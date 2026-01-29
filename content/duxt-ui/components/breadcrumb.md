---
title: Breadcrumb
description: A navigation component showing the current page location in a hierarchy.
layout: ui-layout
order: 13
---

# Breadcrumb

The `DBreadcrumb` component displays the current page location within a navigational hierarchy, helping users understand where they are in the site structure.

## Basic Usage

```dart
DBreadcrumb(
  items: [
    DBreadcrumbItem(label: 'Home', href: '/'),
    DBreadcrumbItem(label: 'Products', href: '/products'),
    DBreadcrumbItem(label: 'Electronics', href: '/products/electronics'),
    DBreadcrumbItem(label: 'Phones'),  // Current page (no href)
  ],
)
```

## Separators

### Slash (Default)

```dart
DBreadcrumb(
  separator: DBreadcrumbSeparator.slash,
  items: [...],
)
// Home / Products / Electronics
```

### Chevron

```dart
DBreadcrumb(
  separator: DBreadcrumbSeparator.chevron,
  items: [...],
)
// Home > Products > Electronics
```

### Arrow

```dart
DBreadcrumb(
  separator: DBreadcrumbSeparator.arrow,
  items: [...],
)
// Home → Products → Electronics
```

### Dot

```dart
DBreadcrumb(
  separator: DBreadcrumbSeparator.dot,
  items: [...],
)
// Home · Products · Electronics
```

## With Icons

```dart
DBreadcrumb(
  items: [
    DBreadcrumbItem(
      label: 'Home',
      href: '/',
      icon: DIcon(name: 'home'),
    ),
    DBreadcrumbItem(
      label: 'Settings',
      href: '/settings',
      icon: DIcon(name: 'settings'),
    ),
    DBreadcrumbItem(
      label: 'Account',
      icon: DIcon(name: 'user'),
    ),
  ],
)
```

## Icon Only

For a compact breadcrumb:

```dart
DBreadcrumb(
  items: [
    DBreadcrumbItem(
      label: 'Home',
      href: '/',
      icon: DIcon(name: 'home'),
      iconOnly: true,
    ),
    DBreadcrumbItem(label: 'Dashboard', href: '/dashboard'),
    DBreadcrumbItem(label: 'Analytics'),
  ],
)
```

## In Page Header

```dart
div(classes: 'space-y-4', [
  DBreadcrumb(
    separator: DBreadcrumbSeparator.chevron,
    items: [
      DBreadcrumbItem(label: 'Dashboard', href: '/dashboard'),
      DBreadcrumbItem(label: 'Projects', href: '/projects'),
      DBreadcrumbItem(label: 'Website Redesign'),
    ],
  ),
  h1(classes: 'text-2xl font-bold', [text('Website Redesign')]),
  p(classes: 'text-gray-500', [text('Project overview and details')]),
])
```

## Dynamic Breadcrumbs

Generate breadcrumbs from a path:

```dart
class DynamicBreadcrumb extends StatelessComponent {
  final String path;

  DynamicBreadcrumb({required this.path});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final segments = path.split('/').where((s) => s.isNotEmpty).toList();
    final items = <DBreadcrumbItem>[
      DBreadcrumbItem(
        label: 'Home',
        href: '/',
        icon: DIcon(name: 'home'),
      ),
    ];

    String currentPath = '';
    for (int i = 0; i < segments.length; i++) {
      currentPath += '/${segments[i]}';
      final isLast = i == segments.length - 1;

      items.add(DBreadcrumbItem(
        label: _formatLabel(segments[i]),
        href: isLast ? null : currentPath,
      ));
    }

    yield DBreadcrumb(
      separator: DBreadcrumbSeparator.chevron,
      items: items,
    );
  }

  String _formatLabel(String segment) {
    return segment
        .replaceAll('-', ' ')
        .split(' ')
        .map((w) => w[0].toUpperCase() + w.substring(1))
        .join(' ');
  }
}
```

## With Dropdown for Long Paths

For very deep hierarchies:

```dart
DBreadcrumb(
  items: [
    DBreadcrumbItem(label: 'Home', href: '/'),
    DBreadcrumbItem(
      label: '...',
      dropdown: DDropdown(
        trigger: span(classes: 'cursor-pointer', [text('...')]),
        items: [
          DDropdownItem(label: 'Level 1', onClick: () => {}),
          DDropdownItem(label: 'Level 2', onClick: () => {}),
          DDropdownItem(label: 'Level 3', onClick: () => {}),
        ],
      ),
    ),
    DBreadcrumbItem(label: 'Current Page'),
  ],
)
```

## Dark Mode Support

`DBreadcrumb` automatically adapts to dark mode:
- Text colors adjust for proper contrast
- Separators are visible in both modes
- Links have appropriate hover states
- Icons remain visible

## API Reference

### DBreadcrumb

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | `List<DBreadcrumbItem>` | required | Breadcrumb items |
| `separator` | `DBreadcrumbSeparator` | `slash` | Separator style |

### DBreadcrumbItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Item text |
| `href` | `String?` | `null` | Link URL (null for current page) |
| `icon` | `Component?` | `null` | Leading icon |
| `iconOnly` | `bool` | `false` | Show only icon |
| `dropdown` | `Component?` | `null` | Dropdown for collapsed items |

### DBreadcrumbSeparator

| Value | Display |
|-------|---------|
| `slash` | `/` |
| `chevron` | `>` (icon) |
| `arrow` | `→` |
| `dot` | `·` |
