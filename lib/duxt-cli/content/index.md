---
title: Duxt CLI
description: Command-line interface for building modern Dart web applications.
layout: cli-layout
order: 0
---

# Duxt CLI

**Command-line tools for Duxt** - create, develop, generate, and deploy Duxt applications from the terminal.

## What is Duxt CLI?

The Duxt CLI is your primary tool for working with Duxt projects. It handles project creation, development server with hot reload, code generation (modules, pages, components, full CRUD scaffolds), production builds, and deployment. One tool for the entire workflow.

## Why Duxt CLI?

### Zero Config Dev Server
`duxt dev` starts a hot-reload server with Tailwind compilation, file watching, and route generation. No setup needed.

### Code Generators
Generate modules, pages, components, layouts, models, and APIs with a single command. Full CRUD scaffolding included.

### Smart Builds
Production builds with SSR or SSG output, optimized assets, and Tailwind purging.

### Integrated Docs
Generate API documentation from your code, or create doc pages and tutorials.

## Quick Start

Install globally and create a project:

```
dart pub global activate duxt
duxt create my-app
cd my-app && duxt dev
```

Your app is running at `http://localhost:4000`.

## Commands

### Project

| Command | Description |
|---------|-------------|
| [`create`](/duxt-cli/create) | Create a new Duxt project |
| [`update`](/duxt-cli/utilities#update) | Update Duxt CLI to latest version |
| [`version`](/duxt-cli/utilities#version) | Show current version |

### Development

| Command | Description |
|---------|-------------|
| [`dev`](/duxt-cli/dev) | Start development server with hot reload |
| [`preview`](/duxt-cli/build#preview) | Preview production build locally |
| [`start`](/duxt-cli/build#start) | Start production server |

### Build

| Command | Description |
|---------|-------------|
| [`build`](/duxt-cli/build) | Build for production deployment |
| [`generate`](/duxt-cli/build#generate) | Generate static site (SSG) |

### Generators

| Command | Description |
|---------|-------------|
| [`scaffold`](/duxt-cli/scaffold) | Generate full CRUD module |
| [`g`](/duxt-cli/generators) | Generate module, page, component, model, api, layout |
| [`d`](/duxt-cli/generators#delete) | Delete generated files |

### Documentation

| Command | Description |
|---------|-------------|
| [`docs generate`](/duxt-cli/docs) | Generate API docs from code |
| [`docs page`](/duxt-cli/docs#page) | Create documentation page |
| [`docs tutorial`](/duxt-cli/docs#tutorial) | Create tutorial page |

### Utilities

| Command | Description |
|---------|-------------|
| [`info`](/duxt-cli/utilities#info) | Show project information |
| [`doctor`](/duxt-cli/utilities#doctor) | Check environment and dependencies |
| [`clean`](/duxt-cli/utilities#clean) | Clean build artifacts |

## Next Steps

For help with any command:

```
duxt help
duxt help <command>
```

- [Create](/duxt-cli/create) - Project creation options
- [Dev](/duxt-cli/dev) - Development server details
- [Generators](/duxt-cli/generators) - Code generation guide
- [Build](/duxt-cli/build) - Production builds
