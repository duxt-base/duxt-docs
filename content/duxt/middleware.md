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
  Future<MiddlewareResult> handle(RouteState route) async {
    final token = await TokenStorage.getToken();

    if (token == null) {
      return MiddlewareResult.redirect('/login');
    }

    return MiddlewareResult.next();
  }
}
```

## Using Middleware

Apply middleware to pages via the middleware getter:

```
// lib/dashboard/pages/index.dart
import 'package:duxt/duxt.dart';
import '../../shared/middleware/auth_middleware.dart';

class DashboardPage extends DuxtPage {
  @override
  List<DuxtMiddleware> get middleware => [
    AuthMiddleware(),
  ];

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('Dashboard')]),
      text('You are authenticated!'),
    ]);
  }
}
```

Multiple middleware run in order:

```
@override
List<DuxtMiddleware> get middleware => [
  AuthMiddleware(),
  AdminMiddleware(),
  FeatureFlagMiddleware('beta'),
];
```

## Middleware Results

### next()

Continue to the page (or next middleware):

```
return MiddlewareResult.next();
```

### redirect()

Redirect to a different route:

```
return MiddlewareResult.redirect('/login');
return MiddlewareResult.redirect('/login?redirect=${route.path}');
```

### abort()

Stop navigation entirely:

```
return MiddlewareResult.abort();
```

## Common Patterns

### Auth Middleware

```
class AuthMiddleware extends DuxtMiddleware {
  @override
  Future<MiddlewareResult> handle(RouteState route) async {
    final isAuthenticated = await AuthService.isAuthenticated();

    if (!isAuthenticated) {
      final returnUrl = Uri.encodeComponent(route.path);
      return MiddlewareResult.redirect('/login?redirect=$returnUrl');
    }

    return MiddlewareResult.next();
  }
}
```

### Guest Middleware

```
class GuestMiddleware extends DuxtMiddleware {
  @override
  Future<MiddlewareResult> handle(RouteState route) async {
    final isAuthenticated = await AuthService.isAuthenticated();

    if (isAuthenticated) {
      return MiddlewareResult.redirect('/dashboard');
    }

    return MiddlewareResult.next();
  }
}
```

### Role Middleware

```
class RoleMiddleware extends DuxtMiddleware {
  final List<String> allowedRoles;

  RoleMiddleware(this.allowedRoles);

  @override
  Future<MiddlewareResult> handle(RouteState route) async {
    final user = await AuthService.getCurrentUser();

    if (user == null) {
      return MiddlewareResult.redirect('/login');
    }

    if (!allowedRoles.contains(user.role)) {
      return MiddlewareResult.redirect('/unauthorized');
    }

    return MiddlewareResult.next();
  }
}

// Usage
class AdminPage extends DuxtPage {
  @override
  List<DuxtMiddleware> get middleware => [
    RoleMiddleware(['admin', 'superadmin']),
  ];
}
```

### Feature Flag Middleware

```
class FeatureFlagMiddleware extends DuxtMiddleware {
  final String featureName;

  FeatureFlagMiddleware(this.featureName);

  @override
  Future<MiddlewareResult> handle(RouteState route) async {
    final isEnabled = await FeatureFlags.isEnabled(featureName);

    if (!isEnabled) {
      return MiddlewareResult.redirect('/coming-soon');
    }

    return MiddlewareResult.next();
  }
}
```

## Global Middleware

Apply middleware to all routes in your app configuration:

```
// lib/app.dart
import 'package:duxt/duxt.dart';

class AppConfig extends DuxtApp {
  @override
  List<DuxtMiddleware> get globalMiddleware => [
    LoggingMiddleware(),
    AnalyticsMiddleware(),
  ];
}
```

Global middleware runs before page-specific middleware.
