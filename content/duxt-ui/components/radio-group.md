---
title: Radio Group
description: A group of radio buttons for selecting a single option from a list.
layout: ui-layout
order: 32
---

# Radio Group

The `DRadioGroup` component allows users to select a single option from a list of choices.

## Basic Usage

```dart
DRadioGroup<String>(
  name: 'plan',
  label: 'Select a plan',
  options: [
    DRadioOption(value: 'free', label: 'Free'),
    DRadioOption(value: 'pro', label: 'Pro'),
    DRadioOption(value: 'enterprise', label: 'Enterprise'),
  ],
  onChange: (value) => print('Selected: $value'),
)
```

## Controlled State

```dart
class RadioGroupExample extends StatefulComponent {
  @override
  State createState() => _RadioGroupExampleState();
}

class _RadioGroupExampleState extends State<RadioGroupExample> {
  String? selected = 'pro';

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DRadioGroup<String>(
      name: 'plan',
      label: 'Select a plan',
      value: selected,
      options: [
        DRadioOption(value: 'free', label: 'Free'),
        DRadioOption(value: 'pro', label: 'Pro'),
        DRadioOption(value: 'enterprise', label: 'Enterprise'),
      ],
      onChange: (value) => setState(() => selected = value),
    );
  }
}
```

## Sizes

```dart
DRadioGroup<String>(
  size: DRadioGroupSize.xs,
  name: 'size-xs',
  options: options,
)

DRadioGroup<String>(
  size: DRadioGroupSize.sm,
  name: 'size-sm',
  options: options,
)

DRadioGroup<String>(
  size: DRadioGroupSize.md,  // Default
  name: 'size-md',
  options: options,
)

DRadioGroup<String>(
  size: DRadioGroupSize.lg,
  name: 'size-lg',
  options: options,
)

DRadioGroup<String>(
  size: DRadioGroupSize.xl,
  name: 'size-xl',
  options: options,
)
```

## Colors

```dart
DRadioGroup<String>(color: DRadioGroupColor.primary, ...)
DRadioGroup<String>(color: DRadioGroupColor.gray, ...)
DRadioGroup<String>(color: DRadioGroupColor.success, ...)
DRadioGroup<String>(color: DRadioGroupColor.warning, ...)
DRadioGroup<String>(color: DRadioGroupColor.error, ...)
```

## Orientation

### Vertical (Default)

```dart
DRadioGroup<String>(
  orientation: DRadioGroupOrientation.vertical,
  name: 'vertical',
  options: options,
)
```

### Horizontal

```dart
DRadioGroup<String>(
  orientation: DRadioGroupOrientation.horizontal,
  name: 'horizontal',
  options: options,
)
```

## With Descriptions

```dart
DRadioGroup<String>(
  name: 'plan',
  label: 'Select a plan',
  options: [
    DRadioOption(
      value: 'free',
      label: 'Free',
      description: 'Best for trying out the service',
    ),
    DRadioOption(
      value: 'pro',
      label: 'Pro',
      description: 'Perfect for small teams',
    ),
    DRadioOption(
      value: 'enterprise',
      label: 'Enterprise',
      description: 'For large organizations',
    ),
  ],
  onChange: (value) => {},
)
```

## Disabled Options

```dart
DRadioGroup<String>(
  name: 'plan',
  options: [
    DRadioOption(value: 'free', label: 'Free'),
    DRadioOption(value: 'pro', label: 'Pro'),
    DRadioOption(
      value: 'enterprise',
      label: 'Enterprise',
      description: 'Contact sales',
      disabled: true,
    ),
  ],
  onChange: (value) => {},
)
```

## Disabled Group

```dart
DRadioGroup<String>(
  name: 'plan',
  disabled: true,
  value: 'pro',
  options: options,
)
```

## Required

```dart
DRadioGroup<String>(
  name: 'plan',
  label: 'Select a plan',
  required: true,
  options: options,
  onChange: (value) => {},
)
```

## With Error

```dart
DRadioGroup<String>(
  name: 'plan',
  label: 'Select a plan',
  error: 'Please select a plan',
  options: options,
  onChange: (value) => {},
)
```

## With Hint

```dart
DRadioGroup<String>(
  name: 'plan',
  label: 'Select a plan',
  hint: 'You can change this later',
  options: options,
  onChange: (value) => {},
)
```

## Payment Method Example

```dart
DRadioGroup<String>(
  name: 'payment',
  label: 'Payment method',
  value: selectedPayment,
  options: [
    DRadioOption(
      value: 'card',
      label: 'Credit Card',
      description: 'Pay with Visa, Mastercard, or American Express',
    ),
    DRadioOption(
      value: 'paypal',
      label: 'PayPal',
      description: 'Pay with your PayPal account',
    ),
    DRadioOption(
      value: 'bank',
      label: 'Bank Transfer',
      description: 'Direct bank transfer',
    ),
  ],
  onChange: (value) => setState(() => selectedPayment = value),
)
```

## Shipping Options Example

```dart
DRadioGroup<String>(
  name: 'shipping',
  label: 'Shipping method',
  orientation: DRadioGroupOrientation.vertical,
  options: [
    DRadioOption(
      value: 'standard',
      label: 'Standard Shipping',
      description: '5-7 business days - Free',
    ),
    DRadioOption(
      value: 'express',
      label: 'Express Shipping',
      description: '2-3 business days - \$9.99',
    ),
    DRadioOption(
      value: 'overnight',
      label: 'Overnight Shipping',
      description: 'Next business day - \$24.99',
    ),
  ],
  onChange: (value) => {},
)
```

## Dark Mode Support

`DRadioGroup` automatically adapts to dark mode:
- Radio button backgrounds adjust for proper contrast
- Labels and descriptions are readable
- Selected state indicators are visible
- Focus rings adapt appropriately

## API Reference

### DRadioGroup<T>

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `name` | `String` | required | Input name for form submission |
| `label` | `String?` | `null` | Group label |
| `options` | `List<DRadioOption<T>>` | required | Radio options |
| `value` | `T?` | `null` | Selected value |
| `size` | `DRadioGroupSize` | `md` | Radio button size |
| `color` | `DRadioGroupColor` | `primary` | Selected color |
| `orientation` | `DRadioGroupOrientation` | `vertical` | Layout direction |
| `disabled` | `bool` | `false` | Disable all options |
| `required` | `bool` | `false` | Mark as required |
| `error` | `String?` | `null` | Error message |
| `hint` | `String?` | `null` | Hint text |
| `onChange` | `ValueChanged<T>?` | `null` | Selection callback |

### DRadioOption<T>

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | `T` | required | Option value |
| `label` | `String` | required | Option label |
| `description` | `String?` | `null` | Secondary text |
| `disabled` | `bool` | `false` | Disable this option |
