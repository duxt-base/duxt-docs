---
title: Skeleton
description: Placeholder content for loading states.
layout: ui-layout
order: 22
---

# Skeleton

The `DSkeleton` component provides placeholder content while data is loading, improving perceived performance and user experience.

## Basic Usage

```
DSkeleton()  // Default rectangle
```

## Custom Dimensions

```
// Fixed width and height
DSkeleton(width: 200, height: 20)

// Percentage width
DSkeleton(width: '100%', height: 16)
DSkeleton(width: '60%', height: 16)

// Full width
DSkeleton(height: 24)  // width defaults to 100%
```

## Shapes

### Rectangle (Default)

```
DSkeleton(width: 200, height: 100)
```

### Circle

```
DSkeleton(
  width: 48,
  height: 48,
  circle: true,
)
```

### Rounded

```
DSkeleton(
  width: 200,
  height: 40,
  rounded: true,  // Uses rounded-md
)
```

## Text Skeleton

Mimic text content:

```
div(classes: 'space-y-2', [
  DSkeleton(height: 20, width: '70%'),  // Title
  DSkeleton(height: 16),                 // Line 1
  DSkeleton(height: 16),                 // Line 2
  DSkeleton(height: 16, width: '80%'),  // Line 3 (shorter)
])
```

## Card Skeleton

```
DCard(
  body: [
    div(classes: 'space-y-4', [
      // Header with avatar
      div(classes: 'flex items-center gap-3', [
        DSkeleton(width: 40, height: 40, circle: true),
        div(classes: 'flex-1', [
          DSkeleton(height: 16, width: '40%'),
          DSkeleton(height: 14, width: '20%', classes: 'mt-1'),
        ]),
      ]),

      // Content
      div(classes: 'space-y-2', [
        DSkeleton(height: 16),
        DSkeleton(height: 16),
        DSkeleton(height: 16, width: '75%'),
      ]),

      // Actions
      div(classes: 'flex gap-2', [
        DSkeleton(width: 80, height: 32, rounded: true),
        DSkeleton(width: 80, height: 32, rounded: true),
      ]),
    ]),
  ],
)
```

## Table Skeleton

```
DCard(
  noPadding: true,
  body: [
    // Header
    div(classes: 'p-4 border-b', [
      div(classes: 'flex gap-4', [
        DSkeleton(height: 16, width: '20%'),
        DSkeleton(height: 16, width: '30%'),
        DSkeleton(height: 16, width: '25%'),
        DSkeleton(height: 16, width: '15%'),
      ]),
    ]),

    // Rows
    for (var i = 0; i < 5; i++)
      div(classes: 'p-4 border-b last:border-0', [
        div(classes: 'flex gap-4', [
          DSkeleton(height: 14, width: '20%'),
          DSkeleton(height: 14, width: '30%'),
          DSkeleton(height: 14, width: '25%'),
          DSkeleton(height: 14, width: '15%'),
        ]),
      ]),
  ],
)
```

## List Skeleton

```
div(classes: 'space-y-4', [
  for (var i = 0; i < 4; i++)
    div(classes: 'flex items-center gap-3', [
      DSkeleton(width: 48, height: 48, rounded: true),
      div(classes: 'flex-1', [
        DSkeleton(height: 16, width: '60%'),
        DSkeleton(height: 14, width: '40%', classes: 'mt-1'),
      ]),
    ]),
])
```

## Complete Loading Pattern

```
class UserProfile extends StatefulComponent {
  @override
  State createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool loading = true;
  User? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final data = await api.getUser();
    setState(() {
      user = data;
      loading = false;
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      body: [
        if (loading)
          // Skeleton state
          div(classes: 'space-y-4', [
            div(classes: 'flex items-center gap-4', [
              DSkeleton(width: 64, height: 64, circle: true),
              div(classes: 'flex-1', [
                DSkeleton(height: 20, width: '40%'),
                DSkeleton(height: 16, width: '60%', classes: 'mt-2'),
              ]),
            ]),
            div(classes: 'space-y-2', [
              DSkeleton(height: 16),
              DSkeleton(height: 16),
              DSkeleton(height: 16, width: '70%'),
            ]),
          ])
        else
          // Loaded state
          div(classes: 'space-y-4', [
            div(classes: 'flex items-center gap-4', [
              DAvatar(src: user!.avatar, size: DAvatarSize.xl),
              div([
                h3(classes: 'font-semibold', [text(user!.name)]),
                p(classes: 'text-gray-500', [text(user!.email)]),
              ]),
            ]),
            p([text(user!.bio)]),
          ]),
      ],
    );
  }
}
```

## Grid Skeleton

```
div(classes: 'grid grid-cols-3 gap-4', [
  for (var i = 0; i < 6; i++)
    DCard(
      body: [
        DSkeleton(height: 120),
        div(classes: 'mt-3 space-y-2', [
          DSkeleton(height: 16, width: '70%'),
          DSkeleton(height: 14, width: '50%'),
        ]),
      ],
    ),
])
```

## Animation

Skeletons have a built-in pulse animation:

```
// Default animation
DSkeleton(height: 16)

// Custom animation class (if needed)
DSkeleton(height: 16, classes: 'animate-pulse')
```

## Dark Mode Support

`DSkeleton` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Animation remains visible in both modes

## API Reference

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `width` | `dynamic` | `'100%'` | Width (number for px, string for CSS) |
| `height` | `dynamic` | `16` | Height (number for px, string for CSS) |
| `circle` | `bool` | `false` | Render as circle |
| `rounded` | `bool` | `false` | Use rounded corners |
| `classes` | `String?` | `null` | Additional CSS classes |
