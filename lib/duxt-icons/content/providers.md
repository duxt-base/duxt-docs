---
title: Providers
description: Discover and browse available icon sets.
layout: icons-layout
order: 4
---

# Icon Providers

Duxt Icons supports every icon set in the Iconify ecosystem — over 150 sets with 200,000+ icons. The `IconProviders` class helps you discover what's available.

## Browsing Providers

### Popular Sets

`IconProviders.popular` contains 20 curated, well-maintained sets — no API call needed:

```
for (final p in IconProviders.popular) {
  print('${p.prefix} - ${p.name} (${p.total} icons, ${p.license})');
}
```

### Filter by Category

```
// General purpose icons
final general = IconProviders.byCategory('General');

// Brand/social logos
final brands = IconProviders.byCategory('Brands / Social');

// Country flags
final flags = IconProviders.byCategory('Flags');

// Emoji
final emoji = IconProviders.byCategory('Emoji');
```

### Find a Specific Set

```
final provider = IconProviders.find('lucide');
if (provider != null) {
  print('${provider.name}: ${provider.total} icons');
  print('License: ${provider.license}');
  print('Samples: ${provider.samples.join(', ')}');
}
```

### Fetch All Sets

To discover all 150+ sets from the Iconify API:

```
final all = await IconProviders.fetchAll();
for (final p in all) {
  print('${p.prefix}: ${p.name} (${p.total} icons)');
}
```

## Popular Icon Sets

### General Purpose

| Prefix | Name | Icons | License | Style |
|--------|------|-------|---------|-------|
| `lucide` | Lucide | 1,541 | ISC | Outline stroke |
| `mdi` | Material Design Icons | 7,447 | Apache-2.0 | Filled |
| `tabler` | Tabler Icons | 5,738 | MIT | Outline stroke |
| `ph` | Phosphor Icons | 7,896 | MIT | Multiple weights |
| `heroicons` | Heroicons | 888 | MIT | Outline + Solid |
| `ri` | Remix Icon | 2,860 | Apache-2.0 | Line + Fill |
| `solar` | Solar Icons | 7,110 | CC BY 4.0 | Multiple styles |
| `material-symbols` | Material Symbols | 15,118 | Apache-2.0 | Variable weight |
| `ic` | Google Material Icons | 10,955 | Apache-2.0 | Filled |
| `carbon` | Carbon (IBM) | 2,139 | Apache-2.0 | Outline |
| `mingcute` | MingCute Icons | 4,248 | Apache-2.0 | Line + Fill |

### Brands and Logos

| Prefix | Name | Icons | License |
|--------|------|-------|---------|
| `simple-icons` | Simple Icons | 3,393 | CC0 1.0 |
| `logos` | SVG Logos | 1,834 | CC0 1.0 |
| `devicon` | Devicon | 860 | MIT |

### Flags

| Prefix | Name | Icons | License |
|--------|------|-------|---------|
| `circle-flags` | Circle Flags | 539 | MIT |
| `flagpack` | Flagpack | 514 | MIT |

### Emoji

| Prefix | Name | Icons | License |
|--------|------|-------|---------|
| `noto` | Noto Emoji | 3,663 | Apache-2.0 |
| `twemoji` | Twitter Emoji | 3,668 | MIT |

### Animated

| Prefix | Name | Icons | License |
|--------|------|-------|---------|
| `line-md` | Material Line (Animated) | 1,218 | MIT |

### Specialty

| Prefix | Name | Icons | License |
|--------|------|-------|---------|
| `game-icons` | Game Icons | 4,123 | CC BY 3.0 |

## Using Any Prefix

You don't need to "configure" a provider. Just use its prefix in the icon ID:

```
// These all work — any valid Iconify prefix is supported:
Icon('lucide:home')
Icon('mdi:account')
Icon('tabler:settings')
Icon('ph:globe')
Icon('heroicons:star')
Icon('ri:search-line')
Icon('solar:home-bold')
Icon('material-symbols:home')
Icon('carbon:dashboard')
Icon('simple-icons:dart')
Icon('circle-flags:al')
Icon('noto:rocket')
Icon('game-icons:crossed-swords')
```

Just make sure to preload them first:

```
await IconResolver.instance.preload([
  'lucide:home',
  'mdi:account',
  'simple-icons:dart',
]);
```

## IconProvider Properties

Each `IconProvider` has:

| Property | Type | Description |
|----------|------|-------------|
| `prefix` | `String` | The prefix for icon IDs (e.g., `'lucide'`) |
| `name` | `String` | Human-readable name |
| `total` | `int` | Number of icons in the set |
| `author` | `String?` | Author name |
| `license` | `String?` | License identifier |
| `category` | `String?` | Category grouping |
| `samples` | `List<String>` | Example icon names |

## Browsing Icons Visually

To browse icons and find the exact names you need, visit:

- [icon-sets.iconify.design](https://icon-sets.iconify.design/) — Search across all sets
- [lucide.dev/icons](https://lucide.dev/icons/) — Browse Lucide icons
- [fonts.google.com/icons](https://fonts.google.com/icons) — Browse Material Symbols

## Next Steps

- [Caching](/duxt-icons/caching) — Local cache and production setup
- [API Reference](/duxt-icons/api-reference) — Full API docs
