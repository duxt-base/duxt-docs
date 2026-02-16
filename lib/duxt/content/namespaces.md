---
title: Namespaces
description: Organize modules into namespaces like Admin and Theme for grouped routing and auto-layouts.
layout: duxt-layout
order: 2.5
---

# Namespaces

## Overview

Namespaces let you group related modules under a common URL prefix with shared layouts. Instead of flat modules like `lib/posts/` and `lib/users/`, you can organize them under namespaces like `lib/admin/posts/` and `lib/admin/users/`.

This is useful for:

- **Admin panels** - Group all admin pages under `/admin/*` with a shared admin layout
- **Themes** - Create public-facing pages that route to root `/` paths
- **Multi-tenant** - Separate areas of your app with distinct navigation

## How It Works

```
Flat modules (still supported):
  lib/posts/pages/index.dart           -> /posts

Namespaced modules:
  lib/admin/posts/pages/index.dart     -> /admin/posts
  lib/admin/users/pages/index.dart     -> /admin/users

Theme namespace (special):
  lib/theme/home/pages/index.dart      -> /           (strips theme/ prefix)
  lib/theme/blog/pages/index.dart      -> /blog
```

Existing flat modules continue working unchanged. Namespaces are fully backwards compatible.

## Creating Namespaced Modules

Use uppercase first letter to indicate a namespace:

```
# Create an admin module
duxt g module Admin/Posts

# Creates:
# lib/admin/posts/
#   pages/index.dart     -> /admin/posts
#   components/

# Create more modules in the same namespace
duxt g module Admin/Users
duxt g module Admin/Dashboard
```

Generate pages and components within namespaces:

```
# Add a page
duxt g page Admin/Posts/edit
# Creates: lib/admin/posts/pages/edit.dart -> /admin/posts/edit

# Add a component
duxt g component Admin/Posts/card title:String

# Scaffold full CRUD
duxt scaffold Admin/Posts title:String content:String
# Creates full CRUD in lib/admin/posts/
# Routes: /admin/posts, /admin/posts/:id
# API: /api/admin/posts
```

## Namespace Layouts

Create a layout that automatically wraps all routes in a namespace:

```
duxt g layout Admin
```

This creates `lib/admin/layouts/default.dart`:

```
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class AdminLayout extends StatelessComponent {
  final Component child;

  const AdminLayout({super.key, required this.child});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen', [
      header(classes: 'bg-gray-900 border-b border-gray-700', [
        div(classes: 'max-w-7xl mx-auto px-4 py-3 flex items-center justify-between', [
          a(href: '/admin', classes: 'text-white font-semibold text-lg', [
            text('Admin'),
          ]),
          nav(classes: 'flex gap-4', [
            // Add navigation links here
          ]),
        ]),
      ]),
      main_(classes: 'max-w-7xl mx-auto px-4 py-8', [
        child,
      ]),
    ]);
  }
}
```

Once this file exists, **all routes** under `/admin/*` are automatically wrapped with `AdminLayout`. No manual configuration needed.

### Directory Structure

```
lib/admin/
  layouts/
    default.dart              AdminLayout (auto-wraps all /admin/* routes)
  posts/
    pages/
      index.dart              /admin/posts (wrapped in AdminLayout)
      _id_.dart               /admin/posts/:id (wrapped in AdminLayout)
    components/
      post_card.dart
  users/
    pages/
      index.dart              /admin/users (wrapped in AdminLayout)
```

## Theme Namespace

The `theme/` namespace is special - it strips the `theme/` prefix from routes, mapping directly to root paths. This lets you organize "public-facing" pages in a namespace while keeping clean URLs.

```
# Create theme modules
duxt g module Theme/Home
duxt g module Theme/Blog
duxt g module Theme/About
```

Route mapping:

| File | Route |
|------|-------|
| `lib/theme/home/pages/index.dart` | `/` |
| `lib/theme/home/pages/features.dart` | `/features` |
| `lib/theme/blog/pages/index.dart` | `/blog` |
| `lib/theme/blog/pages/_slug_.dart` | `/blog/:slug` |
| `lib/theme/about/pages/index.dart` | `/about` |

The `theme/home` module is special - it maps to the root `/` path, just like a flat `home` module would.

### Theme Layout

Create a layout for all theme pages:

```
duxt g layout Theme
```

Creates `lib/theme/layouts/default.dart` that wraps all theme routes (the public site layout).

## Detection Heuristic

Duxt automatically detects whether a directory is a namespace or a flat module:

- **Flat module**: A directory under `lib/` that directly contains `pages/` or `content/`
- **Namespace**: A directory under `lib/` that contains subdirectories with `pages/` or `content/`
- A directory **can be both** (has its own `pages/` AND child modules with `pages/`)

Directories named `shared`, `.generated`, `models`, and `.duxt` are always skipped.

## Route Conflict Resolution

If a theme route and a flat module produce the same URL path, the theme route wins. A warning is printed during route generation:

```
! Route conflict: /blog - theme/blog wins over blog
```

## Complete Example

```
lib/
  # Flat modules (still work)
  home/
    pages/index.dart                   -> /

  # Admin namespace
  admin/
    layouts/
      default.dart                     AdminLayout (auto-wraps)
    dashboard/
      pages/index.dart                 -> /admin/dashboard
    posts/
      pages/
        index.dart                     -> /admin/posts
        _id_.dart                      -> /admin/posts/:id
      components/
        post_card.dart
    users/
      pages/index.dart                 -> /admin/users

  # Theme namespace
  theme/
    layouts/
      default.dart                     ThemeLayout (auto-wraps)
    blog/
      pages/
        index.dart                     -> /blog
        _slug_.dart                    -> /blog/:slug
    about/
      pages/index.dart                 -> /about

  # Shared (never routed)
  shared/
    layouts/
      default.dart
    components/
      navbar.dart
```

## Generated Code

The router generator produces code like:

```
// Auto-generated routes
Route(
  path: '/admin/posts',
  builder: (context, state) {
    return layout_admin.AdminLayout(
      child: const page_admin_posts_postspage.PostsPage(),
    );
  },
),
```

Import aliases include the module path to avoid conflicts:

```
import '../admin/posts/pages/index.dart' as page_admin_posts_postspage;
import '../admin/layouts/default.dart' as layout_admin;
```

## See Also

- [Modules](/duxt/modules) - Module-based architecture
- [Routing](/duxt/routing) - File-based routing
- [Layouts](/duxt/layouts) - Layout system
- [Generators](/duxt-cli/generators) - CLI code generation
- [Scaffold](/duxt-cli/scaffold) - Full CRUD scaffolding
