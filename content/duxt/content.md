---
title: Content System
description: Build documentation sites and content-driven applications with markdown.
layout: duxt-layout
order: 10
---

# Content System

Duxt provides a powerful content system for building documentation sites, blogs, and content-driven applications using markdown files with frontmatter.

## Features

- Frontmatter parsing (title, description, layout, etc.)
- Markdown to HTML conversion
- Table of contents generation
- Navigation structure building
- Draft content support
- Content caching
- Custom component embedding

## Quick Start

### Using DuxtContentApp

The easiest way to build a documentation site:

```
// lib/main.server.dart
import 'package:duxt/content.dart';
import 'package:jaspr/jaspr.dart';

void main() {
  runApp(
    Document(
      body: DuxtContentApp(
        layouts: [DocsLayout(), BlogLayout()],
        components: [CodeBlock(), Callout(), Image(zoom: true)],
      ),
    ),
  );
}
```

### Content Directory Structure

```
content/
├── getting-started/
│   ├── index.md           → /getting-started
│   ├── installation.md    → /getting-started/installation
│   └── quick-start.md     → /getting-started/quick-start
├── guides/
│   ├── index.md           → /guides
│   └── routing.md         → /guides/routing
└── index.md               → /
```

## Frontmatter

Each markdown file can include YAML frontmatter:

```
---
title: Getting Started
description: Learn how to set up your first Duxt project.
layout: docs-layout
order: 1
draft: false
---

# Getting Started

Your content here...
```

### Frontmatter Fields

| Field | Type | Description |
|-------|------|-------------|
| `title` | `String` | Page title (used in nav and SEO) |
| `description` | `String` | Page description for SEO |
| `layout` | `String` | Layout to use for this page |
| `order` | `int` | Sort order in navigation (default: 999) |
| `draft` | `bool` | If true, excluded from production (default: false) |

## ContentLoader

For manual content loading:

```
import 'package:duxt/content.dart';

final loader = ContentLoader(
  config: ContentLoaderConfig(
    contentDir: 'content',
    includeDrafts: false,
  ),
);

// Load a single document
final doc = await loader.load('getting-started/index');
print(doc?.title);
print(doc?.htmlContent);

// Load all documents in a directory
final docs = await loader.loadDirectory('guides');

// Build navigation structure
final nav = await loader.loadNavigation();
```

## ContentDocument

The parsed content document:

```
class ContentDocument {
  final Map<String, dynamic> frontmatter;
  final String rawContent;      // Original markdown
  final String htmlContent;     // Parsed HTML
  final List<TocEntry> tableOfContents;
  final String path;
  final String slug;

  // Convenience getters
  String get title;
  String? get description;
  int get order;
  String? get layout;
  bool get draft;
}
```

## Table of Contents

Automatically generated from headings:

```
final doc = await loader.load('guides/routing');

for (final entry in doc.tableOfContents) {
  print('${entry.text} -> #${entry.anchor}');
  // "File-Based Routing -> #file-based-routing"
}
```

### TocEntry

```
class TocEntry {
  final String text;      // Heading text
  final String anchor;    // URL anchor (#slug)
  final int level;        // Heading level (2-4)
  final List<TocEntry> children;
}
```

## Navigation

Build sidebar navigation from content:

```
final sections = await loader.loadNavigation();

for (final section in sections) {
  print(section.title);  // "Getting Started"
  print(section.path);   // "/getting-started"

  for (final item in section.items) {
    print('  ${item.title}');  // "Installation"
    print('  ${item.path}');   // "/getting-started/installation"
  }
}
```

### NavSection & NavItem

```
class NavSection {
  final String title;
  final String path;
  final List<NavItem> items;
}

class NavItem {
  final String title;
  final String path;
  final String? description;
}
```

## Configuration

```
final config = ContentLoaderConfig(
  contentDir: 'content',           // Base directory
  extensions: ['.md', '.markdown'], // File extensions
  includeDrafts: false,            // Include draft content
  blockSyntaxes: [],               // Custom markdown blocks
  inlineSyntaxes: [],              // Custom inline syntax
);

final loader = ContentLoader(config: config);
```

## Layouts

Create layouts for different content types:

```
// lib/layouts/docs_layout.dart
import 'package:duxt/content.dart';

class DocsLayout extends DuxtPageLayout {
  @override
  String get name => 'docs-layout';

  @override
  Component build(ContentDocument doc, Component content) {
    return div(classes: 'docs-page', [
      aside(classes: 'sidebar', [
        ContentNav(),  // Auto-generated navigation
      ]),
      main_([
        h1([text(doc.title)]),
        content,
        ContentToc(entries: doc.tableOfContents),
      ]),
    ]);
  }
}
```

## Built-in Components

### ContentPage

Renders a markdown page with its layout:

```
ContentPage(path: 'getting-started/index')
```

### ContentToc

Table of contents component:

```
ContentToc(entries: doc.tableOfContents)
```

### ContentNav

Sidebar navigation:

```
ContentNav(sections: sections)
```

### MarkdownContent

Direct markdown rendering:

```
MarkdownContent(markdown: '# Hello\n\nWorld')
```

## Custom Components in Markdown

Embed custom components using HTML-like syntax:

```
---
title: Button Guide
---

# Buttons

Here's a live button example:

<DButton label="Click me" color="primary" />

And an alert:

<DAlert title="Note" description="This is important!" color="info" />
```

Register components in DuxtContentApp:

```
DuxtContentApp(
  components: [
    DuxtUiComponents(),  // Registers DButton, DAlert, etc.
  ],
)
```

## Caching

ContentLoader caches parsed documents for performance:

```
// Documents are cached after first load
final doc1 = await loader.load('guides/routing');
final doc2 = await loader.load('guides/routing');  // Returns cached

// Clear cache if needed
loader.clearCache();
```

## Draft Content

Mark content as draft to exclude from production:

```
---
title: Upcoming Feature
draft: true
---
```

Include drafts during development:

```
final loader = ContentLoader(
  config: ContentLoaderConfig(
    includeDrafts: true,  // Show drafts in dev
  ),
);
```
