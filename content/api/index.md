---
title: API Reference
description: Complete API documentation for Duxt UI components.
layout: docs
order: 1
---

# API Reference

This section provides complete API documentation for all Duxt UI components.

## Core Components

### Buttons

- [UButton](/components/button) - Standard button component
- `UButtonGroup` - Group multiple buttons together
- `UIconButton` - Icon-only button

### Forms

- `UInput` - Text input field
- `UTextarea` - Multi-line text input
- `USelect` - Dropdown selection
- `UCheckbox` - Checkbox input
- `URadio` - Radio button input
- `USwitch` - Toggle switch
- `USlider` - Range slider

### Layout

- [UCard](/components/card) - Content container
- `UDivider` - Visual separator
- `USkeleton` - Loading placeholder

### Navigation

- `UTabs` - Tab navigation
- `UBreadcrumb` - Breadcrumb navigation
- `UPagination` - Page navigation

### Feedback

- `UAlert` - Alert messages
- `UBadge` - Status indicators
- `UTooltip` - Hover tooltips
- `UModal` - Modal dialogs
- `UToast` - Toast notifications

### Data Display

- `UAvatar` - User avatars
- `UTable` - Data tables
- `UAccordion` - Collapsible sections

## Utilities

### Colors (UColor)

```
enum UColor {
  primary,
  secondary,
  success,
  warning,
  error,
  info,
  gray,
}
```

### Sizes (USize)

```
enum USize {
  xs,  // Extra small
  sm,  // Small
  md,  // Medium (default)
  lg,  // Large
  xl,  // Extra large
  xxl, // 2X Large
}
```

### Variants

Each component has its own variant enum. Common patterns include:

- `solid` - Filled background
- `outline` - Border only
- `soft` - Subtle background
- `ghost` - No background
- `link` - Text link style

## Theming

### Theme Configuration

```
final theme = UTheme(
  colors: UColors(
    primary: Color(0xFF4F46E5),
    secondary: Color(0xFF6B7280),
    // ...
  ),
  borderRadius: UBorderRadius.md,
  darkMode: false,
);
```

### Using Theme

Wrap your app with `UThemeProvider`:

```
UThemeProvider(
  theme: theme,
  child: MyApp(),
)
```

Access theme in components:

```
final theme = UTheme.of(context);
```

## Importing

Import all components:

```
import 'package:duxt_ui/duxt_ui.dart';
```

Import specific components:

```
import 'package:duxt_ui/components/button.dart';
import 'package:duxt_ui/components/card.dart';
```
