---
title: Duxt Framework
description: The meta-framework for Jaspr - Build full-stack Dart web apps.
layout: duxt-layout
order: 1
---

# Duxt Framework

**The meta-framework for Jaspr** - build full-stack Dart web applications with file-based routing, modules, and server-side rendering.

## What is Duxt?

Duxt is a batteries-included framework built on top of [Jaspr](https://jaspr.dev). It takes the power of Jaspr's Dart-to-web compilation and adds the structure and tooling you need to build real applications: file-based routing, modular architecture, middleware, API layer, content system, and first-class Tailwind CSS support.

## Why Duxt?

### File-Based Routing
Drop a file in `pages/`, get a route. Nested layouts, dynamic params, and catch-all routes work automatically.

### Modular Architecture
Organize your app into self-contained modules with their own pages, layouts, middleware, and components.

### Full-Stack Dart
Write your frontend and backend in the same language. Server-side API routes, middleware, and SSR/SSG built in.

### Content System
Build documentation sites with markdown, frontmatter, and custom layouts - like this site.

### First-Class Tailwind
Integrated Tailwind CSS compilation. No extra config needed.

## Quick Start

Install the CLI and create your first app:

```
dart pub global activate duxt
duxt create my-app
cd my-app && duxt dev
```

Your app is running at `http://localhost:4000`.

## Next Steps

### Core Concepts

- **[Modules](/duxt/modules)** - Organize code by feature
- **[Routing](/duxt/routing)** - File-based routing system
- **[Pages](/duxt/pages)** - Create pages with layouts, middleware, and async data
- **[Layouts](/duxt/layouts)** - Wrap pages with reusable components
- **[Middleware](/duxt/middleware)** - Protect routes and control flow

### Data & State

- **[API Client](/duxt/api-client)** - Making HTTP requests
- **[State Management](/duxt/state)** - Handle async data loading
- **[Server API](/duxt/server)** - Build backend APIs

### Styling & Tools

- **[Configuration](/duxt/configuration)** - Configure your Duxt app
- **[Tailwind CSS](/duxt/tailwind)** - First-class Tailwind integration
- **[CLI Commands](/duxt/cli)** - Full CLI reference
- **[Content System](/duxt/content)** - Build docs sites with markdown
- **[Deployment](/duxt/deploy)** - Deploy to production
