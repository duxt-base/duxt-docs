---
title: Schema
description: Define database schemas with column types and modifiers.
layout: orm-layout
order: 3
---

# Schema Definition

Define your table schema when registering models. The schema is used for auto-migrations.

## Column Types

```
Column.integer()        // INTEGER
Column.bigInteger()     // BIGINT
Column.string(255)      // VARCHAR(255)
Column.text()           // TEXT
Column.boolean()        // BOOLEAN (stored as INTEGER 0/1)
Column.dateTime()       // TIMESTAMP
Column.date()           // DATE
Column.time()           // TIME
Column.decimal(10, 2)   // DECIMAL(10, 2)
Column.float()          // FLOAT
Column.json()           // JSON (TEXT on SQLite)
Column.binary()         // BLOB
```

## Column Modifiers

Chain modifiers to define constraints:

```
// Primary key with auto-increment
Column.integer().primaryKey().autoIncrement()

// NOT NULL constraint
Column.string(255).notNull()

// Nullable (default)
Column.string(255).nullable()

// Unique constraint
Column.string(255).unique()

// Default value
Column.boolean().defaultValue(true)
Column.integer().defaultValue(0)
Column.string(50).defaultValue('pending')

// Foreign key reference
Column.integer().references('users')        // References users(id)
Column.integer().references('users', 'uid') // References users(uid)
```

## Complete Example

```
static void register() {
  Model.registerModel<Post>(
    Post.fromRow,
    schema: {
      // Primary key
      'id': Column.integer().primaryKey().autoIncrement(),

      // Required string fields
      'title': Column.string(200).notNull(),
      'slug': Column.string(200).unique().notNull(),

      // Optional text field
      'content': Column.text().nullable(),
      'excerpt': Column.string(500).nullable(),

      // Foreign key
      'user_id': Column.integer().notNull().references('users'),
      'category_id': Column.integer().nullable().references('categories'),

      // Boolean with default
      'published': Column.boolean().defaultValue(false),
      'featured': Column.boolean().defaultValue(false),

      // Numeric fields
      'views': Column.integer().defaultValue(0),
      'rating': Column.decimal(3, 2).nullable(),

      // JSON data (stored as TEXT in SQLite)
      'metadata': Column.json().nullable(),

      // Timestamps
      'published_at': Column.dateTime().nullable(),
      'created_at': Column.dateTime().nullable(),
      'updated_at': Column.dateTime().nullable(),
    },
  );
}
```

## Database-Specific Types

The ORM translates types appropriately for each database:

| Column Type | PostgreSQL | MySQL | SQLite |
|-------------|------------|-------|--------|
| `integer()` | INTEGER | INT | INTEGER |
| `bigInteger()` | BIGINT | BIGINT | INTEGER |
| `string(n)` | VARCHAR(n) | VARCHAR(n) | TEXT |
| `text()` | TEXT | TEXT | TEXT |
| `boolean()` | BOOLEAN | TINYINT(1) | INTEGER |
| `dateTime()` | TIMESTAMP | DATETIME | TEXT |
| `decimal(p,s)` | DECIMAL(p,s) | DECIMAL(p,s) | REAL |
| `json()` | JSONB | JSON | TEXT |

## Auto-Increment

Auto-increment behavior varies by database:

- **PostgreSQL**: Uses `SERIAL` or `BIGSERIAL`
- **MySQL**: Uses `AUTO_INCREMENT`
- **SQLite**: Uses `INTEGER PRIMARY KEY` (implicit auto-increment)

```
'id': Column.integer().primaryKey().autoIncrement(),
// PostgreSQL: id SERIAL PRIMARY KEY
// MySQL: id INT PRIMARY KEY AUTO_INCREMENT
// SQLite: id INTEGER PRIMARY KEY
```

## Indexes

Indexes are created automatically for:
- Primary keys
- Unique columns
- Foreign key references

For composite or custom indexes, use raw migrations:

```
await DuxtOrm.execute(
  'CREATE INDEX idx_posts_user_date ON posts(user_id, created_at)'
);
```
