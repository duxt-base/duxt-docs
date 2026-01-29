---
title: Textarea
description: A multi-line text input for longer form content.
layout: ui-layout
order: 16
---

# Textarea

The `DTextarea` component provides a multi-line text input field for longer content like descriptions, comments, and messages.

## Basic Usage

```dart
DTextarea(
  label: 'Description',
  placeholder: 'Enter a description...',
)
```

## With Rows

Control the visible height:

```dart
DTextarea(
  label: 'Message',
  rows: 5,  // Default is 3
)
```

## Auto Resize

Automatically grow with content:

```dart
DTextarea(
  label: 'Notes',
  autoresize: true,
)
```

## Variants

### Outline (Default)

```dart
DTextarea(
  label: 'Description',
  variant: DInputVariant.outline,
)
```

### Soft

```dart
DTextarea(
  label: 'Description',
  variant: DInputVariant.soft,
)
```

### Subtle

```dart
DTextarea(
  label: 'Description',
  variant: DInputVariant.subtle,
)
```

### Ghost

```dart
DTextarea(
  label: 'Description',
  variant: DInputVariant.ghost,
)
```

## Sizes

```dart
DTextarea(label: 'XS', size: DSize.xs)
DTextarea(label: 'SM', size: DSize.sm)
DTextarea(label: 'MD', size: DSize.md)  // Default
DTextarea(label: 'LG', size: DSize.lg)
DTextarea(label: 'XL', size: DSize.xl)
```

## States

### Disabled

```dart
DTextarea(
  label: 'Description',
  value: 'This content cannot be edited.',
  disabled: true,
)
```

### Read-only

```dart
DTextarea(
  label: 'Terms',
  value: 'Read-only content...',
  readonly: true,
)
```

### Required

```dart
DTextarea(
  label: 'Description',
  required: true,
)
```

## Validation

### Error State

```dart
DTextarea(
  label: 'Description',
  error: 'Description must be at least 20 characters.',
)
```

### With Hint

```dart
DTextarea(
  label: 'Bio',
  hint: 'Tell us about yourself (max 500 characters)',
)
```

## Character Counter

```dart
class TextareaWithCounter extends StatefulComponent {
  @override
  State createState() => _TextareaWithCounterState();
}

class _TextareaWithCounterState extends State<TextareaWithCounter> {
  String value = '';
  final maxLength = 500;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'space-y-1', [
      DTextarea(
        label: 'Bio',
        value: value,
        onInput: (v) => setState(() => value = v),
        error: value.length > maxLength
            ? 'Exceeds maximum length'
            : null,
      ),
      div(classes: 'flex justify-end', [
        span(
          classes: value.length > maxLength
              ? 'text-sm text-error-500'
              : 'text-sm text-gray-500',
          [text('${value.length} / $maxLength')],
        ),
      ]),
    ]);
  }
}
```

## Complete Form Example

```dart
DCard(
  header: [
    h3([text('Leave a Review')]),
  ],
  body: [
    div(classes: 'space-y-4', [
      DInput(
        label: 'Title',
        placeholder: 'Summarize your experience',
      ),
      DTextarea(
        label: 'Review',
        placeholder: 'Tell us what you think...',
        rows: 5,
        hint: 'Be specific about what you liked or disliked',
      ),
      div(classes: 'flex gap-2', [
        DButton(
          label: 'Cancel',
          variant: DButtonVariant.ghost,
        ),
        DButton(
          label: 'Submit Review',
        ),
      ]),
    ]),
  ],
)
```

## Dark Mode Support

`DTextarea` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Border colors are optimized for dark backgrounds
- Placeholder text remains readable
- Focus states are visible in both modes

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Input label |
| `placeholder` | `String?` | `null` | Placeholder text |
| `value` | `String?` | `null` | Current value |
| `variant` | `DInputVariant` | `outline` | Visual style |
| `size` | `DSize` | `md` | Input size |
| `rows` | `int` | `3` | Visible rows |
| `autoresize` | `bool` | `false` | Auto-grow with content |
| `disabled` | `bool` | `false` | Disable input |
| `readonly` | `bool` | `false` | Make read-only |
| `required` | `bool` | `false` | Mark as required |
| `error` | `String?` | `null` | Error message |
| `hint` | `String?` | `null` | Hint text |
| `onInput` | `ValueChanged<String>?` | `null` | Input callback |
