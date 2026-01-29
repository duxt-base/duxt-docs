---
title: Dashboard
description: Components for building admin dashboards and application layouts.
layout: ui-layout
order: 39
---

# Dashboard

Duxt UI provides a comprehensive set of components for building admin dashboards and application layouts with sidebars, navbars, and panels.

## Dashboard Sidebar

A collapsible sidebar with navigation items:

```dart
DDashboardSidebar(
  header: div(classes: 'p-4', [
    img(src: '/logo.svg', classes: 'h-8'),
  ]),
  children: [
    DSidebarSection(
      label: 'Main',
      children: [
        DSidebarItem(
          label: 'Dashboard',
          icon: DIcon(name: 'home'),
          active: true,
          onClick: () => navigate('/'),
        ),
        DSidebarItem(
          label: 'Analytics',
          icon: DIcon(name: 'bar-chart-2'),
          onClick: () => navigate('/analytics'),
        ),
        DSidebarItem(
          label: 'Users',
          icon: DIcon(name: 'users'),
          badge: '12',
          onClick: () => navigate('/users'),
        ),
      ],
    ),
    DSidebarSection(
      label: 'Settings',
      children: [
        DSidebarItem(
          label: 'Settings',
          icon: DIcon(name: 'settings'),
          onClick: () => navigate('/settings'),
        ),
      ],
    ),
  ],
  footer: div(classes: 'p-4 border-t', [
    // User profile or collapse button
  ]),
)
```

### Collapsible Sidebar

```dart
DDashboardSidebar(
  initialCollapsed: false,
  onCollapseChange: (collapsed) {
    print('Sidebar collapsed: $collapsed');
  },
  children: [...],
)
```

### Mobile Overlay

```dart
DDashboardSidebar(
  mobileOpen: isMobileMenuOpen,
  onMobileClose: () => setState(() => isMobileMenuOpen = false),
  children: [...],
)
```

### Background Variants

```dart
// Gray background (default)
DDashboardSidebar(
  background: DSidebarBackground.gray,
  children: [...],
)

// White background
DDashboardSidebar(
  background: DSidebarBackground.white,
  children: [...],
)
```

### Sidebar Position

```dart
// Left side (default)
DDashboardSidebar(
  side: DSidebarSide.left,
  children: [...],
)

// Right side
DDashboardSidebar(
  side: DSidebarSide.right,
  children: [...],
)
```

## Sidebar Items

### Basic Item

```dart
DSidebarItem(
  label: 'Dashboard',
  icon: DIcon(name: 'home'),
  onClick: () => navigate('/'),
)
```

### Active State

```dart
DSidebarItem(
  label: 'Dashboard',
  icon: DIcon(name: 'home'),
  active: currentPath == '/',
  onClick: () => navigate('/'),
)
```

### With Badge

```dart
DSidebarItem(
  label: 'Notifications',
  icon: DIcon(name: 'bell'),
  badge: '5',
  onClick: () => navigate('/notifications'),
)
```

### Disabled Item

```dart
DSidebarItem(
  label: 'Premium Feature',
  icon: DIcon(name: 'star'),
  disabled: true,
)
```

## Sidebar Sections

Group related items with a label:

```dart
DSidebarSection(
  label: 'Navigation',
  children: [
    DSidebarItem(label: 'Home', icon: DIcon(name: 'home')),
    DSidebarItem(label: 'Projects', icon: DIcon(name: 'folder')),
  ],
)

DSidebarSection(
  label: 'Admin',
  children: [
    DSidebarItem(label: 'Users', icon: DIcon(name: 'users')),
    DSidebarItem(label: 'Settings', icon: DIcon(name: 'settings')),
  ],
)
```

## Dashboard Navbar

A horizontal navigation bar:

