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

```
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

```
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

```
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

```
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

```
final posts = Model<Post>();
final post = await posts.find(1);

if (post != null) {
  post.title = 'Updated Title';
  post.published = true;
  await post.save();
}
```

### Delete

```
final posts = Model<Post>();
final post = await posts.find(1);

if (post != null) {
  await post.destroy();
}
```

## Custom Table Names

Override the auto-inferred table name:

```
Entity.registerModel<User>(
  User.fromRow,
  tableName: 'app_users',  // Instead of 'users'
  schema: { ... },
);
```

## Model<T> Query Interface

The `Model<T>` class provides a clean API for queries:

```
final posts = Model<Post>();

// All queries flow from this interface
await posts.all();
await posts.find(1);
await posts.where('published', true).get();
await posts.create({'title': 'New Post', ...});
await posts.count();
```

This gives you Rails-like syntax without the complexity.

## Soft Deletes

Soft deletes are **enabled by default** for all models. When you call `destroy()`, the record gets a `deleted_at` timestamp instead of being permanently removed. The `deleted_at` column is auto-injected into your schema during registration.

### Deleting Records

```
final post = await Model<Post>().find(1);

// Soft delete (sets deleted_at)
await post!.destroy();

// Check if soft-deleted
print(post.trashed); // true

// Restore
await post.restore();

// Permanently delete (bypasses soft deletes)
await post.forceDelete();
```

### Querying Soft-Deleted Records

By default, queries automatically exclude soft-deleted records:

```
final posts = Model<Post>();

// Only returns non-deleted posts
final active = await posts.all();

// Include soft-deleted posts
final all = await posts.withTrashed().get();

// Only soft-deleted posts
final trashed = await posts.onlyTrashed().get();
```

### Opting Out of Soft Deletes

To disable soft deletes for a specific model, pass `softDeletes: false` during registration:

```
static void register() {
  Entity.registerModel<LogEntry>(
    LogEntry.fromRow,
    softDeletes: false,  // Hard deletes only
    schema: {
      'id': Column.integer().primaryKey().autoIncrement(),
      'message': Column.text().notNull(),
    },
  );
}
```

## Disabling Timestamps

By default, `save()` auto-sets `created_at` and `updated_at` on every model. You can disable this per model during registration.

### Disable all timestamps

For write-once entities like sessions or one-time tokens:

```
Entity.registerModel<Session>(
  Session.fromRow,
  timestamps: false,  // No created_at or updated_at
  schema: {
    'id': Column.integer().primaryKey().autoIncrement(),
    'token': Column.string(255).notNull(),
    'expires_at': Column.dateTime().notNull(),
  },
);
```

### Disable only updated_at

For immutable-after-creation entities like audit logs:

```
Entity.registerModel<AuditLog>(
  AuditLog.fromRow,
  updatedAt: false,  // Keeps created_at, skips updated_at
  schema: {
    'id': Column.integer().primaryKey().autoIncrement(),
    'action': Column.string(255).notNull(),
    'created_at': Column.dateTime().nullable(),
  },
);
```

| Option | `created_at` | `updated_at` |
|--------|:---:|:---:|
| Default | auto | auto |
| `timestamps: false` | skip | skip |
| `updatedAt: false` | auto | skip |

## Lifecycle Hooks

Override lifecycle hooks to run logic before or after persistence operations:

```
class Post extends Entity {
  String? title;
  String? slug;

  @override
  Future<void> beforeSave() async {
    // Auto-generate slug from title
    slug ??= title?.toLowerCase().replaceAll(' ', '-');
  }

  @override
  Future<void> afterSave() async {
    // Log or trigger side effects
    print('Post saved: $id');
  }

  @override
  Future<void> beforeDelete() async {
    // Validate or clean up before deletion
  }

  @override
  Future<void> afterDelete() async {
    // Clean up related resources
  }
}
```

### Available Hooks

| Hook | When it runs |
|------|-------------|
| `beforeSave()` | Before INSERT or UPDATE |
| `afterSave()` | After INSERT or UPDATE |
| `beforeDelete()` | Before DELETE (including soft delete) |
| `afterDelete()` | After DELETE (including soft delete) |

All hooks are async and return `Future<void>`. The default implementation does nothing.
