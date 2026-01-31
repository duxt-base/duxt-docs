---
title: CLI Commands
description: Complete reference for the Duxt command-line interface.
layout: duxt-layout
order: 8
---

# CLI Commands

## Installation

Install the Duxt CLI globally:

```
dart pub global activate duxt
```

Verify the installation:

```
duxt --version
```

## Command Overview

| Command | Description |
|---------|-------------|
| `duxt create <name>` | Create a new Duxt project |
| `duxt dev` | Start development server with hot reload |
| `duxt build` | Build for production deployment |
| `duxt preview` | Preview production build locally |
| `duxt generate` | Generate static site (SSG only) |
| `duxt g <type> <name>` | Generate module, page, component, etc. |
| `duxt scaffold <name>` | Generate full CRUD module |
| `duxt d <type> <name>` | Delete module, page, component, etc. |
| `duxt info` | Show project information |
| `duxt clean` | Clean build artifacts and caches |
| `duxt update` | Update Duxt CLI to latest version |
| `duxt version` | Show Duxt version |

## duxt create

Create a new Duxt project with the recommended structure:

```
duxt create my-app
cd my-app
duxt dev
```

This creates:

```
my-app/
├── lib/
│   ├── home/pages/index.dart       → /
│   ├── about/pages/index.dart      → /about
│   ├── showcase/pages/index.dart   → /showcase
│   ├── blog/pages/                 (fullstack example)
│   │   ├── index.dart              → /blog
│   │   └── _slug_.dart             → /blog/:slug
│   └── shared/layouts/default.dart
├── server/
│   ├── main.dart                   Entry point
│   ├── db.dart                     SQLite connection
│   ├── models/post.dart            Post model
│   └── api/posts.dart              API routes
├── web/
│   ├── index.html
│   └── styles.tw.css
└── pubspec.yaml
```

## duxt dev

Start development server with hot reload:

```
duxt dev
```

This will:
- Generate routes from `pages/` directories
- Start the API server (if `server/main.dart` exists)
- Start the Jaspr frontend server
- Watch for file changes

### Options

```
duxt dev --port=4000        # Frontend port (default: 4000)
duxt dev --api-port=3001    # API port (default: 3001)
duxt dev --no-api           # Skip API server
```

### Output

```
╭─────────────────────────────────────╮
│  Duxt Development Server            │
╰─────────────────────────────────────╯

→ Generating routes...
→ Starting API server...
→ Starting Jaspr server...

✓ Ready!

  App:  http://localhost:4000
  API:  http://localhost:3001
```

## duxt build

Build your application for production:

```
duxt build
```

This creates:
- Optimized frontend in `.output/public/`
- Compiled server binary in `.output/server-<target>`

### Options

```
duxt build --output=.output           # Output directory
duxt build --target=linux-x64         # Target platform
duxt build --target=linux-arm64
duxt build --target=macos-x64
duxt build --target=macos-arm64
duxt build --all-targets              # Build for all platforms
```

### Output Structure

```
.output/
├── public/              Static frontend files
├── server-linux-x64     Linux x64 binary
├── server-linux-arm64   Linux ARM64 binary
├── server-macos-x64     macOS x64 binary
└── server-macos-arm64   macOS ARM64 binary
```

## duxt preview

Preview your production build locally before deploying:

```
duxt preview
```

### Options

```
duxt preview --port=3000    # Port to run on (default: 3000)
```

This serves the `.output/public/` directory and runs the compiled server binary, giving you an exact preview of what will be deployed.

## duxt generate

Generate a static site (SSG mode, no server):

```
duxt generate
```

This pre-renders all routes as static HTML files in `.output/public/`. Use this for static hosting platforms like Netlify, Vercel, or GitHub Pages.

## duxt g (generate files)

Generate various file types:

### Module

```
duxt g module posts
duxt g mod posts
```

Creates a new module with pages, components, and models directories.

### Page

```
duxt g page posts/index
duxt g p posts/[id]
duxt g page posts/[id]/edit
```

### Component

```
duxt g component posts/card
duxt g c posts/card
```

### Model

```
duxt g model post
duxt g m post id:int title:String content:String
```

### API

```
duxt g api posts
duxt g a posts
```

### Layout

```
duxt g layout dashboard
duxt g l dashboard
```

## duxt scaffold

Generate a complete CRUD module with pages, components, model, and API:

```
duxt scaffold posts title:String content:String author:String
```

This generates:

```
lib/posts/
├── pages/
│   ├── index.dart          List all posts
│   ├── _id_.dart           View single post
│   ├── create.dart         Create new post
│   └── [id]/edit.dart      Edit post
├── components/
│   ├── post_card.dart
│   ├── post_form.dart
│   └── post_list.dart
└── model.dart

server/
├── models/post.dart
└── api/posts.dart
```

### Field Types

| Type | Example |
|------|---------|
| `String` | `title:String` |
| `int` | `count:int` |
| `double` | `price:double` |
| `bool` | `isActive:bool` |
| `DateTime` | `createdAt:DateTime` |

## duxt d (delete)

Delete generated files:

```
duxt d module posts       # Delete entire module
duxt d page posts/index   # Delete a page
duxt d component posts/card
duxt d model post
duxt d api posts
```

This removes the files and cleans up imports.

## duxt info

Show project information:

```
duxt info
```

Output:

```
╭─────────────────────────────────────╮
│  Duxt Project Info                  │
╰─────────────────────────────────────╯

  Name:     my-app
  Version:  1.0.0
  Duxt:     0.3.7

  Modules:  5
  Pages:    12
  API Routes: 4

  Dependencies:
    jaspr: ^0.15.0
    duxt: ^0.3.7
    duxt_ui: ^0.2.3
```

## duxt clean

Clean build artifacts and caches:

```
duxt clean
```

This removes:
- `.output/` directory
- `.dart_tool/` caches
- Generated route files
- Build artifacts

## duxt update

Update the Duxt CLI to the latest version:

```
duxt update
```

This runs `dart pub global activate duxt` to get the latest version.

## duxt version

Show the current Duxt CLI version:

```
duxt version
duxt --version
duxt -v
```
