---
title: Slideover
description: A panel that slides in from the edge of the screen.
layout: ui-layout
order: 24
---

# Slideover

The `DSlideover` component (also known as a drawer) displays a panel that slides in from the edge of the screen, useful for navigation, forms, and detailed content.

## Basic Usage

```dart
DSlideover(
  open: isOpen,
  title: 'Panel Title',
  children: [
    text('Slideover content goes here.'),
  ],
  onClose: () => setState(() => isOpen = false),
)
```

## Sides

### Right (Default)

```dart
DSlideover(
  open: isOpen,
  side: DSlideoverSide.right,
  title: 'Right Panel',
  children: [...],
)
```

### Left

```dart
DSlideover(
  open: isOpen,
  side: DSlideoverSide.left,
  title: 'Left Panel',
  children: [...],
)
```

### Top

```dart
DSlideover(
  open: isOpen,
  side: DSlideoverSide.top,
  title: 'Top Panel',
  children: [...],
)
```

### Bottom

```dart
DSlideover(
  open: isOpen,
  side: DSlideoverSide.bottom,
  title: 'Bottom Panel',
  children: [...],
)
```

## With Description

```dart
DSlideover(
  open: isOpen,
  title: 'Edit Profile',
  description: 'Update your personal information.',
  children: [
    div(classes: 'space-y-4', [
      DInput(label: 'Name'),
      DInput(label: 'Email'),
    ]),
  ],
  onClose: () => setState(() => isOpen = false),
)
```

## Custom Header

```dart
DSlideover(
  open: isOpen,
  header: [
    div(classes: 'flex items-center gap-3', [
      DAvatar(src: '/user.jpg'),
      div([
        h3(classes: 'font-semibold', [text('John Doe')]),
        p(classes: 'text-sm text-gray-500', [text('john@example.com')]),
      ]),
    ]),
  ],
  children: [...],
  onClose: () => setState(() => isOpen = false),
)
```

## With Footer

```dart
DSlideover(
  open: isOpen,
  title: 'Edit Item',
  children: [
    div(classes: 'space-y-4', [
      DInput(label: 'Name', value: item.name),
      DTextarea(label: 'Description', value: item.description),
    ]),
  ],
  footer: [
    div(classes: 'flex gap-2', [
      DButton(
        label: 'Cancel',
        variant: DButtonVariant.ghost,
        onClick: () => setState(() => isOpen = false),
      ),
      DButton(
        label: 'Save',
        onClick: () => saveItem(),
      ),
    ]),
  ],
  onClose: () => setState(() => isOpen = false),
)
```

## Navigation Drawer Example

```dart
class NavigationDrawer extends StatefulComponent {
  @override
  State createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool open = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      // Toggle button
      DButton(
        leadingIcon: DIcon(name: 'menu'),
        variant: DButtonVariant.ghost,
        onClick: () => setState(() => open = true),
      ),

      // Navigation drawer
      DSlideover(
        open: open,
        side: DSlideoverSide.left,
        title: 'Navigation',
        onClose: () => setState(() => open = false),
        children: [
          nav(classes: 'space-y-1', [
            navItem('Home', 'home', '/'),
            navItem('Dashboard', 'layout-dashboard', '/dashboard'),
            navItem('Projects', 'folder', '/projects'),
            navItem('Settings', 'settings', '/settings'),
          ]),
        ],
      ),
    ]);
  }

  Component navItem(String label, String icon, String href) {
    return a(
      href: href,
      classes: 'flex items-center gap-3 px-3 py-2 rounded-md hover:bg-gray-100 dark:hover:bg-gray-800',
      [
        DIcon(name: icon, size: 20),
        span([text(label)]),
      ],
    );
  }
}
```

## Filter Panel Example

