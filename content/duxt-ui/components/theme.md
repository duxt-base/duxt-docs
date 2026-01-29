---
title: Theme
description: Theme provider and color mode toggle for managing dark/light modes.
layout: ui-layout
order: 27
---

# Theme

Duxt UI provides a theme system with `DThemeProvider` for managing application themes and `DColorModeSwitch` for toggling between light and dark modes.

## Theme Provider

Wrap your application with `DThemeProvider` to enable theme management:

```dart
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DThemeProvider(
      theme: DuxtTheme(),
      mode: DThemeMode.system,  // Follow system preference
      child: [
        // Your app content
      ],
    );
  }
}
```

## Theme Modes

```dart
// Light mode only
DThemeProvider(
  mode: DThemeMode.light,
  child: [...],
)

// Dark mode only
DThemeProvider(
  mode: DThemeMode.dark,
  child: [...],
)

// Follow system preference (default)
DThemeProvider(
  mode: DThemeMode.system,
  child: [...],
)
```

## Custom Theme

Define a custom theme with your brand colors:

```dart
final customTheme = DuxtTheme(
  // Primary color (brand color)
  primary: DColorScale(
    light: '#3b82f6',  // Blue for light mode
    dark: '#60a5fa',   // Lighter blue for dark mode
  ),

  // Secondary color
  secondary: DColorScale(
    light: '#8b5cf6',  // Purple
    dark: '#a78bfa',
  ),

  // Semantic colors
  success: DColorScale(light: '#22c55e', dark: '#4ade80'),
  warning: DColorScale(light: '#f59e0b', dark: '#fbbf24'),
  error: DColorScale(light: '#ef4444', dark: '#f87171'),
  info: DColorScale(light: '#06b6d4', dark: '#22d3ee'),

  // Typography
  font: 'Inter, system-ui, sans-serif',
  codeFont: 'JetBrains Mono, monospace',
);

// Use the custom theme
DThemeProvider(
  theme: customTheme,
  child: [...],
)
```

## Color Mode Switch

A toggle component for switching between light and dark modes:

```dart
DColorModeSwitch()
```

### With Callback

```dart
DColorModeSwitch(
  onModeChange: (isDark) {
    print('Dark mode: $isDark');
  },
)
```

### In Header

```dart
header(classes: 'flex items-center justify-between p-4', [
  // Logo
  a(href: '/', [text('MyApp')]),

  // Navigation + Theme toggle
  div(classes: 'flex items-center gap-4', [
    nav(classes: 'flex gap-4', [
      a(href: '/features', [text('Features')]),
      a(href: '/docs', [text('Docs')]),
    ]),
    DColorModeSwitch(),
  ]),
])
```

## CSS Variables

The theme system generates CSS variables that can be used in your styles:

```css
:root {
  --color-primary: #22c55e;
  --color-secondary: #3b82f6;
  --color-success: #22c55e;
  --color-warning: #f59e0b;
  --color-error: #ef4444;
  --color-info: #06b6d4;
}

.dark {
  --color-primary: #4ade80;
  --color-secondary: #60a5fa;
  --color-success: #4ade80;
  --color-warning: #fbbf24;
  --color-error: #f87171;
  --color-info: #22d3ee;
}
```

## Color System

### Semantic Colors

Duxt UI provides semantic colors that convey meaning:

| Color | Usage |
|-------|-------|
| `primary` | Primary actions, brand color, links |
| `secondary` | Secondary actions, accents |
| `success` | Positive states, confirmations |
| `warning` | Cautionary states, important notices |
| `error` | Error states, destructive actions |
| `info` | Informational states, tips |
| `neutral` | Neutral, muted elements |

### Using Colors

```dart
// In components
DButton(color: DColor.primary)
DAlert(color: DColor.success)
DBadge(color: DColor.warning)

// Color utility functions
final bgClass = bgColor(DColor.primary);  // 'bg-primary-500'
final textClass = textColor(DColor.error);  // 'text-error-500'
final ringClass = ringColor(DColor.info);  // 'ring-info-500'
```

### Text Colors

```dart
// Pre-defined text colors
DTextColors.highlighted  // Primary text color
DTextColors.defaultText  // Default text
DTextColors.muted        // Muted/secondary text
DTextColors.dimmed       // Very subtle text
DTextColors.inverted     // Inverted (for dark backgrounds)
```

### Background Colors

```dart
// Pre-defined backgrounds
DBgColors.defaultBg  // Default background
DBgColors.elevated   // Slightly elevated (cards)
DBgColors.muted      // Muted background
DBgColors.inverted   // Inverted background
```

## Complete App Example

```dart
void main() {
  runApp(App());
}

class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Document(
      title: 'My App',
      head: [
        // Include Tailwind
        link(href: '/styles.css', rel: 'stylesheet'),
      ],
      body: DThemeProvider(
        theme: DuxtTheme(
          primary: DColorScale(light: '#6366f1', dark: '#818cf8'),
          font: 'Inter, sans-serif',
        ),
        mode: DThemeMode.system,
        child: [
          div(classes: 'min-h-screen bg-white dark:bg-gray-900', [
            // Header with theme toggle
            header(classes: 'border-b', [
              DContainer(
                padded: true,
                children: [
                  div(classes: 'h-16 flex items-center justify-between', [
                    span(classes: 'font-bold text-xl', [text('MyApp')]),
                    DColorModeSwitch(),
                  ]),
                ],
              ),
            ]),

            // Main content
            main([
              DContainer(
                padded: true,
                children: [
                  div(classes: 'py-8', [
                    h1(classes: 'text-3xl font-bold', [text('Welcome')]),
                    p(classes: 'text-gray-500 dark:text-gray-400 mt-2', [
                      text('This app supports light and dark modes.'),
                    ]),
                  ]),
                ],
              ),
            ]),
          ]),
        ],
      ),
    );
  }
}
```

## Dark Mode Styling

All Duxt UI components automatically support dark mode. For custom elements, use Tailwind's dark mode classes:

```dart
div(
  classes: 'bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100',
  [
    text('This adapts to dark mode'),
  ],
)
```

## API Reference

### DThemeProvider

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `theme` | `DuxtTheme?` | `null` | Custom theme configuration |
| `mode` | `DThemeMode` | `system` | Theme mode |
| `child` | `List<Component>` | required | App content |

### DuxtTheme

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `primary` | `DColorScale` | Green | Primary brand color |
| `secondary` | `DColorScale` | Blue | Secondary color |
| `success` | `DColorScale` | Green | Success color |
| `warning` | `DColorScale` | Yellow | Warning color |
| `error` | `DColorScale` | Red | Error color |
| `info` | `DColorScale` | Cyan | Info color |
| `font` | `String?` | `null` | Body font family |
| `codeFont` | `String?` | `null` | Code font family |

### DColorModeSwitch

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `onModeChange` | `ValueChanged<bool>?` | `null` | Mode change callback |

### DThemeMode

| Value | Description |
|-------|-------------|
| `light` | Always use light mode |
| `dark` | Always use dark mode |
| `system` | Follow system preference |
