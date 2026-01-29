---
title: Button
description: A button element that can act as a link or trigger an action.
layout: docs
order: 1
---

# Button

The `UButton` component is a versatile button that supports multiple variants, sizes, colors, and states.

## Basic Usage

```dart
UButton(
  label: 'Click me',
  onPressed: () => print('Clicked!'),
)
```

## Variants

Buttons come in several variants:

### Solid

```dart
UButton(
  label: 'Solid Button',
  variant: UButtonVariant.solid,
)
```

### Outline

```dart
UButton(
  label: 'Outline Button',
  variant: UButtonVariant.outline,
)
```

### Soft

```dart
UButton(
  label: 'Soft Button',
  variant: UButtonVariant.soft,
)
```

### Subtle

```dart
UButton(
  label: 'Subtle Button',
  variant: UButtonVariant.subtle,
)
```

### Ghost

```dart
UButton(
  label: 'Ghost Button',
  variant: UButtonVariant.ghost,
)
```

### Link

```dart
UButton(
  label: 'Link Button',
  variant: UButtonVariant.link,
)
```

## Colors

Buttons support all theme colors:

```dart
// Primary (default)
UButton(label: 'Primary', color: UColor.primary)

// Secondary
UButton(label: 'Secondary', color: UColor.secondary)

// Success
UButton(label: 'Success', color: UColor.success)

// Info
UButton(label: 'Info', color: UColor.info)

// Warning
UButton(label: 'Warning', color: UColor.warning)

// Error
UButton(label: 'Error', color: UColor.error)

// Neutral
UButton(label: 'Neutral', color: UColor.neutral)
```

## Sizes

```dart
// Extra small
UButton(label: 'XS', size: USize.xs)

// Small
UButton(label: 'SM', size: USize.sm)

// Medium (default)
UButton(label: 'MD', size: USize.md)

// Large
UButton(label: 'LG', size: USize.lg)

// Extra large
UButton(label: 'XL', size: USize.xl)
```

## With Icons

```dart
UButton(
  label: 'Download',
  leadingIcon: Icons.download,
)

UButton(
  label: 'Next',
  trailingIcon: Icons.arrow_right,
)
```

## Loading State

```dart
UButton(
  label: 'Submit',
  loading: true,
)
```

## Disabled State

```dart
UButton(
  label: 'Disabled',
  disabled: true,
)
```

## Full Width

```dart
UButton(
  label: 'Full Width',
  block: true,
)
```

## As Link

Buttons can act as links:

```dart
UButton(
  label: 'Visit Site',
  href: 'https://example.com',
  target: Target.blank,
)
```

## Dark Mode Support

`UButton` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Borders and shadows are optimized for dark backgrounds
- Hover and focus states remain visible
- All variants work seamlessly in both modes

No additional configuration is required when using Duxt UI's theme system.

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Button text |
| `variant` | `UButtonVariant` | `solid` | Visual style (solid, outline, soft, subtle, ghost, link) |
| `color` | `UColor` | `primary` | Color scheme (primary, secondary, success, info, warning, error, neutral) |
| `size` | `USize` | `md` | Button size (xs, sm, md, lg, xl) |
| `loading` | `bool` | `false` | Show loading state |
| `disabled` | `bool` | `false` | Disable interaction |
| `block` | `bool` | `false` | Full width |
| `leadingIcon` | `IconData?` | `null` | Icon before label |
| `trailingIcon` | `IconData?` | `null` | Icon after label |
| `href` | `String?` | `null` | Link URL (makes button act as anchor) |
| `target` | `Target?` | `null` | Link target (blank, self, etc.) |
| `onPressed` | `VoidCallback?` | `null` | Click handler |
