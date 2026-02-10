---
title: API Reference
description: Complete API reference for duxt_icons.
layout: icons-layout
order: 6
---

# API Reference

## Icon()

Renders an icon from the Iconify ecosystem.

```
Component Icon(
  String icon, {
  double? size,
  String? className,
  String? style,
  String? id,
  Map<String, String>? attributes,
  Map<String, EventCallback>? events,
  Key? key,
})
```

**Parameters:**

- `icon` — Icon ID in `prefix:name` format (e.g., `'lucide:home'`)
- `size` — Width and height in pixels
- `className` — CSS classes
- `style` — Inline CSS styles
- `id` — HTML id attribute
- `attributes` — Additional HTML attributes
- `events` — Event listeners (web component fallback only)
- `key` — Jaspr component key

---

## iconScript()

Returns a `<script>` component that loads the Iconify web component from CDN.

```
Component iconScript({String version = '2.1.0'})
```

Only needed if you use icons without preloading (fallback mode).

---

## IconResolver

Singleton that manages icon fetching and caching.

### Properties

```
IconResolver.instance  // Singleton instance
```

### Methods

#### preload()

Fetches icons from the Iconify API and caches them locally.

```
Future<void> preload(
  List<String> icons, {
  bool useLocalCache = true,
})
```

Groups icons by prefix, checks disk cache first, fetches from API if needed.

#### loadFromDisk()

Loads all cached icon data from disk into memory. No API calls.

```
Future<void> loadFromDisk()
```

#### get()

Synchronous lookup from cache.

```
IconData? get(String icon)
```

Returns `null` if the icon hasn't been preloaded.

#### has()

Checks if an icon is available in the cache.

```
bool has(String icon)
```

#### register()

Manually registers an icon with pre-built SVG data.

```
void register(String icon, IconData data)
```

#### setCacheDir()

Sets the local cache directory path.

```
void setCacheDir(String path)
```

Default: `.duxt_icons_cache`

#### clearCache()

Clears both in-memory and disk cache.

```
Future<void> clearCache()
```

#### clearMemoryCache()

Clears only the in-memory cache, preserving disk cache.

```
void clearMemoryCache()
```

#### parseIconId() (static)

Splits an icon ID into prefix and name.

```
static (String prefix, String name) parseIconId(String icon)
```

Throws `ArgumentError` if the format is invalid.

---

## IconData

Represents the SVG data for a single icon.

```
class IconData {
  final String body;   // Inner SVG content
  final int width;     // Default: 24
  final int height;    // Default: 24
}
```

### Constructors

```
const IconData({
  required String body,
  int width = 24,
  int height = 24,
})

factory IconData.fromJson(Map<String, dynamic> json)
```

### Methods

```
Map<String, dynamic> toJson()
```

---

## IconifyJson

Parses an Iconify API JSON response. Handles both direct icons and aliases.

```
factory IconifyJson.fromJson(Map<String, dynamic> json)
```

### Methods

#### resolve()

Resolves an icon name to its `IconData`, following alias chains (max depth 10).

```
IconData? resolve(String name)
```

#### names

Returns all icon names (both direct and aliases).

```
Iterable<String> get names
```

---

## IconNames

Pre-defined constants for ~70 common Lucide icons.

```
abstract final class IconNames {
  // Navigation
  static const String home = 'lucide:home';
  static const String menu = 'lucide:menu';
  static const String arrowLeft = 'lucide:arrow-left';
  static const String chevronDown = 'lucide:chevron-down';
  // ...

  // Actions
  static const String search = 'lucide:search';
  static const String plus = 'lucide:plus';
  static const String edit = 'lucide:edit';
  static const String trash = 'lucide:trash';
  static const String copy = 'lucide:copy';
  // ...

  // Status
  static const String info = 'lucide:info';
  static const String alertCircle = 'lucide:alert-circle';
  static const String checkCircle = 'lucide:check-circle';
  // ...

  // Communication
  static const String mail = 'lucide:mail';
  static const String bell = 'lucide:bell';
  static const String send = 'lucide:send';
  // ...

  // Files
  static const String file = 'lucide:file';
  static const String folder = 'lucide:folder';
  static const String image = 'lucide:image';
  static const String database = 'lucide:database';
  // ...

  // UI
  static const String settings = 'lucide:settings';
  static const String user = 'lucide:user';
  static const String heart = 'lucide:heart';
  static const String star = 'lucide:star';
  static const String code = 'lucide:code';
  static const String terminal = 'lucide:terminal';
  // ...

  static List<String> get all => [...]; // All 70 constants
}
```

---

## IconProviders

Registry of available icon providers.

### Properties

#### popular

20 curated, well-maintained icon sets. No API call needed.

```
static const List<IconProvider> popular
```

### Methods

#### byCategory()

Filters popular providers by category.

```
static List<IconProvider> byCategory(String category)
```

Categories: `'General'`, `'Brands / Social'`, `'Flags'`, `'Emoji'`, `'Thematic'`

#### find()

Finds a provider by prefix.

```
static IconProvider? find(String prefix)
```

#### fetchAll()

Fetches all 150+ icon sets from the Iconify API.

```
static Future<List<IconProvider>> fetchAll()
```

---

## IconProvider

Metadata about an icon set.

```
class IconProvider {
  final String prefix;
  final String name;
  final int total;
  final String? author;
  final String? license;
  final String? category;
  final List<String> samples;
}
```

---

## Utility Functions

### replaceIDs()

Replaces internal SVG IDs with unique ones to prevent collisions.

```
String replaceIDs(String svgBody)
```

### buildSvgString()

Constructs a complete `<svg>` tag from icon body data.

```
String buildSvgString({
  required String body,
  required int width,
  required int height,
  double? size,
  String? className,
  String? style,
  String? id,
  Map<String, String>? attributes,
})
```
