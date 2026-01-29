---
title: Toast
description: A notification component for displaying brief messages to users.
layout: ui-layout
order: 12
---

# Toast

The `DToast` and `DToaster` components provide a notification system for displaying brief, non-blocking messages to users.

## Basic Usage

```dart
DToast(
  title: 'Success',
  description: 'Your changes have been saved.',
  color: DColor.success,
)
```

## Colors

```dart
DToast(title: 'Primary', color: DColor.primary)
DToast(title: 'Secondary', color: DColor.secondary)
DToast(title: 'Success', color: DColor.success)
DToast(title: 'Info', color: DColor.info)
DToast(title: 'Warning', color: DColor.warning)
DToast(title: 'Error', color: DColor.error)
```

## Variants

### Solid

```dart
DToast(
  title: 'Solid Toast',
  variant: DToastVariant.solid,
  color: DColor.success,
)
```

### Outline

```dart
DToast(
  title: 'Outline Toast',
  variant: DToastVariant.outline,
  color: DColor.info,
)
```

### Soft

```dart
DToast(
  title: 'Soft Toast',
  variant: DToastVariant.soft,
  color: DColor.warning,
)
```

### Subtle

```dart
DToast(
  title: 'Subtle Toast',
  variant: DToastVariant.subtle,
  color: DColor.error,
)
```

## With Custom Icon

```dart
DToast(
  title: 'Download Complete',
  description: 'Your file is ready.',
  icon: DIcon(name: 'download'),
  color: DColor.success,
)
```

## Closable Toast

```dart
DToast(
  title: 'Notification',
  description: 'You have a new message.',
  closable: true,
  onClose: () => print('Toast closed'),
)
```

## With Action

```dart
DToast(
  title: 'Event Created',
  description: 'Your event has been scheduled.',
  color: DColor.success,
  action: DButton(
    label: 'View',
    size: DSize.sm,
    variant: DButtonVariant.ghost,
    onClick: () => viewEvent(),
  ),
)
```

## Toast Data Factory Methods

Create toast data with semantic colors:

```dart
// Success toast
final successToast = ToastData.success(
  title: 'Saved!',
  description: 'Your changes have been saved.',
);

// Error toast
final errorToast = ToastData.error(
  title: 'Error',
  description: 'Something went wrong.',
);

// Warning toast
final warningToast = ToastData.warning(
  title: 'Warning',
  description: 'This action cannot be undone.',
);

// Info toast
final infoToast = ToastData.info(
  title: 'Info',
  description: 'New features are available.',
);
```

## DToaster Container

Use `DToaster` to manage multiple toasts:

```dart
class MyApp extends StatefulComponent {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<ToastData> toasts = [];

  void showToast(ToastData toast) {
    setState(() {
      toasts.add(toast);
    });

    // Auto-dismiss after duration
    Future.delayed(Duration(milliseconds: toast.duration ?? 5000), () {
      setState(() {
        toasts.remove(toast);
      });
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      // Your app content
      DButton(
        label: 'Show Success',
        onClick: () => showToast(
          ToastData.success(
            title: 'Success!',
            description: 'Operation completed.',
          ),
        ),
      ),

      // Toast container
      DToaster(
        toasts: toasts,
        onClose: (toast) {
          setState(() {
            toasts.remove(toast);
          });
        },
      ),
    ]);
  }
}
```

## Complete Example

```dart
class NotificationExample extends StatefulComponent {
  @override
  State createState() => _NotificationExampleState();
}

class _NotificationExampleState extends State<NotificationExample> {
  final List<ToastData> toasts = [];

  void addToast({
    required String title,
    String? description,
    required DColor color,
  }) {
    final toast = ToastData(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      color: color,
      duration: 5000,
    );

    setState(() => toasts.add(toast));

    Future.delayed(Duration(milliseconds: 5000), () {
      removeToast(toast);
    });
  }

  void removeToast(ToastData toast) {
    setState(() => toasts.remove(toast));
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'space-y-4', [
      h3([text('Notification Demo')]),

      div(classes: 'flex gap-2', [
        DButton(
          label: 'Success',
          color: DColor.success,
          onClick: () => addToast(
            title: 'Success!',
            description: 'Your action was completed.',
            color: DColor.success,
          ),
        ),
        DButton(
          label: 'Error',
          color: DColor.error,
          onClick: () => addToast(
            title: 'Error',
            description: 'Something went wrong.',
            color: DColor.error,
          ),
        ),
        DButton(
          label: 'Warning',
          color: DColor.warning,
          onClick: () => addToast(
            title: 'Warning',
            description: 'Please review this.',
            color: DColor.warning,
          ),
        ),
        DButton(
          label: 'Info',
          color: DColor.info,
          onClick: () => addToast(
            title: 'Info',
            description: 'Here is some information.',
            color: DColor.info,
          ),
        ),
      ]),

      // Toast container positioned at bottom-right
      DToaster(
        toasts: toasts,
        onClose: removeToast,
      ),
    ]);
  }
}
```

## Dark Mode Support

`DToast` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Text remains readable in both modes
- Icons and actions adapt accordingly
- All variants work seamlessly

## API Reference

### DToast

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | Toast title |
| `description` | `String?` | `null` | Toast description |
| `variant` | `DToastVariant` | `soft` | Visual style |
| `color` | `DColor` | `primary` | Color scheme |
| `icon` | `Component?` | `null` | Custom icon (auto-selected if null) |
| `action` | `Component?` | `null` | Action button |
| `closable` | `bool` | `true` | Show close button |
| `onClose` | `VoidCallback?` | `null` | Close callback |

### ToastData

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `id` | `String` | required | Unique identifier |
| `title` | `String?` | `null` | Toast title |
| `description` | `String?` | `null` | Toast description |
| `color` | `DColor` | `primary` | Color scheme |
| `duration` | `int?` | `5000` | Auto-dismiss duration (ms) |

### DToaster

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `toasts` | `List<ToastData>` | required | Active toasts |
| `onClose` | `void Function(ToastData)?` | `null` | Toast close callback |
