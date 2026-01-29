---
title: Input
description: A text input field for forms and user input with validation support.
layout: ui-layout
order: 3
---

# Input

The `DInput` component is a versatile text input field that supports multiple types, variants, sizes, and validation states.

## Basic Usage

```dart
DInput(
  label: 'Email',
  placeholder: 'Enter your email',
)
```

## Input Types

```dart
DInput(label: 'Name', type: 'text')
DInput(label: 'Email', type: 'email')
DInput(label: 'Password', type: 'password')
DInput(label: 'Age', type: 'number')
DInput(label: 'Website', type: 'url')
DInput(label: 'Search', type: 'search')
DInput(label: 'Phone', type: 'tel')
```

## Variants

### Outline (Default)

```dart
DInput(
  label: 'Email',
  variant: DInputVariant.outline,
)
```

### Filled

```dart
DInput(
  label: 'Email',
  variant: DInputVariant.filled,
)
```

### Soft

```dart
DInput(
  label: 'Email',
  variant: DInputVariant.soft,
)
```

### Ghost

```dart
DInput(
  label: 'Email',
  variant: DInputVariant.ghost,
)
```

## Sizes

```dart
DInput(label: 'XS', size: DSize.xs)
DInput(label: 'SM', size: DSize.sm)
DInput(label: 'MD', size: DSize.md)
DInput(label: 'LG', size: DSize.lg)
DInput(label: 'XL', size: DSize.xl)
```

## Colors

```dart
DInput(label: 'Primary', color: DColor.primary)
DInput(label: 'Secondary', color: DColor.secondary)
DInput(label: 'Success', color: DColor.success)
DInput(label: 'Warning', color: DColor.warning)
DInput(label: 'Error', color: DColor.error)
DInput(label: 'Neutral', color: DColor.neutral)
```

## States

### Disabled

```dart
DInput(
  label: 'Disabled Input',
  disabled: true,
  value: 'Cannot edit this',
)
```

### Read-only

```dart
DInput(
  label: 'Read Only',
  readonly: true,
  value: 'View only content',
)
```

### Required

```dart
DInput(
  label: 'Required Field',
  required: true,
)
```

## Icons

### Leading Icon

```dart
DInput(
  label: 'Email',
  leadingIcon: Icons.email,
)
```

### Trailing Icon

```dart
DInput(
  label: 'Search',
  trailingIcon: Icons.search,
)
```

### Both Icons

```dart
DInput(
  label: 'Password',
  type: 'password',
  leadingIcon: Icons.lock,
  trailingIcon: Icons.eyeOff,
)
```

## Validation

### Error State

```dart
DInput(
  label: 'Email',
  error: true,
  errorMessage: 'Please enter a valid email address',
  value: 'invalid-email',
)
```

### Success State

```dart
DInput(
  label: 'Username',
  success: true,
  helperText: 'Username is available',
  value: 'johndoe',
)
```

### Helper Text

```dart
DInput(
  label: 'Password',
  type: 'password',
  helperText: 'Must be at least 8 characters',
)
```

## Form Integration

```dart
DInput(
  label: 'Email',
  onChanged: (value) {
    print('Input changed: $value');
  },
)
```

Complete form example:

```dart
class LoginForm extends StatefulComponent {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = '';
  String _password = '';
  bool _loading = false;

  void _handleSubmit() {
    setState(() => _loading = true);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      body: [
        div(classes: 'space-y-4', [
          DInput(
            label: 'Email',
            type: 'email',
            value: _email,
            onChanged: (v) => setState(() => _email = v),
          ),
          DInput(
            label: 'Password',
            type: 'password',
            value: _password,
            onChanged: (v) => setState(() => _password = v),
          ),
          DButton(
            label: 'Sign In',
            loading: _loading,
            block: true,
            onPressed: _handleSubmit,
          ),
        ]),
      ],
    );
  }
}
```

## Dark Mode Support

`DInput` automatically adapts to dark mode:
- Background colors adjust for visibility
- Border colors soften in dark mode
- Focus rings remain visible
- Error/success states stay accessible

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Input label text |
| `placeholder` | `String?` | `null` | Placeholder text |
| `type` | `String` | `text` | Input type |
| `variant` | `DInputVariant` | `outline` | Visual style |
| `color` | `DColor` | `primary` | Color scheme |
| `size` | `DSize` | `md` | Input size |
| `value` | `String?` | `null` | Input value |
| `disabled` | `bool` | `false` | Disable the input |
| `readonly` | `bool` | `false` | Make read-only |
| `required` | `bool` | `false` | Mark as required |
| `error` | `bool` | `false` | Show error state |
| `errorMessage` | `String?` | `null` | Error message |
| `success` | `bool` | `false` | Show success state |
| `helperText` | `String?` | `null` | Helper text |
| `leadingIcon` | `IconData?` | `null` | Icon at start |
| `trailingIcon` | `IconData?` | `null` | Icon at end |
| `onChanged` | `ValueChanged<String>?` | `null` | Value change handler |
