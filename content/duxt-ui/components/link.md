---
title: Link
description: Styled anchor components for navigation and external links.
layout: ui-layout
order: 45
---

# Link

Duxt UI provides styled link components for navigation, external links, and social media links.

## Basic Link

```dart
DLink(
  label: 'Learn more',
  href: '/about',
)
```

## External Link

External links automatically open in a new tab with proper security attributes:

```dart
DLink(
  label: 'View on GitHub',
  href: 'https://github.com/example/repo',
  external: true,
)
```

External links show a small arrow indicator by default.

## Colors

```dart
DLink(color: DLinkColor.primary, label: 'Primary', href: '#')
DLink(color: DLinkColor.neutral, label: 'Neutral', href: '#')
DLink(color: DLinkColor.inherit, label: 'Inherit', href: '#')
```

## With Underline

```dart
// Underline on hover (default)
DLink(
  label: 'Hover underline',
  href: '#',
)

// Always underlined
DLink(
  label: 'Always underlined',
  href: '#',
  underline: true,
)
```

## Active State

```dart
DLink(
  label: 'Current Page',
  href: '/dashboard',
  active: currentPath == '/dashboard',
)
```

## Disabled Link

```dart
DLink(
  label: 'Unavailable',
  href: '#',
  disabled: true,
)
```

## With Icons

```dart
// Leading icon
DLink(
  label: 'Documentation',
  href: '/docs',
  icon: DIcon(name: 'book', size: 16),
)

// Trailing icon
DLink(
  label: 'Download',
  href: '/download',
  trailingIcon: DIcon(name: 'download', size: 16),
)
```

## With Children

```dart
DLink(
  href: '/profile',
  children: [
    DAvatar(src: '/user.jpg', size: DAvatarSize.xs),
    span([text('John Doe')]),
  ],
)
```

## Navigation Link

A navigation-specific link with padding and hover background:

```dart
DNavLink(
  label: 'Dashboard',
  href: '/dashboard',
  active: currentPath == '/dashboard',
)
```

### With Icon

```dart
DNavLink(
  label: 'Settings',
  href: '/settings',
  icon: DIcon(name: 'settings', size: 16),
)
```

## Social Link

Styled for social media icons:

```dart
DSocialLink(
  href: 'https://twitter.com/example',
  icon: DIcon(name: 'twitter'),
  ariaLabel: 'Follow us on Twitter',
)
```

### With Visible Label

```dart
DSocialLink(
  href: 'https://github.com/example',
  icon: DIcon(name: 'github'),
  label: 'GitHub',  // Screen reader only
  ariaLabel: 'View our GitHub',
)
```

## In Navigation

```dart
nav(classes: 'flex items-center gap-6', [
  DLink(
    label: 'Home',
    href: '/',
    color: DLinkColor.neutral,
    active: currentPath == '/',
  ),
  DLink(
    label: 'Features',
    href: '/features',
    color: DLinkColor.neutral,
    active: currentPath == '/features',
  ),
  DLink(
    label: 'Pricing',
    href: '/pricing',
    color: DLinkColor.neutral,
    active: currentPath == '/pricing',
  ),
  DLink(
    label: 'Docs',
    href: 'https://docs.example.com',
    color: DLinkColor.neutral,
    external: true,
  ),
])
```

## In Footer

```dart
footer(classes: 'border-t py-8', [
  div(classes: 'flex justify-between items-center', [
    p(classes: 'text-sm text-gray-500', [
      text('Built with '),
      DLink(
        label: 'Duxt UI',
        href: 'https://duxt.dev',
        external: true,
      ),
    ]),
    div(classes: 'flex gap-4', [
      DSocialLink(
        href: 'https://twitter.com/duxt',
        icon: DIcon(name: 'twitter'),
        ariaLabel: 'Twitter',
      ),
      DSocialLink(
        href: 'https://github.com/duxt',
        icon: DIcon(name: 'github'),
        ariaLabel: 'GitHub',
      ),
      DSocialLink(
        href: 'https://discord.gg/duxt',
        icon: DIcon(name: 'discord'),
        ariaLabel: 'Discord',
      ),
    ]),
  ]),
])
```

## Breadcrumb Links

```dart
nav(classes: 'flex items-center gap-2 text-sm', [
  DLink(label: 'Home', href: '/', color: DLinkColor.neutral),
  span(classes: 'text-gray-400', [text('/')]),
  DLink(label: 'Products', href: '/products', color: DLinkColor.neutral),
  span(classes: 'text-gray-400', [text('/')]),
  span(classes: 'text-gray-900', [text('Widget')]),
])
```

## Dark Mode Support

All link components automatically adapt to dark mode with appropriate text colors and hover states.

## API Reference

### DLink

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Link text |
| `href` | `String` | required | Link URL |
| `external` | `bool` | `false` | Open in new tab |
| `active` | `bool` | `false` | Active state |
| `disabled` | `bool` | `false` | Disabled state |
| `color` | `DLinkColor` | `primary` | Color variant |
| `underline` | `bool` | `false` | Always show underline |
| `icon` | `Component?` | `null` | Leading icon |
| `trailingIcon` | `Component?` | `null` | Trailing icon |
| `children` | `List<Component>` | `[]` | Custom content |

### DNavLink

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Link text |
| `href` | `String` | required | Link URL |
| `active` | `bool` | `false` | Active state |
| `exact` | `bool` | `false` | Exact path match |
| `icon` | `Component?` | `null` | Leading icon |

### DSocialLink

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `href` | `String` | required | Link URL |
| `icon` | `Component` | required | Icon component |
| `label` | `String?` | `null` | Screen reader label |
| `ariaLabel` | `String?` | `null` | Aria label |

### DLinkColor

| Value | Description |
|-------|-------------|
| `primary` | Primary brand color |
| `neutral` | Gray/neutral color |
| `inherit` | Inherit parent color |
