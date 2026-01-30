---
title: Table
description: A component for displaying tabular data with customizable columns.
layout: ui-layout
order: 10
---

# Table

The `DTable` component displays data in a tabular format with support for custom rendering, styling options, and responsive design.

## Basic Usage

```
DTable<Map<String, String>>(
  columns: [
    DTableColumn(key: 'name', label: 'Name'),
    DTableColumn(key: 'email', label: 'Email'),
    DTableColumn(key: 'role', label: 'Role'),
  ],
  data: [
    {'name': 'John Doe', 'email': 'john@example.com', 'role': 'Admin'},
    {'name': 'Jane Smith', 'email': 'jane@example.com', 'role': 'User'},
    {'name': 'Bob Wilson', 'email': 'bob@example.com', 'role': 'Editor'},
  ],
)
```

## With Custom Row Key

```
DTable<User>(
  columns: [...],
  data: users,
  rowKey: (user) => user.id,  // Use user.id as unique key
)
```

## Striped Rows

```
DTable<User>(
  columns: [...],
  data: users,
  striped: true,  // Alternate row backgrounds
)
```

## Hoverable Rows

```
DTable<User>(
  columns: [...],
  data: users,
  hoverable: true,  // Highlight row on hover
)
```

## Bordered Table

```
DTable<User>(
  columns: [...],
  data: users,
  bordered: true,  // Add borders to cells
)
```

## Custom Cell Rendering

```
DTable<User>(
  columns: [
    DTableColumn(
      key: 'avatar',
      label: '',
      render: (user) => DAvatar(
        src: user.avatarUrl,
        size: DAvatarSize.sm,
      ),
    ),
    DTableColumn(
      key: 'name',
      label: 'Name',
      render: (user) => div([
        p(classes: 'font-medium', [text(user.name)]),
        p(classes: 'text-sm text-gray-500', [text(user.email)]),
      ]),
    ),
    DTableColumn(
      key: 'status',
      label: 'Status',
      render: (user) => DBadge(
        label: user.status,
        color: user.isActive ? DColor.success : DColor.neutral,
        variant: DBadgeVariant.soft,
      ),
    ),
    DTableColumn(
      key: 'actions',
      label: '',
      render: (user) => DButton(
        label: 'Edit',
        size: DSize.sm,
        variant: DButtonVariant.ghost,
        onClick: () => editUser(user),
      ),
    ),
  ],
  data: users,
)
```

## Empty State

```
DTable<User>(
  columns: [
    DTableColumn(key: 'name', label: 'Name'),
    DTableColumn(key: 'email', label: 'Email'),
  ],
  data: [],  // Empty data
  emptyState: div(classes: 'text-center py-8', [
    DIcon(name: 'inbox', size: 48, classes: 'text-gray-400 mx-auto'),
    p(classes: 'mt-2 text-gray-500', [text('No users found')]),
    DButton(
      label: 'Add User',
      variant: DButtonVariant.outline,
      onClick: () => addUser(),
    ),
  ]),
)
```

## Complete Example

```
class UsersTable extends StatelessComponent {
  final List<User> users;

  UsersTable({required this.users});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      noPadding: true,
      body: [
        DTable<User>(
          columns: [
            DTableColumn(
              key: 'user',
              label: 'User',
              render: (user) => div(classes: 'flex items-center gap-3', [
                DAvatar(
                  src: user.avatar,
                  text: user.initials,
                  size: DAvatarSize.sm,
                ),
                div([
                  p(classes: 'font-medium', [text(user.name)]),
                  p(classes: 'text-sm text-gray-500', [text(user.email)]),
                ]),
              ]),
            ),
            DTableColumn(
              key: 'role',
              label: 'Role',
              render: (user) => text(user.role),
            ),
            DTableColumn(
              key: 'status',
              label: 'Status',
              render: (user) => DBadge(
                label: user.isActive ? 'Active' : 'Inactive',
                color: user.isActive ? DColor.success : DColor.neutral,
                variant: DBadgeVariant.soft,
              ),
            ),
            DTableColumn(
              key: 'joined',
              label: 'Joined',
              render: (user) => text(formatDate(user.joinedAt)),
            ),
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
                  DDropdownItem(label: 'View', icon: DIcon(name: 'eye')),
                  DDropdownItem(label: 'Edit', icon: DIcon(name: 'edit')),
                  DDropdownItem(divider: true),
                  DDropdownItem(label: 'Delete', icon: DIcon(name: 'trash')),
                ],
              ),
            ),
          ],
          data: users,
          rowKey: (user) => user.id,
          striped: true,
          hoverable: true,
          emptyState: div(classes: 'py-12 text-center', [
            p(classes: 'text-gray-500', [text('No users found')]),
          ]),
        ),
      ],
    );
  }
}
```

## Dark Mode Support

`DTable` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Borders and dividers are optimized
- Striped rows use appropriate dark shades
- Hover states remain visible

## API Reference

### DTable<T>

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `columns` | `List<DTableColumn<T>>` | required | Column definitions |
| `data` | `List<T>` | required | Row data |
| `rowKey` | `String Function(T)?` | `null` | Custom row key function |
| `striped` | `bool` | `false` | Alternate row backgrounds |
| `hoverable` | `bool` | `false` | Highlight on hover |
| `bordered` | `bool` | `false` | Add cell borders |
| `emptyState` | `Component?` | `null` | Empty state content |

### DTableColumn<T>

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `key` | `String` | required | Column identifier |
| `label` | `String` | required | Column header text |
| `render` | `Component Function(T)?` | `null` | Custom cell renderer |
