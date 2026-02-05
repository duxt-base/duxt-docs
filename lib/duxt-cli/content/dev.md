---
title: duxt dev
description: Start development server with hot reload and automatic route generation.
layout: cli-layout
order: 2
---

# duxt dev

Start the development server with hot reload, automatic route generation, and live browser updates.

## Usage

```
duxt dev [options]
```

## What It Does

When you run `duxt dev`, the CLI:

1. **Generates Routes** - Scans `pages/` directories and creates route mappings
2. **Starts API Server** - Launches `server/main.dart` if it exists
3. **Starts Frontend Server** - Runs `jaspr serve` for the Jaspr application
4. **Watches for Changes** - Monitors files and triggers rebuilds
5. **Updates Browser** - Sends live updates via WebSocket

## Options

| Option | Description | Default |
|--------|-------------|---------|
| `--port`, `-p` | Frontend server port | `4000` |
| `--api-port` | API server port | `3001` |
| `--no-api` | Skip API server | `false` |
| `--verbose`, `-v` | Show detailed logs | `false` |

## Examples

```
# Default ports
duxt dev

# Custom frontend port
duxt dev --port=3000

# Custom API port
duxt dev --api-port=8080

# Frontend only (no API server)
duxt dev --no-api
```

## Output

When the server starts successfully:

```
╭─────────────────────────────────────╮
│  Duxt Development Server            │
╰─────────────────────────────────────╯

→ Generating routes...
  ✓ Found 8 pages in 4 modules
  ✓ Generated .generated/routes.dart

→ Starting API server...
  ✓ API running at http://localhost:3001

→ Starting Jaspr server...
  ✓ Compiling...

✓ Ready!

  App:  http://localhost:4000
  API:  http://localhost:3001

Watching for changes...
```

## Route Generation

The dev server automatically generates routes from your `pages/` directories:

```
lib/
├── home/pages/index.dart      → /
├── about/pages/index.dart     → /about
├── blog/pages/
│   ├── index.dart             → /blog
│   ├── _id_.dart              → /blog/:id
│   └── _id_/edit.dart         → /blog/:id/edit
└── contact/pages/index.dart   → /contact
```

Route files are generated to `.generated/routes.dart` and updated on every file change.

### Dynamic Routes

Use underscores for dynamic segments:

| File | Route |
|------|-------|
| `_id_.dart` | `:id` |
| `_slug_.dart` | `:slug` |
| `_...all_.dart` | `*all` (catch-all) |

## Hot Reload

The dev server supports two types of updates:

### Hot Reload (Stateful)

When you modify component code, the browser updates without losing state:
- Component changes
- Style changes
- Minor logic changes

### Full Reload

Some changes require a full page reload:
- Route changes
- Layout changes
- Server restart

## Browser Overlay

A development overlay appears in the browser showing build status:

- **Building** - Code is compiling
- **Ready** - Build complete, app is ready
- **Error** - Build failed with error details

The overlay automatically hides after successful builds.

## API Proxy

In development, the frontend server proxies API requests to the API server:

```
Browser → localhost:4000/api/* → localhost:3001/api/*
```

This allows same-origin requests without CORS configuration.

## Environment Variables

Set environment variables for development:

```
# Using shell
API_URL=http://localhost:3001 duxt dev

# Or in .env file (auto-loaded)
API_URL=http://localhost:3001
```

## Troubleshooting

### Port Already in Use

```
Error: Port 4000 is already in use
```

Either stop the other process or use a different port:

```
duxt dev --port=4001
```

### API Server Not Starting

Ensure `server/main.dart` exists and has correct syntax:

```
dart analyze server/main.dart
```

### Build Stuck

If the build seems stuck, check for:
- Syntax errors in your code
- Missing dependencies
- Circular imports

Run with verbose mode for more details:

```
duxt dev --verbose
```

### Database Issues

For server mode projects, ensure the database is initialized:

```
// server/main.dart
await DuxtOrm.init(SqliteDatabase('data.db'));
await DuxtOrm.migrate();
```
