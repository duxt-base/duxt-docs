---
title: Getting Started
description: Install duxt_signals and create your first reactive state
layout: signals-layout
order: 2
---

# Getting Started

Get up and running with duxt_signals in minutes.

## Installation

Add `duxt_signals` to your `pubspec.yaml`:

```
dependencies:
  duxt_signals: ^0.1.0
```

Then run:

```
dart pub get
```

## Import

```
import 'package:duxt_signals/duxt_signals.dart';
```

## Your First Signal

Create a signal with an initial value:

```
final count = signal(0);
```

Read the value using call syntax:

```
print(count()); // 0
```

Update the value:

```
count.set(5);
print(count()); // 5

// Or update based on previous value
count.update((v) => v + 1);
print(count()); // 6
```

## Computed Values

Create derived state that automatically updates:

```
final price = signal(100);
final quantity = signal(2);

final total = computed(() => price() * quantity());

print(total()); // 200

quantity.set(3);
print(total()); // 300 - automatically updated!
```

## Effects

Run side effects when signals change:

```
final name = signal('John');

effect(() {
  print('Hello, ${name()}!');
});
// Prints: "Hello, John!"

name.set('Jane');
// Prints: "Hello, Jane!"
```

## Form State

Create form fields with validation:

```
final email = formField('', validators: [
  required('Email is required'),
  email('Invalid email format'),
]);

// Check validity
print(email.isValid); // false (empty)
print(email.error);   // "Email is required"

email.set('test@example.com');
print(email.isValid); // true
print(email.error);   // null
```

## Next Steps

- [Signals](/duxt-signals/signals) - Full Signal API reference
- [Computed](/duxt-signals/computed) - Derived state patterns
- [Forms](/duxt-signals/forms) - Form state management
- [Examples](/duxt-signals/examples) - Real-world patterns
