---
title: Empty
description: A component for displaying empty states when there's no data.
layout: ui-layout
order: 42
---

# Empty

The `DEmpty` component provides styled empty state displays for when there's no data to show.

## Basic Usage

```dart
DEmpty(
  title: 'No items',
  description: 'You haven\'t added any items yet.',
)
```

## With Icon

```dart
DEmpty(
  icon: '📭',
  title: 'No messages',
  description: 'Your inbox is empty.',
)
```

## With Icon Component

```dart
DEmpty(
  iconComponent: DIcon(name: 'inbox', size: 48, classes: 'text-gray-400'),
  title: 'No notifications',
  description: 'You\'re all caught up!',
)
```

## With Action

```dart
DEmpty(
  icon: '📁',
  title: 'No projects',
  description: 'Create your first project to get started.',
  action: DButton(
    label: 'Create Project',
    leadingIcon: DIcon(name: 'plus'),
    onClick: () => createProject(),
  ),
)
```

## Sizes

```dart
DEmpty(size: DSize.xs, title: 'No data')
DEmpty(size: DSize.sm, title: 'No data')
DEmpty(size: DSize.md, title: 'No data')  // Default
DEmpty(size: DSize.lg, title: 'No data')
DEmpty(size: DSize.xl, title: 'No data')
```

## Without Padding

```dart
DEmpty(
  padded: false,
  title: 'No items',
  description: 'Add some items to see them here.',
)
```

## Custom Children

```dart
DEmpty(
  icon: '🔍',
  title: 'No results',
  children: [
    p(classes: 'text-sm text-gray-500', [
      text('Try adjusting your search or '),
      a(href: '/help', classes: 'text-primary-600 hover:underline', [
        text('learn more about searching'),
      ]),
    ]),
  ],
)
```

## Preset Empty States

### No Data

```dart
DEmptyNoData(
  action: DButton(
    label: 'Add Data',
    onClick: () => addData(),
  ),
)
```

### No Results

```dart
DEmptyNoResults(
  searchTerm: 'flutter',
  action: DButton(
    label: 'Clear Search',
    variant: DButtonVariant.outline,
    onClick: () => clearSearch(),
  ),
)
```

## In Tables

```dart
DTable<User>(
  columns: columns,
  data: users,
  emptyState: DEmpty(
    iconComponent: DIcon(name: 'users', size: 40, classes: 'text-gray-400'),
    title: 'No users found',
    description: 'Try adjusting your filters or add a new user.',
    action: DButton(
      label: 'Add User',
      size: DSize.sm,
      onClick: () => addUser(),
    ),
  ),
)
```

## In Cards

```dart
DCard(
  body: [
    if (items.isEmpty)
      DEmpty(
        size: DSize.sm,
        icon: '📋',
        title: 'No tasks',
        description: 'All done for today!',
      )
    else
      ListView(items: items),
  ],
)
```

## Conditional Rendering

```dart
if (loading)
  DSpinner()
else if (error != null)
  DError(description: error)
else if (items.isEmpty)
  DEmpty(
    title: 'No items',
    action: DButton(label: 'Refresh', onClick: refresh),
  )
else
  itemList
```

## Dark Mode Support

`DEmpty` automatically adapts to dark mode with appropriate text and icon colors.

## API Reference

### DEmpty

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `icon` | `String?` | `null` | Emoji or text icon |
| `iconComponent` | `Component?` | `null` | Custom icon component |
| `title` | `String?` | `null` | Title text |
| `description` | `String?` | `null` | Description text |
| `action` | `Component?` | `null` | Action button |
| `children` | `List<Component>` | `[]` | Custom content |
| `size` | `DSize` | `md` | Component size |
| `padded` | `bool` | `true` | Add padding |

### Preset Components

| Component | Description |
|-----------|-------------|
| `DEmptyNoData` | Generic "no data" empty state |
| `DEmptyNoResults` | Search results empty state with optional search term |
