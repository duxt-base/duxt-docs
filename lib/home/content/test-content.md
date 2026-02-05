---
title: Test Content Page
description: Testing the unified module-level content routing
layout: duxt-layout
---

# Test Content Page

This page demonstrates the **unified module-level content routing** feature in Duxt.

## How It Works

This markdown file is located at:
```
lib/home/content/test-content.md
```

And is automatically routed to `/test-content` because it's in the `home` module (which maps to the root).

## Features

- File-based routing for markdown
- Frontmatter support (title, layout, etc.)
- Shared layouts with Dart pages
- Custom components in markdown

## Code Example

```
// Generated route
Route(
  path: '/test-content',
  builder: (ctx, state) => DuxtContentPage(
    routeInfo: ContentRouteInfo(
      path: '/test-content',
      filePath: 'lib/home/content/test-content.md',
      moduleName: 'home',
    ),
    config: config,
  ),
)
```