```dart
DSlideover(
  open: showFilters,
  side: DSlideoverSide.right,
  title: 'Filters',
  description: 'Refine your search results',
  children: [
    div(classes: 'space-y-6', [
      // Category filter
      div([
        h4(classes: 'font-medium mb-2', [text('Category')]),
        div(classes: 'space-y-2', [
          DCheckbox(label: 'Electronics'),
          DCheckbox(label: 'Clothing'),
          DCheckbox(label: 'Home & Garden'),
          DCheckbox(label: 'Sports'),
        ]),
      ]),

      // Price range
      div([
        h4(classes: 'font-medium mb-2', [text('Price Range')]),
        DSlider(
          value: maxPrice,
          min: 0,
          max: 1000,
          showValue: true,
          onChange: (v) => setState(() => maxPrice = v),
        ),
      ]),

      // Rating filter
      div([
        h4(classes: 'font-medium mb-2', [text('Minimum Rating')]),
        DSelect<int>(
          options: [
            DSelectOption(label: 'Any', value: 0),
            DSelectOption(label: '4+ Stars', value: 4),
            DSelectOption(label: '3+ Stars', value: 3),
          ],
          onSelect: (v) => {},
        ),
      ]),
    ]),
  ],
  footer: [
    div(classes: 'flex gap-2', [
      DButton(
        label: 'Reset',
        variant: DButtonVariant.ghost,
        block: true,
        onClick: resetFilters,
      ),
      DButton(
        label: 'Apply Filters',
        block: true,
        onClick: applyFilters,
      ),
    ]),
  ],
  onClose: () => setState(() => showFilters = false),
)
```

## Shopping Cart Example

```dart
DSlideover(
  open: showCart,
  side: DSlideoverSide.right,
  title: 'Shopping Cart',
  description: '${cartItems.length} items',
  children: [
    if (cartItems.isEmpty)
      div(classes: 'py-12 text-center', [
        DIcon(name: 'shopping-cart', size: 48, classes: 'text-gray-400 mx-auto'),
        p(classes: 'mt-4 text-gray-500', [text('Your cart is empty')]),
        DButton(
          label: 'Continue Shopping',
          variant: DButtonVariant.outline,
          onClick: () => setState(() => showCart = false),
        ),
      ])
    else
      div(classes: 'divide-y', [
        for (final item in cartItems)
          cartItemRow(item),
      ]),
  ],
  footer: cartItems.isNotEmpty ? [
    div(classes: 'space-y-4', [
      div(classes: 'flex justify-between font-semibold', [
        span([text('Total')]),
        span([text('\$${calculateTotal()}')]),
      ]),
      DButton(
        label: 'Checkout',
        block: true,
        onClick: () => checkout(),
      ),
    ]),
  ] : null,
  onClose: () => setState(() => showCart = false),
)
```

## Close Behavior

```dart
DSlideover(
  open: isOpen,
  closeOnOverlay: true,   // Close when clicking backdrop
  closeOnEscape: true,    // Close on Escape key
  preventClose: false,    // Allow all close methods
  onClose: () => setState(() => isOpen = false),
  children: [...],
)
```

## Dark Mode Support

`DSlideover` automatically adapts to dark mode:
- Panel backgrounds adjust for proper contrast
- Backdrop opacity is optimized
- All content within adapts to the theme

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `open` | `bool` | required | Whether slideover is visible |
| `side` | `DSlideoverSide` | `right` | Edge to slide from |
| `title` | `String?` | `null` | Panel title |
| `description` | `String?` | `null` | Subtitle below title |
| `header` | `List<Component>?` | `null` | Custom header content |
| `children` | `List<Component>` | required | Panel body content |
| `footer` | `List<Component>?` | `null` | Footer content |
| `closeOnOverlay` | `bool` | `true` | Close when clicking backdrop |
| `closeOnEscape` | `bool` | `true` | Close on Escape key |
| `preventClose` | `bool` | `false` | Disable all close methods |
| `onClose` | `VoidCallback?` | `null` | Close callback |
