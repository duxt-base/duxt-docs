---
title: API Reference
description: Complete API reference for Duxt ORM - all methods, types, and modifiers.
layout: orm-layout
order: 6
---

# API Reference

Complete listing of all Duxt ORM classes, methods, and types.

## Model\<T\> Methods

The `Model<T>` class provides the primary query interface.

| Method | Returns | Description |
|--------|---------|-------------|
| `query()` | `QueryBuilder<T>` | Get a raw query builder |
| `all()` | `Future<List<T>>` | Get all records |
| `find(id)` | `Future<T?>` | Find by primary key |
| `findOrFail(id)` | `Future<T>` | Find or throw `RecordNotFoundException` |
| `first()` | `Future<T?>` | Get first record |
| `firstOrFail()` | `Future<T>` | Get first or throw |
| `where(col, val, [op])` | `QueryBuilder<T>` | Start a where query |
| `whereIn(col, values)` | `QueryBuilder<T>` | Where column in list |
| `include(relations)` | `QueryBuilder<T>` | Eager load relations |
| `create(attrs)` | `Future<T>` | Create and save a new record |
| `count()` | `Future<int>` | Count all records |
| `exists()` | `Future<bool>` | Check if any records exist |
| `doesntExist()` | `Future<bool>` | Check if no records exist |
| `withTrashed()` | `QueryBuilder<T>` | Include soft-deleted records |
| `onlyTrashed()` | `QueryBuilder<T>` | Only soft-deleted records |

## Entity Instance Methods

Methods available on model instances.

### Persistence

| Method | Returns | Description |
|--------|---------|-------------|
| `save()` | `Future<void>` | Insert (if new) or update |
| `destroy()` | `Future<void>` | Delete (soft delete if enabled) |
| `forceDelete()` | `Future<void>` | Permanently delete, bypass soft deletes |
| `restore()` | `Future<void>` | Restore a soft-deleted record |
| `refresh()` | `Future<void>` | Reload from database |
| `update(attrs)` | `Future<void>` | Update specific attributes and save |

### Lifecycle Hooks

| Method | Returns | Description |
|--------|---------|-------------|
| `beforeSave()` | `Future<void>` | Called before insert or update |
| `afterSave()` | `Future<void>` | Called after insert or update |
| `beforeDelete()` | `Future<void>` | Called before delete (including soft delete) |
| `afterDelete()` | `Future<void>` | Called after delete (including soft delete) |

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | `dynamic` | Primary key value |
| `tableName` | `String` | Database table name |
| `primaryKey` | `String` | Primary key column (default: `'id'`) |
| `timestamps` | `bool` | Whether to auto-manage created_at/updated_at |
| `softDeletes` | `bool` | Whether soft deletes are enabled (default: `true`) |
| `isNew` | `bool` | True if record has no ID yet |
| `trashed` | `bool` | True if record is soft-deleted |
| `guarded` | `List<String>` | Columns protected from mass assignment |
| `fillable` | `List<String>` | Columns allowed for mass assignment |

### Relations

| Method | Returns | Description |
|--------|---------|-------------|
| `getRelation<R>(name)` | `R?` | Get a loaded relation by name |
| `setRelation(name, value)` | `void` | Set a loaded relation |
| `relationLoaded(name)` | `bool` | Check if relation is loaded |
| `attach(rel, id)` | `Future<void>` | Attach via pivot table (many-to-many) |
| `detach(rel, id)` | `Future<void>` | Detach from pivot table |
| `sync(rel, ids)` | `Future<void>` | Sync pivot table with ID list |

## Entity Static Methods

| Method | Returns | Description |
|--------|---------|-------------|
| `setAdapter(adapter)` | `void` | Set the database adapter |
| `registerModel<T>(fromRow, ...)` | `void` | Register a model type with schema |
| `registerRelation<T>(name, rel)` | `void` | Register a relation for a model |
| `registerPivotTable(name, ...)` | `void` | Register a pivot table schema |
| `relationsFor<T>()` | `Map?` | Get relations for a model type |
| `tableNameFor<T>()` | `String` | Get table name for a model type |
| `fromRowFor<T>()` | `Function` | Get fromRow factory for a model type |
| `isSoftDelete<T>()` | `bool` | Check if model has soft deletes |
| `schemas` | `List<Schema>` | All registered schemas |
| `pivotSchemas` | `List<Schema>` | All pivot table schemas |

## QueryBuilder Methods

### Filtering

| Method | Returns | Description |
|--------|---------|-------------|
| `where(col, val, [op])` | `QueryBuilder` | AND where clause |
| `orWhere(col, val, [op])` | `QueryBuilder` | OR where clause |
| `whereNull(col)` | `QueryBuilder` | Where column IS NULL |
| `whereNotNull(col)` | `QueryBuilder` | Where column IS NOT NULL |
| `whereIn(col, values)` | `QueryBuilder` | Where column IN list |
| `whereNotIn(col, values)` | `QueryBuilder` | Where column NOT IN list |
| `whereBetween(col, start, end)` | `QueryBuilder` | Where column BETWEEN |
| `whereNotBetween(col, start, end)` | `QueryBuilder` | Where column NOT BETWEEN |
| `whereLike(col, pattern)` | `QueryBuilder` | Where column LIKE pattern |
| `whereRaw(sql, [params])` | `QueryBuilder` | Raw AND where clause |
| `orWhereRaw(sql, [params])` | `QueryBuilder` | Raw OR where clause |

