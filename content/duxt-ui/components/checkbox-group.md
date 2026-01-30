---
title: Checkbox Group
description: A group of checkboxes for selecting multiple options from a list.
layout: ui-layout
order: 33
---

# Checkbox Group

The `DCheckboxGroup` component provides a convenient way to manage multiple related checkboxes with array-based value handling.

## Basic Usage

```
DCheckboxGroup<String>(
  label: 'Interests',
  options: [
    DCheckboxOption(value: 'music', label: 'Music'),
    DCheckboxOption(value: 'sports', label: 'Sports'),
    DCheckboxOption(value: 'reading', label: 'Reading'),
    DCheckboxOption(value: 'travel', label: 'Travel'),
  ],
  onChange: (values) => print('Selected: $values'),
)
```

## Controlled State

```
class CheckboxGroupExample extends StatefulComponent {
  @override
  State createState() => _CheckboxGroupExampleState();
}

class _CheckboxGroupExampleState extends State<CheckboxGroupExample> {
  List<String> selected = ['music', 'travel'];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCheckboxGroup<String>(
      label: 'Interests',
      value: selected,
      options: [
        DCheckboxOption(value: 'music', label: 'Music'),
        DCheckboxOption(value: 'sports', label: 'Sports'),
        DCheckboxOption(value: 'reading', label: 'Reading'),
        DCheckboxOption(value: 'travel', label: 'Travel'),
      ],
      onChange: (values) => setState(() => selected = values),
    );

    yield p([text('Selected: ${selected.join(', ')}')]);
  }
}
```

## Sizes

```
DCheckboxGroup<String>(size: DCheckboxSize.xs, ...)
DCheckboxGroup<String>(size: DCheckboxSize.sm, ...)
DCheckboxGroup<String>(size: DCheckboxSize.md, ...)  // Default
DCheckboxGroup<String>(size: DCheckboxSize.lg, ...)
DCheckboxGroup<String>(size: DCheckboxSize.xl, ...)
```

## Colors

```
DCheckboxGroup<String>(color: DCheckboxColor.primary, ...)
DCheckboxGroup<String>(color: DCheckboxColor.gray, ...)
DCheckboxGroup<String>(color: DCheckboxColor.success, ...)
DCheckboxGroup<String>(color: DCheckboxColor.warning, ...)
DCheckboxGroup<String>(color: DCheckboxColor.error, ...)
```

## Orientation

### Vertical (Default)

```
DCheckboxGroup<String>(
  orientation: DCheckboxGroupOrientation.vertical,
  options: options,
  onChange: (values) => {},
)
```

### Horizontal

```
DCheckboxGroup<String>(
  orientation: DCheckboxGroupOrientation.horizontal,
  options: options,
  onChange: (values) => {},
)
```

## With Descriptions

```
DCheckboxGroup<String>(
  label: 'Notification preferences',
  options: [
    DCheckboxOption(
      value: 'email',
      label: 'Email notifications',
      description: 'Receive updates via email',
    ),
    DCheckboxOption(
      value: 'push',
      label: 'Push notifications',
      description: 'Receive push notifications on your device',
    ),
    DCheckboxOption(
      value: 'sms',
      label: 'SMS notifications',
      description: 'Receive text messages for urgent alerts',
    ),
  ],
  onChange: (values) => {},
)
```

## Disabled Options

```
DCheckboxGroup<String>(
  label: 'Features',
  options: [
    DCheckboxOption(value: 'basic', label: 'Basic features'),
    DCheckboxOption(value: 'advanced', label: 'Advanced features'),
    DCheckboxOption(
      value: 'enterprise',
      label: 'Enterprise features',
      description: 'Upgrade to unlock',
      disabled: true,
    ),
  ],
  onChange: (values) => {},
)
```

## Disabled Group

```
DCheckboxGroup<String>(
  label: 'Features',
  disabled: true,
  value: ['basic', 'advanced'],
  options: options,
)
```

## Required

```
DCheckboxGroup<String>(
  label: 'Terms',
  required: true,
  options: [
    DCheckboxOption(
      value: 'terms',
      label: 'I accept the terms and conditions',
    ),
    DCheckboxOption(
      value: 'privacy',
      label: 'I accept the privacy policy',
    ),
  ],
  onChange: (values) => {},
)
```

## With Error

```
DCheckboxGroup<String>(
  label: 'Select at least one option',
  error: 'Please select at least one interest',
  options: options,
  onChange: (values) => {},
)
```

## With Hint

```
DCheckboxGroup<String>(
  label: 'Interests',
  hint: 'Select all that apply',
  options: options,
  onChange: (values) => {},
)
```

## Form Name

For form submission with array values:

```
DCheckboxGroup<String>(
  name: 'interests',  // Submits as interests[]
  options: options,
  onChange: (values) => {},
)
```

## Permissions Example

```
DCheckboxGroup<String>(
  label: 'User permissions',
  value: userPermissions,
  options: [
    DCheckboxOption(
      value: 'read',
      label: 'Read',
      description: 'View content',
    ),
    DCheckboxOption(
      value: 'write',
      label: 'Write',
      description: 'Create and edit content',
    ),
    DCheckboxOption(
      value: 'delete',
      label: 'Delete',
      description: 'Remove content',
    ),
    DCheckboxOption(
      value: 'admin',
      label: 'Admin',
      description: 'Full administrative access',
    ),
  ],
  color: DCheckboxColor.success,
  onChange: (values) => updatePermissions(values),
)
```

## Filter Example

```
DCard(
  header: [h4([text('Filter by category')])],
  body: [
    DCheckboxGroup<String>(
      value: selectedCategories,
      orientation: DCheckboxGroupOrientation.vertical,
      options: [
        DCheckboxOption(value: 'electronics', label: 'Electronics'),
        DCheckboxOption(value: 'clothing', label: 'Clothing'),
        DCheckboxOption(value: 'home', label: 'Home & Garden'),
        DCheckboxOption(value: 'sports', label: 'Sports'),
        DCheckboxOption(value: 'books', label: 'Books'),
      ],
      onChange: (values) {
        setState(() => selectedCategories = values);
        applyFilters();
      },
    ),
  ],
)
```

## Dark Mode Support

`DCheckboxGroup` automatically adapts to dark mode:
- Checkbox backgrounds adjust for proper contrast
- Labels and descriptions are readable
- Checked state indicators are visible
- Focus rings adapt appropriately

## API Reference

### DCheckboxGroup<T>

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Group label |
| `name` | `String?` | `null` | Form input name |
| `options` | `List<DCheckboxOption<T>>` | required | Checkbox options |
| `value` | `List<T>` | `[]` | Selected values |
| `size` | `DCheckboxSize` | `md` | Checkbox size |
| `color` | `DCheckboxColor` | `primary` | Checked color |
| `orientation` | `DCheckboxGroupOrientation` | `vertical` | Layout direction |
| `disabled` | `bool` | `false` | Disable all options |
| `required` | `bool` | `false` | Mark as required |
| `error` | `String?` | `null` | Error message |
| `hint` | `String?` | `null` | Hint text |
| `onChange` | `ValueChanged<List<T>>?` | `null` | Selection callback |

### DCheckboxOption<T>

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | `T` | required | Option value |
| `label` | `String` | required | Option label |
| `description` | `String?` | `null` | Secondary text |
| `disabled` | `bool` | `false` | Disable this option |
