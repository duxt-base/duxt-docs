---
title: Pin Input
description: A PIN/OTP code input with individual digit fields.
layout: ui-layout
order: 35
---

# Pin Input

The `DPinInput` component provides individual digit input fields for PIN codes, OTP verification, and security codes.

## Basic Usage

```
DPinInput(
  label: 'Enter PIN',
  onChange: (value) => print('PIN: $value'),
)
```

## Length

```
// 4 digits (default)
DPinInput(
  length: 4,
  onChange: (value) => {},
)

// 6 digits (common for OTP)
DPinInput(
  length: 6,
  onChange: (value) => {},
)

// 8 digits
DPinInput(
  length: 8,
  onChange: (value) => {},
)
```

## Sizes

```
DPinInput(size: DPinInputSize.xs, ...)
DPinInput(size: DPinInputSize.sm, ...)
DPinInput(size: DPinInputSize.md, ...)  // Default
DPinInput(size: DPinInputSize.lg, ...)
DPinInput(size: DPinInputSize.xl, ...)
```

## Input Types

### Number (Default)

```
DPinInput(
  type: DPinInputType.number,
  onChange: (value) => {},
)
```

### Text

```
DPinInput(
  type: DPinInputType.text,
  onChange: (value) => {},
)
```

### Password (Masked)

```
DPinInput(
  type: DPinInputType.password,
  onChange: (value) => {},
)
```

## Colors

```
DPinInput(color: DColor.primary, ...)
DPinInput(color: DColor.secondary, ...)
DPinInput(color: DColor.success, ...)
DPinInput(color: DColor.warning, ...)
DPinInput(color: DColor.error, ...)
```

## With Placeholder

```
DPinInput(
  placeholder: '○',
  onChange: (value) => {},
)
```

## Controlled Value

```
class PinInputExample extends StatefulComponent {
  @override
  State createState() => _PinInputExampleState();
}

class _PinInputExampleState extends State<PinInputExample> {
  String pin = '';

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DPinInput(
      label: 'Enter PIN',
      value: pin,
      onChange: (value) => setState(() => pin = value),
    );

    yield p(classes: 'mt-2 text-sm text-gray-500', [
      text('Current value: $pin'),
    ]);
  }
}
```

## On Complete Callback

Triggered when all digits are filled:

```
DPinInput(
  label: 'Verification code',
  length: 6,
  onChange: (value) => {},
  onComplete: () {
    print('PIN complete!');
    verifyCode();
  },
)
```

## Autofocus

```
DPinInput(
  label: 'Enter code',
  autofocus: true,
  onChange: (value) => {},
)
```

## Required

```
DPinInput(
  label: 'PIN',
  required: true,
  onChange: (value) => {},
)
```

## With Error

```
DPinInput(
  label: 'Verification code',
  error: 'Invalid code. Please try again.',
  onChange: (value) => {},
)
```

## With Hint

```
DPinInput(
  label: 'Verification code',
  hint: 'Enter the 6-digit code sent to your email',
  length: 6,
  onChange: (value) => {},
)
```

## Disabled

```
DPinInput(
  label: 'PIN',
  value: '1234',
  disabled: true,
)
```

## OTP Verification Example

```
class OTPVerification extends StatefulComponent {
  @override
  State createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  String code = '';
  bool verifying = false;
  String? error;

  Future<void> verifyCode() async {
    setState(() {
      verifying = true;
      error = null;
    });

    try {
      final success = await api.verifyOTP(code);
      if (success) {
        navigateToHome();
      } else {
        setState(() => error = 'Invalid code. Please try again.');
      }
    } catch (e) {
      setState(() => error = 'Verification failed. Please try again.');
    } finally {
      setState(() => verifying = false);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      body: [
        div(classes: 'text-center space-y-6', [
          div([
            h2(classes: 'text-xl font-semibold', [text('Verify your email')]),
            p(classes: 'text-gray-500 mt-2', [
              text('We sent a 6-digit code to john@example.com'),
            ]),
          ]),

          DPinInput(
            length: 6,
            size: DPinInputSize.lg,
            autofocus: true,
            error: error,
            disabled: verifying,
            onChange: (value) => setState(() => code = value),
            onComplete: verifyCode,
          ),

          div(classes: 'space-y-2', [
            DButton(
              label: verifying ? 'Verifying...' : 'Verify',
              loading: verifying,
              disabled: code.length < 6,
              block: true,
              onClick: verifyCode,
            ),
            DButton(
              label: 'Resend code',
              variant: DButtonVariant.ghost,
              block: true,
              disabled: verifying,
              onClick: () => resendCode(),
            ),
          ]),
        ]),
      ],
    );
  }
}
```

## Two-Factor Authentication Example

```
DCard(
  header: [
    div(classes: 'flex items-center gap-3', [
      DIcon(name: 'shield', classes: 'text-primary-500'),
      h3(classes: 'font-semibold', [text('Two-Factor Authentication')]),
    ]),
  ],
  body: [
    div(classes: 'space-y-4', [
      p(classes: 'text-sm text-gray-600', [
        text('Enter the code from your authenticator app'),
      ]),

      DPinInput(
        length: 6,
        type: DPinInputType.number,
        size: DPinInputSize.lg,
        color: DColor.primary,
        onChange: (value) => {},
        onComplete: () => verify2FA(),
      ),

      p(classes: 'text-xs text-gray-500', [
        text('Having trouble? '),
        a(href: '/recovery', classes: 'text-primary-600 hover:underline', [
          text('Use a recovery code'),
        ]),
      ]),
    ]),
  ],
)
```

## Dark Mode Support

`DPinInput` automatically adapts to dark mode:
- Input backgrounds adjust for proper contrast
- Border colors are optimized for dark backgrounds
- Focus rings are visible in both modes

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `length` | `int` | `4` | Number of digits |
| `label` | `String?` | `null` | Input label |
| `value` | `String` | `''` | Current value |
| `size` | `DPinInputSize` | `md` | Input size |
| `type` | `DPinInputType` | `number` | Input type |
| `color` | `DColor` | `primary` | Focus color |
| `disabled` | `bool` | `false` | Disable input |
| `required` | `bool` | `false` | Mark as required |
| `autofocus` | `bool` | `false` | Auto focus first input |
| `placeholder` | `String?` | `null` | Placeholder character |
| `hint` | `String?` | `null` | Hint text |
| `error` | `String?` | `null` | Error message |
| `name` | `String?` | `null` | Form input name |
| `onChange` | `ValueChanged<String>?` | `null` | Value change callback |
| `onComplete` | `VoidCallback?` | `null` | Called when all digits entered |
