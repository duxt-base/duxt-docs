---
title: CLI Commands
description: Complete reference for the Duxt command-line interface.
layout: duxt-layout
order: 8
---

# CLI Commands

## Installation

Install the Duxt CLI globally:

```bash
dart pub global activate duxt
```

Verify the installation:

```bash
duxt --version
```

## Commands

| Command | Description |
|---------|-------------|
| `duxt create <name>` | Create a new Duxt project |
| `duxt dev` | Start development server (frontend + API) |
| `duxt build` | Build for production |
| `duxt g <type> <name>` | Generate files (page, component, etc.) |
| `duxt scaffold <name>` | Generate full CRUD module |

## duxt create

Create a new Duxt project with the recommended structure:

```bash
duxt create my-app
cd my-app
duxt dev
```

This creates:

```text
my-app/
├── lib/
│   ├── home/pages/index.dart       → /
│   ├── about/pages/index.dart      → /about
│   ├── showcase/pages/index.dart   → /showcase
│   ├── company/pages/              (nested routing example)
│   ├── blog/pages/                 (fullstack example)
│   │   ├── index.dart              → /blog
│   │   └── [slug].dart             → /blog/:slug
│   ├── shared/layouts/default.dart
│   └── app.dart
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

```bash
duxt dev
```

This will:
- Generate routes from `pages/` directories
- Start the API server (if `server/main.dart` exists)
- Start the Jaspr frontend server
- Watch for file changes

### Options

```bash
duxt dev --port=4000        # Frontend port (default: 4000)
duxt dev --api-port=3001    # API port (default: 3001)
duxt dev --no-api           # Skip API server
```

### Output

```text
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

```bash
duxt build
```

This creates:
- Optimized frontend in `.output/public/`
- Compiled server binary in `.output/server-<target>`

### Options

```bash
duxt build --output=.output           # Output directory (default: .output)
duxt build --target=linux-x64         # Target platform
duxt build --target=linux-arm64
duxt build --target=macos-x64
duxt build --target=macos-arm64
duxt build --all-targets              # Build for all platforms
```

### Output

```text
.output/
├── public/              Static frontend files
├── server-linux-x64     Linux x64 binary
├── server-linux-arm64   Linux ARM64 binary
├── server-macos-x64     macOS x64 binary
└── server-macos-arm64   macOS ARM64 binary
```

### Cross-Compilation

| Target | Native | Docker |
|--------|--------|--------|
| linux-x64 | ✓ (on Linux) | ✓ |
| linux-arm64 | ✓ (on ARM Linux) | ✓ |
| macos-x64 | ✓ (on Intel Mac) | ✗ |
| macos-arm64 | ✓ (on Apple Silicon) | ✗ |

## duxt g (generate)

Generate various file types:

### Page

```bash
duxt g page posts/index
duxt g p posts/[id]
duxt g page posts/[id]/edit
```

### Component

```bash
duxt g component posts/card
duxt g c posts/card
```

### Model

```bash
duxt g model post
duxt g m post id:int title:String content:String
```

### API

```bash
duxt g api posts
duxt g a posts
```

### Layout

```bash
duxt g layout dashboard
duxt g l dashboard
```

### Module

```bash
duxt g module posts
```

## duxt scaffold

Generate a complete CRUD module:

```bash
duxt scaffold posts title:String content:String author:String
```

This generates:

```text
lib/posts/
├── pages/
│   ├── index.dart
│   ├── [id].dart
│   ├── create.dart
│   └── [id]/edit.dart
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
