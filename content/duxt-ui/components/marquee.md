---
title: Marquee
description: An infinite scrolling animation component for logos and content.
layout: ui-layout
order: 48
---

# Marquee

The `DMarquee` component creates a smooth, infinite scrolling animation for displaying logos, testimonials, or any repeating content.

## Basic Usage

```dart
DMarquee(
  children: [
    img(src: '/logos/logo1.svg', classes: 'h-8'),
    img(src: '/logos/logo2.svg', classes: 'h-8'),
    img(src: '/logos/logo3.svg', classes: 'h-8'),
    img(src: '/logos/logo4.svg', classes: 'h-8'),
    img(src: '/logos/logo5.svg', classes: 'h-8'),
  ],
)
```

## Direction

### Left (Default)

```dart
DMarquee(
  direction: DMarqueeDirection.left,
  children: [...],
)
```

### Right

```dart
DMarquee(
  direction: DMarqueeDirection.right,
  children: [...],
)
```

## Speed

Control the animation speed with the `duration` property (in seconds):

```dart
// Slow
DMarquee(
  duration: 40,
  children: [...],
)

// Fast
DMarquee(
  duration: 10,
  children: [...],
)
```

## Pause on Hover

By default, the marquee pauses when hovered:

```dart
// Enabled (default)
DMarquee(
  pauseOnHover: true,
  children: [...],
)

// Disabled
DMarquee(
  pauseOnHover: false,
  children: [...],
)
```

## Custom Gap

```dart
DMarquee(
  gap: 'gap-12',
  children: [...],
)
```

## Logo Showcase

```dart
div(classes: 'py-12 bg-gray-50 dark:bg-gray-900', [
  p(classes: 'text-center text-sm text-gray-500 mb-8', [
    text('Trusted by leading companies'),
  ]),
  DMarquee(
    duration: 30,
    gap: 'gap-16',
    children: [
      img(src: '/logos/google.svg', classes: 'h-8 grayscale opacity-60 hover:grayscale-0 hover:opacity-100 transition'),
      img(src: '/logos/amazon.svg', classes: 'h-8 grayscale opacity-60 hover:grayscale-0 hover:opacity-100 transition'),
      img(src: '/logos/microsoft.svg', classes: 'h-8 grayscale opacity-60 hover:grayscale-0 hover:opacity-100 transition'),
      img(src: '/logos/apple.svg', classes: 'h-8 grayscale opacity-60 hover:grayscale-0 hover:opacity-100 transition'),
      img(src: '/logos/netflix.svg', classes: 'h-8 grayscale opacity-60 hover:grayscale-0 hover:opacity-100 transition'),
      img(src: '/logos/spotify.svg', classes: 'h-8 grayscale opacity-60 hover:grayscale-0 hover:opacity-100 transition'),
    ],
  ),
])
```

## Testimonials

```dart
DMarquee(
  duration: 40,
  gap: 'gap-6',
  children: testimonials.map((t) => DMarqueeItem(
    child: DCard(
      classes: 'w-80',
      body: [
        p(classes: 'text-gray-600 dark:text-gray-300', [text('"${t.quote}"')]),
        div(classes: 'mt-4 flex items-center gap-3', [
          DAvatar(src: t.avatar, size: DAvatarSize.sm),
          div([
            p(classes: 'font-medium text-sm', [text(t.name)]),
            p(classes: 'text-xs text-gray-500', [text(t.company)]),
          ]),
        ]),
      ],
    ),
  )).toList(),
)
```

## Technology Stack

```dart
div(classes: 'py-8', [
  p(classes: 'text-center font-semibold mb-6', [text('Built with')]),
  DMarquee(
    gap: 'gap-8',
    children: [
      div(classes: 'flex items-center gap-2 px-4 py-2 bg-white dark:bg-gray-800 rounded-lg shadow-sm', [
        img(src: '/tech/dart.svg', classes: 'h-6'),
        span([text('Dart')]),
      ]),
      div(classes: 'flex items-center gap-2 px-4 py-2 bg-white dark:bg-gray-800 rounded-lg shadow-sm', [
        img(src: '/tech/jaspr.svg', classes: 'h-6'),
        span([text('Jaspr')]),
      ]),
      div(classes: 'flex items-center gap-2 px-4 py-2 bg-white dark:bg-gray-800 rounded-lg shadow-sm', [
        img(src: '/tech/tailwind.svg', classes: 'h-6'),
        span([text('Tailwind')]),
      ]),
    ],
  ),
])
```

## With Gradient Fade

Add gradient overlays to create a fade effect at the edges:

```dart
div(classes: 'relative', [
  // Left fade
  div(classes: 'absolute left-0 top-0 bottom-0 w-20 bg-gradient-to-r from-white dark:from-gray-900 to-transparent z-10', []),

  DMarquee(
    children: [...],
  ),

  // Right fade
  div(classes: 'absolute right-0 top-0 bottom-0 w-20 bg-gradient-to-l from-white dark:from-gray-900 to-transparent z-10', []),
])
```

## Multiple Rows

Create a dynamic effect with multiple marquees:

```dart
div(classes: 'space-y-4', [
  DMarquee(
    direction: DMarqueeDirection.left,
    duration: 25,
    children: row1Items,
  ),
  DMarquee(
    direction: DMarqueeDirection.right,
    duration: 30,
    children: row2Items,
  ),
  DMarquee(
    direction: DMarqueeDirection.left,
    duration: 20,
    children: row3Items,
  ),
])
```

## Dark Mode Support

`DMarquee` works seamlessly in dark mode. Ensure your content items have appropriate dark mode styling.

## API Reference

### DMarquee

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `children` | `List<Component>` | required | Content to scroll |
| `direction` | `DMarqueeDirection` | `left` | Scroll direction |
| `duration` | `int` | `20` | Animation duration (seconds) |
| `pauseOnHover` | `bool` | `true` | Pause on hover |
| `gap` | `String` | `'gap-8'` | Gap between items |
| `classes` | `String?` | `null` | Custom CSS classes |

### DMarqueeItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | `Component` | required | Item content |
| `classes` | `String?` | `null` | Custom CSS classes |

### DMarqueeDirection

| Value | Description |
|-------|-------------|
| `left` | Scroll left |
| `right` | Scroll right |
