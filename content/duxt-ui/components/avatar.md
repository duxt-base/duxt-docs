---
title: Avatar
description: A component for displaying user profile pictures or initials.
layout: ui-layout
order: 6
---

# Avatar

The `DAvatar` component displays user profile images, initials, or icons with various sizes and optional status indicators.

## Basic Usage

### With Image

```
DAvatar(
  src: '/images/user.jpg',
  alt: 'John Doe',
)
```

### With Initials

```
DAvatar(
  text: 'JD',
)
```

### With Icon

```
DAvatar(
  icon: DIcon(name: 'user'),
)
```

## Sizes

DAvatar supports 9 sizes from `xxxs` to `xxxl`:

```
DAvatar(text: 'A', size: DAvatarSize.xxxs)  // 16px
DAvatar(text: 'A', size: DAvatarSize.xxs)   // 20px
DAvatar(text: 'A', size: DAvatarSize.xs)    // 24px
DAvatar(text: 'A', size: DAvatarSize.sm)    // 28px
DAvatar(text: 'A', size: DAvatarSize.md)    // 32px
DAvatar(text: 'A', size: DAvatarSize.lg)    // 40px
DAvatar(text: 'A', size: DAvatarSize.xl)    // 48px
DAvatar(text: 'A', size: DAvatarSize.xxl)   // 64px
DAvatar(text: 'A', size: DAvatarSize.xxxl)  // 80px
```

## With Status Chip

Display a status indicator on the avatar:

```
// Online status (bottom right)
DAvatar(
  src: '/user.jpg',
  chipColor: DColor.success,
  chipPosition: DChipPosition.bottomRight,
)

// Busy status (top right)
DAvatar(
  src: '/user.jpg',
  chipColor: DColor.error,
  chipPosition: DChipPosition.topRight,
)

// Away status (bottom left)
DAvatar(
  src: '/user.jpg',
  chipColor: DColor.warning,
  chipPosition: DChipPosition.bottomLeft,
)
```

## Avatar Group

Display multiple avatars together with an overflow indicator:

```
DAvatarGroup(
  avatars: [
    DAvatar(src: '/user1.jpg'),
    DAvatar(src: '/user2.jpg'),
    DAvatar(src: '/user3.jpg'),
    DAvatar(src: '/user4.jpg'),
    DAvatar(src: '/user5.jpg'),
    DAvatar(src: '/user6.jpg'),
  ],
  max: 4,  // Shows 4 avatars + "+2" indicator
  size: DAvatarSize.md,
)
```

## Fallback Behavior

When an image fails to load, DAvatar gracefully falls back:

```
// Primary: image, Fallback: initials
DAvatar(
  src: '/may-not-exist.jpg',
  text: 'JD',  // Shows if image fails
)

// Primary: image, Fallback: icon
DAvatar(
  src: '/may-not-exist.jpg',
  icon: DIcon(name: 'user'),  // Shows if image fails
)
```

## Common Use Cases

### User Profile Header

```
div(classes: 'flex items-center gap-4', [
  DAvatar(
    src: '/profile.jpg',
    size: DAvatarSize.xl,
    chipColor: DColor.success,
    chipPosition: DChipPosition.bottomRight,
  ),
  div([
    h2(classes: 'font-semibold', [text('Jane Smith')]),
    p(classes: 'text-sm text-gray-500', [text('Product Designer')]),
  ]),
])
```

### Comment List

```
div(classes: 'flex gap-3', [
  DAvatar(
    text: 'MK',
    size: DAvatarSize.sm,
  ),
  div([
    span(classes: 'font-medium', [text('Mike K.')]),
    p(classes: 'text-gray-600', [text('Great work on this!')]),
  ]),
])
```

### Team Members

```
div([
  p(classes: 'text-sm text-gray-500 mb-2', [text('Team members')]),
  DAvatarGroup(
    avatars: teamMembers.map((m) => DAvatar(src: m.avatar)).toList(),
    max: 5,
    size: DAvatarSize.sm,
  ),
])
```

## Dark Mode Support

`DAvatar` automatically adapts to dark mode:
- Background colors for initials adjust for contrast
- Border colors are optimized for dark backgrounds
- Status chips remain visible in both modes

## API Reference

### DAvatar

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `src` | `String?` | `null` | Image URL |
| `alt` | `String?` | `null` | Image alt text |
| `text` | `String?` | `null` | Initials to display |
| `icon` | `Component?` | `null` | Icon to display |
| `size` | `DAvatarSize` | `md` | Avatar size |
| `chipColor` | `DColor?` | `null` | Status indicator color |
| `chipPosition` | `DChipPosition` | `bottomRight` | Status indicator position |

### DAvatarGroup

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `avatars` | `List<DAvatar>` | required | List of avatars |
| `max` | `int?` | `null` | Maximum avatars to show |
| `size` | `DAvatarSize` | `md` | Size for all avatars |
