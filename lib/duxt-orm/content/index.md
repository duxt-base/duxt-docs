---
title: Duxt ORM
description: ActiveRecord-style ORM for Duxt with auto-migrations. Supports PostgreSQL, MySQL, and SQLite.
layout: orm-layout
order: 1
---

# Duxt ORM

**ActiveRecord-style ORM for Dart** - define models, auto-migrate tables, and query data with a fluent API. Supports PostgreSQL, MySQL, and SQLite.

## What is Duxt ORM?

Duxt ORM brings the simplicity of ActiveRecord and GORM to Dart. Define your models as classes, register a schema, and let the ORM create and migrate your tables automatically. Query with a chainable builder, eager-load relations, and run transactions - all in pure Dart.

## Why Duxt ORM?

### Auto-Migrations
Register your schema once. `DuxtOrm.migrate()` creates and updates tables automatically - no migration files to manage.

### Fluent Query Builder
Chain `.where()`, `.orderBy()`, `.limit()`, and more. Reads like English, compiles to efficient SQL.

### Relations & Eager Loading
HasMany, BelongsTo, HasOne with `.include()` for eager loading. Supports nested dot notation (`author.profile`). No N+1 queries.

### Soft Deletes
Enabled by default on all models. `destroy()` sets `deleted_at` instead of removing rows. Query scopes like `withTrashed()` and `onlyTrashed()` give you full control.

### Lifecycle Hooks
Override `beforeSave()`, `afterSave()`, `beforeDelete()`, `afterDelete()` to run logic around persistence operations.

### Multi-Database
Switch between PostgreSQL, MySQL, and SQLite with a config change. Same API everywhere.

## Quick Start

Add to your `pubspec.yaml`:

```
dependencies:
  duxt_orm: ^0.3.0
```

Define a model:

```
class User extends Entity {
  String? email;
  String? name;

  User({int? id, this.email, this.name});

  @override Map<String, dynamic> toMap() => {'email': email, 'name': name};

  static void register() {
    Entity.registerModel<User>(
      (row) => User(id: row['id'], email: row['email'], name: row['name']),
      schema: {
        'id': Column.integer().primaryKey().autoIncrement(),
        'email': Column.string(255).unique().notNull(),
        'name': Column.string(100).notNull(),
      },
    );
  }
}
```

Initialize and query:

```
User.register();
await DuxtOrm.init(DuxtConfig.database);
await DuxtOrm.migrate();

final users = Model<User>();
final allUsers = await users.all();
final admins = await users.where('role', 'admin').get();
```

## Next Steps

- [Configuration](/duxt-orm/configuration) - Set up MySQL, PostgreSQL, or SQLite in duxt.config.dart
- [Models](/duxt-orm/models) - Define and register models, soft deletes, lifecycle hooks
- [Schema](/duxt-orm/schema) - Column types and modifiers
- [Queries](/duxt-orm/queries) - Query builder reference, soft delete scopes
- [Relations](/duxt-orm/relations) - HasMany, BelongsTo, HasOne with eager loading and nested dot notation
- [Transactions](/duxt-orm/transactions) - Transactions and raw queries
- [API Reference](/duxt-orm/api-reference) - Complete method listing
