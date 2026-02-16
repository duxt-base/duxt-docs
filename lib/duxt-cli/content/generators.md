---
title: duxt g / duxt d
description: Generate and delete individual files - modules, pages, components, models, APIs, and layouts.
layout: cli-layout
order: 5
---

# duxt g (Generate)

Generate individual files for your Duxt project. Use this when you need more control than `scaffold` provides, or to add files to existing modules.

## Usage

```
duxt g <type> <name> [fields...]
```

Short alias:
```
duxt g <type> <name>
```

## Types

| Type | Alias | Description |
|------|-------|-------------|
| `module` | `mod` | Create a new module directory |
| `page` | `p` | Create a page component |
| `component` | `c` | Create a UI component |
| `model` | `m` | Create a DuxtORM model |
| `api` | `a` | Create API routes |
| `layout` | `l` | Create a layout component |

---

## Module

Create a new module with standard directory structure.

```
duxt g module posts
duxt g mod posts
```

**Creates:**
```
lib/posts/
├── pages/
│   └── index.dart
├── components/
```

### Namespaced Modules

Use uppercase first letter to create modules inside a namespace:

```
# Admin namespace
duxt g module Admin/Posts       # lib/admin/posts/ -> /admin/posts
duxt g module Admin/Users       # lib/admin/users/ -> /admin/users

# Theme namespace (routes to root /)
duxt g module Theme/Home        # lib/theme/home/ -> /
duxt g module Theme/Blog        # lib/theme/blog/ -> /blog
```

See [Namespaces](/duxt/namespaces) for full details.

---

## Page

Create a page component in a module's `pages/` directory.

```
duxt g page posts/index
duxt g p posts/index
```

**Creates:** `lib/posts/pages/index.dart`

### Namespaced Pages

```
duxt g page Admin/Posts/edit    # lib/admin/posts/pages/edit.dart -> /admin/posts/edit
duxt g page Admin/Posts/_id_    # lib/admin/posts/pages/_id_.dart -> /admin/posts/:id
duxt g page Theme/Blog/_slug_   # lib/theme/blog/pages/_slug_.dart -> /blog/:slug
```

### Dynamic Routes

Use bracket notation for dynamic segments:

```
# Single parameter
duxt g page posts/[id]
# Creates: lib/posts/pages/_id_.dart -> /posts/:id

# Nested routes
duxt g page posts/[id]/edit
# Creates: lib/posts/pages/_id_/edit.dart -> /posts/:id/edit

# Multiple parameters
duxt g page users/[userId]/posts/[postId]
# Creates: lib/users/pages/_userId_/posts/_postId_.dart
```

### Page Template

```
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class PostsIndexPage extends StatelessComponent {
  const PostsIndexPage({super.key});

  @override
  Component build(BuildContext context) {
    return main_([
      h1([text('Posts Index')]),
    ]);
  }
}
```

---

## Component

Create a reusable UI component.

```
duxt g component posts/card
duxt g c posts/card
```

**Creates:** `lib/posts/components/post_card.dart`

### Component Template

```
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class PostCard extends StatelessComponent {
  const PostCard({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'post-card', [
      // Component content
    ]);
  }
}
```

### Shared Components

Create shared components outside modules:

```
duxt g component shared/button
# Creates: lib/shared/components/button.dart
```

---

## Model

Create a DuxtORM entity model.

```
duxt g model post
duxt g m post
```

**Creates:** `lib/models/post.dart`

### With Fields

Specify fields directly:

```
duxt g model post id:int title:string content:text published:bool
```

**Creates:**

```
import 'package:duxt_orm/duxt_orm.dart';

@Entity()
class Post extends Model {
  @PrimaryKey()
  int? id;

  @Column()
  String? title;

  @Column()
  String? content;

  @Column()
  bool published = false;

  String get displayLabel => title ?? 'Post #$id';
}
```

### Field Types

| Type | Dart Type | Column |
|------|-----------|--------|
| `int` | `int?` | `INTEGER` |
| `string` | `String?` | `VARCHAR(255)` |
| `text` | `String?` | `TEXT` |
| `bool` | `bool` | `BOOLEAN` |
| `double` | `double?` | `DECIMAL` |
| `datetime` | `DateTime?` | `TIMESTAMP` |

---

## API

Create REST API routes for a resource.

```
duxt g api posts
duxt g a posts
```

**Creates:** `server/api/posts.dart`

