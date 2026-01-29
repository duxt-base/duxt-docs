---
title: Navigation Menu
description: Horizontal and vertical navigation menus with dropdown support.
layout: ui-layout
order: 46
---

# Navigation Menu

Duxt UI provides flexible navigation components for building horizontal navbars, vertical sidebars, and dropdown menus.

## Basic Horizontal Menu

```dart
DNavigationMenu(
  items: [
    DNavigationItem(label: 'Home', href: '/'),
    DNavigationItem(label: 'Products', href: '/products'),
    DNavigationItem(label: 'About', href: '/about'),
    DNavigationItem(label: 'Contact', href: '/contact'),
  ],
)
```

## Vertical Menu

```dart
DNavigationMenu(
  orientation: DNavigationOrientation.vertical,
  items: [
    DNavigationItem(label: 'Dashboard', href: '/dashboard'),
    DNavigationItem(label: 'Projects', href: '/projects'),
    DNavigationItem(label: 'Team', href: '/team'),
    DNavigationItem(label: 'Settings', href: '/settings'),
  ],
)
```

## Navigation Item

### Basic Item

```dart
DNavigationItem(
  label: 'Dashboard',
  href: '/dashboard',
)
```

### With Icon

```dart
DNavigationItem(
  label: 'Settings',
  href: '/settings',
  icon: DIcon(name: 'settings', size: 16),
)
```

### Active State

```dart
DNavigationItem(
  label: 'Dashboard',
  href: '/dashboard',
  active: currentPath == '/dashboard',
)
```

### With Badge

```dart
DNavigationItem(
  label: 'Notifications',
  href: '/notifications',
  icon: DIcon(name: 'bell', size: 16),
  badge: DBadge(label: '5', size: DSize.xs),
)
```

### Disabled Item

```dart
DNavigationItem(
  label: 'Premium Feature',
  href: '/premium',
  disabled: true,
)
```

### Click Handler

```dart
DNavigationItem(
  label: 'Logout',
  icon: DIcon(name: 'log-out', size: 16),
  onClick: () => handleLogout(),
)
```

## Dropdown Menu

Items with children render as dropdown menus:

```dart
DNavigationMenu(
  items: [
    DNavigationItem(label: 'Home', href: '/'),
    DNavigationItem(
      label: 'Products',
      children: [
        DNavigationItem(label: 'All Products', href: '/products'),
        DNavigationItem(label: 'Categories', href: '/categories'),
        DNavigationItem(label: 'New Arrivals', href: '/new'),
        DNavigationItem(label: 'Sale', href: '/sale'),
      ],
    ),
    DNavigationItem(
      label: 'Resources',
      children: [
        DNavigationItem(label: 'Documentation', href: '/docs'),
        DNavigationItem(label: 'Blog', href: '/blog'),
        DNavigationItem(label: 'Support', href: '/support'),
      ],
    ),
    DNavigationItem(label: 'Contact', href: '/contact'),
  ],
)
```

## Vertical Navigation with Groups

Use `DVerticalNavigation` and `DNavigationGroup` for grouped sidebar navigation:

```dart
DVerticalNavigation(
  groups: [
    DNavigationGroup(
      title: 'Main',
      items: [
        DNavigationItem(
          label: 'Dashboard',
          href: '/dashboard',
          icon: DIcon(name: 'home', size: 16),
          active: true,
        ),
        DNavigationItem(
          label: 'Projects',
          href: '/projects',
          icon: DIcon(name: 'folder', size: 16),
        ),
        DNavigationItem(
          label: 'Tasks',
          href: '/tasks',
          icon: DIcon(name: 'check-square', size: 16),
          badge: DBadge(label: '12', size: DSize.xs, color: DBadgeColor.primary),
        ),
      ],
    ),
    DNavigationGroup(
      title: 'Settings',
      items: [
        DNavigationItem(
          label: 'Account',
          href: '/account',
          icon: DIcon(name: 'user', size: 16),
        ),
        DNavigationItem(
          label: 'Preferences',
          href: '/preferences',
          icon: DIcon(name: 'settings', size: 16),
        ),
      ],
    ),
  ],
)
```

## In Header

```dart
header(classes: 'border-b', [
  div(classes: 'container mx-auto px-4', [
    div(classes: 'flex items-center justify-between h-16', [
      // Logo
      a(href: '/', [
        img(src: '/logo.svg', classes: 'h-8'),
      ]),

      // Navigation
      DNavigationMenu(
        items: [
          DNavigationItem(label: 'Features', href: '/features'),
          DNavigationItem(
            label: 'Solutions',
            children: [
              DNavigationItem(label: 'Enterprise', href: '/enterprise'),
              DNavigationItem(label: 'Startups', href: '/startups'),
              DNavigationItem(label: 'Developers', href: '/developers'),
            ],
          ),
          DNavigationItem(label: 'Pricing', href: '/pricing'),
          DNavigationItem(label: 'Docs', href: '/docs'),
        ],
      ),

      // Actions
      div(classes: 'flex items-center gap-4', [
        DButton(label: 'Sign In', variant: DButtonVariant.ghost),
        DButton(label: 'Get Started'),
      ]),
    ]),
  ]),
])
```

## In Sidebar

```dart
aside(classes: 'w-64 border-r h-screen', [
  // Logo
  div(classes: 'h-16 flex items-center px-4 border-b', [
    img(src: '/logo.svg', classes: 'h-8'),
  ]),

  // Navigation
  div(classes: 'p-4', [
    DVerticalNavigation(
      groups: [
        DNavigationGroup(
          title: 'Overview',
          items: [
            DNavigationItem(label: 'Dashboard', href: '/', icon: DIcon(name: 'home')),
            DNavigationItem(label: 'Analytics', href: '/analytics', icon: DIcon(name: 'bar-chart')),
          ],
        ),
        DNavigationGroup(
          title: 'Management',
          items: [
            DNavigationItem(label: 'Users', href: '/users', icon: DIcon(name: 'users')),
            DNavigationItem(label: 'Products', href: '/products', icon: DIcon(name: 'package')),
            DNavigationItem(label: 'Orders', href: '/orders', icon: DIcon(name: 'shopping-cart')),
          ],
        ),
      ],
    ),
  ]),
])
```

## Dark Mode Support

All navigation components automatically adapt to dark mode with appropriate backgrounds, text colors, and hover states.

## API Reference

### DNavigationMenu

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | `List<DNavigationItem>` | required | Menu items |
| `orientation` | `DNavigationOrientation` | `horizontal` | Menu orientation |

### DNavigationItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Item label |
| `href` | `String?` | `null` | Link URL |
| `icon` | `Component?` | `null` | Leading icon |
| `badge` | `Component?` | `null` | Badge component |
| `active` | `bool` | `false` | Active state |
| `disabled` | `bool` | `false` | Disabled state |
| `onClick` | `VoidCallback?` | `null` | Click handler |
| `children` | `List<DNavigationItem>?` | `null` | Dropdown items |

### DVerticalNavigation

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `groups` | `List<DNavigationGroup>` | required | Navigation groups |

### DNavigationGroup

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | Group title |
| `items` | `List<DNavigationItem>` | required | Group items |

### DNavigationOrientation

| Value | Description |
|-------|-------------|
| `horizontal` | Horizontal menu layout |
| `vertical` | Vertical menu layout |
