---
title: Kbd
description: A component for displaying keyboard shortcuts and keys.
layout: ui-layout
order: 30
---

# Kbd

The `DKBD` component displays keyboard keys and shortcuts in a styled badge format.

## Basic Usage

```
DKBD(keys: ['Ctrl', 'S'])
```

## Single Key

```
DKBD(keys: ['Enter'])
DKBD(keys: ['Esc'])
DKBD(keys: ['Tab'])
```

## Key Combinations

```
// Save
DKBD(keys: ['Ctrl', 'S'])

// Copy
DKBD(keys: ['Ctrl', 'C'])

// Paste
DKBD(keys: ['Ctrl', 'V'])

// Undo
DKBD(keys: ['Ctrl', 'Z'])

// Search
DKBD(keys: ['Ctrl', 'K'])
```

## Mac Style Keys

```
// Command + S
DKBD(keys: ['⌘', 'S'])

// Option + Shift + P
DKBD(keys: ['⌥', '⇧', 'P'])

// Control + Option + Delete
DKBD(keys: ['⌃', '⌥', '⌫'])
```

## In Tooltips

```
DTooltip(
  content: div(classes: 'flex items-center gap-2', [
    span([text('Save')]),
    DKBD(keys: ['Ctrl', 'S']),
  ]),
  child: DButton(
    leadingIcon: DIcon(name: 'save'),
    variant: DButtonVariant.ghost,
    square: true,
  ),
)
```

## In Menu Items

```
DDropdown(
  trigger: DButton(label: 'File'),
  items: [
    DDropdownItem(
      label: 'New',
      trailing: DKBD(keys: ['Ctrl', 'N']),
    ),
    DDropdownItem(
      label: 'Open',
      trailing: DKBD(keys: ['Ctrl', 'O']),
    ),
    DDropdownItem(
      label: 'Save',
      trailing: DKBD(keys: ['Ctrl', 'S']),
    ),
    DDropdownItem(divider: true),
    DDropdownItem(
      label: 'Exit',
      trailing: DKBD(keys: ['Alt', 'F4']),
    ),
  ],
)
```

## Keyboard Shortcuts Help

```
DCard(
  header: [
    h3([text('Keyboard Shortcuts')]),
  ],
  body: [
    div(classes: 'space-y-3', [
      shortcutRow('Save document', ['Ctrl', 'S']),
      shortcutRow('Open file', ['Ctrl', 'O']),
      shortcutRow('Find', ['Ctrl', 'F']),
      shortcutRow('Find and replace', ['Ctrl', 'H']),
      shortcutRow('Go to line', ['Ctrl', 'G']),
      shortcutRow('Toggle comment', ['Ctrl', '/']),
      shortcutRow('Duplicate line', ['Ctrl', 'Shift', 'D']),
      shortcutRow('Delete line', ['Ctrl', 'Shift', 'K']),
    ]),
  ],
)

Component shortcutRow(String label, List<String> keys) {
  return div(classes: 'flex items-center justify-between', [
    span(classes: 'text-gray-600 dark:text-gray-400', [text(label)]),
    DKBD(keys: keys),
  ]);
}
```

## Command Palette Item

```
div(classes: 'flex items-center justify-between p-2 hover:bg-gray-100 dark:hover:bg-gray-800 rounded', [
  div(classes: 'flex items-center gap-3', [
    DIcon(name: 'file-plus', size: 16, classes: 'text-gray-400'),
    span([text('Create new file')]),
  ]),
  DKBD(keys: ['Ctrl', 'N']),
])
```

## Inline Usage

```
p([
  text('Press '),
  DKBD(keys: ['Enter']),
  text(' to submit or '),
  DKBD(keys: ['Esc']),
  text(' to cancel.'),
])
```

## Navigation Instructions

```
div(classes: 'text-sm text-gray-500 flex items-center gap-4', [
  div(classes: 'flex items-center gap-1', [
    DKBD(keys: ['↑']),
    DKBD(keys: ['↓']),
    text('to navigate'),
  ]),
  div(classes: 'flex items-center gap-1', [
    DKBD(keys: ['Enter']),
    text('to select'),
  ]),
  div(classes: 'flex items-center gap-1', [
    DKBD(keys: ['Esc']),
    text('to close'),
  ]),
])
```

## Sizes

```
DKBD(keys: ['Ctrl', 'S'], size: DSize.xs)
DKBD(keys: ['Ctrl', 'S'], size: DSize.sm)
DKBD(keys: ['Ctrl', 'S'], size: DSize.md)  // Default
```

## Common Key Symbols

| Key | Symbol |
|-----|--------|
| Command (Mac) | `⌘` |
| Option (Mac) | `⌥` |
| Control | `⌃` or `Ctrl` |
| Shift | `⇧` or `Shift` |
| Caps Lock | `⇪` |
| Tab | `⇥` or `Tab` |
| Return/Enter | `↵` or `Enter` |
| Delete | `⌫` or `Del` |
| Escape | `⎋` or `Esc` |
| Arrow Up | `↑` |
| Arrow Down | `↓` |
| Arrow Left | `←` |
| Arrow Right | `→` |

## Dark Mode Support

`DKBD` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Border colors are optimized
- Text remains readable

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `keys` | `List<String>` | required | Keys to display |
| `size` | `DSize` | `sm` | Key badge size |
| `separator` | `String` | `+` | Separator between keys |
