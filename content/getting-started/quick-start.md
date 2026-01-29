---
title: Quick Start
description: Build your first page with Duxt UI in minutes.
layout: docs
order: 3
---

# Quick Start

This tutorial will guide you through building your first page with Duxt UI components. By the end, you'll have a working form with buttons, inputs, and cards.

## Prerequisites

Make sure you have completed the [Installation](/getting-started/installation) guide before starting.

## Create a New Page

Create a new file at `lib/pages/contact.dart`:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:duxt_ui/duxt_ui.dart';

class ContactPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'min-h-screen bg-gray-950 p-8', [
      div(classes: 'max-w-md mx-auto', [
        h1(classes: 'text-3xl font-bold text-white mb-8', [
          text('Contact Us'),
        ]),
        _buildContactForm(),
      ]),
    ]);
  }

  Component _buildContactForm() {
    return UCard(
      body: [
        div(classes: 'space-y-4', [
          UInput(
            label: 'Name',
            placeholder: 'Enter your name',
            required: true,
          ),
          UInput(
            label: 'Email',
            type: 'email',
            placeholder: 'you@example.com',
            required: true,
          ),
          UTextarea(
            label: 'Message',
            placeholder: 'How can we help?',
            rows: 4,
          ),
          div(classes: 'flex gap-3 pt-4', [
            UButton(
              label: 'Submit',
              variant: UButtonVariant.solid,
              color: UColor.primary,
            ),
            UButton(
              label: 'Cancel',
              variant: UButtonVariant.outline,
              color: UColor.neutral,
            ),
          ]),
        ]),
      ],
    );
  }
}
```

## Add the Route

Register your page in `lib/app.dart`:

```dart
import 'pages/contact.dart' as contact;

// Add to routes list:
Route(
  path: '/contact',
  title: 'Contact - My App',
  builder: (context, state) => contact.ContactPage(),
),
```

## Run and Test

Start your development server:

```bash
jaspr serve
```

Visit `http://localhost:8080/contact` to see your form.

## Understanding the Code

Let's break down what we built:

### The Layout

```dart
div(classes: 'min-h-screen bg-gray-950 p-8', [...])
```

This creates a full-height dark background with padding. Tailwind classes handle all styling.

### The Card Container

```dart
UCard(
  body: [...],
)
```

`UCard` provides a clean container with proper padding and borders. It automatically adapts to dark mode.

### Form Inputs

```dart
UInput(
  label: 'Email',
  type: 'email',
  placeholder: 'you@example.com',
  required: true,
)
```

`UInput` components include:
- Automatic label rendering
- Input type validation
- Required field indicators
- Error state handling

### Buttons

```dart
UButton(
  label: 'Submit',
  variant: UButtonVariant.solid,
  color: UColor.primary,
)
```

Buttons support multiple variants and colors for different purposes.

## Adding Interactivity

For form submission, use a `StatefulComponent`:

```dart
class ContactForm extends StatefulComponent {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  bool _loading = false;

  void _handleSubmit() {
    setState(() => _loading = true);
    // Handle form submission
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield UButton(
      label: 'Submit',
      loading: _loading,
      onPressed: _handleSubmit,
    );
  }
}
```

## Next Steps

Now that you've built your first page:

- [Components](/components) - Explore all available components
- [Button](/components/button) - Learn about button variants and states
- [Input](/components/input) - Dive deeper into form inputs
- [Theming](/duxt-ui/theming) - Customize colors and styles
