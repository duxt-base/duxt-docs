---
title: Error
description: A component for displaying error states and error messages.
layout: ui-layout
order: 43
---

# Error

The `DError` component provides styled error state displays for handling errors gracefully in your application.

## Basic Usage

```dart
DError(
  title: 'Something went wrong',
  description: 'Please try again later.',
)
```

## With Retry

```dart
DError(
  title: 'Failed to load data',
  description: 'An error occurred while fetching your data.',
  onRetry: () => fetchData(),
)
```

## Severity Levels

### Warning

```dart
DError(
  severity: DErrorSeverity.warning,
  title: 'Connection unstable',
  description: 'Your internet connection appears to be slow.',
)
```

### Error (Default)

```dart
DError(
  severity: DErrorSeverity.error,
  title: 'Something went wrong',
  description: 'An unexpected error occurred.',
)
```

### Fatal

```dart
DError(
  severity: DErrorSeverity.fatal,
  title: 'Critical error',
  description: 'The application encountered a fatal error.',
)
```

## With Error Code

```dart
DError(
  title: 'Request failed',
  description: 'The server returned an error response.',
  errorCode: 'ERR_500',
  onRetry: () => retry(),
)
```

## Custom Icon

```dart
DError(
  icon: '🔒',
  title: 'Access denied',
  description: 'You don\'t have permission to view this resource.',
)
```

## With Icon Component

```dart
DError(
  iconComponent: DIcon(name: 'wifi-off', size: 48, classes: 'text-red-500'),
  title: 'No connection',
  description: 'Please check your internet connection.',
  onRetry: () => checkConnection(),
)
```

## With Custom Action

```dart
DError(
  title: 'Session expired',
  description: 'Your session has expired. Please log in again.',
  action: DButton(
    label: 'Log In',
    onClick: () => navigateToLogin(),
  ),
)
```

## Sizes

```dart
DError(size: DSize.xs, title: 'Error')
DError(size: DSize.sm, title: 'Error')
DError(size: DSize.md, title: 'Error')  // Default
DError(size: DSize.lg, title: 'Error')
DError(size: DSize.xl, title: 'Error')
```

## Without Padding

```dart
DError(
  padded: false,
  title: 'Error',
  description: 'Something went wrong.',
)
```

## Preset Error States

### 404 Error

```dart
DError404(
  action: DButton(
    label: 'Go Home',
    onClick: () => navigateToHome(),
  ),
)
```

### 500 Error

```dart
DError500(
  onRetry: () => reload(),
  action: DButton(
    label: 'Contact Support',
    variant: DButtonVariant.outline,
    onClick: () => contactSupport(),
  ),
)
```

### Network Error

```dart
DErrorNetwork(
  onRetry: () => retryConnection(),
)
```

## Error Boundary Pattern

```dart
class ErrorBoundary extends StatefulComponent {
  final List<Component> children;

  ErrorBoundary({required this.children});

  @override
  State createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  String? error;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (error != null) {
      yield DError(
        title: 'Component Error',
        description: error,
        onRetry: () => setState(() => error = null),
      );
    } else {
      yield* component.children;
    }
  }
}
```

## In Data Loading

```dart
class DataView extends StatefulComponent {
  @override
  State createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  bool loading = true;
  String? error;
  List<Item>? data;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      data = await api.fetchItems();
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (loading) {
      yield div(classes: 'py-12', [
        DSpinner(size: DSize.lg),
      ]);
    } else if (error != null) {
      yield DError(
        title: 'Failed to load items',
        description: error,
        onRetry: loadData,
      );
    } else if (data!.isEmpty) {
      yield DEmpty(
        title: 'No items',
        description: 'Add some items to get started.',
      );
    } else {
      yield itemList(data!);
    }
  }
}
```

## Dark Mode Support

`DError` automatically adapts to dark mode with appropriate colors for different severity levels.

## API Reference

### DError

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `icon` | `String?` | `null` | Emoji or text icon |
| `iconComponent` | `Component?` | `null` | Custom icon component |
| `title` | `String?` | `null` | Error title |
| `description` | `String?` | `null` | Error description |
| `errorCode` | `String?` | `null` | Error code to display |
| `action` | `Component?` | `null` | Custom action button |
| `children` | `List<Component>` | `[]` | Custom content |
| `size` | `DSize` | `md` | Component size |
| `severity` | `DErrorSeverity` | `error` | Severity level |
| `padded` | `bool` | `true` | Add padding |
| `onRetry` | `VoidCallback?` | `null` | Retry callback |

### DErrorSeverity

| Value | Description |
|-------|-------------|
| `warning` | Non-critical issue (yellow) |
| `error` | Standard error (red) |
| `fatal` | Critical error (dark red) |

### Preset Components

| Component | Description |
|-----------|-------------|
| `DError404` | Page not found error |
| `DError500` | Server error |
| `DErrorNetwork` | Network connection error |
