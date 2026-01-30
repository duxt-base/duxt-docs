---
title: Tailwind CSS
description: First-class Tailwind CSS integration for styling your Duxt apps.
layout: duxt-layout
order: 7
---

# Tailwind CSS

## Overview

Duxt includes first-class Tailwind CSS integration out of the box. New projects come pre-configured with Tailwind, so you can start using utility classes immediately.

## Project Setup

When you run `duxt create`, Tailwind is automatically configured:

```
my-app/
├── web/
│   ├── index.html
│   ├── styles.tw.css      # Tailwind input file
│   └── styles.css         # Generated CSS (don't edit)
├── tailwind.config.js
└── package.json
```

## Tailwind Input File

The `web/styles.tw.css` file is your Tailwind source:

```
@tailwind base;
@tailwind components;
@tailwind utilities;

/* Custom styles below */
```

## Configuration

### tailwind.config.js

```
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './lib/**/*.dart',
    './web/**/*.html',
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#eff6ff',
          500: '#3b82f6',
          600: '#2563eb',
          700: '#1d4ed8',
        },
      },
    },
  },
  plugins: [],
}
```

### Content Paths

Tailwind scans your Dart files for class names:

```
content: [
  './lib/**/*.dart',      // All Dart components
  './web/**/*.html',      // HTML templates
],
```

## Using Tailwind

### In Components

Use the `classes` parameter on any element:

```
import 'package:jaspr/jaspr.dart';

class MyComponent extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return div(
      classes: 'flex items-center justify-between p-4 bg-white rounded-lg shadow',
      [
        h1(classes: 'text-2xl font-bold text-gray-900', [
          text('Hello World'),
        ]),
        button(
          classes: 'px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600',
          [text('Click me')],
        ),
      ],
    );
  }
}
```

### Responsive Design

Use Tailwind's responsive prefixes:

```
div(
  classes: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4',
  [
    // Cards
  ],
)
```

### Dark Mode

Enable dark mode in `tailwind.config.js`:

```
module.exports = {
  darkMode: 'class',  // or 'media'
  // ...
}
```

Use in components:

```
div(
  classes: 'bg-white dark:bg-gray-900 text-gray-900 dark:text-white',
  [text('Supports dark mode')],
)
```

### Hover, Focus, and States

```
button(
  classes: '''
    px-4 py-2 bg-blue-500 text-white rounded
    hover:bg-blue-600
    focus:outline-none focus:ring-2 focus:ring-blue-500
    active:bg-blue-700
    disabled:opacity-50 disabled:cursor-not-allowed
  ''',
  [text('Interactive button')],
)
```

## Development Workflow

### Watch Mode

During development, `duxt dev` automatically rebuilds Tailwind when you save files:

```
duxt dev
```

The dev server runs Tailwind in watch mode, so changes appear instantly.

### Manual Build

To build Tailwind manually:

```
npx tailwindcss -i web/styles.tw.css -o web/styles.css --watch
```

For production (minified):

```
npx tailwindcss -i web/styles.tw.css -o web/styles.css --minify
```

## Adding Tailwind to Existing Project

If your project doesn't have Tailwind configured:

### 1. Install Dependencies

```
npm init -y
npm install -D tailwindcss
npx tailwindcss init
```

### 2. Create Input File

Create `web/styles.tw.css`:

```
@tailwind base;
@tailwind components;
@tailwind utilities;
```

### 3. Configure tailwind.config.js

```
module.exports = {
  content: ['./lib/**/*.dart', './web/**/*.html'],
  theme: { extend: {} },
  plugins: [],
}
```

### 4. Add to index.html

```
<link rel="stylesheet" href="styles.css">
```

### 5. Build

```
npx tailwindcss -i web/styles.tw.css -o web/styles.css
```

## Custom Components

### @apply Directive

Create reusable styles in `styles.tw.css`:

```
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer components {
  .btn {
    @apply px-4 py-2 rounded font-medium transition-colors;
  }

  .btn-primary {
    @apply btn bg-blue-500 text-white hover:bg-blue-600;
  }

  .btn-secondary {
    @apply btn bg-gray-200 text-gray-800 hover:bg-gray-300;
  }

  .card {
    @apply bg-white rounded-lg shadow-md p-6;
  }

  .input {
    @apply w-full px-3 py-2 border border-gray-300 rounded-md
           focus:outline-none focus:ring-2 focus:ring-blue-500;
  }
}
```

Use in Dart:

```
button(classes: 'btn-primary', [text('Save')])
button(classes: 'btn-secondary', [text('Cancel')])
```

## Tailwind Plugins

### Typography

For markdown/prose content:

```
npm install -D @tailwindcss/typography
```

```
// tailwind.config.js
module.exports = {
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
```

```
div(classes: 'prose prose-lg', [
  // Rendered markdown content
])
```

### Forms

For better form styling:

```
npm install -D @tailwindcss/forms
```

```
plugins: [
  require('@tailwindcss/forms'),
],
```

### Container Queries

For component-based responsive design:

```
npm install -D @tailwindcss/container-queries
```

## With Duxt UI

[Duxt UI](/duxt-ui) components are built with Tailwind and work seamlessly:

```
import 'package:duxt_ui/duxt_ui.dart';

// Duxt UI components use Tailwind internally
DButton(
  label: 'Click me',
  color: DButtonColor.primary,
)

// You can still add custom Tailwind classes
div(
  classes: 'mt-4 p-4 bg-gray-100 rounded',
  [
    DCard(
      title: 'My Card',
      description: 'Card content',
    ),
  ],
)
```

## Tips

### String Interpolation

Build dynamic classes:

```
final isActive = true;
final size = 'lg';

div(
  classes: 'p-4 rounded ${isActive ? 'bg-blue-500' : 'bg-gray-200'}',
  [text('Dynamic styling')],
)
```

### Conditional Classes

```
String buttonClasses(bool disabled, bool loading) {
  return [
    'px-4 py-2 rounded',
    if (disabled) 'opacity-50 cursor-not-allowed',
    if (loading) 'animate-pulse',
    if (!disabled && !loading) 'hover:bg-blue-600',
  ].join(' ');
}
```

### Class Utilities

Create a helper for complex class combinations:

```
String cn(List<String?> classes) {
  return classes.whereType<String>().join(' ');
}

// Usage
div(
  classes: cn([
    'flex items-center',
    isLarge ? 'p-8' : 'p-4',
    hasError ? 'border-red-500' : null,
  ]),
  [...],
)
```
