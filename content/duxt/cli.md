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

## Commands

| Command | Description |
|---------|-------------|
| `duxt create <name>` | Create a new Duxt project |
| `duxt dev` | Start development server with hot reload |
| `duxt build` | Build for production |
| `duxt start` | Start production server |
| `duxt g <type> <name>` | Generate files (page, component, etc.) |
| `duxt scaffold <name>` | Generate full CRUD module |

## duxt create

Create a new Duxt project with the recommended structure:

```
duxt create my-app
```

This creates:

```
my-app/
├── lib/
│   ├── pages/
│   │   └── index.dart
│   ├── shared/
│   │   └── layouts/
│   │       └── default.dart
│   ├── app.dart
│   └── main.dart
├── web/
│   └── index.html
├── pubspec.yaml
├── tailwind.config.js
└── README.md
```

### Options

```
duxt create my-app --template=minimal
duxt create my-app --template=full
duxt create my-app --no-install
```

## duxt dev

Start the development server with hot reload:

```
duxt dev
```

This will:

- Start the Jaspr dev server
- Watch for file changes
- Auto-regenerate routes
- Compile Tailwind CSS

### Options

```
duxt dev --port=3000
duxt dev --host=0.0.0.0
duxt dev --no-open
```

## duxt build

Build your application for production:

```
duxt build
```

This creates an optimized production build in the `build/` directory.

### Options

```
duxt build --mode=static
duxt build --mode=server
```

## duxt start

Start the production server:

```
duxt start
```

### Options

```
duxt start --port=8080
```

## duxt g (generate)

Generate various file types:

### Page

```
duxt g page posts/index
duxt g p posts/index
duxt g page posts/[id]
duxt g page posts/[id]/edit
```

### Component

```
duxt g component posts/card
duxt g c posts/card
duxt g c posts/card title:String content:String isActive:bool
```

### Model

```
duxt g model post
duxt g m post
duxt g m post id:String title:String content:String createdAt:DateTime
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

### Module

```
duxt g module posts
```

## duxt scaffold

Generate a complete CRUD module with all files:

```
duxt scaffold posts title:String content:String author:String
```

This generates:

```
lib/posts/
├── pages/
│   ├── index.dart
│   ├── [id].dart
│   ├── create.dart
│   └── [id]/
│       └── edit.dart
├── components/
│   ├── post_card.dart
│   ├── post_form.dart
│   └── post_list.dart
├── model.dart
└── api.dart
```

### Field Types

| Type | UI Element | Example |
|------|------------|---------|
| `String` | Text input | `title:String` |
| `int` | Number input | `count:int` |
| `double` | Decimal input | `price:double` |
| `bool` | Checkbox/switch | `isActive:bool` |
| `DateTime` | Date picker | `createdAt:DateTime` |
