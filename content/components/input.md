---
title: Input
description: A text input field for forms and user input with validation support.
layout: docs
order: 3
---

# Input

The `UInput` component is a versatile text input field that supports multiple types, variants, sizes, and validation states.

## Basic Usage

```dart
UInput(
  label: 'Email',
  placeholder: 'Enter your email',
)
```

## Input Types

Standard HTML input types are supported:

```dart
// Text input (default)
UInput(label: 'Name', type: 'text')

// Email input
UInput(label: 'Email', type: 'email')

// Password input
UInput(label: 'Password', type: 'password')

// Number input
UInput(label: 'Age', type: 'number')

// URL input
UInput(label: 'Website', type: 'url')

// Search input
UInput(label: 'Search', type: 'search')

// Tel input
UInput(label: 'Phone', type: 'tel')
```

## Variants

### Outline (Default)

Standard bordered input:

```dart
UInput(
  label: 'Email',
  variant: UInputVariant.outline,
)
```

### Filled

Input with background fill:

```dart
UInput(
  label: 'Email',
  variant: UInputVariant.filled,
)
```

### Soft

Subtle background without border:

```dart
UInput(
  label: 'Email',
  variant: UInputVariant.soft,
)
```

### Ghost

Minimal styling:

```dart
UInput(
  label: 'Email',
  variant: UInputVariant.ghost,
)
```

## Sizes

```dart
// Extra small
UInput(label: 'XS', size: USize.xs)

// Small
UInput(label: 'SM', size: USize.sm)

// Medium (default)
UInput(label: 'MD', size: USize.md)

// Large
UInput(label: 'LG', size: USize.lg)

// Extra large
UInput(label: 'XL', size: USize.xl)
```

## Colors

Apply semantic colors to inputs:

```dart
// Primary (default)
UInput(label: 'Primary', color: UColor.primary)

// Secondary
UInput(label: 'Secondary', color: UColor.secondary)

// Success
UInput(label: 'Success', color: UColor.success)

// Warning
UInput(label: 'Warning', color: UColor.warning)

// Error
UInput(label: 'Error', color: UColor.error)

// Neutral
UInput(label: 'Neutral', color: UColor.neutral)
```

## States

### Disabled

```dart
UInput(
  label: 'Disabled Input',
  disabled: true,
  value: 'Cannot edit this',
)
```

### Read-only

```dart
UInput(
  label: 'Read Only',
  readonly: true,
  value: 'View only content',
)
```

### Required

```dart
UInput(
  label: 'Required Field',
  required: true,
)
```

## Icons

Add visual context with icons:

### Leading Icon

```dart
UInput(
  label: 'Email',
  leadingIcon: Icons.email,
)
```

### Trailing Icon

```dart
UInput(
  label: 'Search',
  trailingIcon: Icons.search,
)
```

### Both Icons

```dart
UInput(
  label: 'Password',
  type: 'password',
  leadingIcon: Icons.lock,
  trailingIcon: Icons.eyeOff,
)
```

## Validation

Display validation feedback:

### Error State

```dart
UInput(
  label: 'Email',
  error: true,
  errorMessage: 'Please enter a valid email address',
  value: 'invalid-email',
)
```

### Success State

```dart
UInput(
  label: 'Username',
  success: true,
  helperText: 'Username is available',
  value: 'johndoe',
)
```

### Helper Text

```dart
UInput(
  label: 'Password',
  type: 'password',
  helperText: 'Must be at least 8 characters',
)
```

## Form Integration

Handle value changes:

```dart
UInput(
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
    // Validate and submit
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield UCard(
      body: [
        div(classes: 'space-y-4', [
          UInput(
            label: 'Email',
            type: 'email',
            value: _email,
            onChanged: (v) => setState(() => _email = v),
          ),
          UInput(
            label: 'Password',
            type: 'password',
            value: _password,
            onChanged: (v) => setState(() => _password = v),
          ),
          UButton(
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

`UInput` automatically adapts to dark mode:
- Background colors adjust for visibility
- Border colors soften in dark mode
- Focus rings remain visible
- Error/success states stay accessible

No additional configuration needed when using Duxt UI's theme system.

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Input label text |
| `placeholder` | `String?` | `null` | Placeholder text |
| `type` | `String` | `text` | Input type (text, email, password, etc.) |
| `variant` | `UInputVariant` | `outline` | Visual style variant |
| `color` | `UColor` | `primary` | Color scheme |
| `size` | `USize` | `md` | Input size |
| `value` | `String?` | `null` | Input value |
| `disabled` | `bool` | `false` | Disable the input |
| `readonly` | `bool` | `false` | Make input read-only |
| `required` | `bool` | `false` | Mark as required |
| `error` | `bool` | `false` | Show error state |
| `errorMessage` | `String?` | `null` | Error message text |
| `success` | `bool` | `false` | Show success state |
| `helperText` | `String?` | `null` | Helper text below input |
| `leadingIcon` | `IconData?` | `null` | Icon at start of input |
| `trailingIcon` | `IconData?` | `null` | Icon at end of input |
| `onChanged` | `ValueChanged<String>?` | `null` | Value change handler |
