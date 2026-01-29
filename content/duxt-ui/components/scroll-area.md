---
title: Scroll Area
description: A scrollable container with customized scrollbar styling.
layout: ui-layout
order: 49
---

# Scroll Area

The `DScrollArea` component provides a scrollable container with thin, styled scrollbars that work across browsers.

## Basic Usage

```dart
DScrollArea(
  maxHeight: '300px',
  children: [
    // Long content here
    for (var i = 0; i < 50; i++)
      p(classes: 'py-2', [text('Item $i')]),
  ],
)
```

## Orientation

### Vertical (Default)

```dart
DScrollArea(
  orientation: DScrollOrientation.vertical,
  maxHeight: '400px',
  children: [...],
)
```

### Horizontal

```dart
DScrollArea(
  orientation: DScrollOrientation.horizontal,
  maxWidth: '600px',
  children: [
    div(classes: 'flex gap-4 p-4', [
      for (var i = 0; i < 20; i++)
        div(classes: 'w-48 h-32 bg-gray-100 dark:bg-gray-800 rounded-lg flex-shrink-0', []),
    ]),
  ],
)
```

### Both Directions

```dart
DScrollArea(
  orientation: DScrollOrientation.both,
  maxHeight: '400px',
  maxWidth: '600px',
  children: [
    // Large content that scrolls in both directions
    div(classes: 'w-[1000px] h-[1000px]', [...]),
  ],
)
```

## Scrollbar Visibility

### Auto (Default)

Scrollbar appears when content overflows:

```dart
DScrollArea(
  scrollbarVisibility: DScrollbarVisibility.auto,
  maxHeight: '300px',
  children: [...],
)
```

### Always Visible

Scrollbar is always visible with a track:

```dart
DScrollArea(
  scrollbarVisibility: DScrollbarVisibility.always,
  maxHeight: '300px',
  children: [...],
)
```

### On Hover

Scrollbar only visible when hovering:

```dart
DScrollArea(
  scrollbarVisibility: DScrollbarVisibility.hover,
  maxHeight: '300px',
  children: [...],
)
```

### Hidden

Scrollbar is completely hidden:

```dart
DScrollArea(
  scrollbarVisibility: DScrollbarVisibility.never,
  maxHeight: '300px',
  children: [...],
)
```

## Chat Messages

```dart
DScrollArea(
  maxHeight: '500px',
  classes: 'bg-gray-50 dark:bg-gray-900 rounded-lg',
  children: [
    div(classes: 'p-4 space-y-4', [
      for (final message in messages)
        DChatMessage(
          content: message.text,
          sender: message.isMe ? 'user' : 'assistant',
        ),
    ]),
  ],
)
```

## Code Preview

```dart
DScrollArea(
  orientation: DScrollOrientation.both,
  maxHeight: '400px',
  classes: 'bg-gray-900 rounded-lg',
  children: [
    pre(classes: 'p-4 text-sm text-gray-100', [
      code([text(codeContent)]),
    ]),
  ],
)
```

## Table with Fixed Header

```dart
div(classes: 'border rounded-lg', [
  // Fixed header
  div(classes: 'bg-gray-50 dark:bg-gray-800 border-b', [
    table(classes: 'w-full', [
      thead([
        tr([
          th(classes: 'px-4 py-3 text-left', [text('Name')]),
          th(classes: 'px-4 py-3 text-left', [text('Email')]),
          th(classes: 'px-4 py-3 text-left', [text('Status')]),
        ]),
      ]),
    ]),
  ]),

  // Scrollable body
  DScrollArea(
    maxHeight: '400px',
    children: [
      table(classes: 'w-full', [
        tbody([
          for (final user in users)
            tr(classes: 'border-b', [
              td(classes: 'px-4 py-3', [text(user.name)]),
              td(classes: 'px-4 py-3', [text(user.email)]),
              td(classes: 'px-4 py-3', [DBadge(label: user.status)]),
            ]),
        ]),
      ]),
    ],
  ),
])
```

## Horizontal Card Gallery

```dart
DScrollArea(
  orientation: DScrollOrientation.horizontal,
  scrollbarVisibility: DScrollbarVisibility.hover,
  children: [
    div(classes: 'flex gap-4 p-4', [
      for (final product in products)
        DCard(
          classes: 'w-64 flex-shrink-0',
          body: [
            img(src: product.image, classes: 'w-full h-40 object-cover rounded'),
            div(classes: 'p-4', [
              h3(classes: 'font-semibold', [text(product.name)]),
              p(classes: 'text-gray-500', [text(product.price)]),
            ]),
          ],
        ),
    ]),
  ],
)
```

## Sidebar Navigation

```dart
aside(classes: 'w-64 border-r h-screen flex flex-col', [
  // Header
  div(classes: 'h-16 flex items-center px-4 border-b', [
    img(src: '/logo.svg', classes: 'h-8'),
  ]),

  // Scrollable navigation
  DScrollArea(
    classes: 'flex-1',
    children: [
      div(classes: 'p-4', [
        DVerticalNavigation(groups: [...]),
      ]),
    ],
  ),

  // Footer
  div(classes: 'p-4 border-t', [
    DButton(label: 'Logout', variant: DButtonVariant.ghost, classes: 'w-full'),
  ]),
])
```

## Modal with Scrollable Content

```dart
DModal(
  open: isOpen,
  onClose: () => close(),
  title: 'Terms of Service',
  body: [
    DScrollArea(
      maxHeight: '60vh',
      children: [
        div(classes: 'prose dark:prose-invert', [
          // Long legal content
          ...termsContent,
        ]),
      ],
    ),
  ],
  footer: [
    DButton(label: 'Decline', variant: DButtonVariant.outline, onClick: decline),
    DButton(label: 'Accept', onClick: accept),
  ],
)
```

## Dark Mode Support

`DScrollArea` automatically adapts scrollbar colors for dark mode with appropriate thumb and track colors.

## API Reference

### DScrollArea

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `children` | `List<Component>` | required | Scrollable content |
| `orientation` | `DScrollOrientation` | `vertical` | Scroll direction |
| `maxHeight` | `String?` | `null` | Maximum height (CSS value) |
| `maxWidth` | `String?` | `null` | Maximum width (CSS value) |
| `scrollbarVisibility` | `DScrollbarVisibility` | `auto` | Scrollbar visibility |
| `classes` | `String?` | `null` | Custom CSS classes |

### DScrollOrientation

| Value | Description |
|-------|-------------|
| `vertical` | Vertical scrolling only |
| `horizontal` | Horizontal scrolling only |
| `both` | Both directions |

### DScrollbarVisibility

| Value | Description |
|-------|-------------|
| `auto` | Show when content overflows |
| `always` | Always visible with track |
| `hover` | Visible only on hover |
| `never` | Hidden scrollbar |
