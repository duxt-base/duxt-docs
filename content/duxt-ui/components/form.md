---
title: Form
description: Form wrapper components with validation support and layout helpers.
layout: ui-layout
order: 37
---

# Form

The `DForm` component provides a form wrapper with built-in validation support, along with helper components for structuring form layouts.

## Basic Usage

```dart
DForm(
  onSubmit: (data) {
    print('Form data: $data');
  },
  children: [
    DInput(name: 'email', label: 'Email', type: InputType.email),
    DInput(name: 'password', label: 'Password', type: InputType.password),
    DFormActions(children: [
      DButton(type: ButtonType.submit, label: 'Sign In'),
    ]),
  ],
)
```

## With Validation

```dart
DForm(
  validateOnSubmit: true,
  onValidate: (data) {
    final errors = <String, String?>{};

    if (data['email']?.isEmpty ?? true) {
      errors['email'] = 'Email is required';
    } else if (!isValidEmail(data['email'])) {
      errors['email'] = 'Please enter a valid email';
    }

    if (data['password']?.isEmpty ?? true) {
      errors['password'] = 'Password is required';
    } else if (data['password'].length < 8) {
      errors['password'] = 'Password must be at least 8 characters';
    }

    return DFormValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
    );
  },
  onSubmit: (data) {
    signIn(data['email'], data['password']);
  },
  children: [
    DInput(name: 'email', label: 'Email', type: InputType.email),
    DInput(name: 'password', label: 'Password', type: InputType.password),
    DFormActions(children: [
      DButton(type: ButtonType.submit, label: 'Sign In'),
    ]),
  ],
)
```

## Form ID and Name

```dart
DForm(
  id: 'login-form',
  name: 'loginForm',
  onSubmit: (data) => {},
  children: [...],
)
```

## Disabled Form

```dart
DForm(
  disabled: true,  // Disables all form interactions
  onSubmit: (data) => {},
  children: [...],
)
```

## Reset Handling

```dart
DForm(
  onSubmit: (data) => handleSubmit(data),
  onReset: () {
    print('Form reset');
    clearState();
  },
  children: [
    DInput(name: 'name', label: 'Name'),
    DFormActions(children: [
      DButton(type: ButtonType.reset, label: 'Reset', variant: DButtonVariant.ghost),
      DButton(type: ButtonType.submit, label: 'Submit'),
    ]),
  ],
)
```

## Form Actions

Position action buttons at the end of the form:

```dart
// Right-aligned (default)
DFormActions(
  children: [
    DButton(type: ButtonType.submit, label: 'Submit'),
  ],
)

// Left-aligned
DFormActions(
  alignment: MainAxisAlignment.start,
  children: [
    DButton(type: ButtonType.submit, label: 'Submit'),
  ],
)

// Space between
DFormActions(
  alignment: MainAxisAlignment.spaceBetween,
  children: [
    DButton(type: ButtonType.reset, label: 'Reset', variant: DButtonVariant.ghost),
    DButton(type: ButtonType.submit, label: 'Submit'),
  ],
)

// Centered
DFormActions(
  alignment: MainAxisAlignment.center,
  children: [
    DButton(type: ButtonType.submit, label: 'Submit', block: true),
  ],
)
```

## Form Row

Create horizontal field layouts:

```dart
// Two columns (default)
DFormRow(
  children: [
    DInput(name: 'firstName', label: 'First Name'),
    DInput(name: 'lastName', label: 'Last Name'),
  ],
)

// Three columns
DFormRow(
  columns: 3,
  children: [
    DInput(name: 'city', label: 'City'),
    DInput(name: 'state', label: 'State'),
    DInput(name: 'zip', label: 'ZIP Code'),
  ],
)
```

## Form Section

Group related fields with an optional title:

```dart
DFormSection(
  title: 'Personal Information',
  description: 'Please enter your details',
  children: [
    DFormRow(children: [
      DInput(name: 'firstName', label: 'First Name'),
      DInput(name: 'lastName', label: 'Last Name'),
    ]),
    DInput(name: 'email', label: 'Email', type: InputType.email),
  ],
)
```

## Complete Registration Form Example

