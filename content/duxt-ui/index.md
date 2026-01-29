---
title: Duxt UI
description: A comprehensive UI component library for Jaspr, inspired by Nuxt UI.
layout: docs
order: 1
---

# Duxt UI

Duxt UI is a modern UI component library built specifically for [Jaspr](https://jaspr.dev) - the Dart framework for building web applications. Inspired by the elegance and developer experience of [Nuxt UI](https://ui.nuxt.com), Duxt UI brings a similar component-driven approach to the Dart web ecosystem.

## Why Duxt UI?

Building beautiful, consistent web interfaces in Jaspr shouldn't require reinventing the wheel. Duxt UI provides:

- **Ready-to-use components** - Buttons, inputs, cards, modals, and more
- **Consistent design language** - All components share common patterns
- **Full customization** - Variants, colors, sizes for every use case
- **Dark mode built-in** - Automatic theme adaptation
- **Type safety** - Full Dart type checking and IntelliSense

## Features

### Tailwind CSS Integration

Built on Tailwind CSS for maximum flexibility:

```dart
UButton(
  label: 'Custom Style',
  classes: 'shadow-lg hover:shadow-xl transition-shadow',
)
```

### Consistent API Design

All components share common properties:

```dart
// Every component supports these patterns
UButton(
  variant: UButtonVariant.solid,
  color: UColor.primary,
  size: USize.md,
)

UInput(
  variant: UInputVariant.outline,
  color: UColor.primary,
  size: USize.md,
)

UCard(
  variant: UCardVariant.elevated,
)
```

### Dark Mode Support

Components automatically adapt to dark mode. No extra configuration needed:

```dart
// Works in both light and dark mode
UCard(
  body: [
    UButton(label: 'Click me', color: UColor.primary),
  ],
)
```

### Comprehensive Variants

Each component type has carefully designed variants:

**Buttons**: solid, outline, soft, subtle, ghost, link

**Inputs**: outline, filled, soft, ghost

**Cards**: default, outlined, elevated

### Color System

Semantic colors for consistent meaning:

| Color | Usage |
|-------|-------|
| `primary` | Primary actions, brand color |
| `secondary` | Secondary actions |
| `success` | Positive actions, confirmations |
| `info` | Informational elements |
| `warning` | Cautionary actions |
| `error` | Destructive actions, errors |
| `neutral` | Neutral, muted elements |

### Size Scale

Consistent sizing across components:

| Size | Description |
|------|-------------|
| `xs` | Extra small - compact UI |
| `sm` | Small - secondary actions |
| `md` | Medium - default size |
| `lg` | Large - emphasized elements |
| `xl` | Extra large - hero sections |

## Component Categories

### Form Components

- [UButton](/components/button) - Buttons and actions
- [UInput](/components/input) - Text inputs
- `UTextarea` - Multi-line text
- `USelect` - Dropdown selection
- `UCheckbox` - Checkboxes
- `URadio` - Radio buttons
- `USwitch` - Toggle switches

### Layout Components

- [UCard](/components/card) - Content containers
- `UDivider` - Visual separators
- `UContainer` - Page containers
- `USkeleton` - Loading placeholders

### Navigation

- `UTabs` - Tab navigation
- `UBreadcrumb` - Breadcrumbs
- `UPagination` - Page navigation
- `UDropdown` - Dropdown menus

### Feedback

- `UAlert` - Alert messages
- `UBadge` - Status badges
- `UTooltip` - Hover tooltips
- `UModal` - Modal dialogs
- `UToast` - Toast notifications

### Data Display

- `UAvatar` - User avatars
- `UTable` - Data tables
- `UAccordion` - Collapsible sections

## Quick Example

Here's a complete example showing Duxt UI in action:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:duxt_ui/duxt_ui.dart';

class ProfileCard extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield UCard(
      variant: UCardVariant.elevated,
      header: [
        div(classes: 'flex items-center justify-between', [
          h2(classes: 'text-lg font-semibold', [text('User Profile')]),
          UBadge(label: 'Pro', color: UColor.primary),
        ]),
      ],
      body: [
        div(classes: 'flex items-center gap-4', [
          UAvatar(src: '/avatar.jpg', size: USize.lg),
          div([
            p(classes: 'font-medium', [text('Jane Doe')]),
            p(classes: 'text-sm text-gray-500', [text('jane@example.com')]),
          ]),
        ]),
      ],
      footer: [
        div(classes: 'flex gap-2', [
          UButton(
            label: 'Edit Profile',
            variant: UButtonVariant.outline,
          ),
          UButton(
            label: 'View Activity',
            variant: UButtonVariant.solid,
            color: UColor.primary,
          ),
        ]),
      ],
    );
  }
}
```

## Getting Started

Ready to build with Duxt UI?

1. **[Installation](/getting-started)** - Add Duxt UI to your project
2. **[Quick Start](/getting-started/quick-start)** - Build your first page
3. **[Components](/components)** - Explore all components
4. **[Theming](/duxt-ui/theming)** - Customize the look and feel

## Requirements

- Dart SDK 3.0 or higher
- Jaspr 0.22.0 or higher
- jaspr_tailwind 0.3.0 or higher

## Source Code

Duxt UI is open source. View the code, report issues, or contribute:

[GitHub Repository](https://github.com/duxt-ui/duxt)
