---
title: Security
description: Security best practices for production Duxt applications
layout: duxt-layout
order: 11
---

# Security

Duxt includes built-in security features and middleware. This guide covers what's included out of the box and what you need to configure for production.

## Built-in Protections

These protections are always active:

- **Path traversal protection** on static file serving (`duxt start`, `duxt preview`)
- **HTML-escaped error pages** prevent XSS via URL paths
- **Parameterized SQL queries** in DuxtOrm (values are never interpolated into SQL)
- **SQL identifier sanitization** strips quote characters from table/column names
- **Input validation** on `duxt scaffold` and `duxt create` commands
- **Sensitive file exclusion** during `duxt build` (`.env`, `.git`, `node_modules` are never copied to output)

## Security Middleware

Import server middleware:

```
import 'package:duxt/server.dart';
```

### securityHeaders()

Adds standard security headers to all responses:

```
final server = DuxtServer(
  port: 3001,
  middleware: [securityHeaders(), ...],
);
```

Headers added:
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: DENY`
- `X-XSS-Protection: 1; mode=block`
- `Referrer-Policy: strict-origin-when-cross-origin`

### bodyLimit()

Rejects requests with bodies exceeding a size limit. Default is 1 MB.

```
// Default 1 MB limit
bodyLimit()

// Custom limit (5 MB)
bodyLimit(maxBytes: 5 * 1024 * 1024)
```

Returns `413 Request Entity Too Large` when exceeded.

### rateLimit()

Limits requests per IP address using in-memory tracking. Default is 100 requests per minute.

```
// Default: 100 requests per minute
rateLimit()

// Custom: 20 requests per 30 seconds
rateLimit(maxRequests: 20, window: Duration(seconds: 30))
```

Returns `429 Too Many Requests` with a `Retry-After` header when exceeded.

### cors()

CORS middleware requires explicit origin configuration. Never use `['*']` for authenticated endpoints.

```
// Specify allowed origins explicitly
cors(origins: ['https://myapp.com', 'https://admin.myapp.com'])

// Development only — allow all origins
cors(origins: ['*'])
```

### auth()

Protects routes with a custom verification function:

```
auth((request) async {
  final token = request.headers['authorization']?.replaceFirst('Bearer ', '');
  if (token == null) return false;
  return await verifyToken(token);
})
```

### csrf()

Validates CSRF tokens on state-changing requests (POST, PUT, DELETE, PATCH). GET/HEAD/OPTIONS are always allowed through.

```
csrf(
  headerName: 'X-CSRF-Token',  // Header to check
  cookieName: 'csrf_token',     // Cookie to match against
)
```

Your frontend must:
1. Read the CSRF token from the cookie
2. Include it in the `X-CSRF-Token` header on every state-changing request

### timeout()

Returns `504 Gateway Timeout` if a handler takes too long. Default is 30 seconds.

```
timeout(duration: Duration(seconds: 15))
```

## Recommended Production Setup

```
final server = DuxtServer(
  port: 3001,
  requestTimeout: Duration(seconds: 30),
  middleware: [
    securityHeaders(),
    bodyLimit(maxBytes: 2 * 1024 * 1024),
    rateLimit(maxRequests: 100),
    cors(origins: ['https://yourdomain.com']),
    jsonBody(),
    logger(),
  ],
);
```

## HTTPS / TLS

DuxtServer binds plain HTTP. For production, use a reverse proxy that terminates TLS:

- **nginx** with Let's Encrypt
- **Cloudflare** proxy
- **Caddy** (automatic HTTPS)

Example nginx config:

```
server {
    listen 443 ssl;
    server_name yourdomain.com;

    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;

    location /api/ {
        proxy_pass http://127.0.0.1:3001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location / {
        root /var/www/myapp/public;
        try_files $uri $uri/ /index.html;
    }
}
```

## Content Security

### Markdown Content

If your application renders user-contributed markdown content (e.g., blog posts from a CMS, user comments), be aware that markdown can contain raw HTML including `<script>` tags.

**Recommendations:**

- Only allow trusted content through `jaspr_content` markdown rendering
- If accepting user-submitted markdown, sanitize it before storing — strip `<script>`, `<iframe>`, `on*` event attributes, and `javascript:` URLs
- For user-generated content, prefer rendering plain text or a restricted markdown subset

### Environment Variables

Duxt build automatically excludes `.env` files from output, but you should also:

- Never commit `.env` files to version control
- Use environment variables on your hosting platform instead of `.env` files in production
- Keep secrets (API keys, database passwords) out of client-side code

## Graceful Shutdown

DuxtServer handles `SIGINT` (Ctrl+C) and `SIGTERM` (deployment systems) for graceful shutdown. Active connections are drained before the process exits. This is automatic — no configuration needed.

## Error Handling

DuxtServer returns generic error messages to clients and logs full details server-side:

```
// Bad: leaks internal details
catch (e) {
  return json({'error': e.toString()}, statusCode: 500);
}

// Good: generic message to client, full log on server
catch (e) {
  print('Handler failed: $e');
  return json({'error': 'Internal server error'}, statusCode: 500);
}
```

The built-in error pages (404, 500) follow this pattern automatically.

## Security Checklist

Before deploying to production:

- [ ] Set explicit CORS origins (not `['*']`)
- [ ] Add `securityHeaders()` middleware
- [ ] Add `bodyLimit()` middleware
- [ ] Add `rateLimit()` middleware
- [ ] Use HTTPS via reverse proxy
- [ ] Remove any `e.toString()` from API error responses
- [ ] Ensure `.env` files are in `.gitignore`
- [ ] Add authentication to API endpoints that modify data
- [ ] Sanitize user-submitted content before storing
- [ ] Test error pages render correctly for missing routes
