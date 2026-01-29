---
title: Select
description: A dropdown component for selecting from a list of options.
layout: ui-layout
order: 17
---

# Select

The `DSelect` component provides a dropdown for selecting one or multiple options from a list.

## Basic Usage

```dart
DSelect<String>(
  label: 'Country',
  placeholder: 'Select a country',
  options: [
    DSelectOption(label: 'United States', value: 'us'),
    DSelectOption(label: 'Canada', value: 'ca'),
    DSelectOption(label: 'United Kingdom', value: 'uk'),
    DSelectOption(label: 'Germany', value: 'de'),
    DSelectOption(label: 'France', value: 'fr'),
  ],
  onSelect: (value) => print('Selected: $value'),
)
```

## With Default Value

```dart
DSelect<String>(
  label: 'Status',
  value: 'active',
  options: [
    DSelectOption(label: 'Active', value: 'active'),
    DSelectOption(label: 'Inactive', value: 'inactive'),
    DSelectOption(label: 'Pending', value: 'pending'),
  ],
  onSelect: (value) => setState(() => status = value),
)
```

## Sizes

```dart
DSelect<String>(label: 'XS', size: DSize.xs, options: [...])
DSelect<String>(label: 'SM', size: DSize.sm, options: [...])
DSelect<String>(label: 'MD', size: DSize.md, options: [...])  // Default
DSelect<String>(label: 'LG', size: DSize.lg, options: [...])
DSelect<String>(label: 'XL', size: DSize.xl, options: [...])
```

## Searchable

Enable filtering options:

```dart
DSelect<String>(
  label: 'Country',
  searchable: true,
  placeholder: 'Search countries...',
  options: [
    DSelectOption(label: 'United States', value: 'us'),
    DSelectOption(label: 'Canada', value: 'ca'),
    DSelectOption(label: 'United Kingdom', value: 'uk'),
    // ... many more options
  ],
  onSelect: (value) => {},
)
```

## Clearable

Allow clearing the selection:

```dart
DSelect<String>(
  label: 'Category',
  clearable: true,
  value: selectedCategory,
  options: categoryOptions,
  onSelect: (value) => setState(() => selectedCategory = value),
)
```

## Multiple Selection

```dart
DSelect<String>(
  label: 'Tags',
  multiple: true,
  value: selectedTags,  // List<String>
  options: [
    DSelectOption(label: 'JavaScript', value: 'js'),
    DSelectOption(label: 'Python', value: 'py'),
    DSelectOption(label: 'Dart', value: 'dart'),
    DSelectOption(label: 'Go', value: 'go'),
    DSelectOption(label: 'Rust', value: 'rust'),
  ],
  onSelect: (values) => setState(() => selectedTags = values),
)
```

## With Icons

```dart
DSelect<String>(
  label: 'Priority',
  leadingIcon: DIcon(name: 'flag'),
  options: [
    DSelectOption(label: 'High', value: 'high'),
    DSelectOption(label: 'Medium', value: 'medium'),
    DSelectOption(label: 'Low', value: 'low'),
  ],
  onSelect: (value) => {},
)
```

## Option Groups

Organize options into groups:

```dart
DSelect<String>(
  label: 'Timezone',
  optionGroups: [
    DSelectOptionGroup(
      label: 'Americas',
      options: [
        DSelectOption(label: 'New York (EST)', value: 'est'),
        DSelectOption(label: 'Los Angeles (PST)', value: 'pst'),
        DSelectOption(label: 'Chicago (CST)', value: 'cst'),
      ],
    ),
    DSelectOptionGroup(
      label: 'Europe',
      options: [
        DSelectOption(label: 'London (GMT)', value: 'gmt'),
        DSelectOption(label: 'Paris (CET)', value: 'cet'),
        DSelectOption(label: 'Berlin (CET)', value: 'cet-de'),
      ],
    ),
    DSelectOptionGroup(
      label: 'Asia',
      options: [
        DSelectOption(label: 'Tokyo (JST)', value: 'jst'),
        DSelectOption(label: 'Singapore (SGT)', value: 'sgt'),
        DSelectOption(label: 'Mumbai (IST)', value: 'ist'),
      ],
    ),
  ],
  onSelect: (value) => {},
)
```

