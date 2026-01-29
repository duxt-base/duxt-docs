---
title: API Client
description: A simple, static HTTP client for making API requests.
layout: duxt-layout
order: 4
---

# API Client

## Overview

The `Api` class provides a static HTTP client with built-in authentication, error handling, and JSON support.

```dart
import 'package:duxt/duxt.dart';

// Make a GET request
final posts = await Api.get('/posts');

// Make a POST request
final newPost = await Api.post('/posts', body: {
  'title': 'Hello World',
});
```

## Configuration

Configure the API client once in your app initialization:

```dart
// lib/main.dart
import 'package:duxt/duxt.dart';

void main() {
  Api.configure(
    baseUrl: 'https://api.example.com',
  );

  // Optional: Add default headers
  Api.configure(
    baseUrl: 'https://api.example.com',
    headers: {
      'X-API-Version': '1.0',
      'Accept-Language': 'en',
    },
  );

  runApp(App());
}
```

## Making Requests

### GET

```dart
final data = await Api.get('/posts');

// With query parameters
final data = await Api.get('/posts', query: {
  'page': '1',
  'limit': '10',
  'search': 'hello',
});
```

### POST

```dart
final data = await Api.post('/posts', body: {
  'title': 'My Post',
  'content': 'Post content here',
});
```

### PUT

```dart
await Api.put('/posts/123', body: {
  'title': 'Updated Title',
  'content': 'Updated content',
});
```

### PATCH

```dart
await Api.patch('/posts/123', body: {
  'title': 'Only update title',
});
```

### DELETE

```dart
await Api.delete('/posts/123');
```

## Authentication

Set an authentication token that's automatically included in all requests:

```dart
Api.setAuth('your-jwt-token');

Api.clearAuth();

if (Api.isAuthenticated) {
  // User is logged in
}
```

Example login flow:

```dart
class AuthApi {
  static Future<User> login(String email, String password) async {
    final data = await Api.post('/auth/login', body: {
      'email': email,
      'password': password,
    });

    final token = data['token'] as String;
    Api.setAuth(token);
    await TokenStorage.save(token);

    return User.fromJson(data['user']);
  }

  static Future<void> logout() async {
    await Api.post('/auth/logout');
    Api.clearAuth();
    await TokenStorage.clear();
  }
}
```

## Error Handling

The API client throws `ApiException` on errors:

```dart
try {
  final posts = await Api.get('/posts');
} on ApiException catch (e) {
  print('Status: ${e.statusCode}');
  print('Message: ${e.message}');
  print('Body: ${e.body}');

  if (e.statusCode == 401) {
    router.push('/login');
  } else if (e.statusCode == 404) {
    // Not found
  } else if (e.statusCode >= 500) {
    // Server error
  }
} catch (e) {
  print('Network error: $e');
}
```

## Module Pattern

Organize API calls into module-specific classes:

```dart
// lib/posts/api.dart
import 'package:duxt/duxt.dart';
import 'model.dart';

class PostsApi {
  static Future<List<Post>> getAll({int page = 1, int limit = 10}) async {
    final data = await Api.get('/posts', query: {
      'page': page.toString(),
      'limit': limit.toString(),
    });
    return Post.fromList(data as List);
  }

  static Future<Post> getOne(String id) async {
    final data = await Api.get('/posts/$id');
    return Post.fromJson(data as Map<String, dynamic>);
  }

  static Future<Post> create({
    required String title,
    required String content,
  }) async {
    final data = await Api.post('/posts', body: {
      'title': title,
      'content': content,
    });
    return Post.fromJson(data as Map<String, dynamic>);
  }

  static Future<Post> update(String id, {String? title, String? content}) async {
    final data = await Api.patch('/posts/$id', body: {
      if (title != null) 'title': title,
      if (content != null) 'content': content,
    });
    return Post.fromJson(data as Map<String, dynamic>);
  }

  static Future<void> delete(String id) async {
    await Api.delete('/posts/$id');
  }
}
```

Use it in your pages:

```dart
final posts = await PostsApi.getAll(page: 1);
final post = await PostsApi.getOne('123');
await PostsApi.create(title: 'New', content: 'Content');
```
