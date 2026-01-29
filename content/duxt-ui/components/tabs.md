---
title: Tabs
description: A component for organizing content into tabbed sections.
layout: ui-layout
order: 8
---

# Tabs

The `DTabs` component organizes content into multiple tabbed sections, allowing users to switch between different views.

## Basic Usage

```dart
DTabs(
  items: [
    DTabItem(
      label: 'Account',
      value: 'account',
      content: [
        text('Account settings content...'),
      ],
    ),
    DTabItem(
      label: 'Security',
      value: 'security',
      content: [
        text('Security settings content...'),
      ],
    ),
    DTabItem(
      label: 'Notifications',
      value: 'notifications',
      content: [
        text('Notification preferences content...'),
      ],
    ),
  ],
)
```

## With Default Value

```dart
DTabs(
  defaultValue: 'security',
  items: [
    DTabItem(label: 'Account', value: 'account', content: [...]),
    DTabItem(label: 'Security', value: 'security', content: [...]),
    DTabItem(label: 'Notifications', value: 'notifications', content: [...]),
  ],
)
```

## With Icons

```dart
DTabs(
  items: [
    DTabItem(
      label: 'Account',
      value: 'account',
      icon: DIcon(name: 'user'),
      content: [...],
    ),
    DTabItem(
      label: 'Security',
      value: 'security',
      icon: DIcon(name: 'lock'),
      content: [...],
    ),
    DTabItem(
      label: 'Notifications',
      value: 'notifications',
      icon: DIcon(name: 'bell'),
      content: [...],
    ),
  ],
)
```

## Vertical Orientation

```dart
DTabs(
  orientation: DTabsOrientation.vertical,
  items: [
    DTabItem(label: 'Overview', value: 'overview', content: [...]),
    DTabItem(label: 'Analytics', value: 'analytics', content: [...]),
    DTabItem(label: 'Reports', value: 'reports', content: [...]),
  ],
)
```

## Disabled Tabs

```dart
DTabs(
  items: [
    DTabItem(label: 'Active', value: 'active', content: [...]),
    DTabItem(
      label: 'Coming Soon',
      value: 'coming-soon',
      disabled: true,
      content: [...],
    ),
    DTabItem(label: 'Settings', value: 'settings', content: [...]),
  ],
)
```

## Controlled Tabs

For external state management:

```dart
class ControlledTabsExample extends StatefulComponent {
  @override
  State createState() => _ControlledTabsExampleState();
}

class _ControlledTabsExampleState extends State<ControlledTabsExample> {
  String activeTab = 'tab1';

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DControlledTabs(
      value: activeTab,
      onSelect: (value) => setState(() => activeTab = value),
      items: [
        DTabItem(label: 'Tab 1', value: 'tab1', content: [...]),
        DTabItem(label: 'Tab 2', value: 'tab2', content: [...]),
        DTabItem(label: 'Tab 3', value: 'tab3', content: [...]),
      ],
    );

    // External controls
    yield div(classes: 'mt-4 flex gap-2', [
      DButton(
        label: 'Go to Tab 1',
        onClick: () => setState(() => activeTab = 'tab1'),
      ),
      DButton(
        label: 'Go to Tab 2',
        onClick: () => setState(() => activeTab = 'tab2'),
      ),
    ]);
  }
}
```

## Unmount on Hide

Control whether inactive tab content is removed from the DOM:

```dart
DTabs(
  unmountOnHide: true,  // Remove inactive content from DOM
  items: [
    DTabItem(label: 'Tab 1', value: 'tab1', content: [...]),
    DTabItem(label: 'Tab 2', value: 'tab2', content: [...]),
  ],
)
```

## On Select Callback

```dart
DTabs(
  onSelect: (value) {
    print('Selected tab: $value');
  },
  items: [
    DTabItem(label: 'Tab 1', value: 'tab1', content: [...]),
    DTabItem(label: 'Tab 2', value: 'tab2', content: [...]),
  ],
)
```

## Complete Example

```dart
DTabs(
  defaultValue: 'profile',
  items: [
    DTabItem(
      label: 'Profile',
      value: 'profile',
      icon: DIcon(name: 'user'),
      content: [
        div(classes: 'space-y-4', [
          DInput(label: 'Name', placeholder: 'Enter your name'),
          DInput(label: 'Bio', placeholder: 'Tell us about yourself'),
          DButton(label: 'Save Profile'),
        ]),
      ],
    ),
    DTabItem(
      label: 'Password',
      value: 'password',
      icon: DIcon(name: 'key'),
      content: [
        div(classes: 'space-y-4', [
          DInput(label: 'Current Password', type: InputType.password),
          DInput(label: 'New Password', type: InputType.password),
          DInput(label: 'Confirm Password', type: InputType.password),
          DButton(label: 'Update Password'),
        ]),
      ],
    ),
    DTabItem(
      label: 'Billing',
      value: 'billing',
      icon: DIcon(name: 'credit-card'),
      content: [
        DCard(
          body: [
            text('Your billing information...'),
          ],
        ),
      ],
    ),
  ],
)
```

## Dark Mode Support

`DTabs` automatically adapts to dark mode:
- Tab backgrounds adjust for proper contrast
- Active tab indicators are visible in both modes
- Content areas maintain readability
- Hover and focus states adapt appropriately

## API Reference

### DTabs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | `List<DTabItem>` | required | Tab items |
| `defaultValue` | `String?` | `null` | Initially active tab |
| `orientation` | `DTabsOrientation` | `horizontal` | Tab layout direction |
| `unmountOnHide` | `bool` | `false` | Remove inactive content from DOM |
| `onSelect` | `ValueChanged<String>?` | `null` | Tab change callback |

### DControlledTabs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | `List<DTabItem>` | required | Tab items |
| `value` | `String` | required | Active tab value |
| `orientation` | `DTabsOrientation` | `horizontal` | Tab layout direction |
| `unmountOnHide` | `bool` | `false` | Remove inactive content from DOM |
| `onSelect` | `ValueChanged<String>?` | `null` | Tab change callback |

### DTabItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Tab label text |
| `value` | `String` | required | Unique identifier |
| `icon` | `Component?` | `null` | Tab icon |
| `content` | `List<Component>` | required | Tab panel content |
| `disabled` | `bool` | `false` | Disable the tab |