### API Template

```
import 'package:duxt/server.dart';
import 'package:my_app/models/post.dart';

final postsRoutes = ApiModule(
  path: '/api/posts',
  routes: [
    ApiRoute.get('/', (req) async {
      final items = await Post.all();
      return Response.json(items.map((i) => i.toJson()).toList());
    }),

    ApiRoute.get('/:id', (req) async {
      final id = req.params['id'];
      final item = await Post.find(int.parse(id!));
      if (item == null) return Response.notFound();
      return Response.json(item.toJson());
    }),

    ApiRoute.post('/', (req) async {
      final body = await req.json();
      final item = Post()..fromJson(body);
      await item.save();
      return Response.json(item.toJson(), status: 201);
    }),

    ApiRoute.put('/:id', (req) async {
      final id = req.params['id'];
      final item = await Post.find(int.parse(id!));
      if (item == null) return Response.notFound();
      final body = await req.json();
      item.fromJson(body);
      await item.save();
      return Response.json(item.toJson());
    }),

    ApiRoute.delete('/:id', (req) async {
      final id = req.params['id'];
      final item = await Post.find(int.parse(id!));
      if (item == null) return Response.notFound();
      await item.delete();
      return Response.json({'deleted': true});
    }),
  ],
);
```

---

## Layout

Create a layout component for wrapping pages.

```
duxt g layout dashboard
duxt g l dashboard
```

**Creates:** `lib/shared/layouts/dashboard.dart`

### Namespace Layouts

Use uppercase first letter to create a namespace layout that auto-wraps all routes in that namespace:

```
duxt g layout Admin
```

**Creates:** `lib/admin/layouts/default.dart`

All routes under `/admin/*` are automatically wrapped with `AdminLayout`. See [Namespaces](/duxt/namespaces) for details.

### Layout Template

```
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class DashboardLayout extends StatelessComponent {
  final Component child;

  const DashboardLayout({required this.child, super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'dashboard-layout', [
      aside(classes: 'sidebar', [
        // Sidebar navigation
      ]),
      main_(classes: 'content', [child]),
    ]);
  }
}
```

---

# duxt d (Delete)

Delete generated files and clean up imports.

## Usage

```
duxt d <type> <name>
```

## Examples

```
# Delete entire module
duxt d module posts
duxt d mod posts

# Delete a page
duxt d page posts/index
duxt d p posts/[id]

# Delete a component
duxt d component posts/card
duxt d c posts/card

# Delete a model
duxt d model post
duxt d m post

# Delete API routes
duxt d api posts
duxt d a posts
```

## What Gets Deleted

### Module

```
duxt d module posts
```

Deletes:
- `lib/posts/` (entire directory)
- Related model in `lib/models/`
- Related API in `server/api/`

### Page

```
duxt d page posts/index
```

Deletes:
- `lib/posts/pages/index.dart`

### Component

```
duxt d component posts/card
```

Deletes:
- `lib/posts/components/post_card.dart`

### Model

```
duxt d model post
```

Deletes:
- `lib/models/post.dart`

### API

```
duxt d api posts
```

Deletes:
- `server/api/posts.dart`

## Safety

The delete command:
- Asks for confirmation before deleting
- Shows files that will be removed
- Does not delete files with modifications (use `--force` to override)

```
# Force delete without confirmation
duxt d module posts --force
```

---

## Combined Workflow

A typical development workflow:

```
# 1. Create the module structure
duxt g module posts

# 2. Add the model with fields
duxt g model post title:string content:text published:bool

# 3. Create the API
duxt g api posts

# 4. Create pages
duxt g page posts/index
duxt g page posts/[id]
duxt g page posts/new

# 5. Create components
duxt g component posts/card
duxt g component posts/form
```

Or use `scaffold` for all at once:

```
duxt scaffold posts title:string content:text published:bool
```

### Namespace Workflow

```
# 1. Create admin modules
duxt g module Admin/Dashboard
duxt g module Admin/Posts
duxt g module Admin/Users

# 2. Create namespace layout (auto-wraps all admin routes)
duxt g layout Admin

# 3. Add pages
duxt g page Admin/Posts/edit
duxt g page Admin/Posts/_id_

# 4. Create theme modules (public pages at root URLs)
duxt g module Theme/Home
duxt g module Theme/Blog

# 5. Create theme layout
duxt g layout Theme
```
