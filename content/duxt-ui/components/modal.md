---
title: Modal
description: A dialog overlay for focused user interactions.
layout: ui-layout
order: 7
---

# Modal

The `DModal` component displays content in a dialog overlay, useful for confirmations, forms, and focused interactions.

## Basic Usage

```dart
DModal(
  open: isOpen,
  title: 'Confirm Action',
  children: [
    p([text('Are you sure you want to proceed?')]),
  ],
  footer: [
    DButton(
      label: 'Cancel',
      variant: DButtonVariant.ghost,
      onClick: () => setState(() => isOpen = false),
    ),
    DButton(
      label: 'Confirm',
      onClick: () => handleConfirm(),
    ),
  ],
)
```

## Sizes

```dart
DModal(open: true, title: 'XS Modal', size: DModalSize.xs, ...)
DModal(open: true, title: 'SM Modal', size: DModalSize.sm, ...)
DModal(open: true, title: 'MD Modal', size: DModalSize.md, ...)  // Default
DModal(open: true, title: 'LG Modal', size: DModalSize.lg, ...)
DModal(open: true, title: 'XL Modal', size: DModalSize.xl, ...)
DModal(open: true, title: 'Full Modal', size: DModalSize.full, ...)
```

## With Description

```dart
DModal(
  open: isOpen,
  title: 'Delete Item',
  description: 'This action cannot be undone.',
  children: [
    p([text('Are you sure you want to delete this item?')]),
  ],
)
```

## Custom Header

```dart
DModal(
  open: isOpen,
  header: [
    div(classes: 'flex items-center gap-3', [
      DIcon(name: 'alert-triangle', classes: 'text-warning-500'),
      h3(classes: 'font-semibold', [text('Warning')]),
    ]),
  ],
  children: [
    text('Custom header content...'),
  ],
)
```

## Close Behavior

### Close on Overlay Click

```dart
DModal(
  open: isOpen,
  closeOnOverlay: true,  // Default: true
  onClose: () => setState(() => isOpen = false),
  children: [...],
)
```

### Close on Escape Key

```dart
DModal(
  open: isOpen,
  closeOnEscape: true,  // Default: true
  onClose: () => setState(() => isOpen = false),
  children: [...],
)
```

### Prevent Close

For modals that require explicit action:

```dart
DModal(
  open: isOpen,
  preventClose: true,
  title: 'Required Action',
  children: [
    text('You must complete this action before closing.'),
  ],
  footer: [
    DButton(
      label: 'Complete',
      onClick: () => completeAndClose(),
    ),
  ],
)
```

## Form Modal Example

```dart
class EditProfileModal extends StatefulComponent {
  final bool open;
  final void Function() onClose;

  EditProfileModal({required this.open, required this.onClose});

  @override
  State createState() => _EditProfileModalState();
}

class _EditProfileModalState extends State<EditProfileModal> {
  String name = '';
  String email = '';

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DModal(
      open: component.open,
      title: 'Edit Profile',
      description: 'Update your profile information.',
      onClose: component.onClose,
      children: [
        div(classes: 'space-y-4', [
          DInput(
            label: 'Name',
            value: name,
            onInput: (v) => setState(() => name = v),
          ),
          DInput(
            label: 'Email',
            type: InputType.email,
            value: email,
            onInput: (v) => setState(() => email = v),
          ),
        ]),
      ],
      footer: [
        DButton(
          label: 'Cancel',
          variant: DButtonVariant.ghost,
          onClick: component.onClose,
        ),
        DButton(
          label: 'Save Changes',
          onClick: () => saveProfile(),
        ),
      ],
    );
  }
}
```

## Confirmation Modal

```dart
DModal(
  open: showDeleteConfirm,
  title: 'Delete Project',
  description: 'This will permanently delete the project and all its data.',
  size: DModalSize.sm,
  children: [
    DAlert(
      color: DColor.error,
      variant: DAlertVariant.soft,
      title: 'Warning',
      description: 'This action cannot be undone.',
    ),
  ],
  footer: [
    DButton(
      label: 'Cancel',
      variant: DButtonVariant.outline,
      onClick: () => setState(() => showDeleteConfirm = false),
    ),
    DButton(
      label: 'Delete',
      color: DColor.error,
      onClick: () => deleteProject(),
    ),
  ],
)
```

## Dark Mode Support

`DModal` automatically adapts to dark mode:
- Backdrop opacity adjusts appropriately
- Background colors provide proper contrast
- Border and shadow effects are optimized
- All content within adapts to the theme

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `open` | `bool` | required | Whether modal is visible |
| `title` | `String?` | `null` | Modal title |
| `description` | `String?` | `null` | Subtitle below title |
| `header` | `List<Component>?` | `null` | Custom header content |
| `children` | `List<Component>` | required | Modal body content |
| `footer` | `List<Component>?` | `null` | Footer content |
| `size` | `DModalSize` | `md` | Modal width |
| `closeOnOverlay` | `bool` | `true` | Close when clicking backdrop |
| `closeOnEscape` | `bool` | `true` | Close on Escape key |
| `preventClose` | `bool` | `false` | Disable all close methods |
| `onClose` | `VoidCallback?` | `null` | Close callback |
