---
title: Card
description: A flexible card component for displaying content in a contained format.
layout: ui-layout
order: 2
---

# Card

The `DCard` component provides a flexible container for displaying content with optional header and footer sections.

## Basic Usage

```
DCard(
  children: [
    p([text('This is a basic card.')]),
  ],
)
```

## With Header

```
DCard(
  header: DCardHeader(
    title: 'Card Title',
    description: 'Optional description',
  ),
  children: [
    p([text('Card content goes here.')]),
  ],
)
```

## With Footer

```
DCard(
  children: [
    p([text('Card content')]),
  ],
  footer: DCardFooter(
    children: [
      DButton(label: 'Cancel', variant: DButtonVariant.ghost),
      DButton(label: 'Save'),
    ],
  ),
)
```

## Complete Example

```
DCard(
  header: DCardHeader(
    title: 'User Profile',
    trailing: DBadge(label: 'Active', color: DBadgeColor.success),
  ),
  children: [
    div(classes: 'flex items-center gap-4', [
      DAvatar(src: 'user.jpg'),
      div([
        p(classes: 'font-medium', [text('John Doe')]),
        p(classes: 'text-sm text-gray-500', [text('john@example.com')]),
      ]),
    ]),
  ],
  footer: DCardFooter(
    children: [
      DButton(label: 'Edit', variant: DButtonVariant.outline),
      DButton(label: 'Delete', color: DButtonColor.error),
    ],
  ),
)
```

## Variants

### Outline (Default)

```
DCard(
  variant: DCardVariant.outline,
  children: [text('Outlined card with border')],
)
```

### Solid

```
DCard(
  variant: DCardVariant.solid,
  children: [text('Solid card with filled background')],
)
```

### Soft

```
DCard(
  variant: DCardVariant.soft,
  children: [text('Soft card with subtle background')],
)
```

### Subtle

```
DCard(
  variant: DCardVariant.subtle,
  children: [text('Subtle card with soft background and border')],
)
```

## No Padding

```
DCard(
  noPadding: true,
  children: [
    img(src: '/image.jpg', classes: 'w-full'),
  ],
)
```

## Dark Mode Support

`DCard` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Borders are optimized for dark backgrounds
- Dividers between sections adapt accordingly
- All variants work seamlessly in both modes

## API Reference

### DCard

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `header` | `Component?` | `null` | Header content (use DCardHeader) |
| `children` | `List<Component>` | `[]` | Main content |
| `footer` | `Component?` | `null` | Footer content (use DCardFooter) |
| `variant` | `DCardVariant` | `outline` | Visual style |
| `noPadding` | `bool` | `false` | Remove body padding |
| `classes` | `String?` | `null` | Additional CSS classes |

### DCardHeader

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | Header title |
| `description` | `String?` | `null` | Header description |
| `trailing` | `Component?` | `null` | Trailing content (badge, button, etc.) |

### DCardFooter

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `children` | `List<Component>` | `[]` | Footer content (typically buttons) |
