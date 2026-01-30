---
title: Stepper
description: A multi-step progress indicator for wizards and multi-page forms.
layout: ui-layout
order: 50
---

# Stepper

The `DStepper` component displays progress through a multi-step process with numbered steps and connecting lines.

## Basic Usage

```
DStepper(
  currentStep: 1,
  steps: [
    DStepItem(title: 'Account'),
    DStepItem(title: 'Profile'),
    DStepItem(title: 'Settings'),
    DStepItem(title: 'Complete'),
  ],
)
```

## Horizontal (Default)

```
DStepper(
  orientation: DStepperOrientation.horizontal,
  currentStep: 2,
  steps: [
    DStepItem(title: 'Cart'),
    DStepItem(title: 'Shipping'),
    DStepItem(title: 'Payment'),
    DStepItem(title: 'Confirm'),
  ],
)
```

## Vertical

```
DStepper(
  orientation: DStepperOrientation.vertical,
  currentStep: 1,
  steps: [
    DStepItem(title: 'Create Account', description: 'Enter your email and password'),
    DStepItem(title: 'Verify Email', description: 'Check your inbox for verification link'),
    DStepItem(title: 'Complete Profile', description: 'Add your personal information'),
    DStepItem(title: 'Get Started', description: 'Start using the platform'),
  ],
)
```

## With Descriptions

```
DStepper(
  currentStep: 0,
  steps: [
    DStepItem(
      title: 'Personal Info',
      description: 'Name, email, phone',
    ),
    DStepItem(
      title: 'Address',
      description: 'Shipping and billing',
    ),
    DStepItem(
      title: 'Payment',
      description: 'Credit card or PayPal',
    ),
    DStepItem(
      title: 'Review',
      description: 'Confirm your order',
    ),
  ],
)
```

## With Custom Icons

```
DStepper(
  currentStep: 1,
  steps: [
    DStepItem(
      title: 'Cart',
      icon: DIcon(name: 'shopping-cart', size: 16),
    ),
    DStepItem(
      title: 'Shipping',
      icon: DIcon(name: 'truck', size: 16),
    ),
    DStepItem(
      title: 'Payment',
      icon: DIcon(name: 'credit-card', size: 16),
    ),
    DStepItem(
      title: 'Done',
      icon: DIcon(name: 'package', size: 16),
    ),
  ],
)
```

## Clickable Steps

Allow users to navigate by clicking on steps:

```
class MultiStepForm extends StatefulComponent {
  @override
  State createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  int currentStep = 0;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DStepper(
      currentStep: currentStep,
      clickable: true,
      onStepClick: (index) {
        // Only allow clicking on completed or current steps
        if (index <= currentStep) {
          setState(() => currentStep = index);
        }
      },
      steps: [
        DStepItem(title: 'Details'),
        DStepItem(title: 'Options'),
        DStepItem(title: 'Review'),
      ],
    );
  }
}
```

## Step States

Steps have three states:
- **Upcoming**: Steps after the current step (gray, numbered)
- **Current**: The active step (indigo, numbered)
- **Completed**: Steps before the current step (green, checkmark)

```
DStepper(
  currentStep: 2,  // Steps 0 and 1 are completed, step 2 is current
  steps: [
    DStepItem(title: 'Step 1'),  // Completed (green check)
    DStepItem(title: 'Step 2'),  // Completed (green check)
    DStepItem(title: 'Step 3'),  // Current (indigo)
    DStepItem(title: 'Step 4'),  // Upcoming (gray)
  ],
)
```

## Complete Multi-Step Form

```
class CheckoutWizard extends StatefulComponent {
  @override
  State createState() => _CheckoutWizardState();
}

class _CheckoutWizardState extends State<CheckoutWizard> {
  int currentStep = 0;
  final totalSteps = 4;

  void nextStep() {
    if (currentStep < totalSteps - 1) {
      setState(() => currentStep++);
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'max-w-2xl mx-auto', [
      // Stepper
      DStepper(
        currentStep: currentStep,
        steps: [
          DStepItem(title: 'Cart', description: 'Review items'),
          DStepItem(title: 'Shipping', description: 'Delivery address'),
          DStepItem(title: 'Payment', description: 'Payment method'),
          DStepItem(title: 'Confirm', description: 'Place order'),
        ],
      ),

      // Step content
      DCard(
        classes: 'mt-8',
        body: [
          if (currentStep == 0) _buildCartStep(),
          if (currentStep == 1) _buildShippingStep(),
          if (currentStep == 2) _buildPaymentStep(),
          if (currentStep == 3) _buildConfirmStep(),
        ],
        footer: [
          div(classes: 'flex justify-between', [
            DButton(
              label: 'Back',
              variant: DButtonVariant.outline,
              disabled: currentStep == 0,
              onClick: previousStep,
            ),
            DButton(
              label: currentStep == totalSteps - 1 ? 'Place Order' : 'Continue',
              onClick: currentStep == totalSteps - 1 ? placeOrder : nextStep,
            ),
          ]),
        ],
      ),
    ]);
  }
}
```

## Registration Flow

```
DStepper(
  orientation: DStepperOrientation.vertical,
  currentStep: registrationStep,
  steps: [
    DStepItem(
      title: 'Create Account',
      description: 'Set up your login credentials',
      icon: DIcon(name: 'user-plus', size: 16),
    ),
    DStepItem(
      title: 'Verify Email',
      description: 'Confirm your email address',
      icon: DIcon(name: 'mail', size: 16),
    ),
    DStepItem(
      title: 'Choose Plan',
      description: 'Select your subscription',
      icon: DIcon(name: 'credit-card', size: 16),
    ),
    DStepItem(
      title: 'Complete Setup',
      description: 'Configure your workspace',
      icon: DIcon(name: 'settings', size: 16),
    ),
  ],
)
```

## In Modal

```
DModal(
  open: showWizard,
  onClose: closeWizard,
  title: 'Setup Wizard',
  size: DModalSize.lg,
  body: [
    DStepper(
      currentStep: wizardStep,
      steps: [
        DStepItem(title: 'Welcome'),
        DStepItem(title: 'Configure'),
        DStepItem(title: 'Finish'),
      ],
    ),
    div(classes: 'mt-6', [
      // Step content
    ]),
  ],
  footer: [
    DButton(label: 'Previous', variant: DButtonVariant.outline, onClick: prevStep),
    DButton(label: 'Next', onClick: nextStep),
  ],
)
```

## Dark Mode Support

`DStepper` automatically adapts to dark mode with appropriate colors for step circles, connectors, and text.

## API Reference

### DStepper

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `steps` | `List<DStepItem>` | required | Step items |
| `currentStep` | `int` | `0` | Active step index (0-based) |
| `orientation` | `DStepperOrientation` | `horizontal` | Layout orientation |
| `clickable` | `bool` | `false` | Allow clicking steps |
| `onStepClick` | `ValueChanged<int>?` | `null` | Step click callback |
| `classes` | `String?` | `null` | Custom CSS classes |

### DStepItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String` | required | Step title |
| `description` | `String?` | `null` | Step description |
| `icon` | `Component?` | `null` | Custom icon |

### DStepperOrientation

| Value | Description |
|-------|-------------|
| `horizontal` | Horizontal layout |
| `vertical` | Vertical layout |

### DStepStatus

| Value | Description |
|-------|-------------|
| `upcoming` | Future step (gray) |
| `current` | Active step (indigo) |
| `completed` | Past step (green check) |
