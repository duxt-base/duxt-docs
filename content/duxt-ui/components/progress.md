---
title: Progress
description: Visual indicators for showing progress and completion status.
layout: ui-layout
order: 15
---

# Progress

Duxt UI provides three progress components: `DProgress` (linear), `DProgressCircular`, and `DProgressSteps`.

## Linear Progress

### Basic Usage

```dart
DProgress(
  value: 65,
  max: 100,
)
```

### With Label

```dart
DProgress(
  value: 65,
  max: 100,
  showLabel: true,  // Shows "65%"
)
```

### Colors

```dart
DProgress(value: 65, color: DColor.primary)
DProgress(value: 65, color: DColor.secondary)
DProgress(value: 65, color: DColor.success)
DProgress(value: 65, color: DColor.info)
DProgress(value: 65, color: DColor.warning)
DProgress(value: 65, color: DColor.error)
```

### Sizes

```dart
DProgress(value: 65, size: DSize.xs)
DProgress(value: 65, size: DSize.sm)
DProgress(value: 65, size: DSize.md)
DProgress(value: 65, size: DSize.lg)
DProgress(value: 65, size: DSize.xl)
```

### Animations

```dart
// Pulse animation
DProgress(
  value: 65,
  animation: DProgressAnimation.pulse,
)

// Indeterminate (unknown progress)
DProgress(
  indeterminate: true,
  animation: DProgressAnimation.indeterminate,
)
```

### Custom Colors

```dart
DProgress(
  value: 65,
  trackColor: 'bg-gray-100',
  indicatorColor: 'bg-gradient-to-r from-blue-500 to-purple-500',
)
```

## Circular Progress

### Basic Usage

```dart
DProgressCircular(
  value: 75,
  max: 100,
)
```

### With Center Label

```dart
DProgressCircular(
  value: 75,
  max: 100,
  showLabel: true,  // Shows "75%" in center
)
```

### Sizes

```dart
DProgressCircular(value: 75, size: DSize.sm)  // 48px
DProgressCircular(value: 75, size: DSize.md)  // 64px
DProgressCircular(value: 75, size: DSize.lg)  // 80px
DProgressCircular(value: 75, size: DSize.xl)  // 96px
```

### Stroke Width

```dart
DProgressCircular(
  value: 75,
  strokeWidth: 8,  // Thicker stroke
)
```

### Indeterminate

```dart
DProgressCircular(
  indeterminate: true,  // Spinning animation
)
```

### Custom Center Content

```dart
DProgressCircular(
  value: 75,
  max: 100,
  center: [
    DIcon(name: 'check', classes: 'text-success-500'),
  ],
)
```

## Progress Steps

### Basic Usage

```dart
DProgressSteps(
  value: 2,
  steps: 5,
)
```

### With Labels

```dart
DProgressSteps(
  value: 2,
  steps: 5,
  labels: ['Cart', 'Shipping', 'Payment', 'Review', 'Complete'],
)
```

### Colors

```dart
DProgressSteps(
  value: 3,
  steps: 5,
  color: DColor.success,
)
```

## Upload Progress Example

```dart
class FileUpload extends StatefulComponent {
  @override
  State createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  int progress = 0;
  bool uploading = false;

  void startUpload() {
    setState(() {
      uploading = true;
      progress = 0;
    });

    // Simulate upload progress
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (progress >= 100) {
        timer.cancel();
        setState(() => uploading = false);
      } else {
        setState(() => progress += 5);
      }
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      body: [
        div(classes: 'space-y-4', [
          div(classes: 'flex items-center justify-between', [
            span([text('file.pdf')]),
            span(classes: 'text-sm text-gray-500', [text('${progress}%')]),
          ]),
          DProgress(
            value: progress,
            max: 100,
            color: progress == 100 ? DColor.success : DColor.primary,
            animation: uploading ? DProgressAnimation.pulse : DProgressAnimation.none,
          ),
          if (!uploading && progress == 0)
            DButton(
              label: 'Upload',
              onClick: startUpload,
            ),
          if (progress == 100)
            DAlert(
              title: 'Upload Complete',
              color: DColor.success,
              variant: DAlertVariant.soft,
            ),
        ]),
      ],
    );
  }
}
```

## Checkout Steps Example

```dart
class CheckoutStepper extends StatefulComponent {
  @override
  State createState() => _CheckoutStepperState();
}

class _CheckoutStepperState extends State<CheckoutStepper> {
  int currentStep = 1;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'space-y-6', [
      DProgressSteps(
        value: currentStep,
        steps: 4,
        labels: ['Cart', 'Shipping', 'Payment', 'Confirm'],
        color: DColor.primary,
      ),

      // Step content
      DCard(
        body: [
          if (currentStep == 1) text('Review your cart items...'),
          if (currentStep == 2) text('Enter shipping address...'),
          if (currentStep == 3) text('Add payment method...'),
          if (currentStep == 4) text('Confirm your order...'),
        ],
      ),

      // Navigation
      div(classes: 'flex justify-between', [
        DButton(
          label: 'Back',
          variant: DButtonVariant.outline,
          disabled: currentStep == 1,
          onClick: () => setState(() => currentStep--),
        ),
        DButton(
          label: currentStep == 4 ? 'Place Order' : 'Continue',
          onClick: () {
            if (currentStep < 4) {
              setState(() => currentStep++);
            } else {
              placeOrder();
            }
          },
        ),
      ]),
    ]);
  }
}
```

## Loading State Example

```dart
DCard(
  body: [
    if (loading)
      div(classes: 'flex flex-col items-center gap-4 py-8', [
        DProgressCircular(
          indeterminate: true,
          size: DSize.lg,
        ),
        p(classes: 'text-gray-500', [text('Loading data...')]),
      ])
    else
      dataContent,
  ],
)
```

## Dark Mode Support

All progress components automatically adapt to dark mode:
- Track backgrounds adjust for proper contrast
- Indicator colors remain vibrant
- Labels are readable in both modes

## API Reference

### DProgress

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | `double` | `0` | Current progress value |
| `max` | `double` | `100` | Maximum value |
| `size` | `DSize` | `md` | Progress bar height |
| `color` | `DColor` | `primary` | Indicator color |
| `showLabel` | `bool` | `false` | Show percentage label |
| `indeterminate` | `bool` | `false` | Unknown progress mode |
| `animation` | `DProgressAnimation` | `none` | Animation style |
| `trackColor` | `String?` | `null` | Custom track color |
| `indicatorColor` | `String?` | `null` | Custom indicator color |

### DProgressCircular

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | `double` | `0` | Current progress value |
| `max` | `double` | `100` | Maximum value |
| `size` | `DSize` | `md` | Circle size |
| `color` | `DColor` | `primary` | Indicator color |
| `strokeWidth` | `double` | `4` | Stroke thickness |
| `showLabel` | `bool` | `false` | Show center percentage |
| `indeterminate` | `bool` | `false` | Spinning animation |
| `center` | `List<Component>?` | `null` | Custom center content |

### DProgressSteps

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | `int` | `0` | Current step (1-indexed) |
| `steps` | `int` | required | Total number of steps |
| `labels` | `List<String>?` | `null` | Step labels |
| `color` | `DColor` | `primary` | Active step color |
