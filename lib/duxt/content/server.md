---
title: Server API
description: Build backend APIs with DuxtServer and SQLite.
layout: duxt-layout
order: 9
---

# Server API

## Overview

Duxt provides a fullstack development experience. The `server/` directory contains your backend code:

```
server/
├── main.dart           Entry point
├── db.dart             Database connection
├── models/
│   └── post.dart       Data models
└── api/
    └── posts.dart      API routes
```

Run `duxt dev` to start both frontend and API server simultaneously.

## Quick Start

The default template includes a complete blog example with SQLite:

```
duxt create my_app
cd my_app
duxt dev
```

This starts:
- **Frontend**: http://localhost:4000
- **API**: http://localhost:3001

## Database Setup

### server/db.dart

```
import 'package:sqlite3/sqlite3.dart' as sqlite;

class Db {
  static late sqlite.Database _db;

  static void init([String path = 'blog.db']) {
    _db = sqlite.sqlite3.open(path);
    _createTables();
  }

  static void _createTables() {
    _db.execute('''
      CREATE TABLE IF NOT EXISTS posts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        slug TEXT UNIQUE NOT NULL,
        content TEXT NOT NULL,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  static sqlite.Database get db => _db;
}
```

## Models

### server/models/post.dart

```
import 'package:sqlite3/sqlite3.dart' as sqlite;
import '../db.dart';

class Post {
  final int? id;
  final String title;
  final String slug;
  final String content;

  Post({this.id, required this.title, required this.slug, required this.content});

  factory Post.fromRow(sqlite.Row row) => Post(
    id: row['id'] as int,
    title: row['title'] as String,
    slug: row['slug'] as String,
    content: row['content'] as String,
  );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'] as int?,
    title: json['title'] as String,
    slug: json['slug'] as String,
    content: json['content'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id, 'title': title, 'slug': slug, 'content': content,
  };

  // Repository methods
  static List<Post> findAll() {
    return Db.db.select('SELECT * FROM posts ORDER BY created_at DESC')
        .map(Post.fromRow).toList();
  }

  static Post? findBySlug(String slug) {
    final r = Db.db.select('SELECT * FROM posts WHERE slug = ?', [slug]);
    return r.isEmpty ? null : Post.fromRow(r.first);
  }

  static Post create(Post post) {
    Db.db.execute(
      'INSERT INTO posts (title, slug, content) VALUES (?, ?, ?)',
      [post.title, post.slug, post.content],
    );
    return findById(Db.db.lastInsertRowId)!;
  }

  static Post? findById(int id) {
    final r = Db.db.select('SELECT * FROM posts WHERE id = ?', [id]);
    return r.isEmpty ? null : Post.fromRow(r.first);
  }
}
```

## API Routes

### server/api/posts.dart

```
import 'package:duxt/server.dart';
import '../models/post.dart';

void registerPostRoutes(DuxtServer server) {
  // GET /api/posts
  server.get('/api/posts', (req) {
    final posts = Post.findAll();
    return json({'posts': posts.map((p) => p.toJson()).toList()});
  });

  // GET /api/posts/:slug
  server.get('/api/posts/:slug', (req) {
    final slug = req.params['slug'];
    final post = Post.findBySlug(slug!);
    if (post == null) return json({'error': 'Not found'}, statusCode: 404);
    return json({'post': post.toJson()});
  });

  // POST /api/posts
  server.post('/api/posts', (req) {
    final body = req.body as Map<String, dynamic>;
    final post = Post.create(Post.fromJson(body));
    return json({'post': post.toJson()}, statusCode: 201);
  });
}
```

## Server Entry Point

### server/main.dart

```
import 'package:duxt/server.dart';
import 'db.dart';
import 'models/post.dart';
import 'api/posts.dart';

void main() {
  // Initialize database
  Db.init();

  // Create server with middleware
  final server = DuxtServer(
    port: 3001,
    middleware: [cors(), jsonBody(), logger()],
  );

  // Register routes
  registerPostRoutes(server);

  // Start
  server.start();
}
```

## DuxtServer API

### Creating a Server

```
final server = DuxtServer(
  port: 3001,
  middleware: [cors(), jsonBody(), logger()],
);
```

### Route Methods

```
server.get('/path', handler);
server.post('/path', handler);
server.put('/path', handler);
server.delete('/path', handler);
server.patch('/path', handler);
```

### Route Parameters

```
server.get('/posts/:id', (req) {
  final id = req.params['id'];  // Access route params
  final page = req.query('page'); // Access query params
  final body = req.body;          // Access JSON body
  // ...
});
```

### Response Helpers

```
return json({'data': data});                    // 200 OK
return json({'data': data}, statusCode: 201);   // 201 Created
return json({'error': 'Not found'}, statusCode: 404);
```

## Built-in Middleware

### CORS

```
cors(
  origins: ['*'],  // or specific origins
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  headers: ['Content-Type', 'Authorization'],
)
```

### JSON Body Parser

```
jsonBody()  // Parses JSON request bodies
```

### Logger

```
logger()  // Logs requests: GET /api/posts 200 12ms
```

## Calling the API from Frontend

```
import 'dart:convert';
import 'dart:js_interop';
import 'package:web/web.dart' as web;

Future<List<Post>> fetchPosts() async {
  final response = await web.window.fetch('http://localhost:3001/api/posts'.toJS).toDart;
  final jsText = await response.text().toDart;
  final data = jsonDecode(jsText.toDart);
  return (data['posts'] as List).map((p) => Post.fromJson(p)).toList();
}
```

## Development

```
# Start both frontend and API
duxt dev

# Options
duxt dev --port=4000        # Frontend port
duxt dev --api-port=3001    # API port
duxt dev --no-api           # Skip API server
```

## Production Build

```
# Build for current platform
duxt build

# Build for specific target
duxt build --target=linux-x64
duxt build --target=linux-arm64
duxt build --target=macos-x64
duxt build --target=macos-arm64

# Build for all targets (uses Docker for cross-compilation)
duxt build --all-targets
```

### Output Structure

```
.output/
├── public/              Static frontend files
└── server-<target>      Server binary (e.g., server-linux-x64)
```

### Deployment

**Frontend:** Deploy `public/` to any static hosting (Vercel, Netlify, Cloudflare Pages, nginx).

**Server:** Run the binary on your server:

```
# On your server
./.output/server-linux-x64
```

### Cross-Compilation

| Target | Native | Docker |
|--------|--------|--------|
| linux-x64 | ✓ (on Linux) | ✓ |
| linux-arm64 | ✓ (on ARM Linux) | ✓ |
| macos-x64 | ✓ (on Intel Mac) | ✗ |
| macos-arm64 | ✓ (on Apple Silicon) | ✗ |

Linux targets can be cross-compiled using Docker. macOS targets must be built on macOS.
