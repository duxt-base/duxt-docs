---
title: Pagination
description: Navigation controls for paginated content.
layout: ui-layout
order: 14
---

# Pagination

The `DPagination` and `DPaginationSimple` components provide navigation controls for paginated content.

## Basic Usage

```dart
DPagination(
  total: 100,
  pageSize: 10,
  currentPage: 1,
  onPageChange: (page) => loadPage(page),
)
```

## Simple Pagination

For a minimal prev/next interface:

```dart
DPaginationSimple(
  currentPage: 1,
  totalPages: 10,
  onPageChange: (page) => loadPage(page),
)
```

## Variants

### Solid

```dart
DPagination(
  variant: DPaginationVariant.solid,
  total: 100,
  pageSize: 10,
  currentPage: 1,
  onPageChange: (page) => {},
)
```

### Outline

```dart
DPagination(
  variant: DPaginationVariant.outline,
  total: 100,
  pageSize: 10,
  currentPage: 1,
  onPageChange: (page) => {},
)
```

### Soft

```dart
DPagination(
  variant: DPaginationVariant.soft,
  total: 100,
  pageSize: 10,
  currentPage: 1,
  onPageChange: (page) => {},
)
```

### Subtle

```dart
DPagination(
  variant: DPaginationVariant.subtle,
  total: 100,
  pageSize: 10,
  currentPage: 1,
  onPageChange: (page) => {},
)
```

### Ghost

```dart
DPagination(
  variant: DPaginationVariant.ghost,
  total: 100,
  pageSize: 10,
  currentPage: 1,
  onPageChange: (page) => {},
)
```

## Sibling Count

Control how many page numbers show around the current page:

```dart
// Shows: 1 ... 4 5 [6] 7 8 ... 10
DPagination(
  total: 100,
  pageSize: 10,
  currentPage: 6,
  siblingCount: 2,  // 2 pages on each side
  onPageChange: (page) => {},
)

// Shows: 1 ... 5 [6] 7 ... 10
DPagination(
  total: 100,
  pageSize: 10,
  currentPage: 6,
  siblingCount: 1,  // 1 page on each side
  onPageChange: (page) => {},
)
```

## Show/Hide Navigation

```dart
// Hide first/last buttons
DPagination(
  showFirstLast: false,
  total: 100,
  pageSize: 10,
  currentPage: 1,
  onPageChange: (page) => {},
)

// Hide prev/next buttons
DPagination(
  showPrevNext: false,
  total: 100,
  pageSize: 10,
  currentPage: 1,
  onPageChange: (page) => {},
)
```

## Custom Labels

```dart
DPagination(
  total: 100,
  pageSize: 10,
  currentPage: 1,
  prevLabel: 'Previous',
  nextLabel: 'Next',
  firstLabel: 'First',
  lastLabel: 'Last',
  onPageChange: (page) => {},
)
```

## With Page Info

Display current page information:

```dart
div(classes: 'flex items-center justify-between', [
  p(classes: 'text-sm text-gray-500', [
    text('Showing ${start + 1} to ${end} of $total results'),
  ]),
  DPagination(
    total: total,
    pageSize: pageSize,
    currentPage: currentPage,
    onPageChange: (page) => loadPage(page),
  ),
])
```

## Complete Table Example

```dart
class PaginatedTable extends StatefulComponent {
  @override
  State createState() => _PaginatedTableState();
}

class _PaginatedTableState extends State<PaginatedTable> {
  int currentPage = 1;
  int pageSize = 10;
  int total = 157;

  List<User> get currentUsers {
    final start = (currentPage - 1) * pageSize;
    final end = min(start + pageSize, total);
    return allUsers.sublist(start, end);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final start = (currentPage - 1) * pageSize;
    final end = min(start + pageSize, total);

    yield DCard(
      noPadding: true,
      body: [
        DTable<User>(
          columns: [
            DTableColumn(key: 'name', label: 'Name'),
            DTableColumn(key: 'email', label: 'Email'),
            DTableColumn(key: 'role', label: 'Role'),
          ],
          data: currentUsers,
        ),
      ],
      footer: [
        div(classes: 'flex items-center justify-between', [
          p(classes: 'text-sm text-gray-500', [
            text('Showing ${start + 1} to $end of $total results'),
          ]),
          DPagination(
            total: total,
            pageSize: pageSize,
            currentPage: currentPage,
            siblingCount: 1,
            onPageChange: (page) => setState(() => currentPage = page),
          ),
        ]),
      ],
    );
  }
}
```

## Simple Pagination Example

```dart
div(classes: 'flex items-center justify-between', [
  p(classes: 'text-sm text-gray-500', [
    text('Page $currentPage of $totalPages'),
  ]),
  DPaginationSimple(
    currentPage: currentPage,
    totalPages: totalPages,
    onPageChange: (page) => setState(() => currentPage = page),
  ),
])
```

## Dark Mode Support

`DPagination` automatically adapts to dark mode:
- Button backgrounds adjust for proper contrast
- Active page indicators remain visible
- Disabled states are distinguishable
- All variants work seamlessly in both modes

## API Reference

### DPagination

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `total` | `int` | required | Total number of items |
| `pageSize` | `int` | `10` | Items per page |
| `currentPage` | `int` | `1` | Current page number |
| `siblingCount` | `int` | `1` | Pages shown around current |
| `variant` | `DPaginationVariant` | `outline` | Visual style |
| `showFirstLast` | `bool` | `true` | Show first/last buttons |
| `showPrevNext` | `bool` | `true` | Show prev/next buttons |
| `prevLabel` | `String?` | `null` | Previous button label |
| `nextLabel` | `String?` | `null` | Next button label |
| `firstLabel` | `String?` | `null` | First button label |
| `lastLabel` | `String?` | `null` | Last button label |
| `onPageChange` | `ValueChanged<int>` | required | Page change callback |

### DPaginationSimple

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `currentPage` | `int` | required | Current page number |
| `totalPages` | `int` | required | Total number of pages |
| `onPageChange` | `ValueChanged<int>` | required | Page change callback |
