---
title: Introduction
description: Reactive signals for Dart - lightweight state management
layout: signals-layout
order: 1
---

# duxt_signals

**Reactive signals for Dart** - lightweight state management inspired by Solid.js, Angular, and Preact Signals.

## What are Signals?

Signals are reactive primitives that hold a value and automatically notify dependents when that value changes. They provide a simple, fine-grained approach to state management without the complexity of streams or state management libraries.

```dart
// Create a signal
final count = signal(0);

// Read value
print(count()); // 0

// Update value
count.set(5);
count.update((v) => v + 1);
```

## Why Signals?

### Simple API
Signals have a minimal API - just read, write, and listen. No boilerplate, no complex patterns.

### Fine-grained Reactivity
Only the parts of your app that depend on a signal re-run when it changes. No unnecessary rebuilds.

### Automatic Dependency Tracking
Computed signals automatically track which signals they depend on. When dependencies change, computed values update.

### Works Everywhere
Pure Dart with no framework dependencies. Use with Jaspr, Flutter, or any Dart application.

## Core Concepts

### Signals
The basic unit of reactive state. Holds a value and notifies listeners when changed.

```dart
final name = signal('John');
print(name()); // "John"
name.set('Jane');
```

### Computed
Derived values that automatically update when dependencies change.

```dart
final firstName = signal('John');
final lastName = signal('Doe');
final fullName = computed(() => '${firstName()} ${lastName()}');
// fullName automatically updates when firstName or lastName changes
```

### Effects
Side effects that run when signals change.

```dart
effect(() {
  print('Name changed to: ${name()}');
});
```

### Form Signals
Specialized signals for form state with validation.

```dart
final email = formField('', validators: [
  required(),
  email('Invalid email'),
]);
```

## Next Steps

- [Getting Started](/duxt-signals/getting-started) - Install and start using signals
- [Signals](/duxt-signals/signals) - Deep dive into the Signal API
- [Examples](/duxt-signals/examples) - Real-world usage patterns
