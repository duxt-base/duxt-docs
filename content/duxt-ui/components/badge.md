---
title: Badge
description: A small status indicator for labeling and categorization.
layout: ui-layout
order: 5
---

# Badge

The `DBadge` component displays small labels for status indicators, counts, or categorization.

## Basic Usage

```
DBadge(label: 'New')
```

## Variants

### Solid

```
DBadge(
  label: 'Solid',
  variant: DBadgeVariant.solid,
)
```

### Outline

```
DBadge(
  label: 'Outline',
  variant: DBadgeVariant.outline,
)
```

### Soft

```
DBadge(
  label: 'Soft',
  variant: DBadgeVariant.soft,
)
```

### Subtle

```
DBadge(
  label: 'Subtle',
  variant: DBadgeVariant.subtle,
)
```

## Colors

```
DBadge(label: 'Primary', color: DBadgeColor.primary)
DBadge(label: 'Secondary', color: DBadgeColor.secondary)
DBadge(label: 'Success', color: DBadgeColor.success)
DBadge(label: 'Info', color: DBadgeColor.info)
DBadge(label: 'Warning', color: DBadgeColor.warning)
DBadge(label: 'Error', color: DBadgeColor.error)
DBadge(label: 'Neutral', color: DBadgeColor.neutral)
```

## Sizes

```
DBadge(label: 'XS', size: DBadgeSize.xs)
DBadge(label: 'SM', size: DBadgeSize.sm)
DBadge(label: 'MD', size: DBadgeSize.md)
DBadge(label: 'LG', size: DBadgeSize.lg)
DBadge(label: 'XL', size: DBadgeSize.xl)
```

## With Icons

### Leading Icon

```
DBadge(
  label: 'Active',
  leadingIcon: DIcon(name: 'check'),
  color: DBadgeColor.success,
)
```

### Trailing Icon

```
DBadge(
  label: 'Remove',
  trailingIcon: DIcon(name: 'x'),
  color: DBadgeColor.error,
)
```

## Common Use Cases

### Status Indicators

```
// Online status
DBadge(
  label: 'Online',
  color: DBadgeColor.success,
  variant: DBadgeVariant.soft,
)

// Pending status
DBadge(
  label: 'Pending',
  color: DBadgeColor.warning,
  variant: DBadgeVariant.soft,
)

// Error status
DBadge(
  label: 'Failed',
  color: DBadgeColor.error,
  variant: DBadgeVariant.soft,
)
```

### Notification Count

```
DBadge(
  label: '5',
  color: DBadgeColor.error,
  variant: DBadgeVariant.solid,
  size: DBadgeSize.xs,
)
```

### Category Labels

```
Row([
  DBadge(label: 'Flutter', color: DBadgeColor.info),
  DBadge(label: 'Dart', color: DBadgeColor.primary),
  DBadge(label: 'Web', color: DBadgeColor.secondary),
])
```

### In Card Headers

```
DCard(
  header: [
    div(classes: 'flex items-center justify-between', [
      h3([text('Project Status')]),
      DBadge(
        label: 'In Progress',
        color: DBadgeColor.warning,
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
| `color` | `DBadgeColor` | `primary` | Color scheme |
| `size` | `DBadgeSize` | `md` | Badge size |
| `leadingIcon` | `Component?` | `null` | Icon before label |
| `trailingIcon` | `Component?` | `null` | Icon after label |
