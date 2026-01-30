---
title: Deployment
description: Deploy your Duxt app to production
order: 10
---

# Deployment

A Duxt application can be deployed as a **static site** or a **full-stack server application** depending on your project structure.

## Deployment Modes

### Static Mode

If your project doesn't have a `server/` directory, you can generate a fully static site:

```
duxt generate
```

This pre-renders all routes and outputs static HTML, CSS, and JavaScript to the `dist/` directory. Deploy this folder to any static hosting provider.

**Best for:** Documentation sites, landing pages, blogs without dynamic content.

### Server Mode

If your project has a `server/` directory with API routes, you need to deploy as a full-stack application:

```
duxt build
```

This produces:
- `.output/bundle/` - Compiled server binary with native libraries
- `build/jaspr/` - Static frontend assets

**Best for:** Apps with APIs, databases, authentication, or dynamic server-side logic.

---

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | API server port | `3001` |
| `DATA_DIR` | Database storage directory | `.` |

Set these in your hosting provider's dashboard or in your Docker configuration.

### Database Persistence

Duxt uses SQLite by default. In containerized environments, mount a persistent volume:

```
docker run -v app-data:/app/data my-duxt-app
```

The database is stored at `$DATA_DIR/blog.db`.

---

## Static Hosting

Deploy the `dist/` folder from `duxt generate` to any static host.

### Vercel

```
npm i -g vercel
cd dist && vercel --prod
```

Or connect your repository and set:
- **Build Command:** `dart pub global activate duxt && dart pub get && duxt generate`
- **Output Directory:** `dist`

### Netlify

```
npm i -g netlify-cli
netlify deploy --prod --dir=dist
```

Or connect your repository and set:
- **Build Command:** `dart pub global activate duxt && dart pub get && duxt generate`
- **Publish Directory:** `dist`

### Firebase Hosting

```
npm i -g firebase-tools
firebase init hosting
# Set public directory to: dist
# Configure as single-page app: Yes
firebase deploy
```

### Cloudflare Pages

Connect your repository and set:
- **Build Command:** `dart pub global activate duxt && dart pub get && duxt generate`
- **Build Output Directory:** `dist`

### GitHub Pages

Create `.github/workflows/deploy.yml`:

```
name: Deploy
on:
  push:
    branches: [main]

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dart-lang/setup-dart@v1
      - run: dart pub get
      - run: dart pub global activate duxt && duxt generate
      - uses: actions/upload-pages-artifact@v3
        with:
          path: dist

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - uses: actions/deploy-pages@v4
        id: deployment
```

For project repositories (not `username.github.io`), add to `web/index.html`:

```
<base href="/your-repo-name/">
```

### Globe

[Globe](https://globe.dev) by Invertase automatically detects Duxt projects:

```
dart pub global activate globe_cli
globe deploy --prod
```

---

## Server Hosting

For full-stack apps with a `server/` directory, deploy using Docker.

### Docker

New Duxt projects include a production-ready `Dockerfile`:

```
# Build
docker build -t my-duxt-app .

# Run
docker run -p 3000:3000 -v app-data:/app/data my-duxt-app
```

The container runs:
- **nginx** on port 3000 serving static files
- **Dart server** on port 3001 handling API routes
- **supervisor** managing both processes

### Docker Compose

```
docker-compose up -d
```

Default `docker-compose.yml`:

```
services:
  app:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - app-data:/app/data
    restart: unless-stopped

volumes:
  app-data:
```

---

## Cloud Providers

### Railway

1. Connect your GitHub repository
2. Railway auto-detects the Dockerfile
3. Add a volume for database persistence:
   - Go to **Settings → Volumes**
   - Mount path: `/app/data`
4. Set environment variable: `DATA_DIR=/app/data`

### Fly.io

```
fly launch
fly volumes create app_data --size 1
fly deploy
```

Add to `fly.toml`:

```
[mounts]
  source = "app_data"
  destination = "/app/data"

[env]
  DATA_DIR = "/app/data"
```

### Google Cloud Run

```
gcloud builds submit --tag gcr.io/PROJECT/my-app
gcloud run deploy my-app \
  --image gcr.io/PROJECT/my-app \
  --port 3000 \
  --allow-unauthenticated
```

> Cloud Run is stateless. Use Cloud SQL or Firestore instead of SQLite.

### DigitalOcean App Platform

1. Connect your repository
2. Select **Dockerfile** as build type
3. Set HTTP port to `3000`
4. Add a **Database** component or use a mounted disk for SQLite

### Basepod (pod.base.al)

Self-hosted PaaS for Mac Mini or VPS. Auto-detects Dockerfiles and configures SSL automatically.

```
bp init
bp deploy
```

See [Basepod Docs](https://pod.base.al/docs) for configuration options and `basepod.yaml` setup.

---

## Self-Hosted VPS

For Ubuntu/Debian servers:

```
# Install Docker
curl -fsSL https://get.docker.com | sh

# Deploy
git clone https://github.com/you/my-app
cd my-app
docker-compose up -d
```

### Reverse Proxy with Caddy

```
sudo apt install caddy

echo "myapp.com {
    reverse_proxy localhost:3000
}" | sudo tee /etc/caddy/Caddyfile

sudo systemctl reload caddy
```

Caddy automatically provisions SSL certificates.

### Reverse Proxy with Nginx

```
server {
    listen 80;
    server_name myapp.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

Use Certbot for SSL: `sudo certbot --nginx -d myapp.com`

---

## Preview Before Deploy

Test your production build locally:

```
duxt build
duxt preview
```

This runs the production server at `http://localhost:4000`.

---

## CI/CD

### GitHub Actions (Docker)

```
name: Deploy
on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Build and push
        run: |
          docker build -t registry.example.com/my-app:${{ github.sha }} .
          docker push registry.example.com/my-app:${{ github.sha }}

      - name: Deploy
        run: |
          # Your deployment command here
          # e.g., kubectl, ssh, or provider CLI
```

---

## Checklist

Before deploying to production:

- [ ] Set `PORT` and `DATA_DIR` environment variables
- [ ] Configure persistent volume for SQLite database
- [ ] Set up HTTPS (via reverse proxy or provider)
- [ ] Test with `duxt preview` locally
- [ ] Configure CI/CD pipeline
- [ ] Set up monitoring and logging

---

## Further Reading

- [Jaspr Deployment Guide](https://docs.jaspr.site/concepts/deploying) - Underlying framework deployment
- [Docker Documentation](https://docs.docker.com/) - Container basics
- [Dart Native Compilation](https://dart.dev/tools/dart-compile) - How server binaries work