```dart
DForm(
  id: 'registration-form',
  validateOnSubmit: true,
  onValidate: validateRegistration,
  onSubmit: (data) => register(data),
  children: [
    // Personal Info Section
    DFormSection(
      title: 'Personal Information',
      children: [
        DFormRow(children: [
          DInput(name: 'firstName', label: 'First Name', required: true),
          DInput(name: 'lastName', label: 'Last Name', required: true),
        ]),
        DInput(name: 'email', label: 'Email', type: InputType.email, required: true),
        DInput(name: 'phone', label: 'Phone', type: InputType.tel),
      ],
    ),

    // Address Section
    DFormSection(
      title: 'Address',
      description: 'Your shipping address',
      children: [
        DInput(name: 'street', label: 'Street Address'),
        DFormRow(children: [
          DInput(name: 'city', label: 'City'),
          DInput(name: 'state', label: 'State'),
        ]),
        DFormRow(columns: 3, children: [
          DInput(name: 'zip', label: 'ZIP Code'),
          DSelect<String>(
            name: 'country',
            label: 'Country',
            options: countryOptions,
          ),
        ]),
      ],
    ),

    // Account Section
    DFormSection(
      title: 'Account',
      children: [
        DInput(name: 'password', label: 'Password', type: InputType.password, required: true),
        DInput(name: 'confirmPassword', label: 'Confirm Password', type: InputType.password, required: true),
      ],
    ),

    // Terms
    DCheckbox(
      name: 'terms',
      label: 'I agree to the terms and conditions',
      required: true,
    ),

    // Actions
    DFormActions(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        DButton(
          type: ButtonType.reset,
          label: 'Clear',
          variant: DButtonVariant.ghost,
        ),
        DButton(
          type: ButtonType.submit,
          label: 'Create Account',
        ),
      ],
    ),
  ],
)
```

## Contact Form Example

```dart
DCard(
  header: [h3([text('Contact Us')])],
  body: [
    DForm(
      onValidate: (data) {
        final errors = <String, String?>{};
        if (data['name']?.isEmpty ?? true) errors['name'] = 'Name is required';
        if (data['email']?.isEmpty ?? true) errors['email'] = 'Email is required';
        if (data['message']?.isEmpty ?? true) errors['message'] = 'Message is required';
        return DFormValidationResult(isValid: errors.isEmpty, errors: errors);
      },
      onSubmit: (data) => sendMessage(data),
      children: [
        DInput(name: 'name', label: 'Name', required: true),
        DInput(name: 'email', label: 'Email', type: InputType.email, required: true),
        DSelect<String>(
          name: 'subject',
          label: 'Subject',
          options: [
            DSelectOption(label: 'General Inquiry', value: 'general'),
            DSelectOption(label: 'Support', value: 'support'),
            DSelectOption(label: 'Sales', value: 'sales'),
          ],
        ),
        DTextarea(name: 'message', label: 'Message', rows: 5, required: true),
        DFormActions(children: [
          DButton(type: ButtonType.submit, label: 'Send Message'),
        ]),
      ],
    ),
  ],
)
```

## Dark Mode Support

All form components automatically adapt to dark mode with appropriate backgrounds, borders, and text colors.

## API Reference

### DForm

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `id` | `String?` | `null` | Form ID |
| `name` | `String?` | `null` | Form name |
| `children` | `List<Component>` | required | Form content |
| `disabled` | `bool` | `false` | Disable form |
| `validateOnSubmit` | `bool` | `true` | Validate before submit |
| `validateOnBlur` | `bool` | `false` | Validate on blur |
| `validateOnChange` | `bool` | `false` | Validate on change |
| `onValidate` | `FormValidateCallback?` | `null` | Validation function |
| `onSubmit` | `FormSubmitCallback?` | `null` | Submit handler |
| `onReset` | `VoidCallback?` | `null` | Reset handler |

### DFormActions

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `children` | `List<Component>` | required | Action buttons |
| `alignment` | `MainAxisAlignment` | `end` | Button alignment |

### DFormRow

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `children` | `List<Component>` | required | Row fields |
| `columns` | `int` | `2` | Number of columns |

### DFormSection

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | Section title |
| `description` | `String?` | `null` | Section description |
| `children` | `List<Component>` | required | Section content |
