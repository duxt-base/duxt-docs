---
title: Getting Started
description: Install and start using duxt_icons.
layout: icons-layout
order: 2
---

# Getting Started

## Installation

Add duxt_icons to your `pubspec.yaml`:

```
dependencies:
  duxt_icons: ^0.1.0
```

Then run:

```
dart pub get
```

## Basic Setup

### 1. Preload Icons

Before using `Icon()`, preload the icons you need. This fetches SVG data from the Iconify API and caches it locally.

```
import 'package:duxt_icons/duxt_icons.dart';

Future<void> main() async {
  // Preload icons you'll use
  await IconResolver.instance.preload([
    'lucide:home',
    'lucide:settings',
    'lucide:user',
    'lucide:search',
  ]);

  // Start your app...
}
```

### 2. Use Icon()

Once preloaded, `Icon()` is synchronous — no `await` needed:

```
// In any component's build method:
Icon('lucide:home')
Icon('lucide:settings', size: 20)
Icon('lucide:user', className: 'text-blue-500')
```

### 3. Use IconNames Constants

For IDE autocomplete and typo prevention, use the built-in constants:

```
Icon(IconNames.home)
Icon(IconNames.settings, size: 20)
Icon(IconNames.search, className: 'w-5 h-5')
```

## Using with Duxt HTML

Duxt Icons works naturally with duxt_html components:

```
import 'package:duxt_html/duxt_html.dart';
import 'package:duxt_icons/duxt_icons.dart';

Button(
  className: 'flex items-center gap-2 px-4 py-2 bg-blue-500 text-white rounded',
  children: [
    Icon(IconNames.download, size: 16),
    Text('Download'),
  ],
)
```

## Navigation Example

```
Nav(
  className: 'flex items-center gap-6',
  children: [
    A(href: '/', children: [
      Icon(IconNames.home, size: 20),
      Text('Home'),
    ]),
    A(href: '/settings', children: [
      Icon(IconNames.settings, size: 20),
      Text('Settings'),
    ]),
    A(href: '/profile', children: [
      Icon(IconNames.user, size: 20),
      Text('Profile'),
    ]),
  ],
)
```

## Fallback Mode

If an icon hasn't been preloaded, `Icon()` automatically renders an `<iconify-icon>` web component instead. For this to work, add the Iconify script to your page head:

```
Document.head(children: [
  iconScript(), // Adds Iconify CDN script
]);
```

This is a safety net — for production, always preload your icons to avoid client-side fetching.

## Mixing Icon Sets

You're not limited to one icon set. Mix and match freely:

```
await IconResolver.instance.preload([
  'lucide:home',           // Lucide
  'mdi:account',           // Material Design Icons
  'heroicons:star',        // Heroicons
  'simple-icons:github',   // Brand logos
  'ph:globe',              // Phosphor
]);

// Use them all:
Icon('lucide:home')
Icon('mdi:account', size: 24)
Icon('heroicons:star', className: 'text-yellow-500')
Icon('simple-icons:github', size: 20)
Icon('ph:globe', size: 32)
```

## Next Steps

- [Icon Component](/duxt-icons/icon-component) — Full API and parameters
- [Providers](/duxt-icons/providers) — Browse available icon sets
- [Caching](/duxt-icons/caching) — Production caching setup
