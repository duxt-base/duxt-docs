---
title: Duxt CLI
description: Command-line interface for building modern Dart web applications.
layout: cli-layout
order: 0
---

# Duxt CLI

The Duxt CLI is your primary tool for creating, developing, and deploying Duxt applications. It provides a streamlined workflow with intelligent code generation, hot reload development, and optimized production builds.

## Installation

Install the Duxt CLI globally using Dart's package manager:

```
dart pub global activate duxt
```

Make sure the pub cache bin directory is in your PATH. Add this to your shell config (`~/.bashrc`, `~/.zshrc`, etc.):

```
export PATH="$PATH:$HOME/.pub-cache/bin"
```

Verify the installation:

```
duxt --version
```

## Quick Start

Create and run your first Duxt app:

```
# Create a new project
duxt create my-app

# Enter the project directory
cd my-app

# Start development server
duxt dev
```

Your app is now running at `http://localhost:4000`.

## Command Categories

### Project Commands

| Command | Description |
|---------|-------------|
| [`create`](/duxt-cli/create) | Create a new Duxt project |
| [`update`](/duxt-cli/utilities#update) | Update Duxt CLI to latest version |
| [`version`](/duxt-cli/utilities#version) | Show current version |

### Development Commands

| Command | Description |
|---------|-------------|
| [`dev`](/duxt-cli/dev) | Start development server with hot reload |
| [`preview`](/duxt-cli/build#preview) | Preview production build locally |
| [`start`](/duxt-cli/build#start) | Start production server |

### Build Commands

| Command | Description |
|---------|-------------|
| [`build`](/duxt-cli/build) | Build for production deployment |
| [`generate`](/duxt-cli/build#generate) | Generate static site (SSG) |

### Generator Commands

| Command | Description |
|---------|-------------|
| [`scaffold`](/duxt-cli/scaffold) | Generate full CRUD module |
| [`g`](/duxt-cli/generators) | Generate module, page, component, model, api, layout |
| [`d`](/duxt-cli/generators#delete) | Delete generated files |

### Documentation Commands

| Command | Description |
|---------|-------------|
| [`docs generate`](/duxt-cli/docs) | Generate API docs from code |
| [`docs page`](/duxt-cli/docs#page) | Create documentation page |
| [`docs tutorial`](/duxt-cli/docs#tutorial) | Create tutorial page |

### Utility Commands

| Command | Description |
|---------|-------------|
| [`info`](/duxt-cli/utilities#info) | Show project information |
| [`doctor`](/duxt-cli/utilities#doctor) | Check environment and dependencies |
| [`clean`](/duxt-cli/utilities#clean) | Clean build artifacts |

## Getting Help

For help with any command:

```
duxt help
duxt help <command>
duxt <command> --help
```

## Version Requirements

- **Dart SDK**: ^3.0.0
- **Jaspr**: ^0.22.0

The CLI will check for compatible versions and warn you if updates are needed.
