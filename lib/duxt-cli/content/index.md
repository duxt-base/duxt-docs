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

---

### Project

```
$ duxt create <project-name>
```
Create a new Duxt project from template. [Learn more](/duxt-cli/create)

```
$ duxt update
```
Update Duxt CLI to the latest version. [Learn more](/duxt-cli/utilities#update)

```
$ duxt version
```
Show the currently installed version. [Learn more](/duxt-cli/utilities#version)

---

### Development

```
$ duxt dev
```
Start the development server with hot reload, Tailwind compilation, and file watching. [Learn more](/duxt-cli/dev)

```
$ duxt preview
```
Preview a production build locally before deploying. [Learn more](/duxt-cli/build#preview)

```
$ duxt start
```
Start the production server. [Learn more](/duxt-cli/build#start)

---

### Build

```
$ duxt build
```
Build your app for production deployment (SSR). [Learn more](/duxt-cli/build)

```
$ duxt generate
```
Generate a static site (SSG) with pre-rendered HTML. [Learn more](/duxt-cli/build#generate)

---

### Generators

```
$ duxt scaffold <name>
```
Generate a full CRUD module — model, pages, API routes, and components. [Learn more](/duxt-cli/scaffold)

```
$ duxt g <type> <name>
```
Generate individual files: `module`, `page`, `component`, `model`, `api`, `layout`. [Learn more](/duxt-cli/generators)

```
$ duxt d <type> <name>
```
Delete previously generated files. [Learn more](/duxt-cli/generators#delete)

---

### Documentation

```
$ duxt docs generate
```
Generate API documentation from your code. [Learn more](/duxt-cli/docs)

```
$ duxt docs page <name>
```
Create a new documentation page. [Learn more](/duxt-cli/docs#page)

```
$ duxt docs tutorial <name>
```
Create a new tutorial page. [Learn more](/duxt-cli/docs#tutorial)

---

### Utilities

```
$ duxt info
```
Show project information and configuration. [Learn more](/duxt-cli/utilities#info)

```
$ duxt doctor
```
Check your environment and dependencies for issues. [Learn more](/duxt-cli/utilities#doctor)

```
$ duxt clean
```
Clean build artifacts and caches. [Learn more](/duxt-cli/utilities#clean)

---

## Next Steps

For help with any command:

```
$ duxt help
$ duxt help <command>
```

- [Create](/duxt-cli/create) - Project creation options
- [Dev](/duxt-cli/dev) - Development server details
- [Generators](/duxt-cli/generators) - Code generation guide
- [Build](/duxt-cli/build) - Production builds
