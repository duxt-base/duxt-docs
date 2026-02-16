---
title: Modules
description: Organize your code with module-based architecture.
layout: duxt-layout
order: 2
---

# Modules

## Overview

Duxt uses a **module-based architecture** where code is organized by feature rather than by type. Each module is self-contained with its own pages, components, models, and API methods.

This approach makes it easy to:

- Find all code related to a feature in one place
- Add or remove features without affecting others
- Scale your codebase as it grows
- Work in teams with clear boundaries

## Module Structure

A typical Duxt project has this structure:

```
lib/
├── posts/
│   ├── pages/
│   │   ├── index.dart
│   │   ├── _id_.dart
│   │   └── create.dart
│   ├── components/
│   │   ├── post_card.dart
│   │   └── post_form.dart
│   ├── model.dart
│   └── api.dart
│
├── docs/
│   ├── pages/
│   │   └── index.dart        # Dart landing page
│   └── content/              # Markdown content
│       ├── cli.md            # → /docs/cli
│       └── routing.md        # → /docs/routing
│
├── users/
│   ├── pages/
│   ├── components/
│   ├── model.dart
│   └── api.dart
│
├── shared/
│   ├── layouts/
│   │   └── default.dart
│   ├── components/
│   │   └── navbar.dart
│   └── middleware/
│       └── auth.dart
│
├── app.dart
└── main.dart
```

### Module Directories

| Directory | Purpose | Auto-routed? |
|-----------|---------|--------------|
| `pages/` | Dart page components | Yes |
| `content/` | Markdown content files | Yes |
| `components/` | Reusable UI components | No |
| `model.dart` | Data models | No |
| `api.dart` | API methods | No |

## Creating Modules

Use the CLI to generate a new module:

```
duxt g module posts
```

This creates the full module structure:

```
Created lib/posts/
  ├── pages/
  │   └── index.dart
  ├── components/
  ├── model.dart
  └── api.dart
```

## Pages

Files in the `pages/` directory automatically generate routes. See [File-Based Routing](/duxt/routing) for details.

## Content

Modules can include a `content/` directory for markdown files. These are auto-routed alongside Dart pages:

```
lib/docs/
├── pages/
│   └── index.dart          → /docs (Dart component)
└── content/
    ├── cli.md              → /docs/cli (markdown)
    ├── routing.md          → /docs/routing (markdown)
    └── guides/
        └── index.md        → /docs/guides (markdown)
```

Content files use frontmatter for metadata:

```
---
title: CLI Reference
layout: docs-layout
---

# CLI Commands
...
```

See [Content System](/duxt/content) for full documentation.

```
// lib/posts/pages/index.dart
import 'package:duxt/duxt.dart';

class PostsPage extends DuxtPage {
  @override
  Component build(BuildContext context) {
    return div([
      h1([text('All Posts')]),
    ]);
  }
}
```

## Components

Reusable UI components go in the `components/` directory. These are not routed.

```
// lib/posts/components/post_card.dart
import 'package:jaspr/jaspr.dart';
import '../model.dart';

class PostCard extends StatelessComponent {
  final Post post;
  final VoidCallback? onTap;

  const PostCard({required this.post, this.onTap});

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'p-4 border rounded-lg hover:shadow-lg cursor-pointer',
      events: {'click': (_) => onTap?.call()},
      [
        h3(classes: 'font-bold', [text(post.title)]),
        p(classes: 'text-gray-600', [text(post.excerpt)]),
      ],
    );
  }
}
```

Generate a component with the CLI:

```
duxt g component posts/card title:String excerpt:String
duxt g c posts/card title:String
```

## Models

Data models are defined in `model.dart` with JSON serialization:

```
// lib/posts/model.dart
class Post {
  final String id;
  final String title;
  final String content;
  final String author;
  final DateTime createdAt;

  const Post({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    author: json['author'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'author': author,
    'createdAt': createdAt.toIso8601String(),
  };

  static List<Post> fromList(List<dynamic> list) =>
    list.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
}
```

Generate a model with fields:

```
duxt g model post title:String content:String author:String createdAt:DateTime
```

## API

API methods for the module go in `api.dart`:

```
// lib/posts/api.dart
import 'package:duxt/duxt.dart';
import 'model.dart';

class PostsApi {
  static Future<List<Post>> getAll() async {
    final data = await Api.get('/posts');
    return Post.fromList(data as List);
  }

  static Future<Post> getOne(String id) async {
    final data = await Api.get('/posts/$id');
    return Post.fromJson(data as Map<String, dynamic>);
  }

  static Future<Post> create(Post post) async {
    final data = await Api.post('/posts', body: post.toJson());
    return Post.fromJson(data as Map<String, dynamic>);
  }

  static Future<Post> update(String id, Post post) async {
    final data = await Api.put('/posts/$id', body: post.toJson());
    return Post.fromJson(data as Map<String, dynamic>);
  }

  static Future<void> delete(String id) async {
    await Api.delete('/posts/$id');
  }
}
```

## Namespaces

Modules can be grouped into **namespaces** for logical organization. A namespace is a directory under `lib/` that contains other modules with their own `pages/` directories.

```
lib/
  # Flat modules (standard)
  posts/
    pages/index.dart             -> /posts

  # Namespace: admin
  admin/
    layouts/default.dart         AdminLayout (auto-wraps all /admin/* routes)
    posts/
      pages/index.dart           -> /admin/posts
    users/
      pages/index.dart           -> /admin/users

  # Namespace: theme (special - strips prefix)
  theme/
    home/
      pages/index.dart           -> /
    blog/
      pages/index.dart           -> /blog
```

Create namespaced modules with uppercase first letter:

```
duxt g module Admin/Posts
duxt g module Admin/Users
duxt g layout Admin          # Auto-wraps all admin routes
```

See [Namespaces](/duxt/namespaces) for full documentation.

## Shared Code

The `shared/` directory contains code used across multiple modules:

- `shared/layouts/` - Page layouts
- `shared/components/` - Global UI components
- `shared/middleware/` - Route middleware

Files in `shared/` are never auto-routed.
