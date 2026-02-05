---
title: File-Based Routing
description: Routes are automatically generated from your file structure.
layout: duxt-layout
order: 3
---

# File-Based Routing

## Overview

Duxt uses **file-based routing** where the file structure in your `pages/` directories automatically defines your application routes.

No manual route configuration required - just create a file and the route exists.

## Basic Routes

Files map directly to URL paths:

| File | Route |
|------|-------|
| `lib/posts/pages/index.dart` | `/posts` |
| `lib/posts/pages/create.dart` | `/posts/create` |
| `lib/users/pages/index.dart` | `/users` |
| `lib/users/pages/settings.dart` | `/users/settings` |

```
// lib/posts/pages/index.dart → /posts
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class PostsPage extends StatelessComponent {
  const PostsPage({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('All Posts')]),
    ]);
  }
}
```

## Dynamic Routes

Use `_param_` syntax for dynamic segments (Dart-compatible alternative to Next.js `[param]`):

| File | Route |
|------|-------|
| `lib/posts/pages/_id_.dart` | `/posts/:id` |
| `lib/posts/pages/_id_/edit.dart` | `/posts/:id/edit` |
| `lib/users/pages/_userId_/posts/_postId_.dart` | `/users/:userId/posts/:postId` |

```
// lib/posts/pages/_id_.dart → /posts/:id
import 'package:jaspr/jaspr.dart';

class PostDetailPage extends StatelessComponent {
  final String id;

  const PostDetailPage({required this.id, super.key});

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('Post $id')]),
    ]);
  }
}

// The route builder passes params automatically:
// Route(
//   path: '/posts/:id',
//   builder: (context, state) => PostDetailPage(id: state.params['id']!),
// )
```

### Why `_param_` instead of `[param]`?

Dart doesn't allow `[` or `]` in filenames. The `_param_` convention is Dart-compatible while providing the same functionality:

| Framework | Dynamic Route Syntax |
|-----------|---------------------|
| Next.js | `[slug].tsx` |
| Nuxt | `[slug].vue` |
| SvelteKit | `[slug]/+page.svelte` |
| **Duxt** | `_slug_.dart` |

## Nested Routes

Create nested directories for nested routes. You can nest as deep as you want:

```
lib/company/pages/
├── index.dart              → /company
├── about.dart              → /company/about
└── team/
    ├── index.dart          → /company/team
    └── engineering.dart    → /company/team/engineering
```

### Deep Nesting Example

| File | Route |
|------|-------|
| `lib/company/pages/index.dart` | `/company` |
| `lib/company/pages/about.dart` | `/company/about` |
| `lib/company/pages/team/index.dart` | `/company/team` |
| `lib/company/pages/team/engineering.dart` | `/company/team/engineering` |
| `lib/company/pages/team/design.dart` | `/company/team/design` |

### With Dynamic Parameters

```
lib/blog/pages/
├── index.dart              → /blog
├── create.dart             → /blog/create
├── _slug_.dart             → /blog/:slug
└── _slug_/
    ├── edit.dart           → /blog/:slug/edit
    ├── comments.dart       → /blog/:slug/comments
    └── comments/
        └── _commentId_.dart → /blog/:slug/comments/:commentId
```

## Route Parameters

Route parameters are passed to your component via the route builder. Access them through `RouteState`:

```
// In app.dart or routes configuration
Route(
  path: '/posts/:id',
  builder: (context, state) {
    // Access path params
    final id = state.params['id']!;
    // Access query params (?search=hello)
    final search = state.queryParams['search'];

    return PostDetailPage(id: id, search: search);
  },
)
```

Your component receives typed parameters:

```
class PostDetailPage extends StatelessComponent {
  final String id;
  final String? search;

  const PostDetailPage({required this.id, this.search, super.key});

  @override
  Component build(BuildContext context) {
    return div([
      text('Viewing post $id'),
      if (search != null) text('Searching: $search'),
    ]);
  }
}
```

### Auto-detection from Constructor

Duxt automatically detects required parameters from your component constructor and adds them as dynamic route segments:

```
// lib/blog/pages/post.dart
class BlogPostPage extends StatelessComponent {
  final String slug;  // Required param detected!

  const BlogPostPage({required this.slug, super.key});
  // ...
}
// Generates route: /blog/post/:slug
```

This means you can also just name your file normally and let Duxt infer the dynamic segment from your constructor.

## Navigation

Navigate between routes programmatically using context extensions:

```
import 'package:jaspr/jaspr.dart';
import 'package:duxt/duxt.dart';

class MyPage extends StatelessComponent {
  const MyPage({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      button(
        events: {'click': (_) => context.push('/posts')},
        [text('View Posts')],
      ),
      button(
        events: {'click': (_) => context.push('/posts/123')},
        [text('View Post 123')],
      ),
      button(
        events: {'click': (_) => context.back()},
        [text('Go Back')],
      ),
      button(
        events: {'click': (_) => context.replace('/login')},
        [text('Replace (no history)')],
      ),
    ]);
  }
}
```

### Available Navigation Methods

```
// Navigate to a path (adds to history)
context.push('/posts');

// Navigate with extra data
context.push('/posts/1', extra: {'from': 'list'});

// Replace current route (no history entry)
context.replace('/login');

// Go back in browser history
context.back();

// Navigate by named route
context.pushNamed('post-detail', params: {'id': '123'});

// Preload a route for faster navigation
context.preload('/posts');
```

### Using useRouter

You can also get the router directly:

```
final router = useRouter(context);
router.push('/posts');
router.back();
```

### Declarative Links

Use jaspr_router's `Link` component or standard anchor tags:

```
import 'package:jaspr_router/jaspr_router.dart';

// Jaspr Router Link (client-side navigation)
Link(to: '/posts', child: text('View Posts'))

// Standard HTML anchor
a(href: '/posts', [text('View Posts')])
```

## Route Generation

Routes are automatically generated when you run:

```
duxt dev
duxt build
```

## Content Routes

In addition to Dart pages, Duxt also routes markdown files from `content/` directories:

| Source | Route |
|--------|-------|
| `lib/docs/pages/index.dart` | `/docs` (Dart) |
| `lib/docs/content/cli.md` | `/docs/cli` (markdown) |
| `lib/docs/content/guides/index.md` | `/docs/guides` (markdown) |

Content routes are generated alongside page routes:

```
lib/docs/
├── pages/
│   └── index.dart          → /docs
└── content/
    ├── cli.md              → /docs/cli
    └── guides/
        └── index.md        → /docs/guides
```

This enables a unified routing system where both Dart components and markdown content coexist in the same module. See [Content System](/duxt/content) for details on layouts and configuration.
