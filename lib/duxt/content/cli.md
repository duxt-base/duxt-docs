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
| `duxt docs <subcommand>` | Generate and manage documentation |
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
duxt scaffold posts title:string content:text author:string --orm
```

This generates:

```
lib/posts/
├── pages/
│   ├── index.dart          List all posts
│   ├── _id_.dart           View single post
│   └── new.dart            Create new post
├── components/
│   ├── post_card.dart
│   └── post_form.dart
└── model.dart

lib/models/post.dart         DuxtORM Entity model

server/api/posts.dart        REST API routes
```

### Options

```
duxt scaffold posts title:string --orm      # Generate DuxtORM model
duxt scaffold posts title:string --no-api   # SSR-only (no REST endpoints)
duxt scaffold posts title:string --force    # Overwrite existing files
```

### Field Types

| Syntax | Dart Type | DB Column | Description |
|--------|-----------|-----------|-------------|
| `string` | `String` | `VARCHAR(255)` | Short text |
| `text` | `String` | `TEXT` | Long text content |
| `int` | `int` | `INTEGER` | Integer number |
| `double` | `double` | `DECIMAL` | Decimal number |
| `bool` | `bool` | `BOOLEAN` | True/false |
| `datetime` | `DateTime?` | `TIMESTAMP` | Date and time |
| `email` | `String` | `VARCHAR(255)` | Email (validated in UI) |
| `image` | `String?` | `VARCHAR(500)` | Image URL/path |
| `attachment` | `String?` | `VARCHAR(500)` | File attachment |

### Relations (v0.4.1+)

Define relationships directly in the scaffold command:

```
# BelongsTo - Creates foreign key
duxt scaffold posts category:belongsTo:Category --orm

# ToMany - Creates pivot table for many-to-many
duxt scaffold posts tags:toMany:Tag --orm

# Full example with multiple relations
duxt scaffold posts \
  title:string \
  content:text \
  category:belongsTo:Category \
  tags:toMany:Tag \
  --orm
```

The `belongsTo:Model` syntax:
- Creates a foreign key column (`category_id`)
- Registers a `BelongsTo<Category>` relation
- Adds a relation accessor (`Category? get category`)

The `toMany:Model` syntax:
- Creates a pivot table (`post_tags`)
- Registers a `BelongsToMany<Tag>` relation
- Adds relation methods (`attach`, `detach`, `sync`)
- Adds a relation accessor (`List<Tag> get tags`)

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

## duxt docs

Generate and manage project documentation:

### duxt docs generate

Generate API documentation from code comments:

```
duxt docs generate
duxt docs generate --output=docs/api
duxt docs generate --format=html
```

This scans your `lib/models/` directory and generates markdown documentation for each model, including fields and methods.

### duxt docs page

Create a documentation page:

```
duxt docs page getting-started
```

Creates `docs/getting-started.md` with a template structure.

### duxt docs tutorial

Create a tutorial page with step-by-step structure:

```
duxt docs tutorial building-a-blog
```

Creates `docs/tutorials/building-a-blog.md` with:
- Prerequisites section
- Step-by-step instructions
- Code examples
- Troubleshooting guide

## duxt version

Show the current Duxt CLI version:

```
duxt version
duxt --version
duxt -v
```
