---
title: Relations
description: Define relationships between models with eager loading support.
layout: orm-layout
order: 3
---

# Relations

Duxt ORM supports four types of relationships between models:

- **HasMany** - One-to-many (e.g., Category has many Posts)
- **BelongsTo** - Inverse of has-many (e.g., Post belongs to Category)
- **HasOne** - One-to-one (e.g., User has one Profile)
- **BelongsToMany** - Many-to-many through pivot tables

## Defining Relations

Relations are registered alongside your model:

```
import 'package:duxt_orm/duxt_orm.dart';

class Post extends Entity {
  int? _id;
  String title;
  int? categoryId;  // Foreign key

  // Relation accessor
  Category? get category => getRelation<Category>('category');

  static void register() {
    // Register model with schema
    Entity.registerModel<Post>(Post.fromRow, schema: {
      'id': Column.integer().primaryKey().autoIncrement(),
      'title': Column.string(200).notNull(),
      'category_id': Column.integer().nullable().references('categories'),
    });

    // Register BelongsTo relation
    Entity.registerRelation<Post>(
      'category',
      BelongsTo<Category>(foreignKey: 'category_id'),
    );
  }

  @override
  Map<String, dynamic> toMap() => {
    'id': id,  // Include id for relations
    'title': title,
    'category_id': categoryId,
  };

  // ... rest of model
}
```

```
class Category extends Entity {
  int? _id;
  String name;

  // Relation accessor
  List<Post> get posts => getRelation<List<Post>>('posts') ?? [];

  static void register() {
    Entity.registerModel<Category>(Category.fromRow, schema: {
      'id': Column.integer().primaryKey().autoIncrement(),
      'name': Column.string(100).notNull(),
    });

    // Register HasMany relation
    Entity.registerRelation<Category>(
      'posts',
      HasMany<Post>(foreignKey: 'category_id'),
    );
  }

  // ... rest of model
}
```

## Eager Loading

Use `.with_()` to load related models in a single query, preventing N+1 queries:

```
final posts = Model<Post>();

// Load posts WITH their categories (2 queries total instead of N+1)
final results = await posts.query()
    .with_(['category'])
    .where('published', 1)
    .get();

for (final post in results) {
  print(post.title);
  print(post.category?.name);  // Already loaded!
}
```

```
final categories = Model<Category>();

// Load categories WITH their posts
final results = await categories.query()
    .with_(['posts'])
    .get();

for (final category in results) {
  print(category.name);
  print('${category.posts.length} posts');
}
```

## HasMany

One-to-many relationship. The related model has a foreign key pointing to this model.

```
// Category has many Posts
Entity.registerRelation<Category>(
  'posts',
  HasMany<Post>(
    foreignKey: 'category_id',  // Column on posts table
    localKey: 'id',              // Column on categories table (default)
  ),
);

// Access loaded relation
final categories = Model<Category>();
final category = await categories.query()
    .with_(['posts'])
    .find(1);

print(category?.posts.length);  // List<Post>
```

## BelongsTo

Inverse of HasMany. This model has a foreign key pointing to the related model.

```
// Post belongs to Category
Entity.registerRelation<Post>(
  'category',
  BelongsTo<Category>(
    foreignKey: 'category_id',  // Column on posts table
    ownerKey: 'id',              // Column on categories table (default)
  ),
);

// Access loaded relation
final posts = Model<Post>();
final post = await posts.query()
    .with_(['category'])
    .find(1);

print(post?.category?.name);  // Category?
```

## HasOne

One-to-one relationship. Similar to HasMany but returns a single model.

```
// User has one Profile
Entity.registerRelation<User>(
  'profile',
  HasOne<Profile>(
    foreignKey: 'user_id',  // Column on profiles table
    localKey: 'id',          // Column on users table (default)
  ),
);

// Access loaded relation
final users = Model<User>();
final user = await users.query()
    .with_(['profile'])
    .find(1);

print(user?.profile?.bio);  // Profile?
```

## BelongsToMany

Many-to-many through a pivot table.

