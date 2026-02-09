---
title: Duxt Signals
description: Reactive signals for Dart - lightweight state management.
layout: signals-layout
order: 1
---

# Duxt Signals

**Reactive signals for Dart** - lightweight state management inspired by Solid.js, Angular, and Preact Signals. Fine-grained reactivity with zero boilerplate.

## What are Signals?

Signals are reactive primitives that hold a value and automatically notify dependents when it changes. No streams, no controllers, no boilerplate - just read, write, and react.

```
final count = signal(0);

// Read
print(count()); // 0

// Write
count.set(5);
count.update((v) => v + 1);
```

## Why Duxt Signals?

### Minimal API
Three primitives cover everything: `signal` for state, `computed` for derived values, `effect` for side effects.

### Fine-Grained Reactivity
Only the parts that depend on a signal re-run when it changes. No unnecessary rebuilds.

### Automatic Tracking
Computed signals automatically discover their dependencies. No manual subscription management.

### Works Everywhere
Pure Dart with no framework dependencies. Use with Jaspr, Flutter, or any Dart project.

## Quick Start

Add to your `pubspec.yaml`:

```
dependencies:
  duxt_signals: ^0.1.2
```

Core concepts at a glance:

```
import 'package:duxt_signals/duxt_signals.dart';

// Signal - reactive state
final name = signal('John');

// Computed - derived value, auto-updates
final greeting = computed(() => 'Hello, ${name()}!');

// Effect - runs when dependencies change
effect(() => print(greeting()));

// Form field with validation
final email = formField('', validators: [
  required(),
  email('Invalid email'),
]);
```

## Next Steps

- [Getting Started](/duxt-signals/getting-started) - Installation and setup
- [Signals](/duxt-signals/signals) - Deep dive into the Signal API
- [Computed](/duxt-signals/computed) - Derived reactive values
- [Effects](/duxt-signals/effects) - Side effects and subscriptions
- [Forms](/duxt-signals/forms) - Form state and validation
- [Examples](/duxt-signals/examples) - Real-world patterns
