---
title: Page
description: Components for building landing pages and content sections.
layout: ui-layout
order: 40
---

# Page

Duxt UI provides a set of components for building landing pages and marketing content with headers, heroes, sections, and call-to-action blocks.

## Page Header

A responsive page header with title, description, and optional actions:

```dart
DPageHeader(
  title: 'Welcome to Our Platform',
  description: 'Build amazing applications with our powerful tools and APIs.',
  links: [
    DButton(label: 'Get Started', size: DSize.lg),
    DButton(label: 'Learn More', variant: DButtonVariant.outline, size: DSize.lg),
  ],
)
```

### With Headline

```dart
DPageHeader(
  headline: 'New Feature',
  title: 'Introducing Dark Mode',
  description: 'Experience our platform in a whole new way.',
)
```

### With Icon

```dart
DPageHeader(
  icon: div(classes: 'w-16 h-16 bg-primary-100 rounded-2xl flex items-center justify-center', [
    DIcon(name: 'zap', size: 32, classes: 'text-primary-600'),
  ]),
  title: 'Lightning Fast',
  description: 'Experience blazing fast performance.',
)
```

### Alignment

```dart
// Left aligned (default)
DPageHeader(
  align: DPageHeaderAlign.left,
  title: 'Left Aligned Header',
  description: 'Content aligned to the left.',
)

// Center aligned
DPageHeader(
  align: DPageHeaderAlign.center,
  title: 'Center Aligned Header',
  description: 'Content centered on the page.',
)

// Right aligned
DPageHeader(
  align: DPageHeaderAlign.right,
  title: 'Right Aligned Header',
  description: 'Content aligned to the right.',
)
```

## Page Hero

A prominent hero section for landing pages:

```dart
DPageHero(
  headline: 'Introducing v2.0',
  title: 'The Modern Way to Build Web Apps',
  description: 'Create beautiful, responsive applications with our comprehensive component library.',
  links: [
    DButton(label: 'Get Started', size: DSize.lg),
    DButton(label: 'View Demo', variant: DButtonVariant.outline, size: DSize.lg),
  ],
)
```

### With Gradient Background

```dart
DPageHero(
  gradient: true,
  title: 'Build Faster, Ship Sooner',
  description: 'Pre-built components that just work.',
  links: [
    DButton(label: 'Start Free Trial', size: DSize.lg),
  ],
)
```

### Custom Gradient

```dart
DPageHero(
  gradient: true,
  gradientClasses: 'bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 dark:from-gray-900 dark:via-gray-900 dark:to-gray-950',
  title: 'Custom Gradient Hero',
  description: 'With a unique color scheme.',
)
```

### Left Aligned Hero

```dart
DPageHero(
  align: DPageHeaderAlign.left,
  title: 'Enterprise Ready',
  description: 'Built for teams of all sizes.',
  links: [
    DButton(label: 'Contact Sales'),
  ],
)
```

### With Custom Content

```dart
DPageHero(
  children: [
    div(classes: 'grid grid-cols-2 gap-8', [
      div([
        h1(classes: 'text-5xl font-bold', [text('Custom Layout')]),
        p(classes: 'mt-4 text-xl text-gray-600', [text('With full control.')]),
      ]),
      div([
        img(src: '/hero-image.png'),
      ]),
    ]),
  ],
)
```

## Page CTA (Call to Action)

A call-to-action section for conversions:

```dart
DPageCTA(
  title: 'Ready to get started?',
  description: 'Join thousands of developers building with our platform.',
  links: [
    DButton(label: 'Start Free Trial', size: DSize.lg),
    DButton(label: 'Contact Sales', variant: DButtonVariant.outline, size: DSize.lg),
  ],
)
```

### Card Style

```dart
DPageCTA(
  card: true,
  title: 'Get the newsletter',
  description: 'Stay up to date with the latest news and updates.',
  links: [
    DInput(placeholder: 'Enter your email'),
    DButton(label: 'Subscribe'),
  ],
)
```

### Gradient Background

```dart
DPageCTA(
  gradient: true,
  title: 'Start building today',
  description: 'Free for personal projects. Affordable for teams.',
  links: [
    DButton(
      label: 'Get Started',
      size: DSize.lg,
      variant: DButtonVariant.outline,
      classes: 'border-white text-white hover:bg-white hover:text-primary-600',
    ),
  ],
)
```

### With Icon

