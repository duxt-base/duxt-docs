---
title: Server API
description: Build backend APIs with DuxtServer.
layout: duxt-layout
order: 9
---

# Server API

## Overview

`DuxtServer` provides a simple, Express-like API for building backend services in Dart. It's built on top of Shelf and provides routing, middleware, and request/response helpers.

## Getting Started

Create a new server entry point:

```dart
// lib/api/server.dart
import 'package:duxt/server.dart';

void main() {
  final server = DuxtServer();

  server.get('/hello', (req, res) {
    return res.json({'message': 'Hello, World!'});
  });

  server.listen(port: 3000);
  print('Server running on http://localhost:3000');
}
```

Run the server:

```
dart run lib/api/server.dart
```

## Routing

### Basic Routes

```dart
final server = DuxtServer();

server.get('/posts', (req, res) async {
  final posts = await db.posts.findAll();
  return res.json(posts);
});

server.post('/posts', (req, res) async {
  final body = req.body;
  final post = await db.posts.create(body);
  return res.json(post, status: 201);
});

server.put('/posts/:id', (req, res) async {
  final id = req.params['id'];
  final body = req.body;
  final post = await db.posts.update(id, body);
  return res.json(post);
});

server.delete('/posts/:id', (req, res) async {
  final id = req.params['id'];
  await db.posts.delete(id);
  return res.noContent();
});
```

### Route Parameters

```dart
server.get('/users/:id', (req, res) {
  final id = req.params['id'];
  return res.json({'userId': id});
});

server.get('/users/:userId/posts/:postId', (req, res) {
  final userId = req.params['userId'];
  final postId = req.params['postId'];
  return res.json({'userId': userId, 'postId': postId});
});
```

### Query Parameters

```dart
server.get('/posts', (req, res) {
  final page = int.tryParse(req.query['page'] ?? '1') ?? 1;
  final limit = int.tryParse(req.query['limit'] ?? '10') ?? 10;

  final posts = await db.posts.findAll(
    skip: (page - 1) * limit,
    take: limit,
  );

  return res.json({
    'data': posts,
    'page': page,
    'limit': limit,
  });
});
```

## Request & Response

### Request Object

```dart
server.post('/posts', (req, res) async {
  final body = req.body;
  final title = body['title'] as String;
  final id = req.params['id'];
  final search = req.query['search'];
  final authHeader = req.headers['authorization'];
  final url = req.url;
  final method = req.method;

  return res.json({'received': body});
});
```

### Response Helpers

```dart
return res.json({'message': 'Success'});
return res.json({'id': newId}, status: 201);
return res.noContent();
return res.notFound();
return res.notFound(message: 'Post not found');
return res.badRequest(message: 'Invalid input');
return res.unauthorized();
return res.forbidden();
return res.serverError(message: 'Something went wrong');
return res.send(
  body: 'Custom response',
  status: 418,
  headers: {'X-Custom': 'value'},
);
return res.redirect('/new-location');
```

## Middleware

### Built-in Middleware

```dart
final server = DuxtServer();

server.use(corsMiddleware(
  allowedOrigins: ['http://localhost:3000'],
  allowedMethods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
));

server.use(jsonBodyParser());
server.use(loggerMiddleware());
```

### Custom Middleware

```dart
Middleware authMiddleware() {
  return (handler) {
    return (request) async {
      final authHeader = request.headers['authorization'];

      if (authHeader == null || !authHeader.startsWith('Bearer ')) {
        return Response.json(
          {'error': 'Unauthorized'},
          status: 401,
        );
      }

      final token = authHeader.substring(7);

      try {
        final user = await verifyToken(token);
        final updatedRequest = request.copyWith(
          context: {...request.context, 'user': user},
        );
        return handler(updatedRequest);
      } catch (e) {
        return Response.json(
          {'error': 'Invalid token'},
          status: 401,
        );
      }
    };
  };
}

server.use(authMiddleware());

server.get('/me', (req, res) {
  final user = req.context['user'] as User;
  return res.json(user.toJson());
});
```

### Route-Specific Middleware

```dart
server.get('/admin/users', (req, res) {
  // Only admin can access
}, middleware: [authMiddleware(), adminMiddleware()]);
```

## Error Handling

```dart
server.onError((error, stackTrace, req, res) {
  print('Error: $error');
  print(stackTrace);

  if (error is ValidationException) {
    return res.badRequest(message: error.message);
  }

  if (error is NotFoundException) {
    return res.notFound(message: error.message);
  }

  return res.serverError(message: 'Internal server error');
});

server.post('/posts', (req, res) async {
  try {
    final post = await db.posts.create(req.body);
    return res.json(post, status: 201);
  } on ValidationException catch (e) {
    return res.badRequest(message: e.message);
  }
});
```

## Database Integration

```dart
// lib/api/server.dart
import 'package:duxt/server.dart';
import 'db.dart';

void main() async {
  await Database.init();

  final server = DuxtServer();

  server.use(corsMiddleware());
  server.use(jsonBodyParser());
  server.use(loggerMiddleware());

  server.get('/posts', (req, res) async {
    final posts = await Database.posts.findAll();
    return res.json(posts.map((p) => p.toJson()).toList());
  });

  server.get('/posts/:id', (req, res) async {
    final post = await Database.posts.findById(req.params['id']!);
    if (post == null) return res.notFound();
    return res.json(post.toJson());
  });

  server.post('/posts', (req, res) async {
    final post = await Database.posts.create(Post.fromJson(req.body));
    return res.json(post.toJson(), status: 201);
  });

  server.put('/posts/:id', (req, res) async {
    final post = await Database.posts.update(
      req.params['id']!,
      Post.fromJson(req.body),
    );
    if (post == null) return res.notFound();
    return res.json(post.toJson());
  });

  server.delete('/posts/:id', (req, res) async {
    final deleted = await Database.posts.delete(req.params['id']!);
    if (!deleted) return res.notFound();
    return res.noContent();
  });

  server.listen(port: 3000);
}
```
