---
title: Collapsible
description: A component for showing and hiding content with expand/collapse behavior.
layout: ui-layout
order: 23
---

# Collapsible

The `DCollapsible` component provides a single expandable/collapsible section, useful for progressive disclosure of content.

## Basic Usage

```
DCollapsible(
  trigger: [
    DButton(
      label: 'Show Details',
      variant: DButtonVariant.ghost,
    ),
  ],
  children: [
    p([text('This is the collapsible content.')]),
  ],
)
```

## Default Open

```
DCollapsible(
  defaultOpen: true,
  trigger: [...],
  children: [...],
)
```

## Custom Trigger

```
DCollapsible(
  trigger: [
    div(classes: 'flex items-center justify-between p-4 cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-800 rounded-lg', [
      div([
        h4(classes: 'font-medium', [text('Advanced Options')]),
        p(classes: 'text-sm text-gray-500', [text('Configure additional settings')]),
      ]),
      DIcon(name: 'chevron-down', classes: 'transition-transform'),
    ]),
  ],
  children: [
    div(classes: 'p-4 space-y-4', [
      DInput(label: 'Custom field 1'),
      DInput(label: 'Custom field 2'),
      DSwitch(label: 'Enable feature'),
    ]),
  ],
)
```

## Using Helper Components

```
DCollapsible(
  children: [
    DCollapsibleTrigger(
      children: [
        div(classes: 'flex items-center gap-2 p-3', [
          DIcon(name: 'settings'),
          span([text('Settings')]),
          DIcon(name: 'chevron-down', classes: 'ml-auto'),
        ]),
      ],
    ),
    DCollapsibleContent(
      children: [
        div(classes: 'p-4', [
          text('Settings content here...'),
        ]),
      ],
    ),
  ],
)
```

## On Open Change

```
DCollapsible(
  onOpenChange: (isOpen) {
    print('Collapsible is now: ${isOpen ? 'open' : 'closed'}');
  },
  trigger: [...],
  children: [...],
)
```

## FAQ Item Example

```
class FAQItem extends StatelessComponent {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCollapsible(
      trigger: [
        div(classes: 'flex items-center justify-between py-4 border-b cursor-pointer', [
          span(classes: 'font-medium', [text(question)]),
          DIcon(name: 'plus', size: 20),
        ]),
      ],
      children: [
        div(classes: 'py-4 text-gray-600 dark:text-gray-400', [
          text(answer),
        ]),
      ],
    );
  }
}

// Usage
div(classes: 'divide-y', [
  FAQItem(
    question: 'How do I get started?',
    answer: 'Simply install the package and import the components...',
  ),
  FAQItem(
    question: 'Is there a free tier?',
    answer: 'Yes, we offer a generous free tier for small projects...',
  ),
  FAQItem(
    question: 'Can I customize the components?',
    answer: 'Absolutely! All components accept custom CSS classes...',
  ),
])
```

## Nested Content Example

```
DCard(
  body: [
    DCollapsible(
      defaultOpen: true,
      trigger: [
        div(classes: 'flex items-center justify-between', [
          h3(classes: 'font-semibold', [text('Order Summary')]),
          DIcon(name: 'chevron-down'),
        ]),
      ],
      children: [
        div(classes: 'mt-4 space-y-3', [
          div(classes: 'flex justify-between', [
            span([text('Subtotal')]),
            span([text('\$99.00')]),
          ]),
          div(classes: 'flex justify-between', [
            span([text('Shipping')]),
            span([text('\$5.00')]),
          ]),
          div(classes: 'flex justify-between', [
            span([text('Tax')]),
            span([text('\$8.42')]),
          ]),
          div(classes: 'flex justify-between font-semibold pt-3 border-t', [
            span([text('Total')]),
            span([text('\$112.42')]),
          ]),
        ]),
      ],
    ),
  ],
)
```

## Code Block Example

```
DCollapsible(
  trigger: [
    div(classes: 'flex items-center gap-2 text-sm text-gray-500 cursor-pointer hover:text-gray-700', [
      DIcon(name: 'code', size: 16),
      span([text('View code')]),
      DIcon(name: 'chevron-down', size: 16),
    ]),
  ],
  children: [
    div(classes: 'mt-3', [
      pre(classes: 'bg-gray-900 text-gray-100 p-4 rounded-lg overflow-x-auto', [
        code([text(codeExample)]),
      ]),
    ]),
  ],
)
```

## Controlled State

```
class ControlledCollapsible extends StatefulComponent {
  @override
  State createState() => _ControlledCollapsibleState();
}

class _ControlledCollapsibleState extends State<ControlledCollapsible> {
  bool isOpen = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'space-y-4', [
      div(classes: 'flex gap-2', [
        DButton(
          label: 'Toggle',
          onClick: () => setState(() => isOpen = !isOpen),
        ),
        DButton(
          label: 'Open',
          variant: DButtonVariant.outline,
          onClick: () => setState(() => isOpen = true),
        ),
        DButton(
          label: 'Close',
          variant: DButtonVariant.outline,
          onClick: () => setState(() => isOpen = false),
        ),
      ]),

      DCollapsible(
        open: isOpen,
        onOpenChange: (open) => setState(() => isOpen = open),
        trigger: [
          DButton(
            label: isOpen ? 'Hide Details' : 'Show Details',
            variant: DButtonVariant.ghost,
            trailingIcon: DIcon(name: isOpen ? 'chevron-up' : 'chevron-down'),
          ),
        ],
        children: [
          DCard(
            body: [
              text('Detailed content that can be shown or hidden.'),
            ],
          ),
        ],
      ),
    ]);
  }
}
```

## Dark Mode Support

`DCollapsible` automatically adapts to dark mode:
- Trigger areas work with dark backgrounds
- Content areas maintain proper contrast
- Icons and text remain visible

## API Reference

### DCollapsible

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `trigger` | `List<Component>?` | `null` | Clickable trigger content |
| `children` | `List<Component>` | required | Collapsible content |
| `defaultOpen` | `bool` | `false` | Initial open state |
| `open` | `bool?` | `null` | Controlled open state |
| `onOpenChange` | `ValueChanged<bool>?` | `null` | State change callback |

### DCollapsibleTrigger

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `children` | `List<Component>` | required | Trigger content |

### DCollapsibleContent

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `children` | `List<Component>` | required | Content to show/hide |
