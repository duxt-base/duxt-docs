---
title: Separator
description: A visual divider to separate content sections.
layout: ui-layout
order: 26
---

# Separator

The `DSeparator` component provides a visual divider between content sections.

## Basic Usage

```
div([
  text('Section 1'),
  DSeparator(),
  text('Section 2'),
])
```

## Horizontal (Default)

```
div(classes: 'space-y-4', [
  p([text('First paragraph')]),
  DSeparator(orientation: DOrientation.horizontal),
  p([text('Second paragraph')]),
])
```

## Vertical

```
div(classes: 'flex items-center gap-4 h-6', [
  span([text('Item 1')]),
  DSeparator(orientation: DOrientation.vertical),
  span([text('Item 2')]),
  DSeparator(orientation: DOrientation.vertical),
  span([text('Item 3')]),
])
```

## Custom Color

```
DSeparator(color: 'border-primary-500')
DSeparator(color: 'border-gray-300 dark:border-gray-600')
DSeparator(color: 'border-dashed border-gray-400')
```

## With Label

Create a separator with centered text:

```
div(classes: 'flex items-center gap-4', [
  div(classes: 'flex-1', [DSeparator()]),
  span(classes: 'text-sm text-gray-500', [text('OR')]),
  div(classes: 'flex-1', [DSeparator()]),
])
```

## In Forms

```
DCard(
  body: [
    div(classes: 'space-y-4', [
      DInput(label: 'Email'),
      DInput(label: 'Password', type: InputType.password),
      DButton(label: 'Sign In', block: true),

      // Separator with "OR"
      div(classes: 'flex items-center gap-4 py-2', [
        div(classes: 'flex-1', [DSeparator()]),
        span(classes: 'text-sm text-gray-500', [text('OR')]),
        div(classes: 'flex-1', [DSeparator()]),
      ]),

      DButton(
        label: 'Continue with Google',
        variant: DButtonVariant.outline,
        block: true,
        leadingIcon: DIcon(name: 'brand-google'),
      ),
    ]),
  ],
)
```

## In Navigation

```
nav(classes: 'flex items-center gap-2', [
  a(href: '/', [text('Home')]),
  DSeparator(orientation: DOrientation.vertical),
  a(href: '/products', [text('Products')]),
  DSeparator(orientation: DOrientation.vertical),
  a(href: '/about', [text('About')]),
  DSeparator(orientation: DOrientation.vertical),
  a(href: '/contact', [text('Contact')]),
])
```

## In Cards

```
DCard(
  body: [
    div(classes: 'space-y-4', [
      // Section 1
      div([
        h4(classes: 'font-medium', [text('Account')]),
        p(classes: 'text-sm text-gray-500', [text('Manage your account settings')]),
      ]),

      DSeparator(),

      // Section 2
      div([
        h4(classes: 'font-medium', [text('Notifications')]),
        p(classes: 'text-sm text-gray-500', [text('Configure notification preferences')]),
      ]),

      DSeparator(),

      // Section 3
      div([
        h4(classes: 'font-medium', [text('Privacy')]),
        p(classes: 'text-sm text-gray-500', [text('Control your privacy settings')]),
      ]),
    ]),
  ],
)
```

## Spacing Control

```
div([
  text('Content above'),

  // More spacing
  div(classes: 'py-6', [
    DSeparator(),
  ]),

  text('Content below'),
])

// Or use margin directly
div([
  text('Content above'),
  DSeparator(classes: 'my-8'),
  text('Content below'),
])
```

## Dashed Style

```
DSeparator(classes: 'border-dashed')
```

## Thick Separator

```
DSeparator(classes: 'border-t-2')
```

## Section Divider Example

```
class SectionDivider extends StatelessComponent {
  final String label;

  SectionDivider({required this.label});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'flex items-center gap-4 my-8', [
      div(classes: 'flex-1', [
        DSeparator(color: 'border-gray-200 dark:border-gray-700'),
      ]),
      span(classes: 'text-sm font-medium text-gray-500 uppercase tracking-wider', [
        text(label),
      ]),
      div(classes: 'flex-1', [
        DSeparator(color: 'border-gray-200 dark:border-gray-700'),
      ]),
    ]);
  }
}

// Usage
div([
  text('Introduction...'),
  SectionDivider(label: 'Features'),
  text('Feature content...'),
  SectionDivider(label: 'Pricing'),
  text('Pricing content...'),
])
```

## Dark Mode Support

`DSeparator` automatically adapts to dark mode with appropriate border colors. You can customize the colors using the `color` property.

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `orientation` | `DOrientation` | `horizontal` | Separator direction |
| `color` | `String?` | `null` | Custom border color class |
| `classes` | `String?` | `null` | Additional CSS classes |
