---
title: Duxt Icons
description: Icon components for Jaspr with 200K+ icons from Iconify.
layout: icons-layout
order: 1
---

# Duxt Icons

**200,000+ icons for Jaspr** — a single `Icon()` component that renders inline SVG for SSR, with automatic web component fallback for SPA.

## What is Duxt Icons?

Duxt Icons gives you access to every icon set in the Iconify ecosystem through one consistent API. Icons are fetched once at build/startup time, cached locally, and rendered as inline SVG with zero runtime API calls.

```
Icon('lucide:home')
Icon('mdi:account', size: 32)
Icon('heroicons:star', className: 'text-yellow-500')
```

## How It Works

```
Icon('lucide:home')
       |
       v
 IconResolver cache hit?
    |-- YES -> inline <svg> (SSR-friendly, no JS)
    |-- NO  -> <iconify-icon> web component (needs client JS)
```

1. **Preload** icons at startup — fetches SVG data from Iconify API once
2. **Cache locally** — saved to `.duxt_icons_cache/` on disk, zero API calls after first run
3. **Render inline** — `Icon()` is sync, outputs `<svg>` directly into your HTML

## Why Duxt Icons?

### One Component, All Icons
No more mixing icon approaches. One `Icon()` function covers Lucide, Material, Heroicons, Phosphor, and 150+ more sets.

### SSR-First
Icons render as inline `<svg>` — no client-side JavaScript, no layout shift, perfect for static sites.

### Local Caching
Icons are cached to disk after first fetch. Production deployments make zero external API calls.

### Lightweight
No dependency on duxt_html. Just `jaspr` and `http`.

## Quick Start

Add to your `pubspec.yaml`:

```
dependencies:
  duxt_icons: ^0.1.0
```

Preload and use:

```
import 'package:duxt_icons/duxt_icons.dart';

// At startup (once):
await IconResolver.instance.preload([
  IconNames.home,
  IconNames.settings,
  IconNames.user,
]);

// Anywhere in your components — sync, no await:
Icon(IconNames.home)
Icon(IconNames.settings, size: 20, className: 'text-gray-500')
Icon('mdi:account-circle', size: 32)
```

## Available Icon Sets

20 popular sets are listed in `IconProviders.popular`. Here are the highlights:

| Prefix | Set | Icons | License |
|--------|-----|-------|---------|
| `lucide` | Lucide | 1,541 | ISC |
| `mdi` | Material Design Icons | 7,447 | Apache-2.0 |
| `tabler` | Tabler Icons | 5,738 | MIT |
| `ph` | Phosphor Icons | 7,896 | MIT |
| `heroicons` | Heroicons | 888 | MIT |
| `material-symbols` | Material Symbols | 15,118 | Apache-2.0 |
| `simple-icons` | Simple Icons (brands) | 3,393 | CC0 1.0 |
| `carbon` | Carbon (IBM) | 2,139 | Apache-2.0 |

Browse all 150+ sets at [icon-sets.iconify.design](https://icon-sets.iconify.design/).

## Next Steps

- [Getting Started](/duxt-icons/getting-started) — Installation and setup
- [Icon Component](/duxt-icons/icon-component) — Full `Icon()` API
- [Providers](/duxt-icons/providers) — Discover and browse icon sets
- [Caching](/duxt-icons/caching) — Local cache and production setup
