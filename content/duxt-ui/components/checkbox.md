---
title: Checkbox
description: A control for selecting one or multiple options.
layout: ui-layout
order: 18
---

# Checkbox

The `DCheckbox` component allows users to select one or multiple options from a set.

## Basic Usage

```dart
DCheckbox(
  label: 'Accept terms and conditions',
  onChange: (checked) => print('Checked: $checked'),
)
```

## Controlled State

```dart
class CheckboxExample extends StatefulComponent {
  @override
  State createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool accepted = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCheckbox(
      label: 'I agree to the terms',
      checked: accepted,
      onChange: (checked) => setState(() => accepted = checked),
    );
  }
}
```

## Sizes

```dart
DCheckbox(label: 'XS Checkbox', size: DSize.xs)
DCheckbox(label: 'SM Checkbox', size: DSize.sm)
DCheckbox(label: 'MD Checkbox', size: DSize.md)  // Default
DCheckbox(label: 'LG Checkbox', size: DSize.lg)
DCheckbox(label: 'XL Checkbox', size: DSize.xl)
```

## Colors

```dart
DCheckbox(label: 'Primary', checked: true, color: DColor.primary)
DCheckbox(label: 'Gray', checked: true, color: DColor.neutral)
DCheckbox(label: 'Success', checked: true, color: DColor.success)
DCheckbox(label: 'Warning', checked: true, color: DColor.warning)
DCheckbox(label: 'Error', checked: true, color: DColor.error)
```

## With Description

```dart
DCheckbox(
  label: 'Marketing emails',
  description: 'Receive emails about new products and features',
  onChange: (checked) => {},
)
```

## With Hint

```dart
DCheckbox(
  label: 'Remember me',
  hint: 'Stay logged in for 30 days',
  onChange: (checked) => {},
)
```

## Indeterminate State

For parent checkboxes that have partially selected children:

```dart
DCheckbox(
  label: 'Select all',
  indeterminate: someSelected && !allSelected,
  checked: allSelected,
  onChange: (checked) => toggleAll(checked),
)
```

## Disabled State

```dart
DCheckbox(
  label: 'Disabled option',
  disabled: true,
)

DCheckbox(
  label: 'Disabled checked',
  checked: true,
  disabled: true,
)
```

## Required

```dart
DCheckbox(
  label: 'I accept the privacy policy',
  required: true,
  onChange: (checked) => {},
)
```

## With Error

```dart
DCheckbox(
  label: 'Terms and conditions',
  error: 'You must accept the terms to continue',
  onChange: (checked) => {},
)
```

## Checkbox Group

For multiple related checkboxes:

```dart
class CheckboxGroupExample extends StatefulComponent {
  @override
  State createState() => _CheckboxGroupExampleState();
}

class _CheckboxGroupExampleState extends State<CheckboxGroupExample> {
  Set<String> selected = {'email'};

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'space-y-3', [
      p(classes: 'font-medium', [text('Notifications')]),
      DCheckbox(
        label: 'Email notifications',
        description: 'Receive notifications via email',
        checked: selected.contains('email'),
        onChange: (checked) => toggleOption('email', checked),
      ),
      DCheckbox(
        label: 'Push notifications',
        description: 'Receive push notifications on your device',
        checked: selected.contains('push'),
        onChange: (checked) => toggleOption('push', checked),
      ),
      DCheckbox(
        label: 'SMS notifications',
        description: 'Receive text messages for important updates',
        checked: selected.contains('sms'),
        onChange: (checked) => toggleOption('sms', checked),
      ),
    ]);
  }

  void toggleOption(String option, bool checked) {
    setState(() {
      if (checked) {
        selected.add(option);
      } else {
        selected.remove(option);
      }
    });
  }
}
```

## Select All Pattern

```dart
class SelectAllExample extends StatefulComponent {
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  State createState() => _SelectAllExampleState();
}

class _SelectAllExampleState extends State<SelectAllExample> {
  Set<String> selected = {};

  bool get allSelected => selected.length == component.items.length;
  bool get someSelected => selected.isNotEmpty && !allSelected;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'space-y-2', [
      DCheckbox(
        label: 'Select all',
        checked: allSelected,
        indeterminate: someSelected,
        onChange: (checked) {
          setState(() {
            if (checked) {
              selected = component.items.toSet();
            } else {
              selected.clear();
            }
          });
        },
      ),
      div(classes: 'ml-6 space-y-2', [
        for (final item in component.items)
          DCheckbox(
            label: item,
            checked: selected.contains(item),
            onChange: (checked) {
              setState(() {
                if (checked) {
                  selected.add(item);
                } else {
                  selected.remove(item);
                }
              });
            },
          ),
      ]),
    ]);
  }
}
```

## Form Integration

```dart
DCard(
  header: [h3([text('Newsletter Preferences')])],
  body: [
    div(classes: 'space-y-4', [
      DInput(label: 'Email', type: InputType.email),
      div(classes: 'space-y-2', [
        p(classes: 'text-sm font-medium', [text('Topics')]),
        DCheckbox(label: 'Product updates'),
        DCheckbox(label: 'Tips and tutorials'),
        DCheckbox(label: 'Community news'),
      ]),
      DCheckbox(
        label: 'I agree to receive marketing emails',
        required: true,
      ),
    ]),
  ],
  footer: [
    DButton(label: 'Subscribe', block: true),
  ],
)
```

## Dark Mode Support

`DCheckbox` automatically adapts to dark mode:
- Checkbox backgrounds adjust for proper contrast
- Check marks remain visible in both modes
- Labels and descriptions are readable
- Focus rings adapt appropriately

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Checkbox label |
| `description` | `String?` | `null` | Secondary text |
| `hint` | `String?` | `null` | Hint text |
| `error` | `String?` | `null` | Error message |
| `checked` | `bool` | `false` | Checked state |
| `indeterminate` | `bool` | `false` | Partial selection |
| `size` | `DSize` | `md` | Checkbox size |
| `color` | `DColor` | `primary` | Checked color |
| `disabled` | `bool` | `false` | Disable checkbox |
| `required` | `bool` | `false` | Mark as required |
| `onChange` | `ValueChanged<bool>?` | `null` | Change callback |
