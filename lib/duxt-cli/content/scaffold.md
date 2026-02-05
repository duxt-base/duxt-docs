---
title: duxt scaffold
description: Generate complete CRUD modules with pages, components, models, and API routes.
layout: cli-layout
order: 4
---

# duxt scaffold

Generate a complete CRUD module with list, detail, and create pages, form components, model definitions, and REST API routes.

## Usage

```
duxt scaffold <name> [fields...] [options]
```

## Examples

```
# Basic scaffold
duxt scaffold posts title:string content:text

# With all field types
duxt scaffold products \
  name:string \
  description:text \
  price:int \
  active:bool \
  releaseDate:datetime

# With relations
duxt scaffold posts \
  title:string \
  content:text \
  category:belongsTo:Category \
  tags:toMany:Tag
```

## Options

| Option | Description | Default |
|--------|-------------|---------|
| `--orm` | Generate DuxtORM model | `true` |
| `--no-api` | Skip API route generation | `false` |
| `--force` | Overwrite existing files | `false` |

## Generated Files

Running `duxt scaffold posts title:string content:text author:string` generates:

```
lib/
├── posts/
│   ├── pages/
│   │   ├── index.dart          List all posts
│   │   ├── _id_.dart           View single post
│   │   └── new.dart            Create new post
│   └── components/
│       ├── post_card.dart      Card component
│       └── post_form.dart      Form component
├── models/
│   └── post.dart               DuxtORM Entity

server/
└── api/
    └── posts.dart              REST API routes
```

## Field Types

| Syntax | Dart Type | DB Column | Form Input |
|--------|-----------|-----------|------------|
| `string` | `String?` | `VARCHAR(255)` | Text input |
| `text` | `String?` | `TEXT` | Textarea |
| `int` | `int?` | `INTEGER` | Number input |
| `double` | `double?` | `DECIMAL` | Number input |
| `bool` | `bool` | `BOOLEAN` | Checkbox |
| `datetime` | `DateTime?` | `TIMESTAMP` | Date picker |
| `email` | `String?` | `VARCHAR(255)` | Email input |
| `image` | `String?` | `VARCHAR(500)` | File upload |
| `attachment` | `String?` | `VARCHAR(500)` | File upload |

## Field Examples

```
# String fields
duxt scaffold users name:string email:email

# Text content
duxt scaffold articles title:string body:text summary:text

# Numbers
duxt scaffold products price:int quantity:int rating:double

# Boolean
duxt scaffold tasks title:string completed:bool priority:int

# DateTime
duxt scaffold events name:string startDate:datetime endDate:datetime

# Files
duxt scaffold documents title:string file:attachment thumbnail:image
```

## Relations

### BelongsTo (Foreign Key)

Creates a many-to-one relationship:

```
duxt scaffold posts category:belongsTo:Category
```

This generates:
- `category_id` column in the posts table
- `BelongsTo<Category>` relation in the model
- Dropdown select in the form

**Model output:**
```
@Entity()
class Post extends Model {
  @Column()
  int? category_id;

  @BelongsTo(foreignKey: 'category_id')
  Category? category;
}
```

### ToMany (Many-to-Many)

Creates a many-to-many relationship with a pivot table:

```
duxt scaffold posts tags:toMany:Tag
```

This generates:
- `post_tags` pivot table
- `BelongsToMany<Tag>` relation in the model
- Multi-select in the form

**Model output:**
```
@Entity()
class Post extends Model {
  @BelongsToMany(pivot: 'post_tags')
  List<Tag> tags = [];
}
```

### Combined Example

```
duxt scaffold posts \
  title:string \
  content:text \
  published:bool \
  category:belongsTo:Category \
  author:belongsTo:Author \
  tags:toMany:Tag
```

## Generated Model

```
import 'package:duxt_orm/duxt_orm.dart';

@Entity()
class Post extends Model {
  @PrimaryKey()
  int? id;

  @Column()
  String? title;

  @Column()
  String? content;

  @Column()
  bool published = false;

  @Column()
  int? category_id;

  @Column()
  int? author_id;

  @BelongsTo(foreignKey: 'category_id')
  Category? category;

  @BelongsTo(foreignKey: 'author_id')
  Author? author;

  @BelongsToMany(pivot: 'post_tags')
  List<Tag> tags = [];

  /// Display label for dropdowns
  String get displayLabel => title ?? 'Post #$id';
}
```

## Generated API

