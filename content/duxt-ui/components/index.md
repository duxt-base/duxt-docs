---
title: Components
description: Browse all Duxt UI components for building modern web interfaces.
layout: ui-layout
order: 0
---

# Components

Duxt UI provides a comprehensive set of components for building modern web applications with Jaspr. All components support dark mode, are fully typed, and follow consistent API patterns.

## Form Components

Components for user input and data collection.

| Component | Description |
|-----------|-------------|
| [Button](/duxt-ui/components/button) | Buttons and action triggers |
| [Input](/duxt-ui/components/input) | Text input fields |
| [Textarea](/duxt-ui/components/textarea) | Multi-line text input |
| [Select](/duxt-ui/components/select) | Dropdown selection |
| [Checkbox](/duxt-ui/components/checkbox) | Checkboxes for multiple selection |
| [Switch](/duxt-ui/components/switch) | Toggle switches |
| [Slider](/duxt-ui/components/slider) | Range slider input |

## Data Display

Components for presenting information.

| Component | Description |
|-----------|-------------|
| [Table](/duxt-ui/components/table) | Data tables with custom rendering |
| [Avatar](/duxt-ui/components/avatar) | User profile images and initials |
| [Badge](/duxt-ui/components/badge) | Status indicators and labels |
| [Progress](/duxt-ui/components/progress) | Progress bars and indicators |
| [Skeleton](/duxt-ui/components/skeleton) | Loading placeholders |
| [Icon](/duxt-ui/components/icon) | Icon display component |
| [Kbd](/duxt-ui/components/kbd) | Keyboard shortcut display |

## Layout

Components for structuring content.

| Component | Description |
|-----------|-------------|
| [Card](/duxt-ui/components/card) | Content containers |
| [Container](/duxt-ui/components/container) | Responsive page containers |
| [Separator](/duxt-ui/components/separator) | Visual dividers |
| [Accordion](/duxt-ui/components/accordion) | Collapsible content sections |
| [Collapsible](/duxt-ui/components/collapsible) | Single expand/collapse |

## Feedback

Components for user feedback and notifications.

| Component | Description |
|-----------|-------------|
| [Alert](/duxt-ui/components/alert) | Alert messages and notices |
| [Toast](/duxt-ui/components/toast) | Toast notifications |
| [Spinner](/duxt-ui/components/spinner) | Loading spinners |

## Navigation

Components for navigation and wayfinding.

| Component | Description |
|-----------|-------------|
| [Tabs](/duxt-ui/components/tabs) | Tabbed content sections |
| [Breadcrumb](/duxt-ui/components/breadcrumb) | Navigation breadcrumbs |
| [Pagination](/duxt-ui/components/pagination) | Page navigation |
| [Dropdown](/duxt-ui/components/dropdown) | Dropdown menus |

## Overlay

Components that appear above other content.

| Component | Description |
|-----------|-------------|
| [Modal](/duxt-ui/components/modal) | Modal dialogs |
| [Slideover](/duxt-ui/components/slideover) | Slide-out panels/drawers |
| [Tooltip](/duxt-ui/components/tooltip) | Hover tooltips |
| [Popover](/duxt-ui/components/popover) | Click-triggered popovers |

## Theme

Components for theme management.

| Component | Description |
|-----------|-------------|
| [Theme](/duxt-ui/components/theme) | Theme provider and color mode toggle |

## Common Patterns

### Variants

Most components support visual variants:

```dart
DButton(variant: DButtonVariant.solid)    // Filled background
DButton(variant: DButtonVariant.outline)  // Border only
DButton(variant: DButtonVariant.soft)     // Subtle background
DButton(variant: DButtonVariant.subtle)   // Very subtle
DButton(variant: DButtonVariant.ghost)    // No background
DButton(variant: DButtonVariant.link)     // Link style
```

### Colors

Semantic colors are available across components:

```dart
DButton(color: DColor.primary)    // Primary brand color
DButton(color: DColor.secondary)  // Secondary color
DButton(color: DColor.success)    // Positive/success
DButton(color: DColor.info)       // Informational
DButton(color: DColor.warning)    // Warning/caution
DButton(color: DColor.error)      // Error/danger
DButton(color: DColor.neutral)    // Neutral/muted
```

### Sizes

Standard size scale:

```dart
DButton(size: DSize.xs)   // Extra small
DButton(size: DSize.sm)   // Small
DButton(size: DSize.md)   // Medium (default)
DButton(size: DSize.lg)   // Large
DButton(size: DSize.xl)   // Extra large
```

## Getting Started

1. Import Duxt UI in your project:

```dart
import 'package:duxt_ui/duxt_ui.dart';
```

2. Wrap your app with the theme provider:

```dart
DThemeProvider(
  mode: DThemeMode.system,
  child: [
    // Your app content
  ],
)
```

3. Use components:

```dart
DButton(
  label: 'Get Started',
  color: DColor.primary,
  onClick: () => print('Clicked!'),
)
```
