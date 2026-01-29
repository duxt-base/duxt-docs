---
title: Card
description: A flexible card component for displaying content in a contained format.
layout: docs
order: 2
---

# Card

The `UCard` component provides a flexible container for displaying content with optional header, body, and footer sections.

## Basic Usage

```dart
UCard(
  body: [
    p([text('This is a basic card.')]),
  ],
)
```

## With Header

```dart
UCard(
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
UCard(
  body: [
    p([text('Card content')]),
  ],
  footer: [
    UButton(label: 'Action'),
  ],
)
```

## Complete Example

```dart
UCard(
  header: [
    div(classes: 'flex items-center justify-between', [
      h3(classes: 'font-semibold', [text('User Profile')]),
      UBadge(label: 'Active'),
    ]),
  ],
  body: [
    div(classes: 'flex items-center gap-4', [
      UAvatar(src: 'user.jpg'),
      div([
        p(classes: 'font-medium', [text('John Doe')]),
        p(classes: 'text-sm text-gray-500', [text('john@example.com')]),
      ]),
    ]),
  ],
  footer: [
    div(classes: 'flex gap-2', [
      UButton(label: 'Edit', variant: UButtonVariant.outline),
      UButton(label: 'Delete', color: UColor.error),
    ]),
  ],
)
```

## Variants

### Default

Standard card with subtle border:

```dart
UCard(
  variant: UCardVariant.default_,
  body: [text('Default card')],
)
```

### Outlined

Card with more prominent border:

```dart
UCard(
  variant: UCardVariant.outlined,
  body: [text('Outlined card')],
)
```

### Elevated

Card with shadow for depth:

```dart
UCard(
  variant: UCardVariant.elevated,
  body: [text('Elevated card')],
)
```

## Clickable Card

Make the entire card clickable:

```dart
UCard(
  body: [text('Click me!')],
  onPressed: () => print('Card clicked'),
)
```

## As Link

Cards can also act as links:

```dart
UCard(
  body: [text('Click to navigate')],
  href: '/destination',
)
```

## Dark Mode Support

`UCard` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Borders are optimized for dark backgrounds
- Shadow effects adapt for visibility
- All variants work seamlessly in both modes

No additional configuration is required when using Duxt UI's theme system.

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `header` | `List<Component>?` | `null` | Header content |
| `body` | `List<Component>` | required | Main content |
| `footer` | `List<Component>?` | `null` | Footer content |
| `variant` | `UCardVariant` | `default_` | Visual style (default_, outlined, elevated) |
| `padding` | `bool` | `true` | Add padding to sections |
| `href` | `String?` | `null` | Link URL (makes card act as anchor) |
| `onPressed` | `VoidCallback?` | `null` | Click handler |
