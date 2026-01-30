---
title: Popover
description: A floating panel that appears on click with rich content.
layout: ui-layout
order: 29
---

# Popover

The `DPopover` component displays a floating panel with rich content when triggered by a click.

## Basic Usage

```
DPopover(
  trigger: DButton(label: 'Click me'),
  children: [
    div(classes: 'p-4', [
      text('Popover content'),
    ]),
  ],
)
```

## Positions

```
// Top (default)
DPopover(
  position: DPopoverPosition.top,
  trigger: DButton(label: 'Top'),
  children: [...],
)

// Bottom
DPopover(
  position: DPopoverPosition.bottom,
  trigger: DButton(label: 'Bottom'),
  children: [...],
)

// Left
DPopover(
  position: DPopoverPosition.left,
  trigger: DButton(label: 'Left'),
  children: [...],
)

// Right
DPopover(
  position: DPopoverPosition.right,
  trigger: DButton(label: 'Right'),
  children: [...],
)
```

## User Menu Example

```
DPopover(
  trigger: div(classes: 'flex items-center gap-2 cursor-pointer', [
    DAvatar(src: '/user.jpg', size: DAvatarSize.sm),
    span([text('John Doe')]),
    DIcon(name: 'chevron-down', size: 16),
  ]),
  children: [
    div(classes: 'w-64', [
      // User info header
      div(classes: 'p-4 border-b', [
        div(classes: 'flex items-center gap-3', [
          DAvatar(src: '/user.jpg'),
          div([
            p(classes: 'font-medium', [text('John Doe')]),
            p(classes: 'text-sm text-gray-500', [text('john@example.com')]),
          ]),
        ]),
      ]),

      // Menu items
      div(classes: 'p-2', [
        menuItem('Profile', 'user', '/profile'),
        menuItem('Settings', 'settings', '/settings'),
        menuItem('Billing', 'credit-card', '/billing'),
      ]),

      // Sign out
      div(classes: 'p-2 border-t', [
        menuItem('Sign out', 'log-out', null, onSignOut),
      ]),
    ]),
  ],
)
```

## Notification Panel

```
DPopover(
  trigger: div(classes: 'relative', [
    DButton(
      leadingIcon: DIcon(name: 'bell'),
      variant: DButtonVariant.ghost,
      square: true,
    ),
    // Notification badge
    if (unreadCount > 0)
      div(classes: 'absolute -top-1 -right-1', [
        DBadge(
          label: unreadCount.toString(),
          color: DColor.error,
          size: DSize.xs,
        ),
      ]),
  ]),
  children: [
    div(classes: 'w-80', [
      // Header
      div(classes: 'p-4 border-b flex items-center justify-between', [
        h4(classes: 'font-semibold', [text('Notifications')]),
        DButton(
          label: 'Mark all read',
          variant: DButtonVariant.ghost,
          size: DSize.sm,
        ),
      ]),

      // Notification list
      div(classes: 'max-h-96 overflow-y-auto', [
        for (final notification in notifications)
          notificationItem(notification),
      ]),

      // Footer
      div(classes: 'p-3 border-t', [
        DButton(
          label: 'View all notifications',
          variant: DButtonVariant.ghost,
          block: true,
          size: DSize.sm,
        ),
      ]),
    ]),
  ],
)
```

## Date Picker Trigger

```
DPopover(
  trigger: DInput(
    label: 'Date',
    value: selectedDate?.toString() ?? '',
    trailingIcon: DIcon(name: 'calendar'),
    readonly: true,
  ),
  children: [
    div(classes: 'p-4', [
      DCalendar(
        selected: selectedDate,
        onSelect: (date) => setState(() => selectedDate = date),
      ),
    ]),
  ],
)
```

## Color Picker

```
DPopover(
  trigger: div(classes: 'flex items-center gap-2 cursor-pointer', [
    div(
      classes: 'w-6 h-6 rounded border',
      style: 'background-color: $selectedColor',
      [],
    ),
    span([text('Choose color')]),
  ]),
  children: [
    div(classes: 'p-4', [
      div(classes: 'grid grid-cols-6 gap-2', [
        for (final color in colors)
          div(
            classes: 'w-8 h-8 rounded cursor-pointer hover:scale-110 transition-transform',
            style: 'background-color: $color',
            events: {'click': () => selectColor(color)},
            [],
          ),
      ]),
    ]),
  ],
)
```

## Settings Quick Access

```
DPopover(
  trigger: DButton(
    leadingIcon: DIcon(name: 'settings'),
    variant: DButtonVariant.ghost,
    square: true,
  ),
  children: [
    div(classes: 'w-72 p-4 space-y-4', [
      h4(classes: 'font-semibold', [text('Quick Settings')]),

      DSwitch(
        label: 'Dark mode',
        checked: isDarkMode,
        onChange: (v) => toggleDarkMode(v),
      ),

      DSwitch(
        label: 'Notifications',
        checked: notificationsEnabled,
        onChange: (v) => toggleNotifications(v),
      ),

      DSlider(
        label: 'Volume',
        value: volume,
        onChange: (v) => setState(() => volume = v),
      ),

      DSeparator(),

      DButton(
        label: 'All Settings',
        variant: DButtonVariant.outline,
        block: true,
        size: DSize.sm,
        trailingIcon: DIcon(name: 'arrow-right'),
      ),
    ]),
  ],
)
```

## Form in Popover

```
DPopover(
  trigger: DButton(
    label: 'Add Item',
    leadingIcon: DIcon(name: 'plus'),
  ),
  children: [
    div(classes: 'w-80 p-4', [
      h4(classes: 'font-semibold mb-4', [text('Quick Add')]),

      div(classes: 'space-y-3', [
        DInput(
          label: 'Name',
          placeholder: 'Enter item name',
        ),
        DSelect<String>(
          label: 'Category',
          options: categoryOptions,
        ),
        div(classes: 'flex gap-2 pt-2', [
          DButton(
            label: 'Cancel',
            variant: DButtonVariant.ghost,
            size: DSize.sm,
          ),
          DButton(
            label: 'Add',
            size: DSize.sm,
          ),
        ]),
      ]),
    ]),
  ],
)
```

## Dark Mode Support

`DPopover` automatically adapts to dark mode:
- Panel backgrounds adjust for proper contrast
- Borders are optimized for dark backgrounds
- Content within adapts to the theme

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `trigger` | `Component` | required | Element that opens the popover |
| `children` | `List<Component>` | required | Popover content |
| `position` | `DPopoverPosition` | `bottom` | Popover placement |
| `closeOnClickOutside` | `bool` | `true` | Close when clicking outside |

### DPopoverPosition

| Value | Description |
|-------|-------------|
| `top` | Above the trigger |
| `bottom` | Below the trigger |
| `left` | Left of the trigger |
| `right` | Right of the trigger |
