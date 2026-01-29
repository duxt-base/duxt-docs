---
title: Slider
description: A control for selecting a value from a continuous range.
layout: ui-layout
order: 20
---

# Slider

The `DSlider` component allows users to select a value from a continuous range by dragging a thumb along a track.

## Basic Usage

```dart
DSlider(
  value: 50,
  min: 0,
  max: 100,
  onChange: (value) => print('Value: $value'),
)
```

## Controlled State

```dart
class SliderExample extends StatefulComponent {
  @override
  State createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double value = 50;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'space-y-4', [
      DSlider(
        value: value,
        min: 0,
        max: 100,
        onChange: (v) => setState(() => value = v),
      ),
      p([text('Value: ${value.toInt()}')]),
    ]);
  }
}
```

## With Label

```dart
DSlider(
  label: 'Volume',
  value: 75,
  min: 0,
  max: 100,
  onChange: (value) => {},
)
```

## Show Value

Display the current value:

```dart
DSlider(
  label: 'Brightness',
  value: 60,
  min: 0,
  max: 100,
  showValue: true,  // Shows "60" next to slider
  onChange: (value) => {},
)
```

## Sizes

```dart
DSlider(value: 50, size: DSize.xs)
DSlider(value: 50, size: DSize.sm)
DSlider(value: 50, size: DSize.md)  // Default
DSlider(value: 50, size: DSize.lg)
DSlider(value: 50, size: DSize.xl)
```

## Colors

```dart
DSlider(value: 50, color: DColor.primary)
DSlider(value: 50, color: DColor.secondary)
DSlider(value: 50, color: DColor.success)
DSlider(value: 50, color: DColor.info)
DSlider(value: 50, color: DColor.warning)
DSlider(value: 50, color: DColor.error)
```

## Step Values

Control the increment:

```dart
// Steps of 10
DSlider(
  value: 50,
  min: 0,
  max: 100,
  step: 10,  // Values: 0, 10, 20, ..., 100
  showValue: true,
  onChange: (value) => {},
)

// Steps of 5
DSlider(
  value: 25,
  min: 0,
  max: 100,
  step: 5,  // Values: 0, 5, 10, ..., 100
  showValue: true,
  onChange: (value) => {},
)
```

## Custom Range

```dart
// Temperature
DSlider(
  label: 'Temperature',
  value: 72,
  min: 60,
  max: 85,
  step: 1,
  showValue: true,
  onChange: (value) => {},
)

// Percentage
DSlider(
  label: 'Opacity',
  value: 0.8,
  min: 0,
  max: 1,
  step: 0.1,
  showValue: true,
  onChange: (value) => {},
)
```

## Disabled State

```dart
DSlider(
  label: 'Disabled',
  value: 50,
  disabled: true,
)
```

## Volume Control Example

```dart
class VolumeControl extends StatefulComponent {
  @override
  State createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  double volume = 75;
  bool muted = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'flex items-center gap-4', [
      DButton(
        leadingIcon: DIcon(
          name: muted ? 'volume-x' : volume > 50 ? 'volume-2' : 'volume-1',
        ),
        variant: DButtonVariant.ghost,
        square: true,
        onClick: () => setState(() => muted = !muted),
      ),
      div(classes: 'flex-1', [
        DSlider(
          value: muted ? 0 : volume,
          min: 0,
          max: 100,
          disabled: muted,
          onChange: (v) => setState(() {
            volume = v;
            if (v > 0) muted = false;
          }),
        ),
      ]),
      span(classes: 'w-12 text-right text-sm', [
        text(muted ? 'Muted' : '${volume.toInt()}%'),
      ]),
    ]);
  }
}
```

## Price Range Example

```dart
class PriceFilter extends StatefulComponent {
  @override
  State createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  double maxPrice = 500;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      body: [
        div(classes: 'space-y-4', [
          div(classes: 'flex items-center justify-between', [
            span(classes: 'font-medium', [text('Max Price')]),
            span(classes: 'text-lg font-semibold', [
              text('\$${maxPrice.toInt()}'),
            ]),
          ]),
          DSlider(
            value: maxPrice,
            min: 0,
            max: 1000,
            step: 50,
            color: DColor.success,
            onChange: (v) => setState(() => maxPrice = v),
          ),
          div(classes: 'flex justify-between text-sm text-gray-500', [
            span([text('\$0')]),
            span([text('\$1000')]),
          ]),
        ]),
      ],
    );
  }
}
```

## Settings Example

```dart
DCard(
  header: [h3([text('Display Settings')])],
  body: [
    div(classes: 'space-y-6', [
      DSlider(
        label: 'Brightness',
        value: brightness,
        min: 0,
        max: 100,
        showValue: true,
        onChange: (v) => setState(() => brightness = v),
      ),
      DSlider(
        label: 'Contrast',
        value: contrast,
        min: 0,
        max: 100,
        showValue: true,
        onChange: (v) => setState(() => contrast = v),
      ),
      DSlider(
        label: 'Font Size',
        value: fontSize,
        min: 12,
        max: 24,
        step: 2,
        showValue: true,
        onChange: (v) => setState(() => fontSize = v),
      ),
    ]),
  ],
  footer: [
    div(classes: 'flex justify-end gap-2', [
      DButton(
        label: 'Reset',
        variant: DButtonVariant.ghost,
        onClick: resetDefaults,
      ),
      DButton(label: 'Apply'),
    ]),
  ],
)
```

## Dark Mode Support

`DSlider` automatically adapts to dark mode:
- Track backgrounds adjust for proper contrast
- Thumb colors remain visible
- Value labels are readable
- Focus states adapt appropriately

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Slider label |
| `value` | `double` | `0` | Current value |
| `min` | `double` | `0` | Minimum value |
| `max` | `double` | `100` | Maximum value |
| `step` | `double` | `1` | Value increment |
| `size` | `DSize` | `md` | Slider size |
| `color` | `DColor` | `primary` | Active color |
| `showValue` | `bool` | `false` | Display value |
| `disabled` | `bool` | `false` | Disable slider |
| `onChange` | `ValueChanged<double>?` | `null` | Change callback |
