---
title: Spinner
description: Loading indicators for asynchronous operations.
layout: ui-layout
order: 21
---

# Spinner

The `DSpinner` and `DLoading` components provide visual feedback during asynchronous operations.

## Spinner

### Basic Usage

```dart
DSpinner()
```

### Sizes

```dart
DSpinner(size: DSize.xs)  // 16px
DSpinner(size: DSize.sm)  // 20px
DSpinner(size: DSize.md)  // 24px (default)
DSpinner(size: DSize.lg)  // 32px
```

### Custom Color

```dart
DSpinner(color: 'text-primary-600')
DSpinner(color: 'text-success-500')
DSpinner(color: 'text-white')  // For dark backgrounds
```

### In Button

```dart
DButton(
  label: 'Submitting...',
  loading: true,  // Automatically shows spinner
)

// Or manual
DButton(
  disabled: loading,
  children: [
    if (loading) DSpinner(size: DSize.sm, color: 'text-white'),
    span([text(loading ? 'Saving...' : 'Save')]),
  ],
)
```

## Loading Overlay

### Basic Usage

```dart
DLoading(
  loading: isLoading,
  child: [
    // Content that gets covered by loading overlay
    DCard(body: [...]),
  ],
)
```

### With Message

```dart
DLoading(
  loading: isLoading,
  message: 'Loading data...',
  child: [
    myContent,
  ],
)
```

### Full Page Loading

```dart
if (pageLoading)
  div(classes: 'fixed inset-0 flex items-center justify-center bg-white/80 dark:bg-gray-900/80 z-50', [
    div(classes: 'text-center', [
      DSpinner(size: DSize.lg),
      p(classes: 'mt-4 text-gray-500', [text('Loading...')]),
    ]),
  ])
```

## Loading States Example

```dart
class DataFetchExample extends StatefulComponent {
  @override
  State createState() => _DataFetchExampleState();
}

class _DataFetchExampleState extends State<DataFetchExample> {
  bool loading = false;
  List<User>? users;
  String? error;

  Future<void> fetchUsers() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      users = await api.getUsers();
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      header: [
        div(classes: 'flex items-center justify-between', [
          h3([text('Users')]),
          DButton(
            label: 'Refresh',
            leadingIcon: DIcon(name: 'refresh-cw'),
            loading: loading,
            onClick: fetchUsers,
          ),
        ]),
      ],
      body: [
        if (loading)
          div(classes: 'py-8 text-center', [
            DSpinner(size: DSize.lg),
            p(classes: 'mt-4 text-gray-500', [text('Loading users...')]),
          ])
        else if (error != null)
          DAlert(
            title: 'Error',
            description: error!,
            color: DColor.error,
          )
        else if (users != null)
          DTable<User>(
            columns: userColumns,
            data: users!,
          )
        else
          div(classes: 'py-8 text-center text-gray-500', [
            text('Click Refresh to load users'),
          ]),
      ],
    );
  }
}
```

## Skeleton Loading

For a better UX, consider using skeleton loading:

```dart
if (loading)
  div(classes: 'space-y-3', [
    DSkeleton(height: 20, width: '60%'),
    DSkeleton(height: 16),
    DSkeleton(height: 16),
    DSkeleton(height: 16, width: '80%'),
  ])
else
  actualContent
```

## Button Loading States

```dart
class FormSubmit extends StatefulComponent {
  @override
  State createState() => _FormSubmitState();
}

class _FormSubmitState extends State<FormSubmit> {
  bool submitting = false;

  Future<void> handleSubmit() async {
    setState(() => submitting = true);
    try {
      await submitForm();
    } finally {
      setState(() => submitting = false);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'flex gap-2', [
      DButton(
        label: 'Cancel',
        variant: DButtonVariant.ghost,
        disabled: submitting,
      ),
      DButton(
        label: submitting ? 'Saving...' : 'Save',
        loading: submitting,
        onClick: handleSubmit,
      ),
    ]);
  }
}
```

## Inline Loading

```dart
div(classes: 'flex items-center gap-2', [
  if (checking)
    DSpinner(size: DSize.sm),
  span([
    text(checking ? 'Checking availability...' : 'Username available'),
  ]),
  if (!checking && available)
    DIcon(name: 'check', classes: 'text-success-500'),
])
```

## Dark Mode Support

`DSpinner` and `DLoading` automatically adapt to dark mode:
- Spinner colors remain visible against dark backgrounds
- Loading overlays use appropriate backdrop colors
- Text colors adjust for readability

## API Reference

### DSpinner

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `size` | `DSize` | `md` | Spinner size |
| `color` | `String?` | `null` | Custom color class |

### DLoading

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `loading` | `bool` | `false` | Show loading overlay |
| `message` | `String?` | `null` | Loading message |
| `child` | `List<Component>` | required | Content to cover |
