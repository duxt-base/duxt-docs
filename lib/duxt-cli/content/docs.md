---
title: duxt docs
description: Generate and manage project documentation from code comments and templates.
layout: cli-layout
order: 6
---

# duxt docs

Generate API documentation from code comments and create documentation pages with pre-built templates.

## Subcommands

| Command | Description |
|---------|-------------|
| `duxt docs generate` | Generate API docs from code |
| `duxt docs page <name>` | Create a documentation page |
| `duxt docs tutorial <name>` | Create a tutorial page |

---

## duxt docs generate

Scan your codebase and generate API documentation from doc comments.

### Usage

```
duxt docs generate [options]
```

### Options

| Option | Description | Default |
|--------|-------------|---------|
| `--output`, `-o` | Output directory | `docs/api` |
| `--format` | Output format: `markdown`, `html` | `markdown` |
| `--include` | Directories to include | `lib/models` |

### Examples

```
# Default: scan models, output markdown
duxt docs generate

# Custom output directory
duxt docs generate --output=docs/reference

# HTML output
duxt docs generate --format=html

# Include multiple directories
duxt docs generate --include=lib/models,lib/shared
```

### What It Generates

For each model with doc comments:

**Input:** `lib/models/post.dart`
```
/// Represents a blog post.
///
/// Posts are the main content type in the blog system.
/// Each post belongs to a category and can have multiple tags.
@Entity()
class Post extends Model {
  /// Unique identifier for the post.
  @PrimaryKey()
  int? id;

  /// The post title (required).
  @Column()
  String? title;

  /// Full content of the post in markdown.
  @Column()
  String? content;

  /// Whether the post is publicly visible.
  @Column()
  bool published = false;

  /// Foreign key to the category.
  @Column()
  int? category_id;

  /// The category this post belongs to.
  @BelongsTo(foreignKey: 'category_id')
  Category? category;
}
```

**Output:** `docs/api/post.md`
```
# Post

Represents a blog post.

Posts are the main content type in the blog system.
Each post belongs to a category and can have multiple tags.

## Fields

| Field | Type | Description |
|-------|------|-------------|
| `id` | `int?` | Unique identifier for the post. |
| `title` | `String?` | The post title (required). |
| `content` | `String?` | Full content of the post in markdown. |
| `published` | `bool` | Whether the post is publicly visible. |
| `category_id` | `int?` | Foreign key to the category. |

## Relations

| Relation | Type | Description |
|----------|------|-------------|
| `category` | `Category?` | The category this post belongs to. |

## API Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/api/posts` | List all posts |
| GET | `/api/posts/:id` | Get a single post |
| POST | `/api/posts` | Create a new post |
| PUT | `/api/posts/:id` | Update a post |
| DELETE | `/api/posts/:id` | Delete a post |
```

---

## duxt docs page

Create a documentation page with a standard template.

### Usage

```
duxt docs page <name>
```

### Examples

```
duxt docs page getting-started
duxt docs page installation
duxt docs page contributing
```

### What It Creates

**Command:** `duxt docs page getting-started`

**Creates:** `docs/getting-started.md`

```
---
title: Getting Started
description:
order: 0
---

# Getting Started

## Overview

<!-- Describe what this page covers -->

## Prerequisites

<!-- List any requirements -->

## Steps

### Step 1

<!-- First step instructions -->

### Step 2

<!-- Second step instructions -->

## Next Steps

<!-- Link to related pages -->
```

---

## duxt docs tutorial

Create a tutorial page with a comprehensive step-by-step structure.

### Usage

```
duxt docs tutorial <name>
```

### Examples

```
duxt docs tutorial building-a-blog
duxt docs tutorial authentication
duxt docs tutorial deploying-to-production
```

### What It Creates

**Command:** `duxt docs tutorial building-a-blog`

**Creates:** `docs/tutorials/building-a-blog.md`

```
---
title: Building a Blog
description: Learn how to build a complete blog with Duxt.
order: 0
---

# Building a Blog

In this tutorial, you'll learn how to build a complete blog application with Duxt.

## What You'll Build

<!-- Screenshot or description of the final result -->

## Prerequisites

Before starting, make sure you have:

- [ ] Dart SDK 3.0 or higher installed
- [ ] Duxt CLI installed (`dart pub global activate duxt`)
- [ ] Basic familiarity with Dart

## Time Required

Approximately X minutes.

---

## Step 1: Create the Project

<!-- First step with code examples -->

```
duxt create my-blog --mode=server
cd my-blog
```

## Step 2: ...

<!-- Continue with steps -->

---

## Troubleshooting

### Common Issue 1

**Problem:** Description of the issue.

**Solution:** How to fix it.

### Common Issue 2

**Problem:** Description of the issue.

**Solution:** How to fix it.

---

## Summary

In this tutorial, you learned how to:

- [ ] Point 1
- [ ] Point 2
- [ ] Point 3

## Next Steps

- [Related Tutorial 1](/docs/tutorials/...)
- [Related Tutorial 2](/docs/tutorials/...)
```

---

## Best Practices

### Write Good Doc Comments

Use triple-slash comments for documentation:

```
/// Short description on first line.
///
/// Longer description can span multiple lines
/// and include more detail about usage.
///
/// Example:
/// ```
/// final post = Post()
///   ..title = 'Hello World'
///   ..content = 'My first post';
/// await post.save();
/// ```
@Entity()
class Post extends Model {
  /// The post title.
  ///
  /// This field is required and must be unique.
  @Column()
  String? title;
}
```

### Organize Documentation

```
docs/
├── index.md               Main landing page
├── getting-started.md     Quick start guide
├── installation.md        Detailed installation
├── api/                   Generated API docs
│   ├── post.md
│   ├── category.md
│   └── tag.md
├── guides/                How-to guides
│   ├── authentication.md
│   └── deployment.md
└── tutorials/             Step-by-step tutorials
    ├── building-a-blog.md
    └── crud-app.md
```

### Keep Docs Updated

Run `duxt docs generate` as part of your CI/CD pipeline to ensure API docs stay in sync with code changes.
