---
title: Computed
description: Derived signals that automatically update when dependencies change
layout: signals-layout
order: 4
---

# Computed Signals

Computed signals derive their value from other signals and automatically update when dependencies change.

## Creating Computed Signals

```
final firstName = signal('John');
final lastName = signal('Doe');

final fullName = computed(() => '${firstName()} ${lastName()}');

print(fullName()); // "John Doe"

firstName.set('Jane');
print(fullName()); // "Jane Doe" - auto updated!
```

## Automatic Dependency Tracking

Computed signals automatically track which signals they read:

```
final a = signal(1);
final b = signal(2);
final c = signal(3);

final sum = computed(() => a() + b());
// sum depends on a and b, but NOT c

a.set(10); // sum recomputes
b.set(20); // sum recomputes
c.set(30); // sum does NOT recompute
```

## Chaining Computed Signals

Computed signals can depend on other computed signals:

```
final price = signal(100);
final quantity = signal(2);
final taxRate = signal(0.1);

final subtotal = computed(() => price() * quantity());
final tax = computed(() => subtotal() * taxRate());
final total = computed(() => subtotal() + tax());

print(total()); // 220

quantity.set(3);
print(total()); // 330 - all computed values updated
```

## Conditional Dependencies

Dependencies are tracked dynamically based on what's actually read:

```
final useMetric = signal(true);
final meters = signal(100);
final feet = signal(328);

final distance = computed(() {
  if (useMetric()) {
    return '${meters()} meters';
  } else {
    return '${feet()} feet';
  }
});

print(distance()); // "100 meters"
// Only meters is a dependency right now

useMetric.set(false);
print(distance()); // "328 feet"
// Now only feet is a dependency
```

## Read-Only

Computed signals are read-only:

```
final doubled = computed(() => count() * 2);

doubled.set(10); // Throws UnsupportedError!
doubled.update((v) => v + 1); // Throws UnsupportedError!
```

## Listening to Computed

You can listen to computed signals just like regular signals:

```
final count = signal(0);
final doubled = computed(() => count() * 2);

doubled.listen((value) {
  print('Doubled: $value');
});

count.set(5); // Prints: "Doubled: 10"
```

## Memoization

Computed signals cache their value and only recompute when dependencies change:

```
var computeCount = 0;

final expensive = computed(() {
  computeCount++;
  return heavyCalculation(input());
});

// First read - computes
print(expensive());
print(computeCount); // 1

// Second read - cached
print(expensive());
print(computeCount); // 1 (no recompute)

// Dependency changed - recomputes
input.set(newValue);
print(expensive());
print(computeCount); // 2
```

## Best Practices

### Keep Computations Pure
Computed functions should be pure (no side effects):

```
// Good
final total = computed(() => items().fold(0, (sum, i) => sum + i.price));

// Avoid
final total = computed(() {
  print('Computing total...'); // Side effect!
  return items().fold(0, (sum, i) => sum + i.price);
});
```

### Use Effects for Side Effects
When you need side effects, use `effect()`:

```
effect(() {
  print('Total: ${total()}');
});
```

### Avoid Heavy Computations
If a computation is expensive, consider using `untracked()` for parts that don't need tracking:

```
final result = computed(() {
  final config = untracked(() => expensiveConfig());
  return process(data(), config);
});
```