### Soft Delete Scopes

| Method | Returns | Description |
|--------|---------|-------------|
| `withTrashed()` | `QueryBuilder` | Include soft-deleted records |
| `onlyTrashed()` | `QueryBuilder` | Only soft-deleted records |

### Ordering

| Method | Returns | Description |
|--------|---------|-------------|
| `orderBy(col, [dir])` | `QueryBuilder` | Order by column (ASC default) |
| `orderByDesc(col)` | `QueryBuilder` | Order by column DESC |
| `latest([col])` | `QueryBuilder` | Order by created_at DESC |
| `oldest([col])` | `QueryBuilder` | Order by created_at ASC |

### Pagination

| Method | Returns | Description |
|--------|---------|-------------|
| `limit(n)` | `QueryBuilder` | Limit results |
| `offset(n)` | `QueryBuilder` | Offset results |
| `take(n)` | `QueryBuilder` | Alias for limit |
| `skip(n)` | `QueryBuilder` | Alias for offset |

### Joins

| Method | Returns | Description |
|--------|---------|-------------|
| `join(table, first, op, second)` | `QueryBuilder` | INNER JOIN |
| `leftJoin(table, first, op, second)` | `QueryBuilder` | LEFT JOIN |
| `rightJoin(table, first, op, second)` | `QueryBuilder` | RIGHT JOIN |

### Selection

| Method | Returns | Description |
|--------|---------|-------------|
| `select(columns)` | `QueryBuilder` | Select specific columns |
| `distinct()` | `QueryBuilder` | Return distinct results |
| `groupBy(col)` | `QueryBuilder` | Group by column |
| `having(condition)` | `QueryBuilder` | Having clause |

### Eager Loading

| Method | Returns | Description |
|--------|---------|-------------|
| `include(relations)` | `QueryBuilder` | Eager load relations (supports dot notation) |

### Execution

| Method | Returns | Description |
|--------|---------|-------------|
| `get()` | `Future<List<T>>` | Execute query, return all results |
| `first()` | `Future<T?>` | Get first result |
| `firstOrFail()` | `Future<T>` | Get first or throw |
| `find(id)` | `Future<T?>` | Find by primary key |
| `findOrFail(id)` | `Future<T>` | Find by primary key or throw |
| `pluck(col)` | `Future<List>` | Get single column values |

### Aggregates

| Method | Returns | Description |
|--------|---------|-------------|
| `count([col])` | `Future<int>` | Count records |
| `sum(col)` | `Future<num>` | Sum of column |
| `avg(col)` | `Future<num>` | Average of column |
| `max(col)` | `Future<dynamic>` | Maximum value |
| `min(col)` | `Future<dynamic>` | Minimum value |
| `exists()` | `Future<bool>` | Any records exist? |
| `doesntExist()` | `Future<bool>` | No records exist? |

### Modification

| Method | Returns | Description |
|--------|---------|-------------|
| `delete()` | `Future<int>` | Delete matching records (respects soft deletes) |
| `forceDelete()` | `Future<int>` | Permanently delete matching records |
| `restore()` | `Future<int>` | Restore soft-deleted records |
| `update(values)` | `Future<int>` | Update matching records |
| `increment(col, [n])` | `Future<int>` | Increment column value |
| `decrement(col, [n])` | `Future<int>` | Decrement column value |

### Debugging

| Method | Returns | Description |
|--------|---------|-------------|
| `toSql()` | `String` | Get the raw SQL string |

## Column Types & Modifiers

### Type Constructors

| Constructor | SQL Type | Description |
|-------------|----------|-------------|
| `Column.integer()` | INTEGER | Integer column |
| `Column.bigInteger()` | BIGINT | Big integer column |
| `Column.smallInteger()` | SMALLINT | Small integer column |
| `Column.string([len])` | VARCHAR(len) | String column (default 255) |
| `Column.text()` | TEXT | Unlimited text column |
| `Column.boolean()` | BOOLEAN | Boolean column |
| `Column.date()` | DATE | Date column |
| `Column.time()` | TIME | Time column |
| `Column.dateTime()` | TIMESTAMP | DateTime/timestamp column |
| `Column.decimal([p, s])` | DECIMAL(p,s) | Decimal column |
| `Column.float()` | FLOAT | Float column |
| `Column.double_()` | DOUBLE | Double column |
| `Column.json()` | JSON | JSON column |
| `Column.binary()` | BLOB | Binary/blob column |

### Modifiers

| Modifier | Description |
|----------|-------------|
| `.primaryKey()` | Mark as primary key |
| `.autoIncrement()` | Enable auto-increment |
| `.notNull()` | Mark as NOT NULL |
| `.nullable()` | Mark as nullable (default) |
| `.unique()` | Add unique constraint |
| `.defaultValue(val)` | Set default value |
| `.references(table)` | Add foreign key reference |
| `.onDelete(action)` | Set ON DELETE action |
| `.onUpdate(action)` | Set ON UPDATE action |

## Relation Types

| Type | Description |
|------|-------------|
| `HasMany<T>(foreignKey: ...)` | One-to-many (e.g., Category has many Posts) |
| `HasOne<T>(foreignKey: ...)` | One-to-one (e.g., User has one Profile) |
| `BelongsTo<T>(foreignKey: ...)` | Inverse of has-many/has-one |
| `BelongsToMany<T>(pivotTable: ..., foreignPivotKey: ..., relatedPivotKey: ...)` | Many-to-many through pivot table |
