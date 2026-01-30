---
title: Input Number
description: A numeric input with increment and decrement buttons.
layout: ui-layout
order: 36
---

# Input Number

The `DInputNumber` component provides a numeric input field with increment/decrement buttons and support for min/max constraints and step values.

## Basic Usage

```
DInputNumber(
  label: 'Quantity',
  onChange: (value) => print('Value: $value'),
)
```

## Controlled Value

```
class InputNumberExample extends StatefulComponent {
  @override
  State createState() => _InputNumberExampleState();
}

class _InputNumberExampleState extends State<InputNumberExample> {
  double quantity = 1;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DInputNumber(
      label: 'Quantity',
      value: quantity,
      onChange: (value) => setState(() => quantity = value),
    );
  }
}
```

## Min and Max Values

```
DInputNumber(
  label: 'Quantity',
  value: 5,
  min: 1,
  max: 100,
  onChange: (value) => {},
)
```

## Step Value

```
// Step by 1 (default)
DInputNumber(
  label: 'Count',
  step: 1,
  onChange: (value) => {},
)

// Step by 5
DInputNumber(
  label: 'Quantity',
  step: 5,
  onChange: (value) => {},
)

// Step by 0.1 (decimals)
DInputNumber(
  label: 'Price',
  step: 0.1,
  onChange: (value) => {},
)

// Step by 0.5
DInputNumber(
  label: 'Hours',
  step: 0.5,
  onChange: (value) => {},
)
```

## Sizes

```
DInputNumber(size: DInputNumberSize.xs, ...)
DInputNumber(size: DInputNumberSize.sm, ...)
DInputNumber(size: DInputNumberSize.md, ...)  // Default
DInputNumber(size: DInputNumberSize.lg, ...)
DInputNumber(size: DInputNumberSize.xl, ...)
```

## Colors

```
DInputNumber(color: DColor.primary, ...)
DInputNumber(color: DColor.secondary, ...)
DInputNumber(color: DColor.success, ...)
DInputNumber(color: DColor.warning, ...)
DInputNumber(color: DColor.error, ...)
```

## With Placeholder

```
DInputNumber(
  label: 'Amount',
  placeholder: 'Enter amount',
  onChange: (value) => {},
)
```

## Required

```
DInputNumber(
  label: 'Quantity',
  required: true,
  min: 1,
  onChange: (value) => {},
)
```

## With Hint

```
DInputNumber(
  label: 'Quantity',
  min: 1,
  max: 10,
  hint: 'Between 1 and 10',
  onChange: (value) => {},
)
```

## With Error

```
DInputNumber(
  label: 'Quantity',
  error: 'Quantity must be at least 1',
  onChange: (value) => {},
)
```

## Disabled

```
DInputNumber(
  label: 'Quantity',
  value: 5,
  disabled: true,
)
```

## Cart Quantity Example

```
class CartItem extends StatefulComponent {
  final Product product;
  final int initialQuantity;

  CartItem({required this.product, this.initialQuantity = 1});

  @override
  State createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late double quantity;

  @override
  void initState() {
    super.initState();
    quantity = component.initialQuantity.toDouble();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'flex items-center justify-between p-4 border-b', [
      // Product info
      div(classes: 'flex items-center gap-4', [
        img(src: component.product.image, classes: 'w-16 h-16 object-cover rounded'),
        div([
          p(classes: 'font-medium', [text(component.product.name)]),
          p(classes: 'text-sm text-gray-500', [text('\$${component.product.price}')]),
        ]),
      ]),

      // Quantity selector
      div(classes: 'flex items-center gap-4', [
        DInputNumber(
          value: quantity,
          min: 1,
          max: component.product.stock,
          step: 1,
          size: DInputNumberSize.sm,
          onChange: (value) {
            setState(() => quantity = value);
            updateCart(component.product.id, value.toInt());
          },
        ),
        p(classes: 'font-semibold w-20 text-right', [
          text('\$${(component.product.price * quantity).toStringAsFixed(2)}'),
        ]),
      ]),
    ]);
  }
}
```

## Settings Example

```
DCard(
  header: [h3([text('Display Settings')])],
  body: [
    div(classes: 'space-y-4', [
      DInputNumber(
        label: 'Font Size',
        value: fontSize,
        min: 12,
        max: 24,
        step: 1,
        hint: 'pixels',
        onChange: (value) => setState(() => fontSize = value),
      ),

      DInputNumber(
        label: 'Line Height',
        value: lineHeight,
        min: 1.0,
        max: 3.0,
        step: 0.1,
        onChange: (value) => setState(() => lineHeight = value),
      ),

      DInputNumber(
        label: 'Items per page',
        value: itemsPerPage,
        min: 5,
        max: 100,
        step: 5,
        onChange: (value) => setState(() => itemsPerPage = value),
      ),
    ]),
  ],
)
```

## Duration Picker Example

```
div(classes: 'flex items-center gap-4', [
  DInputNumber(
    label: 'Hours',
    value: hours,
    min: 0,
    max: 23,
    step: 1,
    size: DInputNumberSize.sm,
    onChange: (value) => setState(() => hours = value),
  ),
  span(classes: 'text-xl font-bold mt-6', [text(':')]),
  DInputNumber(
    label: 'Minutes',
    value: minutes,
    min: 0,
    max: 59,
    step: 5,
    size: DInputNumberSize.sm,
    onChange: (value) => setState(() => minutes = value),
  ),
])
```

## Dark Mode Support

`DInputNumber` automatically adapts to dark mode:
- Input backgrounds adjust for proper contrast
- Button backgrounds are optimized
- Border colors adapt appropriately
- Disabled states remain distinguishable

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Input label |
| `value` | `double` | `0` | Current value |
| `min` | `double` | `-infinity` | Minimum value |
| `max` | `double` | `infinity` | Maximum value |
| `step` | `double` | `1` | Increment/decrement step |
| `name` | `String?` | `null` | Form input name |
| `placeholder` | `String?` | `null` | Placeholder text |
| `size` | `DInputNumberSize` | `md` | Input size |
| `color` | `DColor` | `primary` | Focus color |
| `disabled` | `bool` | `false` | Disable input |
| `required` | `bool` | `false` | Mark as required |
| `hint` | `String?` | `null` | Hint text |
| `error` | `String?` | `null` | Error message |
| `onChange` | `ValueChanged<double>?` | `null` | Value change callback |
