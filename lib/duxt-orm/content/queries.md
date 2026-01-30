---
title: Queries
description: Query builder reference for Duxt ORM.
layout: orm-layout
order: 4
---

# Query Builder

Duxt ORM provides a fluent query builder for constructing database queries.

## Basic Queries

### Retrieve All Records

```dart
final users = await Model.all<User>();
```

### Find by ID

```dart
final user = await Model.find<User>(1);
// Returns null if not found

final user = await Model.findOrFail<User>(1);
// Throws exception if not found
```

### First Record

```dart
final user = await Model.first<User>();
```

### Count Records

```dart
final count = await Model.count<User>();
```

## Where Clauses

### Simple Where

```dart
// Equality
Model.where<User>('is_active', 1)

// With operator
Model.where<User>('age', 18, '>=')
Model.where<User>('status', 'banned', '!=')
```

### Multiple Conditions

```dart
Model.query<User>()
    .where('is_active', 1)
    .where('role', 'admin')
    .get()
```

### OR Conditions

```dart
Model.query<User>()
    .where('role', 'admin')
    .orWhere('role', 'moderator')
    .get()
```

### NULL Checks

```dart
// Where column IS NULL
Model.query<User>().whereNull('deleted_at').get()

// Where column IS NOT NULL
Model.query<User>().whereNotNull('email_verified_at').get()
```

### IN Clause

```dart
// Where column IN (values)
Model.query<User>().whereIn('id', [1, 2, 3]).get()

// Where column NOT IN (values)
Model.query<User>().whereNotIn('status', ['banned', 'suspended']).get()
```

### BETWEEN

```dart
Model.query<User>().whereBetween('age', 18, 65).get()
```

### LIKE

```dart
Model.query<User>().whereLike('name', '%john%').get()
Model.query<User>().whereLike('email', '%@gmail.com').get()
```

### Raw WHERE

```dart
Model.query<User>()
    .whereRaw('created_at > DATE_SUB(NOW(), INTERVAL 7 DAY)')
    .get()
```

## Ordering

```dart
// Ascending
Model.query<User>().orderBy('name').get()

// Descending
Model.query<User>().orderByDesc('created_at').get()

// Shortcuts for created_at
Model.query<User>().latest().get()  // ORDER BY created_at DESC
Model.query<User>().oldest().get()  // ORDER BY created_at ASC
```

## Pagination

```dart
Model.query<User>()
    .orderByDesc('created_at')
    .skip(20)   // OFFSET 20
    .take(10)   // LIMIT 10
    .get()
```

Or use `limit` and `offset`:

```dart
Model.query<User>()
    .limit(10)
    .offset(20)
    .get()
```

## Aggregates

```dart
// Count with conditions
final activeCount = await Model.query<User>()
    .where('is_active', 1)
    .count();

// Sum
final totalRevenue = await Model.query<Order>().sum('total');

// Average
final avgAge = await Model.query<User>().avg('age');

// Max and Min
final maxPrice = await Model.query<Product>().max('price');
final minPrice = await Model.query<Product>().min('price');
```

## Existence Checks

```dart
// Check if any records exist
if (await Model.where<User>('email', email).exists()) {
  print('Email already taken');
}

// Check if no records exist
if (await Model.where<User>('role', 'admin').doesntExist()) {
  print('No admins yet');
}
```

## Pluck (Single Column)

```dart
// Get list of values from one column
final emails = await Model.query<User>().pluck('email');
// ['john@example.com', 'jane@example.com', ...]

final ids = await Model.query<User>()
    .where('is_active', 1)
    .pluck('id');
// [1, 3, 5, 7, ...]
```

## Select Specific Columns

```dart
final users = await Model.query<User>()
    .select(['id', 'name', 'email'])
    .get();
```

## Bulk Operations

### Update Multiple Records

```dart
await Model.query<User>()
    .where('last_login', DateTime(2023), '<')
    .update({'is_active': 0});
```

### Delete Multiple Records

```dart
await Model.query<User>()
    .where('is_active', 0)
    .delete();
```

### Increment / Decrement

```dart
// Increment by 1
await Model.query<Post>().where('id', 1).increment('views');

// Increment by custom amount
await Model.query<Product>().where('id', 1).increment('stock', 10);

// Decrement
await Model.query<Product>().where('id', 1).decrement('stock', 5);
```

## Chaining Example

```dart
final recentActiveAdmins = await Model.query<User>()
    .select(['id', 'name', 'email', 'last_login'])
    .where('is_active', 1)
    .where('role', 'admin')
    .whereNotNull('email_verified_at')
    .whereBetween('created_at', startDate, endDate)
    .orderByDesc('last_login')
    .limit(10)
    .get();
```
