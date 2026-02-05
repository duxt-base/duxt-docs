---
title: Transactions
description: Database transactions and raw queries in Duxt ORM.
layout: orm-layout
order: 5
---

# Transactions & Raw Queries

## Transactions

Wrap multiple operations in a transaction for atomicity:

```
await DuxtOrm.transaction((tx) async {
  // Create user
  await tx.query(
    'INSERT INTO users (email, name) VALUES (?, ?)',
    ['test@example.com', 'Test User'],
  );

  // Get the new user's ID
  final userId = await tx.lastInsertId();

  // Create profile
  await tx.query(
    'INSERT INTO profiles (user_id, bio) VALUES (?, ?)',
    [userId, 'Hello world!'],
  );

  // Create initial settings
  await tx.query(
    'INSERT INTO user_settings (user_id, theme) VALUES (?, ?)',
    [userId, 'dark'],
  );
});
```

### Auto Commit/Rollback

- **Success**: Transaction auto-commits when the callback completes
- **Error**: Transaction auto-rolls back if an exception is thrown

```
try {
  await DuxtOrm.transaction((tx) async {
    await tx.query('INSERT INTO accounts (balance) VALUES (?)', [1000]);
    await tx.query('UPDATE accounts SET balance = balance - ? WHERE id = ?', [500, 1]);

    // This will cause rollback
    throw Exception('Something went wrong');
  });
} catch (e) {
  print('Transaction rolled back: $e');
}
```

### Manual Commit/Rollback

For more control:

```
final tx = await DuxtOrm.beginTransaction();

try {
  await tx.query('INSERT INTO logs (message) VALUES (?)', ['Started']);
  await tx.query('UPDATE counters SET value = value + 1 WHERE name = ?', ['visits']);

  // Explicit commit
  await tx.commit();
} catch (e) {
  // Explicit rollback
  await tx.rollback();
  rethrow;
}
```

## Raw Queries

### SELECT Queries

```
final results = await DuxtOrm.raw(
  'SELECT * FROM users WHERE email = ?',
  ['test@example.com'],
);

for (final row in results) {
  print('${row['id']}: ${row['name']}');
}
```

### Complex SELECT

```
final results = await DuxtOrm.raw('''
  SELECT
    u.id,
    u.name,
    COUNT(p.id) as post_count
  FROM users u
  LEFT JOIN posts p ON p.user_id = u.id
  WHERE u.is_active = ?
  GROUP BY u.id
  HAVING post_count > ?
  ORDER BY post_count DESC
  LIMIT ?
''', [1, 5, 10]);
```

### INSERT/UPDATE/DELETE

Use `execute()` for statements that don't return rows:

```
// Returns number of affected rows
final affected = await DuxtOrm.execute(
  'UPDATE users SET is_active = ? WHERE last_login < ?',
  [0, '2023-01-01'],
);

print('Deactivated $affected users');
```

### Bulk Insert

```
final users = [
  ['john@example.com', 'John'],
  ['jane@example.com', 'Jane'],
  ['bob@example.com', 'Bob'],
];

for (final user in users) {
  await DuxtOrm.execute(
    'INSERT INTO users (email, name) VALUES (?, ?)',
    user,
  );
}
```

Or with a single statement (database-specific syntax):

```
// PostgreSQL
await DuxtOrm.execute('''
  INSERT INTO users (email, name) VALUES
  ('john@example.com', 'John'),
  ('jane@example.com', 'Jane'),
  ('bob@example.com', 'Bob')
''');
```

## Parameter Binding

Always use parameter binding to prevent SQL injection:

```
// GOOD - Parameters are escaped
await DuxtOrm.raw(
  'SELECT * FROM users WHERE email = ?',
  [userInput],
);

// BAD - SQL injection vulnerability
await DuxtOrm.raw(
  'SELECT * FROM users WHERE email = "$userInput"',  // DON'T DO THIS
);
```

## Database-Specific Features

### PostgreSQL

```
// RETURNING clause
final result = await DuxtOrm.raw(
  'INSERT INTO users (email, name) VALUES (\$1, \$2) RETURNING id, created_at',
  ['test@example.com', 'Test'],
);
final newId = result.first['id'];

// JSONB operations
await DuxtOrm.raw(
  "SELECT * FROM products WHERE metadata->>'category' = \$1",
  ['electronics'],
);
```

### MySQL

```
// Get last insert ID
await DuxtOrm.execute(
  'INSERT INTO users (email, name) VALUES (?, ?)',
  ['test@example.com', 'Test'],
);
final id = await DuxtOrm.lastInsertId();

// ON DUPLICATE KEY UPDATE
await DuxtOrm.execute('''
  INSERT INTO counters (name, value) VALUES (?, ?)
  ON DUPLICATE KEY UPDATE value = value + 1
''', ['page_views', 1]);
```

### SQLite

```
// UPSERT (SQLite 3.24+)
await DuxtOrm.execute('''
  INSERT INTO settings (key, value) VALUES (?, ?)
  ON CONFLICT(key) DO UPDATE SET value = excluded.value
''', ['theme', 'dark']);

// Get changes count
final changes = await DuxtOrm.raw('SELECT changes()');
```

## Connection Management

```
// Close connection when done
await DuxtOrm.close();

// Check if connected
if (DuxtOrm.isConnected) {
  // ...
}

// Reconnect if needed
await DuxtOrm.reconnect();
```
