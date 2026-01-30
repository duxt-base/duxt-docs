---
title: Configuration
description: Configure your Duxt application with duxt.config.dart
layout: duxt-layout
order: 6
---

# Configuration

## Overview

Duxt uses a `duxt.config.dart` file in your project root to configure application settings. This file is created automatically when you run `duxt create`.

## Configuration File

```
// duxt.config.dart
class DuxtConfig {
  static const app = (
    name: 'my-app',
    description: 'A Duxt application',
  );

  /// Rendering mode: 'spa', 'ssr', 'static'
  static const String mode = 'spa';

  /// API base URL
  static const String apiBase = '/api';

  /// Development server port
  static const int port = 3000;
}
```

## Configuration Options

### App Metadata

```
static const app = (
  name: 'my-app',           // Application name
  description: 'My app',    // Application description
);
```

Used for:
- Default page title
- PWA manifest
- Server identification

### Rendering Mode

```
static const String mode = 'spa';
```

| Mode | Description |
|------|-------------|
| `'spa'` | Single Page Application - client-side rendering with hydration |
| `'ssr'` | Server-Side Rendering - pages rendered on each request |
| `'static'` | Static Site Generation - pages pre-rendered at build time |

#### SPA Mode (Default)

Best for: Interactive applications, dashboards, admin panels

```
static const String mode = 'spa';
```

- Initial HTML shell served, then JavaScript hydrates the page
- Fast navigation after initial load
- Requires JavaScript enabled

#### SSR Mode

Best for: SEO-critical pages, dynamic content that changes frequently

```
static const String mode = 'ssr';
```

- Full HTML rendered on server for each request
- Better SEO and faster first contentful paint
- Higher server load

#### Static Mode

Best for: Documentation sites, blogs, marketing pages

```
static const String mode = 'static';
```

- All pages pre-rendered at build time
- No server required - deploy to any static host
- Content only updates on rebuild

### API Base URL

```
static const String apiBase = '/api';
```

The base path for API routes. This is used by:
- The `Api` client for requests
- The server for routing

Common configurations:

```
// Same-origin API (default)
static const String apiBase = '/api';

// External API
static const String apiBase = 'https://api.example.com';

// Environment-based
static const String apiBase = String.fromEnvironment(
  'API_BASE',
  defaultValue: '/api',
);
```

### Development Port

```
static const int port = 3000;
```

The port for the development server. Can be overridden with CLI flag:

```
duxt dev --port=4000
```

## Environment Variables

Use `String.fromEnvironment` for environment-specific values:

```
class DuxtConfig {
  static const app = (
    name: 'my-app',
    description: 'My app',
  );

  static const String mode = String.fromEnvironment(
    'MODE',
    defaultValue: 'spa',
  );

  static const String apiBase = String.fromEnvironment(
    'API_BASE',
    defaultValue: '/api',
  );

  static const int port = int.fromEnvironment(
    'PORT',
    defaultValue: 3000,
  );
}
```

Pass values at build time:

```
duxt build --define=API_BASE=https://api.example.com
```

## Accessing Configuration

Import and use the config anywhere in your app:

```
import '../duxt.config.dart';

void main() {
  print('App: ${DuxtConfig.app.name}');
  print('Mode: ${DuxtConfig.mode}');
  print('API: ${DuxtConfig.apiBase}');
}
```

## Example Configurations

### Documentation Site

```
class DuxtConfig {
  static const app = (
    name: 'my-docs',
    description: 'Project documentation',
  );

  static const String mode = 'static';
  static const String apiBase = '/api';
  static const int port = 3000;
}
```

### Full-Stack Application

```
class DuxtConfig {
  static const app = (
    name: 'my-saas',
    description: 'SaaS application',
  );

  static const String mode = 'ssr';

  static const String apiBase = String.fromEnvironment(
    'API_BASE',
    defaultValue: '/api',
  );

  static const int port = int.fromEnvironment(
    'PORT',
    defaultValue: 3000,
  );
}
```

### SPA with External API

```
class DuxtConfig {
  static const app = (
    name: 'my-dashboard',
    description: 'Admin dashboard',
  );

  static const String mode = 'spa';
  static const String apiBase = 'https://api.example.com/v1';
  static const int port = 4000;
}
```