## Disabled Options

```dart
DSelect<String>(
  label: 'Plan',
  options: [
    DSelectOption(label: 'Free', value: 'free'),
    DSelectOption(label: 'Pro', value: 'pro'),
    DSelectOption(
      label: 'Enterprise (Contact Sales)',
      value: 'enterprise',
      disabled: true,
    ),
  ],
  onSelect: (value) => {},
)
```

## States

### Disabled

```dart
DSelect<String>(
  label: 'Region',
  disabled: true,
  value: 'us',
  options: regionOptions,
)
```

### Loading

```dart
DSelect<String>(
  label: 'Data',
  loading: true,
  options: [],
)
```

### Error

```dart
DSelect<String>(
  label: 'Category',
  error: 'Please select a category',
  options: categoryOptions,
  onSelect: (value) => {},
)
```

## Complete Form Example

```dart
class UserSettingsForm extends StatefulComponent {
  @override
  State createState() => _UserSettingsFormState();
}

class _UserSettingsFormState extends State<UserSettingsForm> {
  String? language;
  String? timezone;
  String? theme;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      header: [
        h3([text('Preferences')]),
      ],
      body: [
        div(classes: 'space-y-4', [
          DSelect<String>(
            label: 'Language',
            value: language,
            searchable: true,
            options: [
              DSelectOption(label: 'English', value: 'en'),
              DSelectOption(label: 'Spanish', value: 'es'),
              DSelectOption(label: 'French', value: 'fr'),
              DSelectOption(label: 'German', value: 'de'),
              DSelectOption(label: 'Japanese', value: 'ja'),
            ],
            onSelect: (v) => setState(() => language = v),
          ),
          DSelect<String>(
            label: 'Timezone',
            value: timezone,
            searchable: true,
            clearable: true,
            optionGroups: timezoneGroups,
            onSelect: (v) => setState(() => timezone = v),
          ),
          DSelect<String>(
            label: 'Theme',
            value: theme,
            leadingIcon: DIcon(name: 'palette'),
            options: [
              DSelectOption(label: 'Light', value: 'light'),
              DSelectOption(label: 'Dark', value: 'dark'),
              DSelectOption(label: 'System', value: 'system'),
            ],
            onSelect: (v) => setState(() => theme = v),
          ),
        ]),
      ],
      footer: [
        div(classes: 'flex justify-end gap-2', [
          DButton(label: 'Cancel', variant: DButtonVariant.ghost),
          DButton(label: 'Save Preferences'),
        ]),
      ],
    );
  }
}
```

## Dark Mode Support

`DSelect` automatically adapts to dark mode:
- Dropdown background adjusts for proper contrast
- Option hover states are visible in both modes
- Selected option highlighting works correctly
- Border and focus states adapt appropriately

## API Reference

### DSelect<T>

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Input label |
| `placeholder` | `String?` | `null` | Placeholder text |
| `value` | `T?` | `null` | Selected value |
| `options` | `List<DSelectOption<T>>?` | `null` | Flat options list |
| `optionGroups` | `List<DSelectOptionGroup<T>>?` | `null` | Grouped options |
| `size` | `DSize` | `md` | Select size |
| `searchable` | `bool` | `false` | Enable search filter |
| `clearable` | `bool` | `false` | Allow clearing selection |
| `multiple` | `bool` | `false` | Multiple selection |
| `disabled` | `bool` | `false` | Disable select |
| `loading` | `bool` | `false` | Show loading state |
| `error` | `String?` | `null` | Error message |
| `leadingIcon` | `Component?` | `null` | Icon before text |
| `onSelect` | `ValueChanged<T>?` | `null` | Selection callback |

### DSelectOption<T>

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Display text |
| `value` | `T` | required | Option value |
| `disabled` | `bool` | `false` | Disable option |

### DSelectOptionGroup<T>

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Group header |
| `options` | `List<DSelectOption<T>>` | required | Group options |
