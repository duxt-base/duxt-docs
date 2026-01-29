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

```shell
lib/
├── posts/
│   ├── pages/
│   │   ├── index.dart
│   │   ├── [id].dart
│   │   └── create.dart
│   ├── components/
│   │   ├── post_card.dart
│   │   └── post_form.dart
│   ├── model.dart
│   └── api.dart
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

## Creating Modules

Use the CLI to generate a new module:

```bash
duxt g module posts
```

This creates the full module structure:

```shell
Created lib/posts/
  ├── pages/
  │   └── index.dart
  ├── components/
  ├── model.dart
  └── api.dart
```

## Pages

Files in the `pages/` directory automatically generate routes. See [File-Based Routing](/duxt/routing) for details.

```dart
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

```dart
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

```bash
duxt g component posts/card title:String excerpt:String
duxt g c posts/card title:String
```

## Models

Data models are defined in `model.dart` with JSON serialization:

```dart
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

```bash
duxt g model post title:String content:String author:String createdAt:DateTime
```

## API

API methods for the module go in `api.dart`:

```dart
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

## Shared Code

The `shared/` directory contains code used across multiple modules:

- `shared/layouts/` - Page layouts
- `shared/components/` - Global UI components
- `shared/middleware/` - Route middleware

Files in `shared/` are never auto-routed.
