---
title: Effects
description: Run side effects when signals change
layout: signals-layout
order: 5
---

# Effects

Effects run side effects when signals change. Use them for logging, DOM updates, API calls, or any other action that should happen in response to state changes.

## Creating Effects

```dart
final count = signal(0);

effect(() {
  print('Count is now: ${count()}');
});
// Immediately prints: "Count is now: 0"

count.set(5);
// Prints: "Count is now: 5"
```

## Automatic Dependency Tracking

Effects automatically track which signals they read:

```dart
final name = signal('John');
final age = signal(25);

effect(() {
  print('Name: ${name()}');
  // Only tracks name, not age
});

name.set('Jane'); // Effect runs
age.set(26);      // Effect does NOT run
```

## Cleanup

The `effect()` function returns a dispose function:

```dart
final dispose = effect(() {
  print('Count: ${count()}');
});

count.set(1); // Effect runs
count.set(2); // Effect runs

dispose(); // Stop the effect

count.set(3); // Effect does NOT run
```

## Use Cases

### Logging

```dart
effect(() {
  console.log({
    'user': currentUser()?.toJson(),
    'cart': cartItems().map((i) => i.id).toList(),
  });
});
```

### API Calls

```dart
effect(() {
  final query = searchQuery();
  if (query.isNotEmpty) {
    fetchResults(query).then((results) {
      searchResults.set(results);
    });
  }
});
```

### Local Storage

```dart
effect(() {
  localStorage.setItem('settings', jsonEncode(settings()));
});
```

### DOM Updates (Jaspr)

```dart
effect(() {
  final theme = isDarkMode() ? 'dark' : 'light';
  document.body?.setAttribute('data-theme', theme);
});
```

## Batch Updates

Use `batch()` to group multiple signal updates:

```dart
final a = signal(1);
final b = signal(2);

effect(() {
  print('a=${a()}, b=${b()}');
});
// Prints: "a=1, b=2"

// Without batch - effect runs twice
a.set(10); // Effect runs
b.set(20); // Effect runs again

// With batch - effect runs once
batch(() {
  a.set(100);
  b.set(200);
});
// Effect runs once: "a=100, b=200"
```

## Untracked Reads

Use `untracked()` to read signals without creating dependencies:

```dart
effect(() {
  final name = user().name; // Creates dependency
  final config = untracked(() => appConfig()); // No dependency

  print('User: $name, Config: $config');
});
```

## Best Practices

### Keep Effects Focused
Each effect should do one thing:

```dart
// Good
effect(() {
  localStorage.setItem('user', jsonEncode(user()));
});

effect(() {
  analytics.track('user_changed', user());
});

// Avoid
effect(() {
  localStorage.setItem('user', jsonEncode(user()));
  analytics.track('user_changed', user());
  sendToServer(user());
  // Too many responsibilities
});
```

### Avoid Modifying Signals in Effects
Don't create infinite loops:

```dart
// Dangerous!
effect(() {
  count.set(count() + 1); // Infinite loop!
});

// If you need derived state, use computed
final doubled = computed(() => count() * 2);
```

### Dispose When Done
Always dispose effects when they're no longer needed:

```dart
class MyComponent {
  late final void Function() _disposeEffect;

  void init() {
    _disposeEffect = effect(() {
      // ...
    });
  }

  void dispose() {
    _disposeEffect();
  }
}
```
