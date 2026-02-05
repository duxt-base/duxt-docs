---
title: Build a Blog with Duxt
description: Step-by-step guide to building a full-featured blog with CRUD operations
order: 1
---

# Build a Blog with Duxt

In this tutorial, you'll build a complete blog application with categories, tags, posts, and comments - all with modal-based CRUD operations.

## Prerequisites

- Dart SDK 3.0+
- Basic knowledge of Dart

## Step 1: Create a New Project

```bash
duxt create my_blog --template minimal
cd my_blog
dart pub get
```

## Step 2: Scaffold the Categories Module

Categories help organize your blog posts.

```bash
duxt scaffold categories name:string slug:string description:text color:string --orm
```

This generates:
- `lib/categories/pages/index.dart` - List page with Create modal
- `lib/categories/pages/_id_.dart` - Detail page with Edit modal + Delete
- `lib/categories/components/category_card.dart`
- `lib/categories/components/category_form.dart`
- `lib/models/category.dart` - DuxtOrm model
- `server/api/categories.dart` - REST API

## Step 3: Scaffold the Tags Module

Tags provide flexible labeling for posts.

```bash
duxt scaffold tags name:string slug:string color:string --orm
```

## Step 4: Scaffold the Posts Module

Posts are the main content, with a relationship to categories.

```bash
duxt scaffold posts title:string slug:string content:text excerpt:text published:bool category:belongsTo:Category --orm
```

The `category:belongsTo:Category` syntax creates a foreign key relationship.

## Step 5: Scaffold the Comments Module

Allow readers to comment on posts.

```bash
duxt scaffold comments content:text author:string email:string approved:bool post:belongsTo:Post --orm
```

## Step 6: Add Routes to app.dart

Update `lib/app.dart` with the scaffolded routes:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'shared/layouts/default.dart';
import 'categories/pages/index.dart';
import 'categories/pages/_id_.dart';
import 'tags/pages/index.dart';
import 'tags/pages/_id_.dart';
import 'posts/pages/index.dart';
import 'posts/pages/_id_.dart';
import 'comments/pages/index.dart';
import 'comments/pages/_id_.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    final routes = [
      // Categories
      Route(path: '/categories', builder: (_, __) => const CategoriesListPage()),
      Route(path: '/categories/:id', builder: (_, state) => CategoriesDetailPage(id: state.params['id']!)),
      // Tags
      Route(path: '/tags', builder: (_, __) => const TagsListPage()),
      Route(path: '/tags/:id', builder: (_, state) => TagsDetailPage(id: state.params['id']!)),
      // Posts
      Route(path: '/posts', builder: (_, __) => const PostsListPage()),
      Route(path: '/posts/:id', builder: (_, state) => PostsDetailPage(id: state.params['id']!)),
      // Comments
      Route(path: '/comments', builder: (_, __) => const CommentsListPage()),
      Route(path: '/comments/:id', builder: (_, state) => CommentsDetailPage(id: state.params['id']!)),
    ];

    final wrappedRoutes = routes.map((route) => Route(
      path: route.path,
      builder: (context, state) => DefaultLayout(
        child: Builder(builder: (ctx) => route.builder!(ctx, state)),
      ),
    )).toList();

    return Router(routes: wrappedRoutes);
  }
}
```

## Step 7: Register Models for SSR

Update `lib/main.server.dart`:

```dart
import 'dart:io';
import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:duxt/duxt.dart';
import 'package:duxt_orm/duxt_orm.dart';
import 'app.dart';
import 'models/category.dart';
import 'models/tag.dart';
import 'models/post.dart';
import 'models/comment.dart';

void main() async {
  // Register models for SSR
  Category.register();
  Tag.register();
  Post.register();
  Comment.register();

  // Initialize ORM
  final dataDir = Platform.environment['DATA_DIR'] ?? '.';
  await DuxtOrm.init((
    driver: 'sqlite',
    host: '',
    port: 0,
    database: '',
    username: '',
    password: '',
    path: '$dataDir/app.db',
    ssl: false,
  ));

  Api.configure(baseUrl: '/api');
  runApp(Document(
    title: 'My Blog',
    head: [link(href: '/styles.css', rel: 'stylesheet')],
    body: App(),
  ));
}
```

## Step 8: Register Models and API Routes

Update `server/db.dart`:

```dart
import 'dart:io';
import 'package:duxt_orm/duxt_orm.dart';
import 'package:my_blog/models/category.dart';
import 'package:my_blog/models/tag.dart';
import 'package:my_blog/models/post.dart';
import 'package:my_blog/models/comment.dart';

class Db {
  static Future<void> init() async {
    Category.register();
    Tag.register();
    Post.register();
    Comment.register();

    final dataDir = Platform.environment['DATA_DIR'] ?? '.';
    await DuxtOrm.init((
      driver: 'sqlite',
      host: '',
      port: 0,
      database: '',
      username: '',
      password: '',
      path: '$dataDir/app.db',
      ssl: false,
    ));

    await DuxtOrm.migrate();
  }
}
```

Update `server/main.dart`:

```dart
import 'dart:io';
import 'package:duxt/server.dart';
import 'db.dart';
import 'api/categories.dart';
import 'api/tags.dart';
import 'api/posts.dart';
import 'api/comments.dart';

void main() async {
  await Db.init();

  final port = int.tryParse(Platform.environment['PORT'] ?? '') ?? 3001;

  final server = DuxtServer(
    port: port,
    middleware: [cors(), jsonBody(), logger()],
  );

  registerCategoryRoutes(server);
  registerTagRoutes(server);
  registerPostRoutes(server);
  registerCommentRoutes(server);

  server.start();
}
```

## Step 9: Run the Development Server

```bash
duxt dev
```

Your blog is now running at:
- **App:** http://localhost:4000
- **API:** http://localhost:4000/api

## Features You Get

### Modal-Based CRUD
- **List Page:** Shows items in a grid with "New" button that opens a modal form
- **Detail Page:** Shows item details with "Edit" (modal) and "Delete" (with confirmation)

### Server-Side Rendering
All pages use `AsyncStatelessComponent` for SSR - no loading states needed.

### REST API
Each module gets full CRUD endpoints:
- `GET /api/posts` - List all
- `GET /api/posts/:id` - Get one
- `POST /api/posts` - Create
- `PUT /api/posts/:id` - Update
- `DELETE /api/posts/:id` - Delete

### Dark Theme UI
Clean, modern design with Tailwind CSS classes.

## Next Steps

- Add authentication with middleware
- Customize the layout in `lib/shared/layouts/default.dart`
- Add rich text editing for post content
- Implement comment moderation
- Add image uploads for featured images

## Full Commands Reference

```bash
# Create project
duxt create my_blog --template minimal

# Scaffold modules
duxt scaffold categories name:string slug:string description:text color:string --orm
duxt scaffold tags name:string slug:string color:string --orm
duxt scaffold posts title:string slug:string content:text excerpt:text published:bool category:belongsTo:Category --orm
duxt scaffold comments content:text author:string email:string approved:bool post:belongsTo:Post --orm

# Run dev server
duxt dev

# Build for production
duxt build
```
