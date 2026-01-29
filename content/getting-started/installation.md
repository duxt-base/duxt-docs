---
title: Installation
description: Step-by-step guide to install Duxt UI in your project.
layout: docs
order: 2
---

# Installation

This guide covers the detailed installation process for Duxt UI.

## Package Installation

### Using Git

Add the package directly from GitHub:

```yaml
dependencies:
  duxt_ui:
    git:
      url: https://github.com/duxt-ui/duxt_ui.git
      ref: main
```

### Using pub.dev (Coming Soon)

Once published, you'll be able to install via:

```yaml
dependencies:
  duxt_ui: ^0.1.0
```

## Tailwind CSS Setup

Duxt UI requires Tailwind CSS for styling. Follow these steps to set it up:

### 1. Add jaspr_tailwind

Add to your `pubspec.yaml` dev dependencies:

```yaml
dev_dependencies:
  jaspr_tailwind: ^0.3.0
```

### 2. Create Tailwind Config

Create a `tailwind.config.js` file in your project root:

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './lib/**/*.dart',
    './web/**/*.html',
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#eef2ff',
          100: '#e0e7ff',
          // ... other shades
          600: '#4f46e5',
          700: '#4338ca',
        },
      },
    },
  },
  plugins: [],
}
```

### 3. Add Tailwind Stylesheet

In your `web/styles.tw.css`:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

## Verify Installation

Create a simple test page to verify everything works:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:duxt_ui/duxt_ui.dart';

class TestPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'p-8', [
      UButton(
        label: 'Installation Successful!',
        color: UColor.success,
      ),
    ]);
  }
}
```

Run your project with `jaspr serve` and you should see the button rendered correctly.
