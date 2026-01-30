---
title: Accordion
description: A component for collapsible content sections with expand/collapse functionality.
layout: ui-layout
order: 11
---

# Accordion

The `DAccordion` component displays collapsible content panels, useful for FAQs, settings, and organizing large amounts of content.

## Basic Usage

```
DAccordion(
  items: [
    DAccordionItem(
      label: 'What is Duxt UI?',
      content: [
        text('Duxt UI is a component library for Jaspr...'),
      ],
    ),
    DAccordionItem(
      label: 'How do I install it?',
      content: [
        text('Add duxt_ui to your pubspec.yaml...'),
      ],
    ),
    DAccordionItem(
      label: 'Is it free to use?',
      content: [
        text('Yes, Duxt UI is open source and free...'),
      ],
    ),
  ],
)
```

## Multiple Expansion

Allow multiple panels to be open simultaneously:

```
DAccordion(
  multiple: true,
  items: [
    DAccordionItem(label: 'Section 1', content: [...]),
    DAccordionItem(label: 'Section 2', content: [...]),
    DAccordionItem(label: 'Section 3', content: [...]),
  ],
)
```

## Variants

### Soft

```
DAccordion(
  variant: DAccordionVariant.soft,
  items: [...],
)
```

### Ghost

```
DAccordion(
  variant: DAccordionVariant.ghost,
  items: [...],
)
```

## Colors

```
DAccordion(
  color: DColor.primary,
  items: [...],
)

DAccordion(
  color: DColor.secondary,
  items: [...],
)

DAccordion(
  color: DColor.success,
  items: [...],
)
```

## Sizes

```
DAccordion(size: DSize.xs, items: [...])
DAccordion(size: DSize.sm, items: [...])
DAccordion(size: DSize.md, items: [...])  // Default
DAccordion(size: DSize.lg, items: [...])
DAccordion(size: DSize.xl, items: [...])
```

## With Icons

```
DAccordion(
  items: [
    DAccordionItem(
      label: 'Account Settings',
      icon: DIcon(name: 'user'),
      content: [
        text('Manage your account settings...'),
      ],
    ),
    DAccordionItem(
      label: 'Security',
      icon: DIcon(name: 'lock'),
      content: [
        text('Configure security options...'),
      ],
    ),
    DAccordionItem(
      label: 'Notifications',
      icon: DIcon(name: 'bell'),
      content: [
        text('Set up notification preferences...'),
      ],
    ),
  ],
)
```

## With Descriptions

```
DAccordion(
  items: [
    DAccordionItem(
      label: 'Personal Information',
      description: 'Update your name, email, and photo',
      content: [
        DInput(label: 'Name'),
        DInput(label: 'Email'),
      ],
    ),
    DAccordionItem(
      label: 'Password',
      description: 'Change your password',
      content: [
        DInput(label: 'Current Password', type: InputType.password),
        DInput(label: 'New Password', type: InputType.password),
      ],
    ),
  ],
)
```

## Disabled Items

```
DAccordion(
  items: [
    DAccordionItem(label: 'Available', content: [...]),
    DAccordionItem(
      label: 'Coming Soon',
      disabled: true,
      content: [...],
    ),
    DAccordionItem(label: 'Settings', content: [...]),
  ],
)
```

## Default Open Items

```
DAccordion(
  defaultValue: ['faq-1'],  // Open this item by default
  items: [
    DAccordionItem(
      value: 'faq-1',
      label: 'First Question',
      content: [...],
    ),
    DAccordionItem(
      value: 'faq-2',
      label: 'Second Question',
      content: [...],
    ),
  ],
)
```

## On Value Change

```
DAccordion(
  onValueChange: (values) {
    print('Open items: $values');
  },
  items: [...],
)
```

## FAQ Example

```
DCard(
  header: [
    h2(classes: 'text-xl font-semibold', [text('Frequently Asked Questions')]),
  ],
  body: [
    DAccordion(
      variant: DAccordionVariant.ghost,
      items: [
        DAccordionItem(
          label: 'What payment methods do you accept?',
          content: [
            p([text('We accept all major credit cards, PayPal, and bank transfers.')]),
          ],
        ),
        DAccordionItem(
          label: 'How long does shipping take?',
          content: [
            p([text('Standard shipping takes 3-5 business days. Express shipping is 1-2 days.')]),
          ],
        ),
        DAccordionItem(
          label: 'What is your return policy?',
          content: [
            p([text('We offer a 30-day money-back guarantee on all products.')]),
          ],
        ),
        DAccordionItem(
          label: 'Do you offer international shipping?',
          content: [
            p([text('Yes, we ship to over 50 countries worldwide.')]),
          ],
        ),
      ],
    ),
  ],
)
```

## Dark Mode Support

`DAccordion` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Borders are optimized for dark backgrounds
- Chevron indicators remain visible
- All variants work seamlessly in both modes

## API Reference

### DAccordion

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | `List<DAccordionItem>` | required | Accordion items |
| `multiple` | `bool` | `false` | Allow multiple open panels |
| `variant` | `DAccordionVariant` | `soft` | Visual style |
| `color` | `DColor` | `neutral` | Color scheme |
| `size` | `DSize` | `md` | Accordion size |
| `defaultValue` | `List<String>?` | `null` | Initially open items |
| `onValueChange` | `ValueChanged<List<String>>?` | `null` | Open state callback |

### DAccordionItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Item header text |
| `value` | `String?` | `null` | Unique identifier |
| `description` | `String?` | `null` | Secondary text |
| `icon` | `Component?` | `null` | Leading icon |
| `content` | `List<Component>` | required | Panel content |
| `disabled` | `bool` | `false` | Disable the item |
