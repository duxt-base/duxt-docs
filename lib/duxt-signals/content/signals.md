---
title: Signals
description: Core Signal API - create, read, write, and listen to reactive state
layout: signals-layout
order: 3
---

# Signals

Signals are the core building block of duxt_signals. They hold a value and notify listeners when changed.

## Creating Signals

Use the `signal()` function to create a signal:

```
// Basic types
final count = signal(0);
final name = signal('John');
final isActive = signal(true);

// Complex types
final user = signal<User?>(null);
final items = signal<List<String>>([]);
final config = signal<Map<String, dynamic>>({});
```

## Reading Values

### Call Syntax (Preferred)

```
final count = signal(0);
print(count()); // 0
```

### Property Syntax

```
print(count.value); // 0
```

### Peek (No Tracking)

Read without creating a dependency:

```
print(count.peek()); // 0
```

Use `peek()` in event handlers or logging where you don't want to track dependencies.

## Writing Values

### Set

Replace the value:

```
count.set(5);
// or
count.value = 5;
```

### Update

Update based on the previous value:

```
count.update((v) => v + 1);

// Works great with collections
items.update((list) => [...list, 'new item']);
items.update((list) => list.where((i) => i != 'remove').toList());
```

## Listening to Changes

Subscribe to value changes:

```
final unsubscribe = count.listen((value) {
  print('Count changed to: $value');
});

count.set(5); // Prints: "Count changed to: 5"

// Stop listening
unsubscribe();
count.set(10); // Nothing printed
```

## Disposing Signals

Clean up when done:

```
count.dispose();
print(count.isDisposed); // true

// After dispose, set/update are no-ops
count.set(100); // Does nothing
```

## Change Detection

Signals only notify when the value actually changes:

```
final count = signal(5);
var notifications = 0;

count.listen((_) => notifications++);

count.set(5); // Same value - no notification
count.set(5); // Same value - no notification
count.set(6); // Different value - notification!

print(notifications); // 1
```

## Working with Objects

For objects, signals compare by reference:

```
final user = signal(User(name: 'John'));

// This triggers notification (new object)
user.set(User(name: 'Jane'));

// This also triggers (even if same data)
user.set(User(name: 'Jane'));

// Use update for in-place modifications
user.update((u) => User(name: u.name.toUpperCase()));
```

## Best Practices

### Keep Signals Focused
Create separate signals for separate concerns:

```
// Good
final firstName = signal('');
final lastName = signal('');
final email = signal('');

// Avoid
final formData = signal({'firstName': '', 'lastName': '', 'email': ''});
```

### Use Computed for Derived State
Don't duplicate state:

```
final firstName = signal('John');
final lastName = signal('Doe');

// Good - derived
final fullName = computed(() => '${firstName()} ${lastName()}');

// Avoid - duplicated
final fullName = signal('John Doe');
// Now you have to manually keep it in sync
```

### Dispose When Done
Clean up signals to prevent memory leaks:

```
class MyComponent {
  final count = signal(0);

  void dispose() {
    count.dispose();
  }
}
```
