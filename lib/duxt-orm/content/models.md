---
title: Models
description: Define and register models with Duxt ORM.
layout: orm-layout
order: 2
---

# Models

Models in Duxt ORM follow the ActiveRecord pattern. Each model maps to a database table.

## Defining a Model

Extend the `Entity` class and implement required methods:

```dart
import 'package:duxt_orm/duxt_orm.dart';

class Post extends Entity {
  int? _id;
  String title;
  String slug;
  String? content;
  int userId;
  bool published;
  DateTime? createdAt;

  Post({
    int? id,
    required this.title,
    required this.slug,
    this.content,
    required this.userId,
    this.published = false,
    this.createdAt,
  }) : _id = id;

  // Required: ID getter and setter
  @override
  dynamic get id => _id;

  @override
  set id(dynamic value) => _id = value as int?;

  // Required: Convert to map for INSERT/UPDATE
  @override
  Map<String, dynamic> toMap() => {
    'title': title,
    'slug': slug,
    'content': content,
    'user_id': userId,
    'published': published ? 1 : 0,
  };

  // Required: Factory constructor from database row
  factory Post.fromRow(Map<String, dynamic> row) => Post(
    id: row['id'] as int?,
    title: row['title'] as String,
    slug: row['slug'] as String,
    content: row['content'] as String?,
    userId: row['user_id'] as int,
    published: (row['published'] as int?) == 1,
    createdAt: DateTime.tryParse(row['created_at'] as String? ?? ''),
  );

  // Required: Register with schema
  static void register() {
    Entity.registerModel<Post>(
      Post.fromRow,
      schema: {
        'id': Column.integer().primaryKey().autoIncrement(),
        'title': Column.string(200).notNull(),
        'slug': Column.string(200).unique().notNull(),
        'content': Column.text().nullable(),
        'user_id': Column.integer().notNull().references('users'),
        'published': Column.boolean().defaultValue(false),
        'created_at': Column.dateTime().nullable(),
        'updated_at': Column.dateTime().nullable(),
      },
    );
  }
}
```

## Registering Models

Call `register()` on each model before initializing the ORM:

```dart
void main() async {
  // Register all models
  User.register();
  Post.register();
  Comment.register();

  // Initialize ORM
  await DuxtOrm.init(DuxtConfig.database);

  // Run migrations (creates/updates tables)
  await DuxtOrm.migrate();
}
```

## CRUD Operations

Use `Model<T>()` for clean Rails-like queries:

### Create

```dart
final posts = Model<Post>();

// Create and save
final post = Post(
  title: 'Hello World',
  slug: 'hello-world',
  content: 'My first post!',
  userId: 1,
);
await post.save();

print(post.id); // Auto-assigned ID

// Or create in one step
final newPost = await posts.create({
  'title': 'Hello',
  'slug': 'hello',
  'user_id': 1,
});
```

### Read

```dart
final posts = Model<Post>();

// Find by ID
final post = await posts.find(1);

// Find or throw
final post = await posts.findOrFail(1);

// Get all
final allPosts = await posts.all();

// Get first
final first = await posts.first();

// Count
final count = await posts.count();
```

### Update

```dart
final posts = Model<Post>();
final post = await posts.find(1);

if (post != null) {
  post.title = 'Updated Title';
  post.published = true;
  await post.save();
}
```

### Delete

```dart
final posts = Model<Post>();
final post = await posts.find(1);

if (post != null) {
  await post.destroy();
}
```

## Custom Table Names

Override the auto-inferred table name:

```dart
Entity.registerModel<User>(
  User.fromRow,
  tableName: 'app_users',  // Instead of 'users'
  schema: { ... },
);
```

## Model<T> Query Interface

The `Model<T>` class provides a clean API for queries:

```dart
final posts = Model<Post>();

// All queries flow from this interface
await posts.all();
await posts.find(1);
await posts.where('published', true).get();
await posts.create({'title': 'New Post', ...});
await posts.count();
```

This gives you Rails-like syntax without the complexity.
