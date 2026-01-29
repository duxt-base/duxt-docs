---
title: Button
description: A button element that can trigger an action.
layout: ui-layout
order: 1
---

# Button

The `DButton` component is a versatile button that supports multiple variants, sizes, colors, and states.

## Basic Usage

```dart
DButton(
  label: 'Click me',
  onClick: () => print('Clicked!'),
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
DButton(label: 'Primary', color: DButtonColor.primary)
DButton(label: 'Secondary', color: DButtonColor.secondary)
DButton(label: 'Success', color: DButtonColor.success)
DButton(label: 'Info', color: DButtonColor.info)
DButton(label: 'Warning', color: DButtonColor.warning)
DButton(label: 'Error', color: DButtonColor.error)
DButton(label: 'Neutral', color: DButtonColor.neutral)
```

## Sizes

```dart
DButton(label: 'XS', size: DButtonSize.xs)
DButton(label: 'SM', size: DButtonSize.sm)
DButton(label: 'MD', size: DButtonSize.md)
DButton(label: 'LG', size: DButtonSize.lg)
DButton(label: 'XL', size: DButtonSize.xl)
```

## With Icons

```dart
DButton(
  label: 'Download',
  leadingIcon: DIcon(name: 'download'),
)

DButton(
  label: 'Next',
  trailingIcon: DIcon(name: 'arrow-right'),
)
```

## Icon Only Button

```dart
DButton(
  leadingIcon: DIcon(name: 'plus'),
  variant: DButtonVariant.ghost,
  square: true,
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

## Dark Mode Support

`DButton` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Borders and shadows are optimized for dark backgrounds
- Hover and focus states remain visible
- All variants work seamlessly in both modes

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Button text |
| `variant` | `DButtonVariant` | `solid` | Visual style |
| `color` | `DButtonColor` | `primary` | Color scheme |
| `size` | `DButtonSize` | `md` | Button size |
| `loading` | `bool` | `false` | Show loading state |
| `disabled` | `bool` | `false` | Disable interaction |
| `block` | `bool` | `false` | Full width |
| `square` | `bool` | `false` | Square button (for icon-only) |
| `leadingIcon` | `Component?` | `null` | Icon before label |
| `trailingIcon` | `Component?` | `null` | Icon after label |
| `onClick` | `VoidCallback?` | `null` | Click handler |
