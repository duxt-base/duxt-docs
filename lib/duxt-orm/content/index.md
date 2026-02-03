---
title: Duxt ORM
description: ActiveRecord-style ORM for Duxt with auto-migrations. Supports PostgreSQL, MySQL, and SQLite.
layout: orm-layout
order: 1
---

# Duxt ORM

ActiveRecord-style ORM for Duxt with GORM-like auto-migrations.

Supports **PostgreSQL**, **MySQL**, and **SQLite**.

## Installation

```
dependencies:
  duxt_orm: ^0.2.0
```

## Quick Start

### 1. Define Your Model

```dart
import 'package:duxt_orm/duxt_orm.dart';

class User extends Model {
  int? _id;
  String? email;
  String? name;
  bool isActive;

  User({int? id, this.email, this.name, this.isActive = true}) : _id = id;

  @override dynamic get id => _id;
  @override set id(dynamic value) => _id = value as int?;

  @override
  Map<String, dynamic> toMap() => {
    'email': email,
    'name': name,
    'is_active': isActive ? 1 : 0,
  };

  factory User.fromRow(Map<String, dynamic> row) => User(
    id: row['id'] as int?,
    email: row['email'] as String?,
    name: row['name'] as String?,
    isActive: (row['is_active'] as int?) == 1,
  );

  static void register() {
    Model.registerModel<User>(
      User.fromRow,
      schema: {
        'id': Column.integer().primaryKey().autoIncrement(),
        'email': Column.string(255).unique().notNull(),
        'name': Column.string(100).notNull(),
        'is_active': Column.boolean().defaultValue(true),
        'created_at': Column.dateTime().nullable(),
        'updated_at': Column.dateTime().nullable(),
      },
    );
  }
}
```

### 2. Initialize and Migrate

```dart
// Register models
User.register();
Post.register();

// Initialize with config
await DuxtOrm.init(DuxtConfig.database);

// Auto-create tables
await DuxtOrm.migrate();
```

### 3. Use It

```dart
// Create a query interface
final users = Model<User>();
final posts = Model<Post>();

// Create
final user = User(email: 'test@example.com', name: 'Test');
await user.save();

// Query all
final allUsers = await users.all();

// Find by ID
final user = await users.find(1);

// Query with conditions
final admins = await users.where('role', 'admin').get();

// Query builder
final results = await users.query()
    .where('is_active', 1)
    .orderByDesc('created_at')
    .limit(10)
    .get();

// Update
user.name = 'Updated Name';
await user.save();

// Delete
await user.destroy();

// Relations with eager loading
final publishedPosts = await posts.query()
    .with_(['category', 'author'])  // Eager load relations
    .where('published', 1)
    .get();

for (final post in publishedPosts) {
  print(post.category?.name);  // Already loaded!
}
```

## Documentation

- **[Models](/duxt-orm/models)** - Define and register models
- **[Relations](/duxt-orm/relations)** - HasMany, BelongsTo, HasOne with eager loading
- **[Schema](/duxt-orm/schema)** - Column types and modifiers
- **[Queries](/duxt-orm/queries)** - Query builder reference
- **[Transactions](/duxt-orm/transactions)** - Transactions and raw queries

## Configuration

Configure in your `duxt.config.dart`:

```dart
class DuxtConfig {
  static const database = (
    driver: 'postgres',  // 'postgres', 'mysql', 'sqlite'
    host: String.fromEnvironment('DB_HOST', defaultValue: 'localhost'),
    port: int.fromEnvironment('DB_PORT', defaultValue: 5432),
    database: String.fromEnvironment('DB_NAME', defaultValue: 'myapp'),
    username: String.fromEnvironment('DB_USER', defaultValue: ''),
    password: String.fromEnvironment('DB_PASS', defaultValue: ''),
    path: 'data/app.db',  // SQLite only
    ssl: false,
  );
}
```

## Table Name Convention

Table names are auto-inferred from class names:

| Class Name | Table Name |
|------------|------------|
| `User` | `users` |
| `UserProfile` | `user_profiles` |
| `Category` | `categories` |
| `Person` | `persons` |

Override with `tableName` parameter:

```dart
Model.registerModel<User>(User.fromRow, tableName: 'app_users');
```
