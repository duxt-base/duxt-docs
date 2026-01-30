---
title: Dropdown
description: A menu that appears when triggered, displaying a list of actions.
layout: ui-layout
order: 9
---

# Dropdown

The `DDropdown` component displays a contextual menu of actions when triggered by a button click.

## Basic Usage

```
DDropdown(
  trigger: DButton(label: 'Options'),
  items: [
    DDropdownItem(label: 'Edit', onClick: () => handleEdit()),
    DDropdownItem(label: 'Duplicate', onClick: () => handleDuplicate()),
    DDropdownItem(label: 'Delete', onClick: () => handleDelete()),
  ],
)
```

## With Icons

```
DDropdown(
  trigger: DButton(
    label: 'Actions',
    trailingIcon: DIcon(name: 'chevron-down'),
  ),
  items: [
    DDropdownItem(
      label: 'Edit',
      icon: DIcon(name: 'edit'),
      onClick: () => handleEdit(),
    ),
    DDropdownItem(
      label: 'Copy',
      icon: DIcon(name: 'copy'),
      onClick: () => handleCopy(),
    ),
    DDropdownItem(
      label: 'Share',
      icon: DIcon(name: 'share'),
      onClick: () => handleShare(),
    ),
  ],
)
```

## With Dividers

```
DDropdown(
  trigger: DButton(label: 'Menu'),
  items: [
    DDropdownItem(label: 'View', onClick: () => {}),
    DDropdownItem(label: 'Edit', onClick: () => {}),
    DDropdownItem(divider: true),  // Divider
    DDropdownItem(
      label: 'Delete',
      icon: DIcon(name: 'trash'),
      onClick: () => handleDelete(),
    ),
  ],
)
```

## Disabled Items

```
DDropdown(
  trigger: DButton(label: 'Actions'),
  items: [
    DDropdownItem(label: 'Edit', onClick: () => {}),
    DDropdownItem(
      label: 'Archive',
      disabled: true,  // Cannot be clicked
    ),
    DDropdownItem(label: 'Delete', onClick: () => {}),
  ],
)
```

## Icon Button Trigger

```
DDropdown(
  trigger: DButton(
    leadingIcon: DIcon(name: 'more-vertical'),
    variant: DButtonVariant.ghost,
    square: true,
  ),
  items: [
    DDropdownItem(label: 'Edit', icon: DIcon(name: 'edit')),
    DDropdownItem(label: 'Delete', icon: DIcon(name: 'trash')),
  ],
)
```

## User Menu Example

```
DDropdown(
  trigger: div(classes: 'flex items-center gap-2 cursor-pointer', [
    DAvatar(src: '/user.jpg', size: DAvatarSize.sm),
    span([text('John Doe')]),
    DIcon(name: 'chevron-down', size: 16),
  ]),
  items: [
    DDropdownItem(
      label: 'Profile',
      icon: DIcon(name: 'user'),
      onClick: () => navigateTo('/profile'),
    ),
    DDropdownItem(
      label: 'Settings',
      icon: DIcon(name: 'settings'),
      onClick: () => navigateTo('/settings'),
    ),
    DDropdownItem(
      label: 'Billing',
      icon: DIcon(name: 'credit-card'),
      onClick: () => navigateTo('/billing'),
    ),
    DDropdownItem(divider: true),
    DDropdownItem(
      label: 'Sign out',
      icon: DIcon(name: 'log-out'),
      onClick: () => handleSignOut(),
    ),
  ],
)
```

## Table Row Actions

```
DTable<User>(
  columns: [
    DTableColumn(key: 'name', label: 'Name'),
    DTableColumn(key: 'email', label: 'Email'),
    DTableColumn(
      key: 'actions',
      label: '',
      render: (user) => DDropdown(
        trigger: DButton(
          leadingIcon: DIcon(name: 'more-horizontal'),
          variant: DButtonVariant.ghost,
          size: DSize.sm,
          square: true,
        ),
        items: [
          DDropdownItem(
            label: 'View Details',
            icon: DIcon(name: 'eye'),
            onClick: () => viewUser(user),
          ),
          DDropdownItem(
            label: 'Edit',
            icon: DIcon(name: 'edit'),
            onClick: () => editUser(user),
          ),
          DDropdownItem(divider: true),
          DDropdownItem(
            label: 'Delete',
            icon: DIcon(name: 'trash'),
            onClick: () => deleteUser(user),
          ),
        ],
      ),
    ),
  ],
  data: users,
)
```

## Dark Mode Support

`DDropdown` automatically adapts to dark mode:
- Menu background adjusts for proper contrast
- Hover states are visible in both modes
- Dividers adapt to the color scheme
- Icons and text remain readable

## API Reference

### DDropdown

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `trigger` | `Component` | required | Element that opens the menu |
| `items` | `List<DDropdownItem>` | required | Menu items |

### DDropdownItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Item text (required unless divider) |
| `icon` | `Component?` | `null` | Leading icon |
| `disabled` | `bool` | `false` | Disable the item |
| `divider` | `bool` | `false` | Render as divider |
| `onClick` | `VoidCallback?` | `null` | Click handler |
