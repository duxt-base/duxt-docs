---
title: Icon Component
description: Full API reference for the Icon() component.
layout: icons-layout
order: 3
---

# Icon Component

The `Icon()` function is the main entry point for rendering icons. It returns a standard Jaspr `Component`.

## Signature

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

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `icon` | `String` | Icon ID in `prefix:name` format (e.g., `'lucide:home'`) |
| `size` | `double?` | Width and height in pixels. Overrides the icon's default size. |
| `className` | `String?` | CSS classes to apply to the SVG element. |
| `style` | `String?` | Inline CSS styles. |
| `id` | `String?` | HTML `id` attribute. |
| `attributes` | `Map<String, String>?` | Additional HTML attributes. |
| `events` | `Map<String, EventCallback>?` | Event listeners (only for web component fallback). |
| `key` | `Key?` | Jaspr component key. |

## Icon ID Format

Icons use the `prefix:name` format from Iconify:

```
'lucide:home'         // prefix = lucide, name = home
'mdi:account'         // prefix = mdi, name = account
'heroicons:star'      // prefix = heroicons, name = star
'simple-icons:github' // prefix = simple-icons, name = github
```

The prefix determines which icon set to use. The name is the specific icon within that set.

## Rendering Modes

### Inline SVG (Preloaded)

When the icon has been preloaded via `IconResolver.instance.preload()`, it renders as inline SVG:

```
<svg xmlns="http://www.w3.org/2000/svg"
     viewBox="0 0 24 24"
     width="24" height="24"
     aria-hidden="true" role="img">
  <path d="..." />
</svg>
```

Benefits:
- No client-side JavaScript required
- Works with SSR/static generation
- No layout shift
- Searchable by CSS selectors

### Web Component (Fallback)

When the icon is NOT cached, it renders as an Iconify web component:

```
<iconify-icon icon="lucide:home" width="24" height="24"></iconify-icon>
```

This requires the Iconify script in your page head:

```
Document.head(children: [
  iconScript(), // version defaults to 2.1.0
  // or specify a version:
  iconScript(version: '2.2.0'),
]);
```

## Examples

### Basic

```
Icon('lucide:home')
Icon('lucide:settings')
Icon('lucide:user')
```

### With Size

```
Icon('lucide:star', size: 16)  // 16x16
Icon('lucide:star', size: 24)  // 24x24 (default for most sets)
Icon('lucide:star', size: 32)  // 32x32
Icon('lucide:star', size: 48)  // 48x48
```

### With Tailwind Classes

```
Icon('lucide:heart', className: 'text-red-500')
Icon('lucide:check', className: 'text-green-500 w-6 h-6')
Icon('lucide:x', className: 'text-gray-400 hover:text-red-500 transition-colors')
```

### With Inline Styles

```
Icon('lucide:sun', style: 'color: gold; filter: drop-shadow(0 0 4px gold);')
```

### With Custom Attributes

```
Icon('lucide:info', attributes: {
  'data-tooltip': 'More information',
  'aria-label': 'Info icon',
})
```

### In a Button

```
Button(
  className: 'inline-flex items-center gap-2',
  children: [
    Icon(IconNames.plus, size: 16),
    Text('Add Item'),
  ],
)
```

### Icon-Only Button

```
Button(
  className: 'p-2 rounded-full hover:bg-gray-100',
  attributes: {'aria-label': 'Close'},
  child: Icon(IconNames.x, size: 20),
)
```

## SVG ID Collision Prevention

When the same icon appears multiple times on a page, internal SVG IDs (used for gradients, clips, masks) can collide. Duxt Icons automatically replaces these with unique IDs via `replaceIDs()`.

This is handled internally — you don't need to do anything.

## Next Steps

- [Providers](/duxt-icons/providers) — Browse available icon sets
- [Caching](/duxt-icons/caching) — Production caching setup
- [API Reference](/duxt-icons/api-reference) — Full API docs
