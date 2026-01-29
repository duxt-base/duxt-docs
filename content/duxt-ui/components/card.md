---
title: Card
description: A flexible card component for displaying content in a contained format.
layout: ui-layout
order: 2
---

# Card

The `DCard` component provides a flexible container for displaying content with optional header, body, and footer sections.

## Basic Usage

```dart
DCard(
  body: [
    p([text('This is a basic card.')]),
  ],
)
```

## With Header

```dart
DCard(
  header: [
    h3([text('Card Title')]),
  ],
  body: [
    p([text('Card content goes here.')]),
  ],
)
```

## With Footer

```dart
DCard(
  body: [
    p([text('Card content')]),
  ],
  footer: [
    DButton(label: 'Action'),
  ],
)
```

## Complete Example

```dart
DCard(
  header: [
    div(classes: 'flex items-center justify-between', [
      h3(classes: 'font-semibold', [text('User Profile')]),
      DBadge(label: 'Active'),
    ]),
  ],
  body: [
    div(classes: 'flex items-center gap-4', [
      DAvatar(src: 'user.jpg'),
      div([
        p(classes: 'font-medium', [text('John Doe')]),
        p(classes: 'text-sm text-gray-500', [text('john@example.com')]),
      ]),
    ]),
  ],
  footer: [
    div(classes: 'flex gap-2', [
      DButton(label: 'Edit', variant: DButtonVariant.outline),
      DButton(label: 'Delete', color: DColor.error),
    ]),
  ],
)
```

## Variants

### Default

```dart
DCard(
  variant: DCardVariant.default_,
  body: [text('Default card')],
)
```

### Outlined

```dart
DCard(
  variant: DCardVariant.outlined,
  body: [text('Outlined card')],
)
```

### Elevated

```dart
DCard(
  variant: DCardVariant.elevated,
  body: [text('Elevated card')],
)
```

## Clickable Card

```dart
DCard(
  body: [text('Click me!')],
  onPressed: () => print('Card clicked'),
)
```

## As Link

```dart
DCard(
  body: [text('Click to navigate')],
  href: '/destination',
)
```

## Dark Mode Support

`DCard` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Borders are optimized for dark backgrounds
- Shadow effects adapt for visibility
- All variants work seamlessly in both modes

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `header` | `List<Component>?` | `null` | Header content |
| `body` | `List<Component>` | required | Main content |
| `footer` | `List<Component>?` | `null` | Footer content |
| `variant` | `DCardVariant` | `default_` | Visual style |
| `padding` | `bool` | `true` | Add padding to sections |
| `href` | `String?` | `null` | Link URL |
| `onPressed` | `VoidCallback?` | `null` | Click handler |
