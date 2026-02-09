---
title: Duxt HTML
description: Flutter-style HTML components for Jaspr.
layout: html-layout
order: 1
---

# Duxt HTML

**Flutter-style HTML components for Jaspr** - build web UIs with familiar patterns using PascalCase components, `child`/`children` API, and `className` props.

## What is Duxt HTML?

Duxt HTML wraps **every** Jaspr DOM element with Flutter-style PascalCase components. Instead of Jaspr's lowercase functions with positional lists, use PascalCase components with named parameters. Everything returns standard Jaspr `Component` types, so you can mix and match freely.

```
// Jaspr style
div(classes: 'container', [
  p([text('Hello World')]),
]);

// Duxt HTML style
Div(
  className: 'container',
  child: P(child: Text('Hello World')),
);
```

## Why Duxt HTML?

### Familiar Syntax
If you know Flutter, you know Duxt HTML. PascalCase components with named parameters feel natural.

### child/children Pattern
Use `child` for single components, `children` for lists - just like Flutter widgets.

### className Prop
Use `className` instead of `classes` for a more intuitive API.

### CSS String Support
Pass inline styles as CSS strings: `style: 'color: red; padding: 16px'`.

### Full Compatibility
All components return Jaspr `Component` types. Use alongside Jaspr's built-in elements without any wrappers.

## Quick Start

Add to your `pubspec.yaml`:

```
dependencies:
  duxt_html: ^0.2.0
```

Then build your UI:

```
import 'package:duxt_html/duxt_html.dart';

Div(
  className: 'container mx-auto p-4',
  children: [
    H1(
      className: 'text-2xl font-bold',
      child: Text('Welcome'),
    ),
    P(
      className: 'text-gray-600',
      child: Text('Build with Flutter patterns'),
    ),
    Button(
      onClick: () => print('clicked'),
      className: 'px-4 py-2 bg-blue-500 text-white rounded',
      child: Text('Click Me'),
    ),
  ],
);
```

## Components

86 components organized into 9 categories — full Jaspr DOM coverage:

| Category | Components |
|----------|------------|
| Document | Html, Head, Body, Meta, HtmlLink |
| Content | Div, P, Ul, Ol, Li, Dl, Dt, Dd, Blockquote, Pre, Hr |
| Text | A, Span, Strong, B, Em, I, U, S, Small, Code, Br, Wbr |
| Headings | H1, H2, H3, H4, H5, H6 |
| Forms | Form, Input, Button, Select, Option, Textarea, Label, Fieldset, Legend, Datalist, Meter, Progress, Optgroup |
| Table | Table, Tr, Td, Th, Thead, Tbody, Tfoot, Caption, Col, Colgroup |
| Media | Img, Video, Audio, Source, Iframe, Embed, ObjectEmbed, Figure, Figcaption, Script |
| Semantic | Header, Footer, Nav, Main, Article, Aside, Section, Details, Summary, Dialog |
| SVG | Svg, Rect, Circle, Ellipse, Line, Path, Polygon, Polyline |

## Next Steps

- [Getting Started](/duxt-html/getting-started) - Installation and basic usage
- [Components](/duxt-html/components) - Full component reference
- [Examples](/duxt-html/examples) - Real-world patterns
