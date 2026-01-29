---
title: Getting Started
description: Learn how to install and set up Duxt UI in your Jaspr project.
layout: docs
order: 1
---

# Getting Started

Welcome to Duxt UI! This guide will help you get started with building beautiful web applications using Duxt UI components.

## Prerequisites

Before you begin, make sure you have the following installed:

- **Dart SDK 3.0** or higher
- **Jaspr CLI** - Install with `dart pub global activate jaspr_cli`
- **A Jaspr project** - Create one with `jaspr create my_app`

## Installation

Add Duxt UI to your project by adding the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  duxt_ui:
    git:
      url: https://github.com/duxt-ui/duxt_ui.git
      ref: main
```

Then run:

```bash
dart pub get
```

## Setup

Duxt UI uses Tailwind CSS for styling. Make sure you have `jaspr_tailwind` configured in your project.

> **Tip:** If you haven't set up Tailwind yet, add `jaspr_tailwind` to your dev dependencies and create a `tailwind.config.js` file.

Import Duxt UI in your Dart files:

```dart
import 'package:duxt_ui/duxt_ui.dart';
```

## Your First Component

Now you're ready to use Duxt UI components! Here's a simple example:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:duxt_ui/duxt_ui.dart';

class MyPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield UButton(
      label: 'Click me!',
      variant: UButtonVariant.solid,
      color: UColor.primary,
      onPressed: () {
        print('Button clicked!');
      },
    );
  }
}
```

This creates a solid primary button with a click handler.

## Next Steps

- [Quick Start Guide](/getting-started/installation) - Build your first page with Duxt UI
- [Components](/components) - Explore all available components
- [Theming](/duxt-ui/theming) - Learn how to customize the look and feel