```dart
DPageCTA(
  card: true,
  icon: div(classes: 'w-12 h-12 bg-primary-100 rounded-xl flex items-center justify-center', [
    DIcon(name: 'rocket', size: 24, classes: 'text-primary-600'),
  ]),
  title: 'Launch your project',
  description: 'Deploy in minutes with zero configuration.',
  links: [
    DButton(label: 'Deploy Now'),
  ],
)
```

## Complete Landing Page Example

```dart
class LandingPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      // Hero Section
      DPageHero(
        gradient: true,
        headline: 'Introducing Duxt UI',
        title: 'Build Beautiful Web Apps with Dart',
        description: 'A comprehensive component library for Jaspr, inspired by Nuxt UI.',
        links: [
          DButton(label: 'Get Started', size: DSize.lg),
          DButton(
            label: 'View on GitHub',
            variant: DButtonVariant.outline,
            size: DSize.lg,
            leadingIcon: DIcon(name: 'github'),
          ),
        ],
      ),

      // Features Section
      DContainer(
        padded: true,
        children: [
          DPageHeader(
            align: DPageHeaderAlign.center,
            headline: 'Features',
            title: 'Everything you need',
            description: 'All the components you need to build modern web applications.',
          ),

          div(classes: 'grid grid-cols-1 md:grid-cols-3 gap-8 mt-16', [
            featureCard(
              'Component Library',
              'Over 50 pre-built components ready to use.',
              'box',
            ),
            featureCard(
              'Dark Mode',
              'Built-in dark mode support for all components.',
              'moon',
            ),
            featureCard(
              'Responsive',
              'Mobile-first responsive design out of the box.',
              'smartphone',
            ),
          ]),
        ],
      ),

      // CTA Section
      DPageCTA(
        gradient: true,
        title: 'Ready to build something amazing?',
        description: 'Get started with Duxt UI today.',
        links: [
          DButton(
            label: 'Start Building',
            size: DSize.lg,
            classes: 'bg-white text-primary-600 hover:bg-gray-100',
          ),
        ],
      ),
    ]);
  }

  Component featureCard(String title, String description, String icon) {
    return DCard(
      body: [
        div(classes: 'text-center', [
          div(classes: 'w-12 h-12 mx-auto bg-primary-100 rounded-xl flex items-center justify-center', [
            DIcon(name: icon, size: 24, classes: 'text-primary-600'),
          ]),
          h3(classes: 'mt-4 text-lg font-semibold', [text(title)]),
          p(classes: 'mt-2 text-gray-600', [text(description)]),
        ]),
      ],
    );
  }
}
```

## Dark Mode Support

All page components automatically adapt to dark mode with appropriate backgrounds, text colors, and gradient adjustments.

## API Reference

### DPageHeader

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | Main title text |
| `description` | `String?` | `null` | Description text |
| `headline` | `String?` | `null` | Eyebrow text above title |
| `align` | `DPageHeaderAlign` | `left` | Content alignment |
| `icon` | `Component?` | `null` | Icon component |
| `links` | `List<Component>` | `[]` | Action buttons |
| `classes` | `String?` | `null` | Custom CSS classes |
| `titleSlot` | `Component?` | `null` | Custom title component |
| `descriptionSlot` | `Component?` | `null` | Custom description component |

### DPageHero

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | Main title text |
| `description` | `String?` | `null` | Description text |
| `headline` | `String?` | `null` | Badge/eyebrow text |
| `align` | `DPageHeaderAlign` | `center` | Content alignment |
| `icon` | `Component?` | `null` | Icon component |
| `links` | `List<Component>` | `[]` | Action buttons |
| `gradient` | `bool` | `false` | Enable gradient background |
| `gradientClasses` | `String?` | `null` | Custom gradient classes |
| `classes` | `String?` | `null` | Custom CSS classes |
| `children` | `List<Component>` | `[]` | Custom content |

### DPageCTA

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | CTA title |
| `description` | `String?` | `null` | CTA description |
| `links` | `List<Component>` | `[]` | Action buttons |
| `gradient` | `bool` | `false` | Gradient background |
| `gradientClasses` | `String?` | `null` | Custom gradient classes |
| `card` | `bool` | `false` | Card-style container |
| `cardClasses` | `String?` | `null` | Custom card classes |
| `icon` | `Component?` | `null` | Icon component |
| `align` | `DPageCTAAlign` | `center` | Content alignment |
| `classes` | `String?` | `null` | Custom CSS classes |
