---
title: Icon
description: A component for displaying icons from various icon sets.
layout: ui-layout
order: 31
---

# Icon

The `DIcon` component displays icons by name, supporting various icon libraries.

## Basic Usage

```dart
DIcon(name: 'home')
DIcon(name: 'settings')
DIcon(name: 'user')
```

## Sizes

```dart
DIcon(name: 'star', size: 12)
DIcon(name: 'star', size: 16)
DIcon(name: 'star', size: 20)  // Default
DIcon(name: 'star', size: 24)
DIcon(name: 'star', size: 32)
DIcon(name: 'star', size: 48)
```

## Colors

```dart
// Using Tailwind classes
DIcon(name: 'heart', classes: 'text-red-500')
DIcon(name: 'check', classes: 'text-green-500')
DIcon(name: 'alert-triangle', classes: 'text-yellow-500')
DIcon(name: 'info', classes: 'text-blue-500')

// Inherits parent text color
div(classes: 'text-primary-600', [
  DIcon(name: 'star'),
  text('Rating'),
])
```

## In Buttons

```dart
DButton(
  label: 'Edit',
  leadingIcon: DIcon(name: 'edit'),
)

DButton(
  label: 'Next',
  trailingIcon: DIcon(name: 'arrow-right'),
)

// Icon-only button
DButton(
  leadingIcon: DIcon(name: 'plus'),
  variant: DButtonVariant.ghost,
  square: true,
)
```

## In Inputs

```dart
DInput(
  label: 'Search',
  leadingIcon: DIcon(name: 'search'),
)

DInput(
  label: 'Email',
  leadingIcon: DIcon(name: 'mail'),
)

DInput(
  label: 'Password',
  type: InputType.password,
  leadingIcon: DIcon(name: 'lock'),
  trailingIcon: DIcon(name: 'eye'),
)
```

## In Alerts

```dart
DAlert(
  icon: DIcon(name: 'check-circle'),
  title: 'Success',
  description: 'Your changes have been saved.',
  color: DColor.success,
)

DAlert(
  icon: DIcon(name: 'alert-triangle'),
  title: 'Warning',
  description: 'Please review before continuing.',
  color: DColor.warning,
)
```

## Common Icons

### Navigation
```dart
DIcon(name: 'home')
DIcon(name: 'menu')
DIcon(name: 'chevron-left')
DIcon(name: 'chevron-right')
DIcon(name: 'chevron-up')
DIcon(name: 'chevron-down')
DIcon(name: 'arrow-left')
DIcon(name: 'arrow-right')
```

### Actions
```dart
DIcon(name: 'plus')
DIcon(name: 'minus')
DIcon(name: 'x')
DIcon(name: 'check')
DIcon(name: 'edit')
DIcon(name: 'trash')
DIcon(name: 'copy')
DIcon(name: 'download')
DIcon(name: 'upload')
DIcon(name: 'share')
DIcon(name: 'refresh-cw')
```

### Communication
```dart
DIcon(name: 'mail')
DIcon(name: 'message-circle')
DIcon(name: 'phone')
DIcon(name: 'send')
DIcon(name: 'bell')
```

### User Interface
```dart
DIcon(name: 'search')
DIcon(name: 'settings')
DIcon(name: 'filter')
DIcon(name: 'more-horizontal')
DIcon(name: 'more-vertical')
DIcon(name: 'eye')
DIcon(name: 'eye-off')
```

### Status
```dart
DIcon(name: 'check-circle')
DIcon(name: 'x-circle')
DIcon(name: 'alert-circle')
DIcon(name: 'alert-triangle')
DIcon(name: 'info')
DIcon(name: 'help-circle')
```

### Media
```dart
DIcon(name: 'image')
DIcon(name: 'video')
DIcon(name: 'music')
DIcon(name: 'file')
DIcon(name: 'folder')
DIcon(name: 'play')
DIcon(name: 'pause')
```

### Social
```dart
DIcon(name: 'heart')
DIcon(name: 'star')
DIcon(name: 'thumbs-up')
DIcon(name: 'thumbs-down')
DIcon(name: 'bookmark')
```

## Icon with Text

```dart
// Horizontal alignment
div(classes: 'flex items-center gap-2', [
  DIcon(name: 'calendar', size: 16),
  span([text('Schedule')]),
])

// Badge-like
div(classes: 'inline-flex items-center gap-1 px-2 py-1 bg-gray-100 rounded', [
  DIcon(name: 'tag', size: 14),
  span(classes: 'text-sm', [text('Label')]),
])
```

## Loading State

```dart
// Spinning icon
DIcon(name: 'loader', classes: 'animate-spin')

// Or use DSpinner for loading states
DSpinner(size: DSize.sm)
```

## Dark Mode Support

`DIcon` inherits the text color from its parent, so it automatically adapts to dark mode when using semantic color classes or when the parent element adapts.

```dart
// This icon will adapt to dark mode
div(classes: 'text-gray-600 dark:text-gray-400', [
  DIcon(name: 'info'),
])
```

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `name` | `String` | required | Icon name |
| `size` | `int` | `20` | Icon size in pixels |
| `classes` | `String?` | `null` | Additional CSS classes |

## Icon Libraries

Duxt UI supports icons from popular icon libraries. The default icon set is based on Lucide icons. Refer to your icon library's documentation for available icon names.

Common icon libraries:
- [Lucide](https://lucide.dev/) - Default
- [Heroicons](https://heroicons.com/)
- [Tabler Icons](https://tabler-icons.io/)
