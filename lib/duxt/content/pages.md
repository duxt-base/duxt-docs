---
title: Pages
description: Create pages with layouts, middleware, SEO metadata, and async data loading.
layout: duxt-layout
order: 4
---

# Pages

Pages in Duxt are Dart components that render at specific routes. They can define layouts, middleware, SEO metadata, and load data asynchronously.

## Basic Page

```
// lib/home/pages/index.dart
import 'package:jaspr/jaspr.dart';

class HomePage extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return div([
      h1([text('Welcome to Duxt')]),
      p([text('Build full-stack Dart web apps.')]),
    ]);
  }
}
```

## DuxtPage

Extend `DuxtPage` for advanced features:

```
import 'package:duxt/duxt.dart';
import 'package:jaspr/jaspr.dart';

class DashboardPage extends DuxtPage {
  @override
  String? get layout => 'dashboard';

  @override
  List<String> get middleware => ['auth'];

  @override
  String? get title => 'Dashboard';

  @override
  Map<String, String> get meta => {
    'description': 'Your personal dashboard',
    'og:title': 'Dashboard | MyApp',
  };

  @override
  bool get requiresAuth => true;

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('Dashboard')]),
    ]);
  }
}
```

## DuxtPage API

| Property | Type | Description |
|----------|------|-------------|
| `layout` | `String?` | Layout name to wrap the page |
| `middleware` | `List<String>` | Middleware to run before rendering |
| `title` | `String?` | Page title for SEO |
| `meta` | `Map<String, String>` | Meta tags for SEO |
| `requiresAuth` | `bool` | If true, requires authentication |

## Async Data Loading

Use `AsyncDataMixin` to load data on the server before rendering:

```
import 'package:duxt/duxt.dart';
import 'package:jaspr/jaspr.dart';

class PostPage extends DuxtPage with AsyncDataMixin {
  Map<String, dynamic>? post;

  @override
  Future<void> asyncData(DuxtContext context) async {
    final id = context.params['id'];
    post = await Api.get('/posts/$id');
  }

  @override
  Component build(BuildContext context) {
    if (post == null) {
      return div([text('Loading...')]);
    }

    return article([
      h1([text(post!['title'])]),
      p([text(post!['content'])]),
    ]);
  }
}
```

## DuxtContext

The context provides route information and control flow:

```
class DuxtContext {
  final String path;                  // Current path
  final Map<String, String> params;   // Route params (/posts/_id_ → {id: '123'})
  final Map<String, String> query;    // Query params (?page=1 → {page: '1'})
  final Map<String, dynamic> state;   // Shared state

  void redirect(String path);         // Redirect to another route
  void error(int code, String msg);   // Return an error
}
```

### Accessing Parameters

```
@override
Future<void> asyncData(DuxtContext context) async {
  // Route: /posts/_id_
  // URL: /posts/123
  final postId = context.params['id'];  // '123'

  // URL: /posts/123?comments=true
  final showComments = context.query['comments'];  // 'true'
}
```

### Redirecting

```
@override
Future<void> asyncData(DuxtContext context) async {
  final post = await Api.get('/posts/${context.params['id']}');

  if (post == null) {
    context.redirect('/404');
    return;
  }

  this.post = post;
}
```

### Returning Errors

```
@override
Future<void> asyncData(DuxtContext context) async {
  final user = await AuthService.getCurrentUser();

  if (user == null) {
    context.error(401, 'Please log in to view this page');
    return;
  }
}
```

## Page with Layout

```
class BlogPostPage extends DuxtPage {
  @override
  String? get layout => 'blog';  // Uses BlogLayout

  @override
  Component build(BuildContext context) {
    return article([
      h1([text('My Blog Post')]),
      p([text('Content here...')]),
    ]);
  }
}
```

## Page with Middleware

```
class AdminPage extends DuxtPage {
  @override
  List<String> get middleware => ['auth', 'admin'];

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('Admin Panel')]),
    ]);
  }
}
```

## SEO Metadata

```
class AboutPage extends DuxtPage {
  @override
  String? get title => 'About Us | MyApp';

  @override
  Map<String, String> get meta => {
    'description': 'Learn about our company and team.',
    'keywords': 'about, company, team',
    'og:title': 'About Us',
    'og:description': 'Learn about our company and team.',
    'og:image': '/images/about-og.png',
    'twitter:card': 'summary_large_image',
  };

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('About Us')]),
    ]);
  }
}
```

## Authentication Required

```
class ProfilePage extends DuxtPage {
  @override
  bool get requiresAuth => true;  // Redirects to login if not authenticated

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('My Profile')]),
    ]);
  }
}
```

## Dynamic Routes

### Single Parameter

```
// lib/posts/pages/_id_.dart → /posts/:id
class PostPage extends DuxtPage with AsyncDataMixin {
  @override
  Future<void> asyncData(DuxtContext context) async {
    final id = context.params['id'];
    // Load post by ID
  }
}
```

### Multiple Parameters

```
// lib/users/pages/_userId_/posts/_postId_.dart → /users/:userId/posts/:postId
class UserPostPage extends DuxtPage with AsyncDataMixin {
  @override
  Future<void> asyncData(DuxtContext context) async {
    final userId = context.params['userId'];
    final postId = context.params['postId'];
  }
}
```

### Catch-All Routes

```
// lib/docs/pages/_...slug_.dart → /docs/*
class DocsPage extends DuxtPage with AsyncDataMixin {
  @override
  Future<void> asyncData(DuxtContext context) async {
    final slug = context.params['slug'];  // 'guides/routing' or 'api/reference'
  }
}
```

## Error Handling

Handle errors gracefully with try-catch:

```
class PostPage extends DuxtPage with AsyncDataMixin {
  Map<String, dynamic>? post;
  String? error;

  @override
  Future<void> asyncData(DuxtContext context) async {
    try {
      post = await Api.get('/posts/${context.params['id']}');
    } catch (e) {
      error = 'Failed to load post';
    }
  }

  @override
  Component build(BuildContext context) {
    if (error != null) {
      return div([text(error!)]);
    }

    if (post == null) {
      return div([text('Loading...')]);
    }

    return article([
      h1([text(post!['title'])]),
    ]);
  }
}
```
