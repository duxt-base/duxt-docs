---
title: Container
description: A responsive container for constraining content width.
layout: ui-layout
order: 25
---

# Container

The `DContainer` component provides a centered, max-width container for page content with responsive padding.

## Basic Usage

```dart
DContainer(
  children: [
    h1([text('Page Title')]),
    p([text('Page content goes here.')]),
  ],
)
```

## Sizes

Control the maximum width:

```dart
// Extra small (max-w-screen-xs: 475px)
DContainer(
  size: DContainerSize.xs,
  children: [...],
)

// Small (max-w-screen-sm: 640px)
DContainer(
  size: DContainerSize.sm,
  children: [...],
)

// Medium (max-w-screen-md: 768px)
DContainer(
  size: DContainerSize.md,
  children: [...],
)

// Large (max-w-screen-lg: 1024px)
DContainer(
  size: DContainerSize.lg,
  children: [...],
)

// Extra large (max-w-screen-xl: 1280px)
DContainer(
  size: DContainerSize.xl,
  children: [...],
)

// 2XL (max-w-screen-2xl: 1536px)
DContainer(
  size: DContainerSize.xxl,
  children: [...],
)

// Full width (no max-width constraint)
DContainer(
  size: DContainerSize.full,
  children: [...],
)
```

## With Padding

Add responsive horizontal padding:

```dart
DContainer(
  padded: true,  // Adds px-4 sm:px-6 lg:px-8
  children: [
    text('Content with padding'),
  ],
)
```

## Page Layout Example

```dart
class PageLayout extends StatelessComponent {
  final List<Component> children;

  PageLayout({required this.children});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'min-h-screen bg-gray-50 dark:bg-gray-900', [
      // Header
      header(classes: 'bg-white dark:bg-gray-800 border-b', [
        DContainer(
          padded: true,
          children: [
            div(classes: 'h-16 flex items-center justify-between', [
              // Logo
              a(href: '/', [text('Logo')]),
              // Navigation
              nav(classes: 'flex gap-4', [
                a(href: '/features', [text('Features')]),
                a(href: '/pricing', [text('Pricing')]),
                a(href: '/docs', [text('Docs')]),
              ]),
            ]),
          ],
        ),
      ]),

      // Main content
      main([
        DContainer(
          padded: true,
          children: [
            div(classes: 'py-8', children),
          ],
        ),
      ]),

      // Footer
      footer(classes: 'bg-gray-100 dark:bg-gray-800', [
        DContainer(
          padded: true,
          children: [
            div(classes: 'py-8 text-center text-gray-500', [
              text('© 2024 Company. All rights reserved.'),
            ]),
          ],
        ),
      ]),
    ]);
  }
}
```

## Narrow Content Container

For readable text content:

```dart
DContainer(
  size: DContainerSize.md,  // 768px max
  padded: true,
  children: [
    article([
      h1(classes: 'text-3xl font-bold mb-4', [text('Article Title')]),
      p(classes: 'text-lg text-gray-600 mb-6', [
        text('This is the article introduction...'),
      ]),
      // Article content...
    ]),
  ],
)
```

## Dashboard Container

For wide dashboard layouts:

```dart
DContainer(
  size: DContainerSize.xxl,  // 1536px max
  padded: true,
  children: [
    div(classes: 'grid grid-cols-12 gap-6', [
      // Sidebar
      aside(classes: 'col-span-3', [
        // Navigation
      ]),
      // Main content
      main(classes: 'col-span-9', [
        // Dashboard content
      ]),
    ]),
  ],
)
```

## Full-Width Sections

Combine full-width backgrounds with contained content:

```dart
div([
  // Hero section - full width background
  section(classes: 'bg-primary-600 text-white', [
    DContainer(
      size: DContainerSize.xl,
      padded: true,
      children: [
        div(classes: 'py-20 text-center', [
          h1(classes: 'text-4xl font-bold', [text('Welcome')]),
          p(classes: 'mt-4 text-lg', [text('Get started today')]),
        ]),
      ],
    ),
  ]),

  // Features section - contained content
  section([
    DContainer(
      size: DContainerSize.lg,
      padded: true,
      children: [
        div(classes: 'py-16', [
          h2(classes: 'text-2xl font-bold', [text('Features')]),
          // Feature grid...
        ]),
      ],
    ),
  ]),
])
```

## Nested Containers

While generally not recommended, you can nest containers for special layouts:

```dart
DContainer(
  size: DContainerSize.xl,
  padded: true,
  children: [
    div(classes: 'grid grid-cols-2 gap-8', [
      // Left side - full width in its column
      div([
        text('Full width content in column'),
      ]),
      // Right side - narrower content
      DContainer(
        size: DContainerSize.sm,
        children: [
          DCard(
            body: [text('Narrow card content')],
          ),
        ],
      ),
    ]),
  ],
)
```

## Dark Mode Support

`DContainer` is a structural component that works seamlessly in both light and dark modes. The container itself doesn't have background colors, so it adapts to whatever background it's placed on.

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `children` | `List<Component>` | required | Container content |
| `size` | `DContainerSize` | `xl` | Maximum width |
| `padded` | `bool` | `false` | Add responsive padding |

### DContainerSize Values

| Size | Max Width | Tailwind Class |
|------|-----------|----------------|
| `xs` | 475px | `max-w-screen-xs` |
| `sm` | 640px | `max-w-screen-sm` |
| `md` | 768px | `max-w-screen-md` |
| `lg` | 1024px | `max-w-screen-lg` |
| `xl` | 1280px | `max-w-screen-xl` |
| `xxl` | 1536px | `max-w-screen-2xl` |
| `full` | none | `max-w-full` |
