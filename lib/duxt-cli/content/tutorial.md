---
title: Scaffold Tutorial
description: Build a complete blog application with the scaffold command
layout: cli-layout
order: 8
---

# Scaffold Tutorial

Learn how to build a full-featured blog application using Duxt's scaffold command. This tutorial covers models, relations, and all field types.

## Prerequisites

Make sure you have Duxt installed:

```
dart pub global activate duxt
```

## Create a New Project

Start with a fresh server-mode project:

```
duxt create my_blog --template=minimal --mode=server
cd my_blog
```

## Quick Start - Simple Blog

For a basic blog with posts and categories:

```
duxt scaffold categories name:string slug:string description:text
duxt scaffold posts title:string content:text published:bool category:belongsTo:Category
duxt dev
```

That's it! Visit `http://localhost:4000/categories` and `http://localhost:4000/posts`.

---

## Full-Featured Blog Tutorial

Let's build a complete blog with users, categories, tags, posts, comments, and media.

### Step 1: Users

Create a user model for authors:

```
duxt scaffold users name:string email:email avatar:image bio:text role:string active:bool last_login:datetime
```

**Fields explained:**
- `name:string` - User's display name
- `email:email` - Email with validation
- `avatar:image` - Profile picture URL
- `bio:text` - Long text for biography
- `role:string` - User role (admin, editor, author)
- `active:bool` - Account status toggle
- `last_login:datetime` - Last login timestamp

### Step 2: Categories

Create categories with self-referential parent relation:

```
duxt scaffold categories name:string slug:string description:text icon:string color:string sort_order:int parent:belongsTo:Category
```

**Fields explained:**
- `sort_order:int` - Numeric ordering
- `parent:belongsTo:Category` - Self-referential relation for nested categories

### Step 3: Tags

Create tags for flexible post labeling:

```
duxt scaffold tags name:string slug:string color:string
```

### Step 4: Posts

Create the main post model with multiple relations:

```
duxt scaffold posts title:string slug:string content:text excerpt:text featured_image:image published:bool publish_date:datetime views:int author:belongsTo:User category:belongsTo:Category tags:toMany:Tag
```

**Relations explained:**
- `author:belongsTo:User` - Each post has one author (creates `author_id` foreign key)
- `category:belongsTo:Category` - Each post belongs to one category
- `tags:toMany:Tag` - Posts can have multiple tags (creates `post_tags` pivot table)

### Step 5: Comments

Create comments with two belongsTo relations:

```
duxt scaffold comments content:text author_name:string author_email:email website:string approved:bool ip_address:string post:belongsTo:Post user:belongsTo:User
```

**Note:** Comments can have both a guest author (name/email) and optionally link to a registered user.

### Step 6: Media Library

Create a media management system:

```
duxt scaffold media filename:string path:string mime_type:string size:int alt_text:string caption:text user:belongsTo:User
```

### Step 7: Run the Application

```
duxt dev
```

Visit:
- `http://localhost:4000/users` - Manage users
- `http://localhost:4000/categories` - Manage categories
- `http://localhost:4000/tags` - Manage tags
- `http://localhost:4000/posts` - Manage posts
- `http://localhost:4000/comments` - Manage comments
- `http://localhost:4000/media` - Manage media

---

## Copy-Paste Commands

Here's the complete setup in one block:

```
duxt create my_blog --template=minimal --mode=server
cd my_blog
duxt scaffold users name:string email:email avatar:image bio:text role:string active:bool last_login:datetime
duxt scaffold categories name:string slug:string description:text icon:string color:string sort_order:int parent:belongsTo:Category
duxt scaffold tags name:string slug:string color:string
duxt scaffold posts title:string slug:string content:text excerpt:text featured_image:image published:bool publish_date:datetime views:int author:belongsTo:User category:belongsTo:Category tags:toMany:Tag
duxt scaffold comments content:text author_name:string author_email:email website:string approved:bool ip_address:string post:belongsTo:Post user:belongsTo:User
duxt scaffold media filename:string path:string mime_type:string size:int alt_text:string caption:text user:belongsTo:User
duxt dev
```

---

## Field Types Reference

| Type | Dart Type | Database | Example |
|------|-----------|----------|---------|
| `string` | `String` | VARCHAR(255) | `name:string` |
| `text` | `String` | TEXT | `content:text` |
| `int` | `int` | INTEGER | `views:int` |
| `bool` | `bool` | BOOLEAN | `published:bool` |
| `datetime` | `DateTime` | DATETIME | `publish_date:datetime` |
| `email` | `String` | VARCHAR(255) | `email:email` |
| `image` | `String` | VARCHAR(500) | `avatar:image` |
| `attachment` | `String` | VARCHAR(500) | `file:attachment` |

## Relation Types Reference

| Syntax | Description | Creates |
|--------|-------------|---------|
| `field:belongsTo:Model` | Many-to-one | Foreign key column |
| `field:toMany:Model` | Many-to-many | Pivot table |

### BelongsTo Example

```
duxt scaffold posts category:belongsTo:Category
```

Creates:
- `category_id` column in posts table
- `category` property on Post model
- Dropdown in form to select category

### ToMany Example

```
duxt scaffold posts tags:toMany:Tag
```

Creates:
- `post_tags` pivot table with `post_id` and `tag_id`
- `tags` property on Post model (List)
- Checkbox group in form to select multiple tags

---

## What Gets Generated

For each scaffold, you get:

```
lib/
├── models/
│   └── post.dart              # Entity with schema, relations
├── posts/
│   ├── pages/
│   │   ├── index.dart         # List page with create modal
│   │   └── _id_.dart          # Detail page with edit modal
│   └── components/
│       ├── post_card.dart     # Card component
│       └── post_form.dart     # Form component
server/
├── db.dart                    # Database initialization
├── main.dart                  # API server entry
└── api/
    └── posts.dart             # REST endpoints
```

### Generated API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/posts` | List all posts |
| GET | `/api/posts/:id` | Get single post |
| POST | `/api/posts` | Create post |
| PUT | `/api/posts/:id` | Update post |
| DELETE | `/api/posts/:id` | Delete post |

---

## Tips

### Order Matters

Scaffold models in dependency order. Create referenced models first:

```
# ✓ Correct order
duxt scaffold users ...
duxt scaffold posts author:belongsTo:User    # User exists

# ✗ Wrong order
duxt scaffold posts author:belongsTo:User    # User doesn't exist yet
duxt scaffold users ...
```

### Regenerating Models

Use `--force` to overwrite existing files:

```
duxt scaffold posts title:string --force
```

### Skip API Generation

For SSR-only models without REST endpoints:

```
duxt scaffold posts title:string --no-api
```

### Skip ORM

For client-only models (SPA mode):

```
duxt scaffold posts title:string --no-orm
```

---

## Next Steps

- [DuxtORM Documentation](/duxt-orm) - Learn about queries and relations
- [DuxtUI Components](/duxt-ui) - Style your forms and pages
- [Deployment Guide](/duxt/deploy) - Deploy your application
