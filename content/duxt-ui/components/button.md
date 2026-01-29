---
title: Button
description: A button element that can act as a link or trigger an action.
layout: ui-layout
order: 1
---

# Button

The `DButton` component is a versatile button that supports multiple variants, sizes, colors, and states.

## Basic Usage

```dart
DButton(
  label: 'Click me',
  onPressed: () => print('Clicked!'),
)
```

## Variants

### Solid

```dart
DButton(
  label: 'Solid Button',
  variant: DButtonVariant.solid,
)
```

### Outline

```dart
DButton(
  label: 'Outline Button',
  variant: DButtonVariant.outline,
)
```

### Soft

```dart
DButton(
  label: 'Soft Button',
  variant: DButtonVariant.soft,
)
```

### Subtle

```dart
DButton(
  label: 'Subtle Button',
  variant: DButtonVariant.subtle,
)
```

### Ghost

```dart
DButton(
  label: 'Ghost Button',
  variant: DButtonVariant.ghost,
)
```

### Link

```dart
DButton(
  label: 'Link Button',
  variant: DButtonVariant.link,
)
```

## Colors

```dart
DButton(label: 'Primary', color: DColor.primary)
DButton(label: 'Secondary', color: DColor.secondary)
DButton(label: 'Success', color: DColor.success)
DButton(label: 'Info', color: DColor.info)
DButton(label: 'Warning', color: DColor.warning)
DButton(label: 'Error', color: DColor.error)
DButton(label: 'Neutral', color: DColor.neutral)
```

## Sizes

```dart
DButton(label: 'XS', size: DSize.xs)
DButton(label: 'SM', size: DSize.sm)
DButton(label: 'MD', size: DSize.md)
DButton(label: 'LG', size: DSize.lg)
DButton(label: 'XL', size: DSize.xl)
```

## With Icons

```dart
DButton(
  label: 'Download',
  leadingIcon: Icons.download,
)

DButton(
  label: 'Next',
  trailingIcon: Icons.arrow_right,
)
```

## Loading State

```dart
DButton(
  label: 'Submit',
  loading: true,
)
```

## Disabled State

```dart
DButton(
  label: 'Disabled',
  disabled: true,
)
```

## Full Width

```dart
DButton(
  label: 'Full Width',
  block: true,
)
```

## As Link

```dart
DButton(
  label: 'Visit Site',
  href: 'https://example.com',
  target: Target.blank,
)
```

## Dark Mode Support

`DButton` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Borders and shadows are optimized for dark backgrounds
- Hover and focus states remain visible
- All variants work seamlessly in both modes

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Button text |
| `variant` | `DButtonVariant` | `solid` | Visual style |
| `color` | `DColor` | `primary` | Color scheme |
| `size` | `DSize` | `md` | Button size |
| `loading` | `bool` | `false` | Show loading state |
| `disabled` | `bool` | `false` | Disable interaction |
| `block` | `bool` | `false` | Full width |
| `leadingIcon` | `IconData?` | `null` | Icon before label |
| `trailingIcon` | `IconData?` | `null` | Icon after label |
| `href` | `String?` | `null` | Link URL |
| `target` | `Target?` | `null` | Link target |
| `onPressed` | `VoidCallback?` | `null` | Click handler |
