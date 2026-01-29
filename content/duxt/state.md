---
title: State Management
description: Handle async data loading with DuxtState.
layout: duxt-layout
order: 5
---

# State Management

## Overview

Duxt provides state management utilities for handling async data loading in SPA mode. The `DuxtState` mixin handles all state transitions automatically.

## DuxtState

Use `DuxtState<T, D>` for pages that load a single data source:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:duxt/duxt.dart';
import '../api.dart';
import '../model.dart';

class PostsPage extends StatefulComponent {
  const PostsPage({super.key});

  @override
  State createState() => _PostsState();
}

class _PostsState extends DuxtState<PostsPage, List<Post>> {
  @override
  Future<List<Post>> load() {
    return PostsApi.getAll();
  }

  @override
  Component buildLoading() {
    return div(classes: 'flex justify-center p-8', [
      DSpinner(),
    ]);
  }

  @override
  Component buildError(Object error) {
    return DAlert(
      title: 'Error loading posts',
      description: error.toString(),
      color: DAlertColor.error,
    );
  }

  @override
  Component buildData(List<Post> posts) {
    return div([
      for (final post in posts)
        PostCard(post: post),
    ]);
  }
}
```

## Loading States

DuxtState manages three states automatically:

| State | Method | Description |
|-------|--------|-------------|
| **Loading** | `buildLoading()` | Initial state while data is being fetched |
| **Error** | `buildError(error)` | When the load() future throws an exception |
| **Data** | `buildData(data)` | When data is successfully loaded |

## Error Handling

Handle different error types in buildError:

```dart
@override
Component buildError(Object error) {
  if (error is ApiException) {
    if (error.statusCode == 404) {
      return DEmpty(
        icon: DIcon(icon: 'heroicons:document'),
        title: 'Not Found',
        description: 'The requested resource was not found.',
      );
    }

    return DAlert(
      title: 'Server Error',
      description: error.message,
      color: DAlertColor.error,
    );
  }

  return DAlert(
    title: 'Connection Error',
    description: 'Please check your internet connection.',
    color: DAlertColor.warning,
    actions: [
      DButton(
        label: 'Retry',
        onClick: () => reload(),
      ),
    ],
  );
}
```

## Reloading

Call `reload()` to refresh the data:

```dart
class _PostsState extends DuxtState<PostsPage, List<Post>> {
  @override
  Future<List<Post>> load() => PostsApi.getAll();

  @override
  Component buildData(List<Post> posts) {
    return div([
      DButton(
        label: 'Refresh',
        onClick: () => reload(),
      ),
      for (final post in posts)
        PostCard(
          post: post,
          onDelete: () async {
            await PostsApi.delete(post.id);
            reload();
          },
        ),
    ]);
  }
}
```

## DuxtMultiState

Use `DuxtMultiState` when you need to load multiple data sources in parallel:

```dart
class DashboardPage extends StatefulComponent {
  const DashboardPage({super.key});

  @override
  State createState() => _DashboardState();
}

class _DashboardState extends DuxtMultiState<DashboardPage> {
  @override
  Map<String, Future<dynamic> Function()> get loaders => {
    'posts': () => PostsApi.getAll(),
    'users': () => UsersApi.getAll(),
    'stats': () => StatsApi.get(),
  };

  @override
  Component buildLoading() => DSpinner();

  @override
  Component buildError(Object error) => DAlert(
    title: 'Error',
    description: error.toString(),
    color: DAlertColor.error,
  );

  @override
  Component buildData(Map<String, dynamic> data) {
    final posts = data['posts'] as List<Post>;
    final users = data['users'] as List<User>;
    final stats = data['stats'] as Stats;

    return div([
      StatsOverview(stats: stats),
      RecentPosts(posts: posts),
      ActiveUsers(users: users),
    ]);
  }
}
```

## AsyncData

For standalone async state management outside of `DuxtState`, use `AsyncData<T>`:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:duxt/duxt.dart';

class MyPage extends StatefulComponent {
  const MyPage({super.key});

  @override
  State createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final _posts = AsyncData<List<Post>>();

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    _posts.setLoading();
    setState(() {});
    try {
      _posts.setData(await PostsApi.getAll());
    } catch (e) {
      _posts.setError(e);
    }
    setState(() {});
  }

  @override
  Component build(BuildContext context) {
    if (_posts.loading) return DSpinner();
    if (_posts.hasError) return DAlert(title: 'Error: ${_posts.error}');

    return div([
      DButton(label: 'Refresh', onClick: _loadPosts),
      for (final post in _posts.data!)
        PostCard(post: post),
    ]);
  }
}
```

### AsyncData Properties

| Property | Type | Description |
|----------|------|-------------|
| `data` | `T?` | Current data value |
| `error` | `Object?` | Current error if any |
| `loading` | `bool` | Whether currently loading |
| `hasData` | `bool` | True if data loaded successfully |
| `hasError` | `bool` | True if an error occurred |

### AsyncData Methods

| Method | Description |
|--------|-------------|
| `setLoading()` | Set loading state |
| `setData(T value)` | Set data and clear loading/error |
| `setError(Object e)` | Set error and clear loading |
| `reset()` | Reset to initial state |

## Navigation

For navigation utilities, see the [Routing](/duxt/routing) documentation.

```dart
// Navigate programmatically
context.push('/posts');
context.back();
context.replace('/login');

// Or use useRouter
final router = useRouter(context);
router.push('/posts');
```
