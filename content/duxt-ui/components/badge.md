---
title: Badge
description: A small status indicator for labeling and categorization.
layout: ui-layout
order: 5
---

# Badge

The `DBadge` component displays small labels for status indicators, counts, or categorization.

## Basic Usage

```dart
DBadge(label: 'New')
```

## Variants

### Solid

```dart
DBadge(
  label: 'Solid',
  variant: DBadgeVariant.solid,
)
```

### Outline

```dart
DBadge(
  label: 'Outline',
  variant: DBadgeVariant.outline,
)
```

### Soft

```dart
DBadge(
  label: 'Soft',
  variant: DBadgeVariant.soft,
)
```

### Subtle

```dart
DBadge(
  label: 'Subtle',
  variant: DBadgeVariant.subtle,
)
```

## Colors

```dart
DBadge(label: 'Primary', color: DColor.primary)
DBadge(label: 'Secondary', color: DColor.secondary)
DBadge(label: 'Success', color: DColor.success)
DBadge(label: 'Info', color: DColor.info)
DBadge(label: 'Warning', color: DColor.warning)
DBadge(label: 'Error', color: DColor.error)
DBadge(label: 'Neutral', color: DColor.neutral)
```

## Sizes

```dart
DBadge(label: 'XS', size: DSize.xs)
DBadge(label: 'SM', size: DSize.sm)
DBadge(label: 'MD', size: DSize.md)
DBadge(label: 'LG', size: DSize.lg)
DBadge(label: 'XL', size: DSize.xl)
```

## With Icons

### Leading Icon

```dart
DBadge(
  label: 'Active',
  leadingIcon: DIcon(name: 'check'),
  color: DColor.success,
)
```

### Trailing Icon

```dart
DBadge(
  label: 'Remove',
  trailingIcon: DIcon(name: 'x'),
  color: DColor.error,
)
```

## Common Use Cases

### Status Indicators

```dart
// Online status
DBadge(
  label: 'Online',
  color: DColor.success,
  variant: DBadgeVariant.soft,
)

// Pending status
DBadge(
  label: 'Pending',
  color: DColor.warning,
  variant: DBadgeVariant.soft,
)

// Error status
DBadge(
  label: 'Failed',
  color: DColor.error,
  variant: DBadgeVariant.soft,
)
```

### Notification Count

```dart
DBadge(
  label: '5',
  color: DColor.error,
  variant: DBadgeVariant.solid,
  size: DSize.xs,
)
```

### Category Labels

```dart
Row([
  DBadge(label: 'Flutter', color: DColor.info),
  DBadge(label: 'Dart', color: DColor.primary),
  DBadge(label: 'Web', color: DColor.secondary),
])
```

### In Card Headers

```dart
DCard(
  header: [
    div(classes: 'flex items-center justify-between', [
      h3([text('Project Status')]),
      DBadge(
        label: 'In Progress',
        color: DColor.warning,
        variant: DBadgeVariant.soft,
      ),
    ]),
  ],
  body: [
    text('Project details...'),
  ],
)
```

## Dark Mode Support

`DBadge` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Border colors are optimized for dark backgrounds
- Text colors remain readable
- All variants work seamlessly in both modes

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Badge text |
| `variant` | `DBadgeVariant` | `soft` | Visual style |
| `color` | `DColor` | `primary` | Color scheme |
| `size` | `DSize` | `sm` | Badge size |
| `leadingIcon` | `Component?` | `null` | Icon before label |
| `trailingIcon` | `Component?` | `null` | Icon after label |
