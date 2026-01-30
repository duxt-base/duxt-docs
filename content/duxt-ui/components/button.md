---
title: Button
description: A button element that can trigger an action.
layout: ui-layout
order: 1
---

# Button

The `DButton` component is a versatile button that supports multiple variants, sizes, colors, and states.

## Basic Usage

```
DButton(
  label: 'Click me',
  onClick: () => print('Clicked!'),
)
```

## Variants

### Solid

```
DButton(
  label: 'Solid Button',
  variant: DButtonVariant.solid,
)
```

### Outline

```
DButton(
  label: 'Outline Button',
  variant: DButtonVariant.outline,
)
```

### Soft

```
DButton(
  label: 'Soft Button',
  variant: DButtonVariant.soft,
)
```

### Subtle

```
DButton(
  label: 'Subtle Button',
  variant: DButtonVariant.subtle,
)
```

### Ghost

```
DButton(
  label: 'Ghost Button',
  variant: DButtonVariant.ghost,
)
```

### Link

```
DButton(
  label: 'Link Button',
  variant: DButtonVariant.link,
)
```

## Colors

```
DButton(label: 'Primary', color: DButtonColor.primary)
DButton(label: 'Secondary', color: DButtonColor.secondary)
DButton(label: 'Success', color: DButtonColor.success)
DButton(label: 'Info', color: DButtonColor.info)
DButton(label: 'Warning', color: DButtonColor.warning)
DButton(label: 'Error', color: DButtonColor.error)
DButton(label: 'Neutral', color: DButtonColor.neutral)
```

## Sizes

```
DButton(label: 'XS', size: DButtonSize.xs)
DButton(label: 'SM', size: DButtonSize.sm)
DButton(label: 'MD', size: DButtonSize.md)
DButton(label: 'LG', size: DButtonSize.lg)
DButton(label: 'XL', size: DButtonSize.xl)
```

## With Icons

```
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

```
DButton(
  leadingIcon: DIcon(name: 'plus'),
  variant: DButtonVariant.ghost,
  square: true,
)
```

## Loading State

```
DButton(
  label: 'Submit',
  loading: true,
)
```

## Disabled State

```
DButton(
  label: 'Disabled',
  disabled: true,
)
```

## Full Width

```
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
