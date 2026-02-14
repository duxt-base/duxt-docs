---
title: duxt build
description: Build your Duxt application for production deployment.
layout: cli-layout
order: 3
---

# duxt build

Build your application for production deployment with optimized assets and compiled server binaries.

## Usage

```
duxt build [options]
```

## What It Does

The build command:

1. **Generates Routes** - Creates production route mappings
2. **Compiles Frontend** - Optimizes and bundles JavaScript/CSS
3. **Compiles Server** - Creates native binary (server mode)
4. **Outputs to .output/** - All artifacts in one directory

## Options

| Option | Description | Default |
|--------|-------------|---------|
| `--output`, `-o` | Output directory | `.output` |
| `--target`, `-t` | Target platform | Current platform |
| `--all-targets` | Build for all platforms | `false` |
| `--verbose`, `-v` | Show detailed logs | `false` |

## Examples

```
# Default build
duxt build

# Custom output directory
duxt build --output=dist

# Build for specific platform
duxt build --target=linux-x64

# Build for all platforms
duxt build --all-targets
```

## Target Platforms

| Target | Description |
|--------|-------------|
| `linux-x64` | Linux 64-bit (most servers) |
| `linux-arm64` | Linux ARM64 (AWS Graviton, etc.) |
| `macos-x64` | macOS Intel |
| `macos-arm64` | macOS Apple Silicon |
| `windows-x64` | Windows 64-bit |

## Output Structure

```
.output/
├── public/                 Static frontend files
│   ├── index.html
│   ├── main.dart.js        Compiled Dart
│   ├── styles.css          Compiled CSS
│   └── assets/             Images, fonts, etc.
├── server-linux-x64        Linux binary
├── server-macos-arm64      macOS binary
└── data.db                 SQLite database (if using ORM)
```

## Build Output

```
╭─────────────────────────────────────╮
│  Duxt Production Build              │
╰─────────────────────────────────────╯

→ Generating routes...
  ✓ Found 8 pages

→ Building frontend...
  ✓ Compiled main.dart.js (245 KB)
  ✓ Compiled styles.css (18 KB)

→ Building server...
  ✓ Compiled server-macos-arm64 (12 MB)

✓ Build complete!

  Output:   .output/
  Frontend: .output/public/
  Server:   .output/server-macos-arm64
```

---

# duxt preview

Preview your production build locally before deploying.

## Usage

```
duxt preview [options]
```

## Options

| Option | Description | Default |
|--------|-------------|---------|
| `--port`, `-p` | Frontend server port | `4000` |
| `--api-port` | API server port | `3001` |

## Examples

```
# Default preview
duxt preview

# Custom port
duxt preview --port=8080
```

## What It Does

Preview mode:
1. Serves static files from `.output/public/`
2. Runs the compiled server binary
3. Matches production behavior exactly

This is the final check before deployment.

---

# duxt start

Start the production server from a built project.

## Usage

```
duxt start [options]
```

## Options

| Option | Description | Default |
|--------|-------------|---------|
| `--port`, `-p` | Server port | Auto-finds free port |
| `--open`, `-o` | Open browser after starting | `false` |

## Examples

```
# Start on auto-detected free port
duxt start

# Start on specific port
duxt start --port=8080

# Start and open browser
duxt start --open
```

## Production Deployment

For production, you typically:

1. Build on CI/CD:
   ```
   duxt build --target=linux-x64
   ```

2. Copy `.output/` to server

3. Run the binary directly:
   ```
   ./server-linux-x64
   ```

Or use the start command:
```
duxt start
```

---

# duxt generate (SSG)

Generate a fully static site with pre-rendered HTML.

## Usage

```
duxt generate [options]
```

## Options

| Option | Description | Default |
|--------|-------------|---------|
| `--output`, `-o` | Output directory | `.output/public` |

## When to Use

Use `duxt generate` instead of `duxt build` when:

- You want static HTML for each route
- No server-side rendering needed
- Deploying to static hosts (Netlify, Vercel, GitHub Pages)
- SEO is critical and content is static

## What It Does

```
duxt generate
```

1. Compiles all pages
2. Pre-renders each route to HTML
3. Generates static assets
4. Outputs everything to `.output/public/`

## Output

```
.output/public/
├── index.html              /
├── about/
│   └── index.html          /about
├── blog/
│   ├── index.html          /blog
│   ├── hello-world/
│   │   └── index.html      /blog/hello-world
│   └── second-post/
│       └── index.html      /blog/second-post
├── main.dart.js
└── styles.css
```

## Static Hosting

Deploy the `.output/public/` directory to any static host:

### Netlify

```
# netlify.toml
[build]
  command = "duxt generate"
  publish = ".output/public"
```

### Vercel

```
# vercel.json
{
  "buildCommand": "duxt generate",
  "outputDirectory": ".output/public"
}
```

### GitHub Pages

```
# .github/workflows/deploy.yml
- run: duxt generate
- uses: peaceiris/actions-gh-pages@v3
  with:
    publish_dir: .output/public
```

## Comparison

| Feature | `duxt build` | `duxt generate` |
|---------|--------------|-----------------|
| Server required | Yes | No |
| Dynamic content | Yes | No |
| API routes | Yes | No |
| Database | Yes | No |
| Pre-rendered HTML | Partial | Full |
| Hosting | VPS, containers | Static CDN |
