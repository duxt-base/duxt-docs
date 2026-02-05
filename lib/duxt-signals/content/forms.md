---
title: Form State
description: Form fields with validation using signals
layout: signals-layout
order: 6
---

# Form State

duxt_signals provides specialized form signals for managing form state with validation.

## FormField

Create a form field with validators:

```dart
final email = formField('', validators: [
  required('Email is required'),
  email('Invalid email format'),
]);

// Value
print(email()); // ""

// Validation
print(email.isValid); // false
print(email.error);   // "Email is required"

// Update
email.set('test@example.com');
print(email.isValid); // true
print(email.error);   // null
```

## Built-in Validators

### required
```dart
required('Field is required')
```

### requiredValue
For nullable types:
```dart
requiredValue<int>('Select a value')
```

### minLength / maxLength
```dart
minLength(3, 'At least 3 characters')
maxLength(100, 'Max 100 characters')
```

### email
```dart
email('Invalid email address')
```

### pattern
```dart
pattern(RegExp(r'^\d{5}$'), 'Must be 5 digits')
```

### min / max
For numbers:
```dart
min(1, 'Must be at least 1')
max(100, 'Cannot exceed 100')
```

### notEmpty
For lists:
```dart
notEmpty<int>('Select at least one item')
```

### compose
Combine validators:
```dart
compose([
  required(),
  minLength(8),
  pattern(RegExp(r'[A-Z]'), 'Must have uppercase'),
])
```

## Field State

FormField tracks additional state beyond the value:

```dart
final name = formField('');

// touched - has the field been focused/blurred?
print(name.touched); // false
name.touch();
print(name.touched); // true

// dirty - has the value changed from initial?
print(name.dirty); // false
name.set('John');
print(name.dirty); // true

// error - current validation error
print(name.error); // null or error message

// isValid - is the field valid?
print(name.isValid); // true/false
```

## Resetting Fields

Reset to initial state:

```dart
final name = formField('initial');

name.set('changed');
name.touch();

name.reset();
// name() == 'initial'
// name.touched == false
// name.dirty == false
```

## FormState

Group multiple fields together:

```dart
final nameField = formField('', validators: [required()]);
final emailField = formField('', validators: [email()]);
final ageField = formField(18, validators: [min(18)]);

final form = FormState({
  'name': nameField,
  'email': emailField,
  'age': ageField,
});

// All values
print(form.values);
// {'name': '', 'email': '', 'age': 18}

// All errors
print(form.errors);
// {'name': 'This field is required'}

// Form validity
print(form.isValid); // false
```

## Form Methods

### validate
Validate all fields:

```dart
if (form.validate()) {
  print('Form is valid!');
}
```

### touchAll
Mark all fields as touched:

```dart
form.touchAll();
```

### reset
Reset all fields:

```dart
form.reset();
```

### setValues
Set multiple values:

```dart
form.setValues({
  'name': 'John Doe',
  'email': 'john@example.com',
});
```

### submit
Submit if valid:

```dart
form.submit((data) async {
  await api.createUser(data);
});
```

## Using with DuxtUI

```dart
DInput(
  label: 'Email',
  value: emailField(),
  onInput: emailField.set,
  error: emailField.touched ? emailField.error : null,
  onBlur: (_) => emailField.touch(),
),
```

## Complete Form Example

```dart
// Define fields
final titleField = formField('', validators: [
  required('Title is required'),
  minLength(3, 'At least 3 characters'),
]);

final contentField = formField('', validators: [
  required('Content is required'),
]);

final publishedField = formField(false);

final categoryField = formField<int?>(null, validators: [
  requiredValue('Select a category'),
]);

// Create form state
final form = FormState({
  'title': titleField,
  'content': contentField,
  'published': publishedField,
  'categoryId': categoryField,
});

// Build form UI
Column([
  DInput(
    label: 'Title',
    value: titleField(),
    onInput: titleField.set,
    error: titleField.error,
  ),
  DTextarea(
    label: 'Content',
    value: contentField(),
    onInput: contentField.set,
    error: contentField.error,
  ),
  DSwitch(
    label: 'Published',
    checked: publishedField(),
    onChange: publishedField.set,
  ),
  DSelect<int>(
    label: 'Category',
    value: categoryField(),
    onChange: categoryField.set,
    options: categories.map((c) =>
      DSelectOption(value: c.id, label: c.name)
    ).toList(),
  ),
  DButton(
    label: form.isValid ? 'Save' : 'Fill required fields',
    disabled: !form.isValid,
    onClick: () => form.submit((data) async {
      await Api.post('/posts', body: data);
    }),
  ),
]),
```
