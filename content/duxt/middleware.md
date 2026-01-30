---
title: Middleware
description: Protect routes and control navigation flow.
layout: duxt-layout
order: 6
---

# Middleware

## Overview

Middleware in Duxt allows you to run code before a route is rendered. Common uses include:

- Authentication checks
- Authorization / role-based access
- Redirecting guests to login
- Logging and analytics
- Feature flags

## Creating Middleware

Extend `DuxtMiddleware` and implement the `handle` method:

```
// lib/shared/middleware/auth_middleware.dart
import 'package:duxt/duxt.dart';

class AuthMiddleware extends DuxtMiddleware {
  @override
  String get name => 'auth';

  @override
  Future<bool> handle(DuxtContext context, Future<void> Function() next) async {
    final isAuthenticated = context.state['isAuthenticated'] ?? false;

    if (!isAuthenticated) {
      context.redirect('/login');
      return false;
    }

    await next();
    return true;
  }
}
```

## DuxtMiddleware API

| Property/Method | Type | Description |
|-----------------|------|-------------|
| `name` | `String` | Unique identifier for the middleware |
| `global` | `bool` | If true, runs on all routes (default: false) |
| `handle()` | `Future<bool>` | Main logic - return true to continue, false to abort |

## DuxtContext

The context object provides access to route information and control flow:

```
class DuxtContext {
  final String path;              // Current route path
  final Map<String, String> params;   // Route parameters
  final Map<String, String> query;    // Query parameters
  final Map<String, dynamic> state;   // Shared state

  void redirect(String path);     // Redirect to another route
  void error(int code, String msg); // Return an error
}
```

## Using Middleware

Apply middleware to pages via the `middleware` getter:

```
// lib/dashboard/pages/index.dart
import 'package:duxt/duxt.dart';

class DashboardPage extends DuxtPage {
  @override
  List<String> get middleware => ['auth'];

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('Dashboard')]),
      text('You are authenticated!'),
    ]);
  }
}
```

## Middleware Results

### Return `true` - Continue

Allow navigation to proceed:

```
await next();
return true;
```

### Return `false` - Abort

Stop navigation (usually after redirect):

```
context.redirect('/login');
return false;
```

### Redirect

Redirect to a different route:

```
context.redirect('/login');
context.redirect('/login?redirect=${context.path}');
return false;
```

### Error

Return an error response:

```
context.error(403, 'Access denied');
return false;
```

## Common Patterns

### Auth Middleware

```
class AuthMiddleware extends DuxtMiddleware {
  @override
  String get name => 'auth';

  @override
  Future<bool> handle(DuxtContext context, Future<void> Function() next) async {
    final isAuthenticated = context.state['isAuthenticated'] ?? false;

    if (!isAuthenticated) {
      final returnUrl = Uri.encodeComponent(context.path);
      context.redirect('/login?redirect=$returnUrl');
      return false;
    }

    await next();
    return true;
  }
}
```

### Guest Middleware

Redirect authenticated users away from login/register pages:

```
class GuestMiddleware extends DuxtMiddleware {
  @override
  String get name => 'guest';

  @override
  Future<bool> handle(DuxtContext context, Future<void> Function() next) async {
    final isAuthenticated = context.state['isAuthenticated'] ?? false;

    if (isAuthenticated) {
      context.redirect('/dashboard');
      return false;
    }

    await next();
    return true;
  }
}
```

### Role Middleware

```
class RoleMiddleware extends DuxtMiddleware {
  final List<String> allowedRoles;

  RoleMiddleware(this.allowedRoles);

  @override
  String get name => 'role';

  @override
  Future<bool> handle(DuxtContext context, Future<void> Function() next) async {
    final userRole = context.state['role'] as String?;

    if (userRole == null || !allowedRoles.contains(userRole)) {
      context.redirect('/unauthorized');
      return false;
    }

    await next();
    return true;
  }
}
```

### Feature Flag Middleware

```
class FeatureFlagMiddleware extends DuxtMiddleware {
  final String featureName;

  FeatureFlagMiddleware(this.featureName);

  @override
  String get name => 'feature-$featureName';

  @override
  Future<bool> handle(DuxtContext context, Future<void> Function() next) async {
    final features = context.state['features'] as Map<String, bool>? ?? {};

    if (features[featureName] != true) {
      context.redirect('/coming-soon');
      return false;
    }

    await next();
    return true;
  }
}
```

## Global Middleware

Set `global` to `true` to run middleware on all routes:

```
class LoggingMiddleware extends DuxtMiddleware {
  @override
  String get name => 'logging';

  @override
  bool get global => true;

  @override
  Future<bool> handle(DuxtContext context, Future<void> Function() next) async {
    print('Navigating to: ${context.path}');
    await next();
    return true;
  }
}
```

Global middleware runs before page-specific middleware.
