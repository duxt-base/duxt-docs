---
title: Getting Started
description: Install and start using duxt_html
layout: html-layout
order: 2
---

# Getting Started

## Installation

Add duxt_html to your `pubspec.yaml`:

```
dependencies:
  duxt_html: ^0.1.0
```

Or use the Duxt CLI to create a new project with duxt_html:

```
duxt new myapp --template html
```

## Basic Usage

Import the package:

```
import 'package:duxt_html/duxt_html.dart';
```

### Creating Components

All components follow the same pattern:

```
ComponentName(
  className: 'css classes',
  style: 'inline-css: value',
  id: 'element-id',
  child: SingleChild(),      // OR
  children: [Multiple(), Children()],
  attributes: {'data-custom': 'value'},
  events: {'mouseover': (e) => handleHover(e)},
  key: Key('unique'),
)
```

### child vs children

Use `child` when you have a single child component:

```
Div(
  child: Text('Single child'),
)
```

Use `children` when you have multiple children:

```
Div(
  children: [
    Text('First'),
    Text('Second'),
  ],
)
```

**Important:** You cannot use both `child` and `children` on the same component. This will throw an `ArgumentError`.

## Common Patterns

### Page Layout

```
Div(
  className: 'min-h-screen flex flex-col',
  children: [
    Header(
      className: 'bg-gray-900 py-4',
      child: Nav(
        className: 'container mx-auto flex justify-between',
        children: [
          A(href: '/', child: Text('Logo')),
          Div(children: [
            A(href: '/about', child: Text('About')),
            A(href: '/contact', child: Text('Contact')),
          ]),
        ],
      ),
    ),
    Main(
      className: 'flex-1 container mx-auto py-8',
      child: Article(
        children: [
          H1(child: Text('Page Title')),
          P(child: Text('Content goes here...')),
        ],
      ),
    ),
    Footer(
      className: 'bg-gray-900 py-4 text-center',
      child: Text('© 2024'),
    ),
  ],
)
```

### Form

```
Form(
  method: FormMethod.post,
  children: [
    Div(
      className: 'mb-4',
      children: [
        Label(
          htmlFor: 'email',
          child: Text('Email'),
        ),
        Input(
          type: 'email',
          name: 'email',
          id: 'email',
          placeholder: 'you@example.com',
          className: 'w-full border rounded px-3 py-2',
          onInput: (value) => print('Email: $value'),
        ),
      ],
    ),
    Button(
      type: 'submit',
      className: 'bg-blue-500 text-white px-4 py-2 rounded',
      child: Text('Submit'),
    ),
  ],
)
```

### List Rendering

```
final items = ['Apple', 'Banana', 'Cherry'];

Ul(
  className: 'list-disc list-inside',
  children: items.map((item) =>
    Li(child: Text(item))
  ).toList(),
)
```

### Conditional Rendering

```
Div(
  children: [
    if (isLoggedIn) ...[
      Text('Welcome back!'),
      Button(
        onClick: logout,
        child: Text('Logout'),
      ),
    ] else ...[
      A(href: '/login', child: Text('Login')),
    ],
  ],
)
```

## Styling

### CSS Classes

Use the `className` parameter:

```
Div(
  className: 'flex items-center gap-4 p-4 bg-gray-100 rounded-lg',
  child: Text('Styled content'),
)
```

### Inline Styles

Use the `style` parameter with CSS string:

```
Div(
  style: 'display: flex; align-items: center; gap: 16px; padding: 16px;',
  child: Text('Inline styled'),
)
```

### Custom Attributes

Use the `attributes` parameter:

```
Div(
  attributes: {
    'data-testid': 'my-component',
    'aria-label': 'Main content',
    'role': 'region',
  },
  child: Text('Accessible content'),
)
```

## Next Steps

- [Components](/duxt-html/components) - Full API reference
- [Examples](/duxt-html/examples) - More patterns and use cases
