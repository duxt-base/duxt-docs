---
title: Switch
description: A toggle control for binary on/off choices.
layout: ui-layout
order: 19
---

# Switch

The `DSwitch` component provides a toggle control for binary choices, commonly used for settings and feature flags.

## Basic Usage

```dart
DSwitch(
  label: 'Enable notifications',
  onChange: (checked) => print('Enabled: $checked'),
)
```

## Controlled State

```dart
class SwitchExample extends StatefulComponent {
  @override
  State createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool enabled = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DSwitch(
      label: 'Dark mode',
      checked: enabled,
      onChange: (checked) => setState(() => enabled = checked),
    );
  }
}
```

## Sizes

```dart
DSwitch(label: 'XS Switch', size: DSize.xs)
DSwitch(label: 'SM Switch', size: DSize.sm)
DSwitch(label: 'MD Switch', size: DSize.md)  // Default
DSwitch(label: 'LG Switch', size: DSize.lg)
DSwitch(label: 'XL Switch', size: DSize.xl)
```

## Colors

```dart
DSwitch(label: 'Primary', checked: true, color: DColor.primary)
DSwitch(label: 'Gray', checked: true, color: DColor.neutral)
DSwitch(label: 'Success', checked: true, color: DColor.success)
DSwitch(label: 'Warning', checked: true, color: DColor.warning)
DSwitch(label: 'Error', checked: true, color: DColor.error)
```

## With On/Off Labels

Custom labels displayed on the track:

```dart
DSwitch(
  label: 'Availability',
  onLabel: 'On',
  offLabel: 'Off',
  onChange: (checked) => {},
)
```

## With Icons

Icons displayed inside the thumb:

```dart
DSwitch(
  label: 'Dark mode',
  onIcon: DIcon(name: 'moon', size: 12),
  offIcon: DIcon(name: 'sun', size: 12),
  onChange: (checked) => {},
)
```

## With Description

```dart
DSwitch(
  label: 'Email notifications',
  description: 'Receive email updates about your account activity',
  onChange: (checked) => {},
)
```

## Disabled State

```dart
DSwitch(
  label: 'Disabled off',
  disabled: true,
)

DSwitch(
  label: 'Disabled on',
  checked: true,
  disabled: true,
)
```

## Required

```dart
DSwitch(
  label: 'Accept terms',
  required: true,
  onChange: (checked) => {},
)
```

## Settings Panel Example

```dart
class SettingsPanel extends StatefulComponent {
  @override
  State createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<SettingsPanel> {
  bool darkMode = false;
  bool notifications = true;
  bool sounds = true;
  bool autoUpdate = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      header: [h3([text('Settings')])],
      body: [
        div(classes: 'divide-y', [
          // Appearance section
          div(classes: 'py-4', [
            h4(classes: 'font-medium mb-3', [text('Appearance')]),
            DSwitch(
              label: 'Dark mode',
              description: 'Use dark theme throughout the app',
              checked: darkMode,
              onIcon: DIcon(name: 'moon', size: 12),
              offIcon: DIcon(name: 'sun', size: 12),
              onChange: (v) => setState(() => darkMode = v),
            ),
          ]),

          // Notifications section
          div(classes: 'py-4', [
            h4(classes: 'font-medium mb-3', [text('Notifications')]),
            div(classes: 'space-y-4', [
              DSwitch(
                label: 'Push notifications',
                description: 'Receive push notifications on this device',
                checked: notifications,
                color: DColor.success,
                onChange: (v) => setState(() => notifications = v),
              ),
              DSwitch(
                label: 'Sound effects',
                description: 'Play sounds for notifications',
                checked: sounds,
                disabled: !notifications,
                onChange: (v) => setState(() => sounds = v),
              ),
            ]),
          ]),

          // Updates section
          div(classes: 'py-4', [
            h4(classes: 'font-medium mb-3', [text('Updates')]),
            DSwitch(
              label: 'Automatic updates',
              description: 'Download and install updates automatically',
              checked: autoUpdate,
              onChange: (v) => setState(() => autoUpdate = v),
            ),
          ]),
        ]),
      ],
    );
  }
}
```

## Feature Flags Example

```dart
DCard(
  header: [
    div(classes: 'flex items-center justify-between', [
      h3([text('Feature Flags')]),
      DBadge(label: 'Beta', color: DColor.warning),
    ]),
  ],
  body: [
    div(classes: 'space-y-4', [
      DSwitch(
        label: 'New Dashboard',
        description: 'Enable the redesigned dashboard experience',
        checked: features['dashboard'] ?? false,
        onChange: (v) => updateFeature('dashboard', v),
      ),
      DSwitch(
        label: 'AI Suggestions',
        description: 'Show AI-powered suggestions in the editor',
        checked: features['ai'] ?? false,
        onChange: (v) => updateFeature('ai', v),
      ),
      DSwitch(
        label: 'Experimental API',
        description: 'Access beta API features (may be unstable)',
        checked: features['api'] ?? false,
        color: DColor.warning,
        onChange: (v) => updateFeature('api', v),
      ),
    ]),
  ],
)
```

## Dark Mode Support

`DSwitch` automatically adapts to dark mode:
- Track backgrounds adjust for proper contrast
- Thumb colors remain visible
- Labels and descriptions are readable
- Transition animations work in both modes

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Switch label |
| `description` | `String?` | `null` | Secondary text |
| `checked` | `bool` | `false` | On/off state |
| `size` | `DSize` | `md` | Switch size |
| `color` | `DColor` | `primary` | Active color |
| `onLabel` | `String?` | `null` | Label shown when on |
| `offLabel` | `String?` | `null` | Label shown when off |
| `onIcon` | `Component?` | `null` | Icon shown when on |
| `offIcon` | `Component?` | `null` | Icon shown when off |
| `disabled` | `bool` | `false` | Disable switch |
| `required` | `bool` | `false` | Mark as required |
| `onChange` | `ValueChanged<bool>?` | `null` | Change callback |