```dart
DDashboardNavbar(
  leading: DButton(
    leadingIcon: DIcon(name: 'menu'),
    variant: DButtonVariant.ghost,
    onClick: () => toggleSidebar(),
  ),
  title: 'Dashboard',
  trailing: div(classes: 'flex items-center gap-4', [
    DDashboardSearch(placeholder: 'Search...'),
    DButton(
      leadingIcon: DIcon(name: 'bell'),
      variant: DButtonVariant.ghost,
      square: true,
    ),
    DAvatar(src: '/user.jpg', size: DAvatarSize.sm),
  ]),
)
```

### Background Variants

```dart
DDashboardNavbar(
  background: DNavbarBackground.white,  // Default
  ...
)

DDashboardNavbar(
  background: DNavbarBackground.gray,
  ...
)

DDashboardNavbar(
  background: DNavbarBackground.transparent,
  ...
)
```

### Without Border

```dart
DDashboardNavbar(
  bordered: false,
  title: 'Dashboard',
)
```

## Dashboard Search

A search input with keyboard shortcut hint:

```dart
DDashboardSearch(
  placeholder: 'Search...',
  onInput: (value) => search(value),
  onSubmit: (value) => performSearch(value),
)
```

### Sizes

```dart
DDashboardSearch(size: DSearchSize.sm, ...)
DDashboardSearch(size: DSearchSize.md, ...)  // Default
DDashboardSearch(size: DSearchSize.lg, ...)
```

### Custom Shortcut

```dart
DDashboardSearch(
  shortcut: 'K',  // Shows ⌘K or Ctrl+K
  onFocus: () => openCommandPalette(),
)
```

### Expand on Focus

```dart
DDashboardSearch(
  expandOnFocus: true,
  placeholder: 'Search...',
  onInput: (value) => {},
)
```

### Search Button

A compact search button for triggering a search modal:

```dart
DDashboardSearchButton(
  shortcut: 'K',
  onClick: () => openSearchModal(),
)
```

## Dashboard Panel

A flexible panel for content areas:

```dart
DDashboardPanel(
  grow: true,  // Fill available space
  children: [
    // Panel content
  ],
)
```

### Resizable Panel

```dart
DDashboardPanel(
  resizable: true,
  resizeDirection: DPanelResizeDirection.right,
  initialWidth: 300,
  minWidth: 200,
  maxWidth: 500,
  children: [
    // Sidebar content
  ],
)
```

## Complete Dashboard Layout Example

```dart
class DashboardLayout extends StatefulComponent {
  @override
  State createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  bool sidebarCollapsed = false;
  bool mobileMenuOpen = false;
  String currentPath = '/';

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'flex h-screen bg-gray-100 dark:bg-gray-900', [
      // Sidebar
      DDashboardSidebar(
        initialCollapsed: sidebarCollapsed,
        mobileOpen: mobileMenuOpen,
        onMobileClose: () => setState(() => mobileMenuOpen = false),
        onCollapseChange: (collapsed) => setState(() => sidebarCollapsed = collapsed),
        header: div(classes: 'h-16 flex items-center justify-center border-b', [
          img(src: '/logo.svg', classes: sidebarCollapsed ? 'h-8' : 'h-8'),
        ]),
        children: [
          DSidebarSection(
            label: sidebarCollapsed ? null : 'Main',
            children: [
              DSidebarItem(
                label: 'Dashboard',
                icon: DIcon(name: 'home'),
                active: currentPath == '/',
                collapsed: sidebarCollapsed,
                onClick: () => navigate('/'),
              ),
              DSidebarItem(
                label: 'Projects',
                icon: DIcon(name: 'folder'),
                active: currentPath == '/projects',
                collapsed: sidebarCollapsed,
                onClick: () => navigate('/projects'),
              ),
              DSidebarItem(
                label: 'Team',
                icon: DIcon(name: 'users'),
                badge: '3',
                active: currentPath == '/team',
                collapsed: sidebarCollapsed,
                onClick: () => navigate('/team'),
              ),
            ],
          ),
        ],
        footer: div(classes: 'p-2 border-t', [
          DSidebarItem(
            label: 'Settings',
            icon: DIcon(name: 'settings'),
            collapsed: sidebarCollapsed,
            onClick: () => navigate('/settings'),
          ),
        ]),
      ),

      // Main content area
      DDashboardPanel(
        grow: true,
        classes: 'flex flex-col',
        children: [
          // Navbar
          DDashboardNavbar(
            leading: div(classes: 'lg:hidden', [
              DButton(
                leadingIcon: DIcon(name: 'menu'),
                variant: DButtonVariant.ghost,
                onClick: () => setState(() => mobileMenuOpen = true),
              ),
            ]),
            title: 'Dashboard',
            trailing: div(classes: 'flex items-center gap-4', [
              DDashboardSearch(
                placeholder: 'Search...',
                onInput: (value) => search(value),
              ),
              DButton(
                leadingIcon: DIcon(name: 'bell'),
                variant: DButtonVariant.ghost,
                square: true,
              ),
              DDropdown(
                trigger: DAvatar(src: '/user.jpg', size: DAvatarSize.sm),
                items: [
                  DDropdownItem(label: 'Profile', icon: DIcon(name: 'user')),
                  DDropdownItem(label: 'Settings', icon: DIcon(name: 'settings')),
                  DDropdownItem(divider: true),
                  DDropdownItem(label: 'Logout', icon: DIcon(name: 'log-out')),
                ],
              ),
            ]),
          ),

          // Page content
          div(classes: 'flex-1 overflow-y-auto p-6', [
            // Your page content here
          ]),
        ],
      ),
    ]);
  }
}
```