```
// Post has many Tags through post_tags pivot table
Entity.registerRelation<Post>(
  'tags',
  BelongsToMany<Tag>(
    pivotTable: 'post_tags',
    foreignPivotKey: 'post_id',   // Column on pivot for this model
    relatedPivotKey: 'tag_id',     // Column on pivot for related model
    localKey: 'id',                // Column on posts table (default)
    relatedKey: 'id',              // Column on tags table (default)
  ),
);

// Register the pivot table schema (v0.2.1+)
Entity.registerPivotTable('post_tags', schema: {
  'post_id': Column.integer().notNull().references('posts'),
  'tag_id': Column.integer().notNull().references('tags'),
}, primaryKey: ['post_id', 'tag_id']);

// Access loaded relation
final posts = Model<Post>();
final post = await posts.query()
    .with_(['tags'])
    .find(1);

print(post?.tags.map((t) => t.name));  // List<Tag>
```

### Pivot Table Methods (v0.2.1+)

Manage many-to-many relationships with attach, detach, and sync:

```
// Attach a tag to a post
await post.attach('tags', tagId);

// Detach a tag from a post
await post.detach('tags', tagId);

// Sync tags (replace all with given IDs)
await post.sync('tags', [1, 2, 3]);
```

### Complete Many-to-Many Example

```
class Post extends Entity {
  int? _id;
  String title;

  // Relation accessor
  List<Tag> get tags => getRelation<List<Tag>>('tags') ?? [];

  static void register() {
    Entity.registerModel<Post>(Post.fromRow, schema: {
      'id': Column.integer().primaryKey().autoIncrement(),
      'title': Column.string(200).notNull(),
    });

    // Register BelongsToMany relation
    Entity.registerRelation<Post>(
      'tags',
      BelongsToMany<Tag>(
        pivotTable: 'post_tags',
        foreignPivotKey: 'post_id',
        relatedPivotKey: 'tag_id',
      ),
    );

    // Register pivot table for migration
    Entity.registerPivotTable('post_tags', schema: {
      'post_id': Column.integer().notNull().references('posts'),
      'tag_id': Column.integer().notNull().references('tags'),
    }, primaryKey: ['post_id', 'tag_id']);
  }

  // Convenience methods
  Future<void> addTag(int tagId) => attach('tags', tagId);
  Future<void> removeTag(int tagId) => detach('tags', tagId);
  Future<void> setTags(List<int> tagIds) => sync('tags', tagIds);
}

// Usage
final post = Post(title: 'My Post');
await post.save();

// Add tags
await post.addTag(1);
await post.addTag(2);

// Or sync all at once
await post.setTags([1, 2, 3]);

// Load post with tags
final loaded = await Model<Post>().query()
    .with_(['tags'])
    .find(post.id);

for (final tag in loaded!.tags) {
  print(tag.name);
}
```

## Relation Accessors

Models have helper methods for working with relations:

```
class Post extends Entity {
  // Type-safe getter for loaded relation
  Category? get category => getRelation<Category>('category');

  // For HasMany relations, return empty list if not loaded
  List<Comment> get comments => getRelation<List<Comment>>('comments') ?? [];
}

// Check if relation is loaded
if (post.relationLoaded('category')) {
  print(post.category?.name);
}

// Manually set a relation (used internally by QueryBuilder)
post.setRelation('category', someCategory);
```

## Important Notes

### Include ID in toMap()

For relations to work correctly, include the `id` field in your `toMap()` method:

```
@override
Map<String, dynamic> toMap() => {
  'id': id,  // Important for relations!
  'title': title,
  'category_id': categoryId,
};
```

### Registration Order

Register models in dependency order (parent before child):

```
void main() async {
  // Category first (no foreign keys)
  Category.register();

  // Post second (has category_id foreign key)
  Post.register();

  await DuxtOrm.init(config);
  await DuxtOrm.migrate();
}
```

### Eager Loading Multiple Relations

Load multiple relations in one query:

```
final posts = Model<Post>();
final results = await posts.query()
    .with_(['category', 'author', 'comments'])
    .get();
```

### Query Helpers with Eager Loading

Add helper methods to your models for common queries:

```
class Post extends Entity {
  // Helper with optional eager loading
  static Future<List<Post>> findAll({
    bool publishedOnly = false,
    bool withCategory = false,
  }) async {
    var query = Model<Post>().query();

    if (withCategory) {
      query = query.with_(['category']);
    }

    if (publishedOnly) {
      query = query.where('published', 1);
    }

    return query.orderByDesc('created_at').get();
  }
}

// Usage
final posts = await Post.findAll(
  publishedOnly: true,
  withCategory: true,
);
```
