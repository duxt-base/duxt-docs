---
title: Input
description: A text input field for forms and user input with validation support.
layout: ui-layout
order: 3
---

# Input

The `DInput` component is a versatile text input field that supports multiple types, variants, sizes, and validation states.

## Basic Usage

```
DInput(
  label: 'Email',
  placeholder: 'Enter your email',
)
```

## Input Types

```
DInput(label: 'Name', type: InputType.text)
DInput(label: 'Email', type: InputType.email)
DInput(label: 'Password', type: InputType.password)
DInput(label: 'Age', type: InputType.number)
DInput(label: 'Website', type: InputType.url)
DInput(label: 'Search', type: InputType.search)
DInput(label: 'Phone', type: InputType.tel)
```

## Variants

### Outline (Default)

```
DInput(
  label: 'Email',
  variant: DInputVariant.outline,
)
```

### Soft

```
DInput(
  label: 'Email',
  variant: DInputVariant.soft,
)
```

### Subtle

```
DInput(
  label: 'Email',
  variant: DInputVariant.subtle,
)
```

### Ghost

```
DInput(
  label: 'Email',
  variant: DInputVariant.ghost,
)
```

### None

```
DInput(
  label: 'Email',
  variant: DInputVariant.none,
)
```

## Sizes

```
DInput(label: 'XS', size: DInputSize.xs)
DInput(label: 'SM', size: DInputSize.sm)
DInput(label: 'MD', size: DInputSize.md)
DInput(label: 'LG', size: DInputSize.lg)
DInput(label: 'XL', size: DInputSize.xl)
```

## States

### Disabled

```
DInput(
  label: 'Disabled Input',
  disabled: true,
  value: 'Cannot edit this',
)
```

### Read-only

```
DInput(
  label: 'Read Only',
  readonly: true,
  value: 'View only content',
)
```

### Required

```
DInput(
  label: 'Required Field',
  required: true,
)
```

### Loading

```
DInput(
  label: 'Loading',
  loading: true,
)
```

## Icons

### Leading Icon

```
DInput(
  label: 'Email',
  leadingIcon: DIcon(name: 'mail'),
)
```

### Trailing Icon

```
DInput(
  label: 'Search',
  trailingIcon: DIcon(name: 'search'),
)
```

### Both Icons

```
DInput(
  label: 'Password',
  type: InputType.password,
  leadingIcon: DIcon(name: 'lock'),
  trailingIcon: DIcon(name: 'eye-off'),
)
```

## Validation

### Error State

```
DInput(
  label: 'Email',
  error: 'Please enter a valid email address',
  value: 'invalid-email',
)
```

### Hint Text

```
DInput(
  label: 'Password',
  type: InputType.password,
  hint: 'Must be at least 8 characters',
)
```

## Form Integration

```
DInput(
  label: 'Email',
  onInput: (value) {
    print('Input changed: $value');
  },
)
```

Complete form example:

```
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
      children: [
        div(classes: 'space-y-4', [
          DInput(
            label: 'Email',
            type: InputType.email,
            value: _email,
            onInput: (v) => setState(() => _email = v),
          ),
          DInput(
            label: 'Password',
            type: InputType.password,
            value: _password,
            onInput: (v) => setState(() => _password = v),
          ),
          DButton(
            label: 'Sign In',
            loading: _loading,
            block: true,
            onClick: _handleSubmit,
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
- Error states stay accessible

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Input label text |
| `placeholder` | `String?` | `null` | Placeholder text |
| `name` | `String?` | `null` | Input name attribute |
| `type` | `InputType` | `text` | Input type |
| `variant` | `DInputVariant` | `outline` | Visual style |
| `size` | `DInputSize` | `md` | Input size |
| `value` | `String?` | `null` | Input value |
| `hint` | `String?` | `null` | Helper/hint text |
| `error` | `String?` | `null` | Error message (shows error state) |
| `highlightColor` | `DInputColor?` | `null` | Highlight color |
| `disabled` | `bool` | `false` | Disable the input |
| `readonly` | `bool` | `false` | Make read-only |
| `required` | `bool` | `false` | Mark as required |
| `loading` | `bool` | `false` | Show loading state |
| `leadingIcon` | `Component?` | `null` | Icon at start |
| `trailingIcon` | `Component?` | `null` | Icon at end |
| `onInput` | `ValueChanged<String>?` | `null` | Value change handler |
