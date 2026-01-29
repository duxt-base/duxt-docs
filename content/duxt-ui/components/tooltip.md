---
title: Tooltip
description: A popup that displays information on hover.
layout: ui-layout
order: 28
---

# Tooltip

The `DTooltip` component displays additional information when hovering over an element.

## Basic Usage

```dart
DTooltip(
  content: 'This is a tooltip',
  child: DButton(label: 'Hover me'),
)
```

## Positions

```dart
// Top (default)
DTooltip(
  content: 'Top tooltip',
  position: DTooltipPosition.top,
  child: DButton(label: 'Top'),
)

// Bottom
DTooltip(
  content: 'Bottom tooltip',
  position: DTooltipPosition.bottom,
  child: DButton(label: 'Bottom'),
)

// Left
DTooltip(
  content: 'Left tooltip',
  position: DTooltipPosition.left,
  child: DButton(label: 'Left'),
)

// Right
DTooltip(
  content: 'Right tooltip',
  position: DTooltipPosition.right,
  child: DButton(label: 'Right'),
)
```

## With Icon Button

```dart
DTooltip(
  content: 'Delete item',
  child: DButton(
    leadingIcon: DIcon(name: 'trash'),
    variant: DButtonVariant.ghost,
    color: DColor.error,
    square: true,
  ),
)
```

## Action Bar Example

```dart
div(classes: 'flex items-center gap-1', [
  DTooltip(
    content: 'Edit',
    child: DButton(
      leadingIcon: DIcon(name: 'edit'),
      variant: DButtonVariant.ghost,
      size: DSize.sm,
      square: true,
    ),
  ),
  DTooltip(
    content: 'Duplicate',
    child: DButton(
      leadingIcon: DIcon(name: 'copy'),
      variant: DButtonVariant.ghost,
      size: DSize.sm,
      square: true,
    ),
  ),
  DTooltip(
    content: 'Share',
    child: DButton(
      leadingIcon: DIcon(name: 'share'),
      variant: DButtonVariant.ghost,
      size: DSize.sm,
      square: true,
    ),
  ),
  DTooltip(
    content: 'Delete',
    child: DButton(
      leadingIcon: DIcon(name: 'trash'),
      variant: DButtonVariant.ghost,
      size: DSize.sm,
      color: DColor.error,
      square: true,
    ),
  ),
])
```

## With Rich Content

```dart
DTooltip(
  content: div([
    p(classes: 'font-medium', [text('Keyboard Shortcut')]),
    p(classes: 'text-gray-400', [text('Ctrl + S')]),
  ]),
  child: DButton(label: 'Save'),
)
```

## Delay

Control when the tooltip appears:

```dart
DTooltip(
  content: 'This appears after 500ms',
  delay: 500,  // milliseconds
  child: DButton(label: 'Delayed'),
)
```

## Information Tooltips

```dart
div(classes: 'flex items-center gap-2', [
  span([text('API Key')]),
  DTooltip(
    content: 'Your API key is used to authenticate requests',
    child: DIcon(
      name: 'info',
      size: 16,
      classes: 'text-gray-400 cursor-help',
    ),
  ),
])
```

## Form Field Help

```dart
div(classes: 'space-y-1', [
  div(classes: 'flex items-center gap-2', [
    label([text('Password')]),
    DTooltip(
      content: div([
        p(classes: 'font-medium mb-1', [text('Password requirements:')]),
        ul(classes: 'text-sm space-y-1', [
          li([text('• At least 8 characters')]),
          li([text('• One uppercase letter')]),
          li([text('• One number')]),
          li([text('• One special character')]),
        ]),
      ]),
      child: DIcon(
        name: 'help-circle',
        size: 16,
        classes: 'text-gray-400',
      ),
    ),
  ]),
  DInput(type: InputType.password),
])
```

## Table Cell Tooltips

For truncated content:

```dart
DTable<User>(
  columns: [
    DTableColumn(
      key: 'email',
      label: 'Email',
      render: (user) => DTooltip(
        content: user.email,
        child: span(
          classes: 'truncate max-w-[200px] block',
          [text(user.email)],
        ),
      ),
    ),
  ],
  data: users,
)
```

## Status Indicator

```dart
div(classes: 'flex items-center gap-2', [
  DTooltip(
    content: 'Online since 2 hours ago',
    child: div(
      classes: 'w-3 h-3 rounded-full bg-success-500',
      [],
    ),
  ),
  span([text('Active')]),
])
```

## Dark Mode Support

`DTooltip` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Text remains readable
- Arrow/pointer colors match

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `content` | `dynamic` | required | Tooltip content (String or Component) |
| `child` | `Component` | required | Element that triggers tooltip |
| `position` | `DTooltipPosition` | `top` | Tooltip placement |
| `delay` | `int` | `0` | Show delay in milliseconds |

### DTooltipPosition

| Value | Description |
|-------|-------------|
| `top` | Above the trigger element |
| `bottom` | Below the trigger element |
| `left` | Left of the trigger element |
| `right` | Right of the trigger element |