## Dark Mode Support

All dashboard components automatically adapt to dark mode with appropriate backgrounds, borders, and text colors.

## API Reference

### DDashboardSidebar

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `classes` | `String?` | `null` | Custom CSS classes |
| `initialCollapsed` | `bool` | `false` | Start collapsed |
| `mobileOpen` | `bool` | `false` | Show mobile overlay |
| `onMobileClose` | `VoidCallback?` | `null` | Mobile close callback |
| `header` | `Component?` | `null` | Header content |
| `footer` | `Component?` | `null` | Footer content |
| `bordered` | `bool` | `true` | Show border |
| `background` | `DSidebarBackground` | `gray` | Background color |
| `side` | `DSidebarSide` | `left` | Sidebar position |
| `onCollapseChange` | `ValueChanged<bool>?` | `null` | Collapse callback |
| `children` | `List<Component>` | `[]` | Navigation items |

### DSidebarItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Item text |
| `icon` | `Component?` | `null` | Leading icon |
| `active` | `bool` | `false` | Active state |
| `disabled` | `bool` | `false` | Disabled state |
| `onClick` | `VoidCallback?` | `null` | Click callback |
| `badge` | `String?` | `null` | Badge content |
| `collapsed` | `bool` | `false` | Icon-only mode |

### DDashboardNavbar

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `leading` | `Component?` | `null` | Left content |
| `title` | `String?` | `null` | Title text |
| `center` | `Component?` | `null` | Center content |
| `trailing` | `Component?` | `null` | Right content |
| `bordered` | `bool` | `true` | Show border |
| `background` | `DNavbarBackground` | `white` | Background color |

### DDashboardSearch

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `placeholder` | `String` | `'Search...'` | Placeholder text |
| `value` | `String?` | `null` | Input value |
| `showShortcut` | `bool` | `true` | Show ⌘K hint |
| `shortcut` | `String` | `'K'` | Shortcut key |
| `size` | `DSearchSize` | `md` | Input size |
| `disabled` | `bool` | `false` | Disable input |
| `expandOnFocus` | `bool` | `false` | Expand on focus |
| `onInput` | `ValueChanged<String>?` | `null` | Input callback |
| `onSubmit` | `ValueChanged<String>?` | `null` | Submit callback |
| `onFocus` | `VoidCallback?` | `null` | Focus callback |