```
// server/api/posts.dart
import 'package:duxt/server.dart';
import 'package:my_app/models/post.dart';

final postsRoutes = ApiModule(
  path: '/api/posts',
  routes: [
    // GET /api/posts
    ApiRoute.get('/', (req) async {
      final posts = await Post.query()
        .with_(['category', 'author', 'tags'])
        .get();
      return Response.json(posts.map((p) => p.toJson()).toList());
    }),

    // GET /api/posts/:id
    ApiRoute.get('/:id', (req) async {
      final id = req.params['id'];
      final post = await Post.query()
        .with_(['category', 'author', 'tags'])
        .find(int.parse(id!));
      if (post == null) return Response.notFound();
      return Response.json(post.toJson());
    }),

    // POST /api/posts
    ApiRoute.post('/', (req) async {
      final body = await req.json();
      final post = Post()
        ..title = body['title']
        ..content = body['content']
        ..published = body['published'] == true
        ..category_id = body['category_id']
        ..author_id = body['author_id'];
      await post.save();

      // Sync tags if provided
      if (body['tag_ids'] != null) {
        await post.tags.sync(List<int>.from(body['tag_ids']));
      }

      return Response.json(post.toJson(), status: 201);
    }),

    // PUT /api/posts/:id
    ApiRoute.put('/:id', (req) async {
      final id = req.params['id'];
      final post = await Post.find(int.parse(id!));
      if (post == null) return Response.notFound();

      final body = await req.json();
      if (body.containsKey('title')) post.title = body['title'];
      if (body.containsKey('content')) post.content = body['content'];
      if (body.containsKey('published')) {
        post.published = body['published'] == true ||
                         body['published'] == 1 ||
                         body['published'] == '1';
      }
      await post.save();

      return Response.json(post.toJson());
    }),

    // DELETE /api/posts/:id
    ApiRoute.delete('/:id', (req) async {
      final id = req.params['id'];
      final post = await Post.find(int.parse(id!));
      if (post == null) return Response.notFound();
      await post.delete();
      return Response.json({'deleted': true});
    }),
  ],
);
```

## Generated Pages

### Index Page (List)

Displays all records with cards and a "New" button:

```
// lib/posts/pages/index.dart
class PostsIndexPage extends StatefulComponent {
  @override
  Component build(BuildContext context) {
    return div([
      h1([text('Posts')]),
      a(href: '/posts/new', [text('New Post')]),
      FutureBuilder<List<Post>>(
        future: Api.get('/posts'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return text('Loading...');
          return div([
            for (final post in snapshot.data!)
              PostCard(post: post),
          ]);
        },
      ),
    ]);
  }
}
```

### Detail Page

Shows a single record with edit/delete actions:

```
// lib/posts/pages/_id_.dart
class PostDetailPage extends StatefulComponent {
  final String id;

  @override
  Component build(BuildContext context) {
    return FutureBuilder<Post?>(
      future: Api.get('/posts/$id'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return text('Loading...');
        final post = snapshot.data!;
        return article([
          h1([text(post.title ?? '')]),
          p([text(post.content ?? '')]),
          // Edit and delete buttons
        ]);
      },
    );
  }
}
```

### New Page (Create Form)

Form for creating new records:

```
// lib/posts/pages/new.dart
class PostNewPage extends StatefulComponent {
  @override
  Component build(BuildContext context) {
    return div([
      h1([text('New Post')]),
      PostForm(
        onSubmit: (data) async {
          await Api.post('/posts', body: data);
          Router.of(context).push('/posts');
        },
      ),
    ]);
  }
}
```

## Best Practices

### 1. Generate Related Models First

When using relations, create the referenced models first:

```
# Create Category and Tag first
duxt scaffold categories name:string
duxt scaffold tags name:string

# Then create Post with relations
duxt scaffold posts \
  title:string \
  category:belongsTo:Category \
  tags:toMany:Tag
```

### 2. Use Meaningful Names

Use singular names for models (scaffold pluralizes routes):

```
# Good
duxt scaffold post title:string    # Creates /posts routes
duxt scaffold category name:string # Creates /categories routes

# Bad
duxt scaffold posts title:string   # Creates /postss routes
```

### 3. Keep Fields Simple

Start with essential fields, add more later:

```
# Start simple
duxt scaffold posts title:string content:text

# Add fields as needed with duxt g model
```

## See Also

- [Scaffold Tutorial](/duxt-cli/tutorial) - Complete step-by-step tutorial
- [Generators](/duxt-cli/generators) - Generate individual files
- [DuxtORM](/duxt-orm) - Database operations
