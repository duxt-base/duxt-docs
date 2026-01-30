---
title: Duxt Framework
description: The meta-framework for Jaspr - Build full-stack Dart web apps.
layout: duxt-layout
order: 1
---

# Duxt Framework

Duxt is a meta-framework built on top of [Jaspr](https://jaspr.dev), designed to make building full-stack Dart web applications fast and enjoyable.

## Prerequisites

Duxt requires **Dart SDK 3.0+**. Install Dart for your platform:

### macOS

```
brew tap dart-lang/dart
brew install dart
```

### Linux

```
sudo apt-get update
sudo apt-get install apt-transport-https
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
sudo apt-get update
sudo apt-get install dart
```

### Windows

Download and run the installer from [dart.dev/get-dart](https://dart.dev/get-dart), or use Chocolatey:

```
choco install dart-sdk
```

Verify installation:

```
dart --version
```

## Quick Start

```
dart pub global activate duxt
duxt create my-app
cd my-app && duxt dev
```

Your app is running at `http://localhost:4000`

## Core Concepts

- **[Modules](/duxt/modules)** - Organize code by feature
- **[Routing](/duxt/routing)** - File-based routing system
- **[API Client](/duxt/api-client)** - Making HTTP requests
- **[State Management](/duxt/state)** - Handle async data loading
- **[Middleware](/duxt/middleware)** - Protect routes and control flow
- **[Layouts](/duxt/layouts)** - Wrap pages with reusable components
- **[CLI Commands](/duxt/cli)** - Full CLI reference
- **[Server API](/duxt/server)** - Build backend APIs
- **[Deployment](/duxt/deploy)** - Deploy to production
