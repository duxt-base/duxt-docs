---
title: Queries
description: Query builder reference for Duxt ORM.
layout: orm-layout
order: 4
---

# Query Builder

Duxt ORM provides a fluent query builder with Rails-like syntax using `Model<T>`.

## Basic Queries

### Setup

```
// Create a query interface for any model
final users = Model<User>();
final posts = Model<Post>();
```

### Retrieve All Records

```
final allUsers = await users.all();
```

### Find by ID

```
final user = await users.find(1);
// Returns null if not found

final user = await users.findOrFail(1);
// Throws exception if not found
```

### First Record

```
final user = await users.first();
```

### Count Records

```
final count = await users.count();
```

## Where Clauses

### Simple Where

```
// Equality
users.where('is_active', 1)

// With operator
users.where('age', 18, '>=')
users.where('status', 'banned', '!=')
```

### Multiple Conditions

```
await users.query()
    .where('is_active', 1)
    .where('role', 'admin')
    .get();
```

### OR Conditions

```
await users.query()
    .where('role', 'admin')
    .orWhere('role', 'moderator')
    .get();
```

### NULL Checks

```
// Where column IS NULL
users.query().whereNull('deleted_at').get()

// Where column IS NOT NULL
users.query().whereNotNull('email_verified_at').get()
```

### IN Clause

```
// Where column IN (values)
users.query().whereIn('id', [1, 2, 3]).get()

// Where column NOT IN (values)
users.query().whereNotIn('status', ['banned', 'suspended']).get()
```

### BETWEEN

```
users.query().whereBetween('age', 18, 65).get()
```

### LIKE

```
users.query().whereLike('name', '%john%').get()
users.query().whereLike('email', '%@gmail.com').get()
```

### Raw WHERE

```
users.query()
    .whereRaw('created_at > DATE_SUB(NOW(), INTERVAL 7 DAY)')
    .get()
```

## Ordering

```
final users = Model<User>();

// Ascending
users.query().orderBy('name').get()

// Descending
users.query().orderByDesc('created_at').get()

// Shortcuts for created_at
users.query().latest().get()  // ORDER BY created_at DESC
users.query().oldest().get()  // ORDER BY created_at ASC
```

## Pagination

```
final users = Model<User>();

await users.query()
    .orderByDesc('created_at')
    .skip(20)   // OFFSET 20
    .take(10)   // LIMIT 10
    .get();
```

Or use `limit` and `offset`:

```
await users.query()
    .limit(10)
    .offset(20)
    .get();
```

## Aggregates

```
final users = Model<User>();

// Count with conditions
final activeCount = await users
    .where('is_active', 1)
    .count();

// Sum
final orders = Model<Order>();
final totalRevenue = await orders.query().sum('total');

// Average
final avgAge = await users.query().avg('age');

// Max and Min
final products = Model<Product>();
final maxPrice = await products.query().max('price');
final minPrice = await products.query().min('price');
```

## Existence Checks

```
final users = Model<User>();

// Check if any records exist
if (await users.where('email', email).exists()) {
  print('Email already taken');
}

// Check if no records exist
if (await users.where('role', 'admin').doesntExist()) {
  print('No admins yet');
}
```

## Pluck (Single Column)

```
final users = Model<User>();

// Get list of values from one column
final emails = await users.query().pluck('email');
// ['john@example.com', 'jane@example.com', ...]

final ids = await users
    .where('is_active', 1)
    .query()
    .pluck('id');
// [1, 3, 5, 7, ...]
```

## Select Specific Columns

```
final users = Model<User>();

final result = await users.query()
    .select(['id', 'name', 'email'])
    .get();
```

## Bulk Operations

### Update Multiple Records

```
final users = Model<User>();

await users.query()
    .where('last_login', DateTime(2023), '<')
    .update({'is_active': 0});
```

### Delete Multiple Records

```
final users = Model<User>();

await users.query()
    .where('is_active', 0)
    .delete();
```

### Increment / Decrement

```
final posts = Model<Post>();

// Increment by 1
await posts.where('id', 1).query().increment('views');

// Increment by custom amount
final products = Model<Product>();
await products.where('id', 1).query().increment('stock', 10);

// Decrement
await products.where('id', 1).query().decrement('stock', 5);
```

## Soft Delete Scopes

By default, queries exclude soft-deleted records. Use these methods to change that behavior:

### Include Soft-Deleted Records

```
final posts = Model<Post>();

// Include trashed records in results
final all = await posts.withTrashed().get();

// Also works with other query methods
final count = await posts.withTrashed().count();
```

### Only Soft-Deleted Records

```
final posts = Model<Post>();

// Only return soft-deleted records
final trashed = await posts.onlyTrashed().get();
```

### Restore and Force Delete via Query

```
final posts = Model<Post>();

// Restore all trashed posts by a user
await posts.query()
    .onlyTrashed()
    .where('user_id', 1)
    .restore();

// Permanently delete trashed records
await posts.query()
    .onlyTrashed()
    .where('user_id', 1)
    .forceDelete();
```

## Chaining Example

```
final users = Model<User>();

final recentActiveAdmins = await users.query()
    .select(['id', 'name', 'email', 'last_login'])
    .where('is_active', 1)
    .where('role', 'admin')
    .whereNotNull('email_verified_at')
    .whereBetween('created_at', startDate, endDate)
    .orderByDesc('last_login')
    .limit(10)
    .get();
```

## Complete Example

```
import 'package:duxt_orm/duxt_orm.dart';

void main() async {
  // Initialize
  User.register();
  Post.register();
  await DuxtOrm.init(config);

  // Use Model<T> for queries
  final users = Model<User>();
  final posts = Model<Post>();

  // Find user
  final user = await users.find(1);

  // Get user's published posts
  final userPosts = await posts
      .where('user_id', user!.id)
      .where('published', true)
      .query()
      .orderByDesc('created_at')
      .get();

  // Create new post
  final newPost = await posts.create({
    'title': 'Hello World',
    'slug': 'hello-world',
    'user_id': user.id,
    'published': true,
  });

  print('Created post: ${newPost.title}');
}
```
