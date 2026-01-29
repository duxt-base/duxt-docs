---
title: Carousel
description: A responsive image and content carousel with navigation controls.
layout: ui-layout
order: 47
---

# Carousel

The `DCarousel` component displays a slideshow of images or content with navigation arrows and dot indicators.

## Basic Usage

```dart
DCarousel(
  items: [
    DCarouselItem(image: '/slides/slide1.jpg', alt: 'First slide'),
    DCarouselItem(image: '/slides/slide2.jpg', alt: 'Second slide'),
    DCarouselItem(image: '/slides/slide3.jpg', alt: 'Third slide'),
  ],
)
```

## With Custom Content

```dart
DCarousel(
  items: [
    DCarouselItem(
      content: div(classes: 'bg-gradient-to-r from-blue-500 to-purple-600 h-64 flex items-center justify-center', [
        h2(classes: 'text-white text-3xl font-bold', [text('Welcome')]),
      ]),
    ),
    DCarouselItem(
      content: div(classes: 'bg-gradient-to-r from-green-500 to-teal-600 h-64 flex items-center justify-center', [
        h2(classes: 'text-white text-3xl font-bold', [text('Features')]),
      ]),
    ),
    DCarouselItem(
      content: div(classes: 'bg-gradient-to-r from-orange-500 to-red-600 h-64 flex items-center justify-center', [
        h2(classes: 'text-white text-3xl font-bold', [text('Get Started')]),
      ]),
    ),
  ],
)
```

## Without Arrows

```dart
DCarousel(
  showArrows: false,
  items: [
    DCarouselItem(image: '/slide1.jpg'),
    DCarouselItem(image: '/slide2.jpg'),
  ],
)
```

## Without Dots

```dart
DCarousel(
  showDots: false,
  items: [
    DCarouselItem(image: '/slide1.jpg'),
    DCarouselItem(image: '/slide2.jpg'),
  ],
)
```

## Minimal Controls

```dart
DCarousel(
  showArrows: false,
  showDots: false,
  items: [
    DCarouselItem(image: '/slide1.jpg'),
    DCarouselItem(image: '/slide2.jpg'),
  ],
)
```

## Product Gallery

```dart
DCarousel(
  classes: 'rounded-lg overflow-hidden',
  items: [
    DCarouselItem(image: '/products/front.jpg', alt: 'Front view'),
    DCarouselItem(image: '/products/side.jpg', alt: 'Side view'),
    DCarouselItem(image: '/products/back.jpg', alt: 'Back view'),
    DCarouselItem(image: '/products/detail.jpg', alt: 'Detail view'),
  ],
)
```

## Hero Carousel

```dart
DCarousel(
  classes: 'h-[500px]',
  items: [
    DCarouselItem(
      content: div(classes: 'relative h-full', [
        img(src: '/hero1.jpg', classes: 'w-full h-full object-cover'),
        div(classes: 'absolute inset-0 bg-black/40 flex items-center justify-center', [
          div(classes: 'text-center text-white', [
            h1(classes: 'text-5xl font-bold', [text('Summer Collection')]),
            p(classes: 'mt-4 text-xl', [text('Discover the latest trends')]),
            DButton(
              label: 'Shop Now',
              size: DSize.lg,
              classes: 'mt-6',
            ),
          ]),
        ]),
      ]),
    ),
    DCarouselItem(
      content: div(classes: 'relative h-full', [
        img(src: '/hero2.jpg', classes: 'w-full h-full object-cover'),
        div(classes: 'absolute inset-0 bg-black/40 flex items-center justify-center', [
          div(classes: 'text-center text-white', [
            h1(classes: 'text-5xl font-bold', [text('New Arrivals')]),
            p(classes: 'mt-4 text-xl', [text('Fresh styles just landed')]),
            DButton(
              label: 'Explore',
              size: DSize.lg,
              classes: 'mt-6',
            ),
          ]),
        ]),
      ]),
    ),
  ],
)
```

## Testimonials Carousel

```dart
DCarousel(
  classes: 'bg-gray-50 dark:bg-gray-800 rounded-xl p-8',
  items: testimonials.map((t) => DCarouselItem(
    content: div(classes: 'text-center max-w-2xl mx-auto', [
      p(classes: 'text-xl italic text-gray-700 dark:text-gray-300', [
        text('"${t.quote}"'),
      ]),
      div(classes: 'mt-6 flex items-center justify-center gap-4', [
        DAvatar(src: t.avatar, size: DAvatarSize.md),
        div([
          p(classes: 'font-semibold', [text(t.name)]),
          p(classes: 'text-sm text-gray-500', [text(t.title)]),
        ]),
      ]),
    ]),
  )).toList(),
)
```

## In a Card

```dart
DCard(
  classes: 'overflow-hidden',
  body: [
    DCarousel(
      showArrows: true,
      showDots: true,
      items: [
        DCarouselItem(image: '/apartment/living.jpg', alt: 'Living room'),
        DCarouselItem(image: '/apartment/bedroom.jpg', alt: 'Bedroom'),
        DCarouselItem(image: '/apartment/kitchen.jpg', alt: 'Kitchen'),
      ],
    ),
    div(classes: 'p-4', [
      h3(classes: 'text-lg font-semibold', [text('Modern Apartment')]),
      p(classes: 'text-gray-500', [text('\$2,500/month')]),
    ]),
  ],
)
```

## Dark Mode Support

The `DCarousel` component automatically adapts navigation controls to dark mode with appropriate styling for arrows and indicators.

## API Reference

### DCarousel

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | `List<DCarouselItem>` | required | Carousel items |
| `showArrows` | `bool` | `true` | Show navigation arrows |
| `showDots` | `bool` | `true` | Show dot indicators |
| `autoPlay` | `bool` | `false` | Auto-advance slides |
| `autoPlayInterval` | `int` | `5000` | Auto-play interval (ms) |
| `classes` | `String?` | `null` | Custom CSS classes |

### DCarouselItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `image` | `String?` | `null` | Image URL |
| `alt` | `String?` | `null` | Image alt text |
| `content` | `Component?` | `null` | Custom content |
