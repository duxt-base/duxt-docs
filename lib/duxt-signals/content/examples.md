---
title: Examples
description: Real-world patterns and examples using duxt_signals
layout: signals-layout
order: 7
---

# Examples

Real-world patterns for using duxt_signals effectively.

## Counter

The classic example:

```dart
final count = signal(0);

void increment() => count.update((v) => v + 1);
void decrement() => count.update((v) => v - 1);
void reset() => count.set(0);

// In UI
div([
  button(onClick: decrement, [text('-')]),
  span([text('${count()}')]),
  button(onClick: increment, [text('+')]),
]);
```

## Todo List

```dart
// State
final todos = signal<List<Todo>>([]);
final filter = signal<TodoFilter>(TodoFilter.all);

// Computed
final filteredTodos = computed(() {
  final list = todos();
  switch (filter()) {
    case TodoFilter.active:
      return list.where((t) => !t.completed).toList();
    case TodoFilter.completed:
      return list.where((t) => t.completed).toList();
    default:
      return list;
  }
});

final activeCount = computed(() =>
  todos().where((t) => !t.completed).length
);

// Actions
void addTodo(String text) {
  todos.update((list) => [...list, Todo(text: text)]);
}

void toggleTodo(int id) {
  todos.update((list) => list.map((t) =>
    t.id == id ? t.copyWith(completed: !t.completed) : t
  ).toList());
}

void removeTodo(int id) {
  todos.update((list) => list.where((t) => t.id != id).toList());
}
```

## Shopping Cart

```dart
// State
final cartItems = signal<List<CartItem>>([]);

// Computed
final itemCount = computed(() =>
  cartItems().fold(0, (sum, item) => sum + item.quantity)
);

final subtotal = computed(() =>
  cartItems().fold(0.0, (sum, item) => sum + item.price * item.quantity)
);

final tax = computed(() => subtotal() * 0.1);

final total = computed(() => subtotal() + tax());

// Actions
void addItem(Product product) {
  cartItems.update((items) {
    final existing = items.indexWhere((i) => i.productId == product.id);
    if (existing >= 0) {
      return items.map((i) => i.productId == product.id
        ? i.copyWith(quantity: i.quantity + 1)
        : i
      ).toList();
    }
    return [...items, CartItem(product: product, quantity: 1)];
  });
}

void removeItem(int productId) {
  cartItems.update((items) =>
    items.where((i) => i.productId != productId).toList()
  );
}

void updateQuantity(int productId, int quantity) {
  if (quantity <= 0) {
    removeItem(productId);
    return;
  }
  cartItems.update((items) => items.map((i) =>
    i.productId == productId ? i.copyWith(quantity: quantity) : i
  ).toList());
}
```

## User Authentication

```dart
// State
final currentUser = signal<User?>(null);
final authToken = signal<String?>(null);
final isLoading = signal(false);

// Computed
final isAuthenticated = computed(() => currentUser() != null);
final userDisplayName = computed(() => currentUser()?.name ?? 'Guest');

// Actions
Future<void> login(String email, String password) async {
  isLoading.set(true);
  try {
    final response = await Api.post('/auth/login', body: {
      'email': email,
      'password': password,
    });
    authToken.set(response['token']);
    currentUser.set(User.fromJson(response['user']));
  } finally {
    isLoading.set(false);
  }
}

void logout() {
  batch(() {
    currentUser.set(null);
    authToken.set(null);
  });
}

// Persist auth token
effect(() {
  final token = authToken();
  if (token != null) {
    localStorage.setItem('auth_token', token);
  } else {
    localStorage.removeItem('auth_token');
  }
});
```

## Search with Debounce

```dart
final searchQuery = signal('');
final searchResults = signal<List<Result>>([]);
final isSearching = signal(false);

// Debounced search effect
Timer? _debounceTimer;

effect(() {
  final query = searchQuery();

  _debounceTimer?.cancel();

  if (query.isEmpty) {
    searchResults.set([]);
    return;
  }

  _debounceTimer = Timer(Duration(milliseconds: 300), () async {
    isSearching.set(true);
    try {
      final results = await Api.get('/search', query: {'q': query});
      searchResults.set(results);
    } finally {
      isSearching.set(false);
    }
  });
});
```

## Theme Switcher

```dart
final isDarkMode = signal(false);

// Computed
final theme = computed(() => isDarkMode() ? darkTheme : lightTheme);

final backgroundColor = computed(() => theme().backgroundColor);
final textColor = computed(() => theme().textColor);

// Toggle
void toggleTheme() => isDarkMode.update((v) => !v);

// Persist preference
effect(() {
  localStorage.setItem('dark_mode', isDarkMode().toString());
});

// Apply to DOM
effect(() {
  document.body?.setAttribute(
    'data-theme',
    isDarkMode() ? 'dark' : 'light',
  );
});
```

## Form with Server Validation

```dart
final usernameField = formField('', validators: [
  required('Username is required'),
  minLength(3, 'At least 3 characters'),
]);

final serverError = signal<String?>(null);
final isChecking = signal(false);

// Check username availability
effect(() {
  final username = usernameField();

  if (username.length < 3) {
    serverError.set(null);
    return;
  }

  isChecking.set(true);

  Api.get('/users/check', query: {'username': username})
    .then((response) {
      if (!response['available']) {
        serverError.set('Username is taken');
      } else {
        serverError.set(null);
      }
    })
    .whenComplete(() => isChecking.set(false));
});

// Combined error
final usernameError = computed(() =>
  usernameField.error ?? serverError()
);
```

## Pagination

```dart
final currentPage = signal(1);
final pageSize = signal(10);
final totalItems = signal(0);

// Computed
final totalPages = computed(() =>
  (totalItems() / pageSize()).ceil()
);

final hasNextPage = computed(() => currentPage() < totalPages());
final hasPrevPage = computed(() => currentPage() > 1);

// Actions
void nextPage() {
  if (hasNextPage()) {
    currentPage.update((p) => p + 1);
  }
}

void prevPage() {
  if (hasPrevPage()) {
    currentPage.update((p) => p - 1);
  }
}

void goToPage(int page) {
  if (page >= 1 && page <= totalPages()) {
    currentPage.set(page);
  }
}

// Load data on page change
effect(() {
  final page = currentPage();
  final size = pageSize();

  loadItems(page: page, size: size);
});
```

## Undo/Redo

```dart
final history = signal<List<State>>([initialState]);
final historyIndex = signal(0);

// Current state
final currentState = computed(() => history()[historyIndex()]);

// Can undo/redo
final canUndo = computed(() => historyIndex() > 0);
final canRedo = computed(() => historyIndex() < history().length - 1);

// Actions
void pushState(State newState) {
  final index = historyIndex();
  final current = history();

  // Remove any future states
  final newHistory = current.sublist(0, index + 1);
  newHistory.add(newState);

  batch(() {
    history.set(newHistory);
    historyIndex.set(newHistory.length - 1);
  });
}

void undo() {
  if (canUndo()) {
    historyIndex.update((i) => i - 1);
  }
}

void redo() {
  if (canRedo()) {
    historyIndex.update((i) => i + 1);
  }
}
```
