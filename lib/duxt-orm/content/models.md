---
title: Models
description: Define and register models with Duxt ORM.
layout: orm-layout
order: 2
---

# Models

Models in Duxt ORM follow the ActiveRecord pattern. Each model maps to a database table.

## Defining a Model

Extend the `Model` class and implement required methods:

```dart
import 'package:duxt_orm/duxt_orm.dart';

class Post extends Model {
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
    Model.registerModel<Post>(
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

### Create

```dart
// Create and save in one step
final post = Post(
  title: 'Hello World',
  slug: 'hello-world',
  content: 'My first post!',
  userId: 1,
);
await post.save();

print(post.id); // Auto-assigned ID
```

### Read

```dart
// Find by ID
final post = await Model.find<Post>(1);

// Find or throw
final post = await Model.findOrFail<Post>(1);

// Get all
final posts = await Model.all<Post>();

// Get first
final first = await Model.first<Post>();

// Count
final count = await Model.count<Post>();
```

### Update

```dart
final post = await Model.find<Post>(1);
if (post != null) {
  post.title = 'Updated Title';
  post.published = true;
  await post.save();
}
```

### Delete

```dart
final post = await Model.find<Post>(1);
if (post != null) {
  await post.destroy();
}
```

## Custom Table Names

Override the auto-inferred table name:

```dart
Model.registerModel<User>(
  User.fromRow,
  tableName: 'app_users',  // Instead of 'users'
  schema: { ... },
);
```

## Timestamps

The ORM doesn't auto-manage timestamps. Add them to your `toMap()`:

```dart
@override
Map<String, dynamic> toMap() => {
  'title': title,
  // ...other fields
  'updated_at': DateTime.now().toIso8601String(),
};
```

For new records, set `created_at`:

```dart
await post.save();
// The model's save() can check if id is null to set created_at
```
