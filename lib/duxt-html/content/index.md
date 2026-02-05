---
title: Introduction
description: Flutter-style HTML components for Jaspr
layout: html-layout
order: 1
---

# duxt_html

**Flutter-style HTML components for Jaspr** - build web UIs with familiar patterns.

## What is duxt_html?

duxt_html provides PascalCase HTML components that follow Flutter's composition patterns. Instead of Jaspr's lowercase functions, use components like `Div`, `Span`, and `Button` with the familiar `child`/`children` API.

```dart
// Before (Jaspr)
div(classes: 'container', [
  p([text('Hello World')]),
]);

// After (duxt_html)
Div(
  className: 'container',
  child: P(child: Text('Hello World')),
);
```

## Why duxt_html?

### Familiar Syntax
If you know Flutter, you know duxt_html. PascalCase components with named parameters.

### child/children Pattern
Use `child` for single components, `children` for lists - just like Flutter.

### className Prop
Use `className` instead of `classes` - more intuitive naming.

### CSS String Support
Pass styles as CSS strings: `style: 'color: red; padding: 16px'`

### Full Jaspr Compatibility
All components return Jaspr `Component` types. Mix and match freely.

## Quick Start

```yaml
# pubspec.yaml
dependencies:
  duxt_html: ^0.1.0
```

```dart
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

## Component Categories

duxt_html includes **80 components** organized into 8 categories:

| Category | Components |
|----------|------------|
| Content | Div, P, Ul, Ol, Li, Dl, Dt, Dd, Blockquote, Pre, Hr |
| Text | A, Span, Strong, B, Em, I, U, S, Small, Code, Br, Wbr |
| Headings | H1, H2, H3, H4, H5, H6 |
| Forms | Form, Input, Button, Select, Option, Textarea, Label, Fieldset, Legend, Datalist, Meter, Progress, Optgroup |
| Table | Table, Tr, Td, Th, Thead, Tbody, Tfoot, Caption, Col, Colgroup |
| Media | Img, Video, Audio, Source, Iframe, Embed, Figure, Figcaption |
| Semantic | Header, Footer, Nav, Main, Article, Aside, Section, Details, Summary, Dialog |
| SVG | Svg, Rect, Circle, Ellipse, Line, Path, Polygon, Polyline |

## Next Steps

- [Getting Started](/duxt-html/getting-started) - Installation and basic usage
- [Components](/duxt-html/components) - Full component reference
- [Examples](/duxt-html/examples) - Real-world patterns
