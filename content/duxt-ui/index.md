---
title: Duxt UI
description: A comprehensive UI component library for Jaspr, inspired by Nuxt UI.
layout: ui-layout
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
DButton(
  label: 'Custom Style',
  classes: 'shadow-lg hover:shadow-xl transition-shadow',
)
```

### Consistent API Design

All components share common properties:

```dart
DButton(
  variant: DButtonVariant.solid,
  color: DColor.primary,
  size: DSize.md,
)

DInput(
  variant: DInputVariant.outline,
  color: DColor.primary,
  size: DSize.md,
)

DCard(
  variant: DCardVariant.elevated,
)
```

### Dark Mode Support

Components automatically adapt to dark mode:

```dart
DCard(
  body: [
    DButton(label: 'Click me', color: DColor.primary),
  ],
)
```

### Comprehensive Variants

**Buttons**: solid, outline, soft, subtle, ghost, link

**Inputs**: outline, filled, soft, ghost

**Cards**: default, outlined, elevated

### Color System

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

| Size | Description |
|------|-------------|
| `xs` | Extra small - compact UI |
| `sm` | Small - secondary actions |
| `md` | Medium - default size |
| `lg` | Large - emphasized elements |
| `xl` | Extra large - hero sections |

## Component Categories

### Form Components

- [DButton](/duxt-ui/components/button) - Buttons and actions
- [DInput](/duxt-ui/components/input) - Text inputs
- `DTextarea` - Multi-line text
- `DSelect` - Dropdown selection
- `DCheckbox` - Checkboxes
- `DRadio` - Radio buttons
- `DSwitch` - Toggle switches

### Layout Components

- [DCard](/duxt-ui/components/card) - Content containers
- `DDivider` - Visual separators
- `DContainer` - Page containers
- `DSkeleton` - Loading placeholders

### Navigation

- `DTabs` - Tab navigation
- `DBreadcrumb` - Breadcrumbs
- `DPagination` - Page navigation
- `DDropdown` - Dropdown menus

### Feedback

- `DAlert` - Alert messages
- `DBadge` - Status badges
- `DTooltip` - Hover tooltips
- `DModal` - Modal dialogs
- `DToast` - Toast notifications

### Data Display

- `DAvatar` - User avatars
- `DTable` - Data tables
- `DAccordion` - Collapsible sections

## Quick Example

```dart
import 'package:jaspr/jaspr.dart';
import 'package:duxt_ui/duxt_ui.dart';

class ProfileCard extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      variant: DCardVariant.elevated,
      header: [
        div(classes: 'flex items-center justify-between', [
          h2(classes: 'text-lg font-semibold', [text('User Profile')]),
          DBadge(label: 'Pro', color: DColor.primary),
        ]),
      ],
      body: [
        div(classes: 'flex items-center gap-4', [
          DAvatar(src: '/avatar.jpg', size: DSize.lg),
          div([
            p(classes: 'font-medium', [text('Jane Doe')]),
            p(classes: 'text-sm text-gray-500', [text('jane@example.com')]),
          ]),
        ]),
      ],
      footer: [
        div(classes: 'flex gap-2', [
          DButton(
            label: 'Edit Profile',
            variant: DButtonVariant.outline,
          ),
          DButton(
            label: 'View Activity',
            variant: DButtonVariant.solid,
            color: DColor.primary,
          ),
        ]),
      ],
    );
  }
}
```

## Requirements

- Dart SDK 3.0 or higher
- Jaspr 0.22.0 or higher
- jaspr_tailwind 0.3.0 or higher

## Source Code

Duxt UI is open source. View the code, report issues, or contribute:

[GitHub Repository](https://github.com/duxt-ui/duxt)
