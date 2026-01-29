---
title: Alert
description: A component for displaying important messages and feedback to users.
layout: ui-layout
order: 4
---

# Alert

The `DAlert` component displays important messages, warnings, or feedback to users with various styles and semantic colors.

## Basic Usage

```dart
DAlert(
  title: 'Heads up!',
  description: 'This is an informational alert.',
)
```

## Variants

### Solid

```dart
DAlert(
  title: 'Solid Alert',
  description: 'This uses a solid background.',
  variant: DAlertVariant.solid,
)
```

### Outline

```dart
DAlert(
  title: 'Outline Alert',
  description: 'This uses an outline style.',
  variant: DAlertVariant.outline,
)
```

### Soft

```dart
DAlert(
  title: 'Soft Alert',
  description: 'This uses a soft, muted background.',
  variant: DAlertVariant.soft,
)
```

### Subtle

```dart
DAlert(
  title: 'Subtle Alert',
  description: 'This uses a subtle styling.',
  variant: DAlertVariant.subtle,
)
```

## Colors

```dart
DAlert(title: 'Primary', color: DAlertColor.primary)
DAlert(title: 'Secondary', color: DAlertColor.secondary)
DAlert(title: 'Success', color: DAlertColor.success)
DAlert(title: 'Info', color: DAlertColor.info)
DAlert(title: 'Warning', color: DAlertColor.warning)
DAlert(title: 'Error', color: DAlertColor.error)
DAlert(title: 'Neutral', color: DAlertColor.neutral)
```

## With Icon

```dart
DAlert(
  title: 'Check your email',
  description: 'We sent you a confirmation link.',
  icon: DIcon(name: 'mail'),
  color: DAlertColor.info,
)
```

## With Avatar

```dart
DAlert(
  title: 'New message from John',
  description: 'Hey, just checking in on the project.',
  avatar: DAvatar(src: '/john.jpg', size: DAvatarSize.sm),
)
```

## Closable Alert

```dart
DAlert(
  title: 'Dismissible Alert',
  description: 'Click the X to close this alert.',
  onClose: () => print('Alert closed'),
)
```

## With Actions

```dart
DAlert(
  title: 'Update Available',
  description: 'A new version is ready to install.',
  color: DAlertColor.info,
  actions: [
    DButton(
      label: 'Update Now',
      size: DButtonSize.sm,
      variant: DButtonVariant.solid,
    ),
    DButton(
      label: 'Later',
      size: DButtonSize.sm,
      variant: DButtonVariant.ghost,
    ),
  ],
)
```

## Complete Example

```dart
DAlert(
  title: 'Payment Successful',
  description: 'Your order #12345 has been confirmed.',
  icon: DIcon(name: 'check-circle'),
  color: DAlertColor.success,
  variant: DAlertVariant.soft,
  onClose: () => print('Dismissed'),
  actions: [
    DButton(
      label: 'View Order',
      size: DButtonSize.sm,
      variant: DButtonVariant.outline,
      color: DButtonColor.success,
    ),
  ],
)
```

## Dark Mode Support

`DAlert` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Border colors are optimized for dark backgrounds
- Text remains readable in both modes
- Icons and actions adapt accordingly

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | Alert title |
| `description` | `String?` | `null` | Alert description |
| `variant` | `DAlertVariant` | `soft` | Visual style |
| `color` | `DAlertColor` | `primary` | Color scheme |
| `icon` | `Component?` | `null` | Leading icon |
| `avatar` | `Component?` | `null` | Leading avatar |
| `onClose` | `VoidCallback?` | `null` | Close callback (shows close button when set) |
| `actions` | `List<Component>` | `[]` | Action buttons |
