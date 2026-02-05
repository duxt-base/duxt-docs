---
title: duxt create
description: Create a new Duxt project with the recommended structure.
layout: cli-layout
order: 1
---

# duxt create

Create a new Duxt project with the recommended directory structure, configuration files, and example code.

## Usage

```
duxt create <project-name> [options]
```

## Examples

```
# Create a minimal project
duxt create my-app

# Create with server mode (includes ORM)
duxt create my-app --mode=server

# Create in a specific directory
duxt create my-app --directory=./projects
```

## Options

| Option | Description | Default |
|--------|-------------|---------|
| `--mode` | Project mode: `static` or `server` | `static` |
| `--directory`, `-d` | Target directory | Current directory |
| `--template` | Template to use: `minimal`, `full` | `minimal` |

## Project Modes

### Static Mode (Default)

Best for content sites, blogs, documentation, and applications without server-side data:

```
duxt create my-site
```

Creates a project optimized for static deployment:
- Pre-rendered HTML pages
- Client-side routing
- No server required at runtime
- Deploy to any static host (Netlify, Vercel, GitHub Pages)

### Server Mode

Best for full-stack applications with databases and APIs:

```
duxt create my-app --mode=server
```

Creates a project with:
- `duxt_orm` for database operations
- `sqlite3` for local development
- Server entry point (`server/main.dart`)
- Database configuration (`server/db.dart`)
- Auto-migration on startup

## Generated Structure

### Static Mode

```
my-app/
├── lib/
│   ├── home/
│   │   └── pages/
│   │       └── index.dart          → /
│   ├── about/
│   │   └── pages/
│   │       └── index.dart          → /about
│   └── shared/
│       ├── layouts/
│       │   └── default.dart
│       └── components/
├── web/
│   ├── index.html
│   └── styles.tw.css
├── pubspec.yaml
├── duxt.yaml
└── README.md
```

### Server Mode

```
my-app/
├── lib/
│   ├── home/
│   │   └── pages/
│   │       └── index.dart          → /
│   ├── about/
│   │   └── pages/
│   │       └── index.dart          → /about
│   ├── blog/
│   │   ├── pages/
│   │   │   ├── index.dart          → /blog
│   │   │   └── _slug_.dart         → /blog/:slug
│   │   └── components/
│   │       └── post_card.dart
│   ├── models/
│   │   └── post.dart
│   └── shared/
│       ├── layouts/
│       │   └── default.dart
│       └── components/
├── server/
│   ├── main.dart                   Entry point
│   ├── db.dart                     Database connection
│   └── api/
│       └── posts.dart              API routes
├── web/
│   ├── index.html
│   └── styles.tw.css
├── pubspec.yaml
├── duxt.yaml
└── README.md
```

## Configuration Files

### duxt.yaml

```
# Project configuration
name: my-app
mode: server  # or 'static'

# Development server
dev:
  port: 4000
  apiPort: 3001

# Build settings
build:
  output: .output
  targets:
    - linux-x64
    - macos-arm64
```

### pubspec.yaml

The generated `pubspec.yaml` includes all necessary dependencies:

```
dependencies:
  jaspr: ^0.22.0
  jaspr_router: ^0.8.0
  duxt: ^0.4.14
  duxt_ui: ^0.3.0
  # Server mode only:
  duxt_orm: ^0.2.0
  sqlite3: ^2.4.0
```

## After Creation

After creating your project:

```
# Enter the project directory
cd my-app

# Get dependencies
dart pub get

# Start development
duxt dev
```

Your app will be available at `http://localhost:4000`.

## Templates

### Minimal (Default)

A clean starting point with basic structure:
- Home page
- About page
- Default layout
- Basic styling

### Full

A comprehensive example with more features:
- Blog module with posts
- Contact form
- Multiple layouts
- API examples (server mode)
- Authentication setup (server mode)

```
duxt create my-app --template=full --mode=server
```
