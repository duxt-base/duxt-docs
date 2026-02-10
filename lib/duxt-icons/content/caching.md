---
title: Caching
description: Local caching for zero API calls in production.
layout: icons-layout
order: 5
---

# Caching

Duxt Icons uses a two-level cache to ensure zero API calls in production.

## How Caching Works

```
preload() called
       |
       v
 Memory cache hit? --> YES --> done (instant)
       |
       NO
       |
       v
 Disk cache hit? --> YES --> load to memory, done
       |
       NO
       |
       v
 Fetch from Iconify API --> save to disk + memory
```

### Level 1: Memory Cache

In-memory `Map` for instant sync lookups. This is what `Icon()` reads from.

### Level 2: Disk Cache

JSON files stored in `.duxt_icons_cache/` directory. Persists across app restarts so the Iconify API is only called once per icon set.

## Cache Directory

By default, icons are cached to `.duxt_icons_cache/` in your project root:

```
.duxt_icons_cache/
  lucide.json      # All fetched Lucide icons
  mdi.json         # All fetched Material Design icons
  heroicons.json   # All fetched Heroicons
```

### Custom Cache Location

```
IconResolver.instance.setCacheDir('path/to/cache');
```

## Production Setup

### Option 1: Commit the Cache (Recommended)

The simplest approach — commit `.duxt_icons_cache/` to version control:

1. Run your app once in development to populate the cache
2. Commit the `.duxt_icons_cache/` directory
3. In production, call `loadFromDisk()` at startup — zero API calls

```
// In production:
await IconResolver.instance.loadFromDisk();

// All icons are now available from disk cache
Icon(IconNames.home) // works instantly
```

### Option 2: CI/CD Cache Generation

Add a build step that preloads icons:

```
// scripts/preload_icons.dart
import 'package:duxt_icons/duxt_icons.dart';

Future<void> main() async {
  await IconResolver.instance.preload([
    ...IconNames.all,
    'mdi:account',
    'simple-icons:github',
    // ... all icons your app uses
  ]);
  print('Icons cached to .duxt_icons_cache/');
}
```

Run it in CI before deployment:

```
dart run scripts/preload_icons.dart
```

### Option 3: Manual Registration

For maximum control, register icons directly with their SVG data — no network or disk I/O at all:

```
IconResolver.instance.register(
  'custom:logo',
  IconData(
    body: '<path d="M12 2L2 22h20L12 2z"/>',
    width: 24,
    height: 24,
  ),
);

// Use immediately:
Icon('custom:logo')
```

## Loading from Disk

`loadFromDisk()` reads all cached JSON files into memory. Call it once at startup:

```
Future<void> main() async {
  // Load all previously cached icons from disk
  await IconResolver.instance.loadFromDisk();

  // Now Icon() can render any previously cached icon
  // without any API calls
}
```

This is separate from `preload()` — it only reads what's already on disk, never makes API calls.

## Cache Management

### Clear Everything

```
// Clears both memory and disk cache
await IconResolver.instance.clearCache();
```

### Clear Memory Only

```
// Clears memory cache, disk cache remains
IconResolver.instance.clearMemoryCache();
```

### Force Refresh

```
// Skip disk cache, fetch fresh from API
await IconResolver.instance.preload(
  ['lucide:home'],
  useLocalCache: false,
);
```

## Preload Flow

When you call `preload()`:

1. Icons are grouped by prefix (one API call per prefix)
2. For each prefix, checks disk cache first
3. If disk cache has all requested icons, loads from disk
4. Otherwise, fetches from `https://api.iconify.design/{prefix}.json?icons={names}`
5. Saves API response to disk cache
6. Resolves individual icons into memory cache

## Checking Cache State

```
// Check if a specific icon is cached
if (IconResolver.instance.has('lucide:home')) {
  print('Icon is cached and ready');
}

// Get icon data (returns null if not cached)
final data = IconResolver.instance.get('lucide:home');
if (data != null) {
  print('SVG body: ${data.body}');
  print('Size: ${data.width}x${data.height}');
}
```

## Next Steps

- [API Reference](/duxt-icons/api-reference) — Full API docs
