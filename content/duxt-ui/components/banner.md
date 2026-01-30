---
title: Banner
description: A full-width notification banner for announcements and alerts.
layout: ui-layout
order: 41
---

# Banner

The `DBanner` component displays a full-width notification bar for announcements, alerts, and important messages.

## Basic Usage

```
DBanner(
  title: 'New Feature',
  description: 'Check out our latest update!',
  onClose: () => hideBanner(),
)
```

## Colors

```
DBanner(title: 'Primary', color: DBannerColor.primary)
DBanner(title: 'Secondary', color: DBannerColor.secondary)
DBanner(title: 'Success', color: DBannerColor.success)
DBanner(title: 'Info', color: DBannerColor.info)
DBanner(title: 'Warning', color: DBannerColor.warning)
DBanner(title: 'Error', color: DBannerColor.error)
```

## Variants

### Solid (Default)

```
DBanner(
  variant: DBannerVariant.solid,
  title: 'Announcement',
  description: 'We have exciting news to share!',
)
```

### Outline

```
DBanner(
  variant: DBannerVariant.outline,
  title: 'Notice',
  description: 'Please review the updated terms.',
)
```

### Soft

```
DBanner(
  variant: DBannerVariant.soft,
  title: 'Tip',
  description: 'Did you know you can customize your dashboard?',
  color: DBannerColor.info,
)
```

### Subtle

```
DBanner(
  variant: DBannerVariant.subtle,
  title: 'Update',
  description: 'A new version is available.',
)
```

## Position

```
// Top (default)
DBanner(
  position: DBannerPosition.top,
  title: 'Top Banner',
)

// Bottom
DBanner(
  position: DBannerPosition.bottom,
  title: 'Bottom Banner',
)
```

## Sticky

Make the banner stick to the top or bottom of the viewport:

```
DBanner(
  sticky: true,
  position: DBannerPosition.top,
  title: 'Sticky Banner',
  description: 'This stays visible while scrolling.',
)
```

## With Icon

```
DBanner(
  icon: DIcon(name: 'megaphone', size: 20),
  title: 'Announcement',
  description: 'Big news coming soon!',
)
```

## With Actions

```
DBanner(
  title: 'New Feature Available',
  description: 'Try our new dashboard.',
  actions: [
    DBannerAction(label: 'Learn more', href: '/features'),
    DBannerAction(label: 'Try now', onClick: () => openFeature()),
  ],
)
```

## Non-Closable

```
DBanner(
  title: 'Maintenance',
  description: 'Scheduled maintenance in 1 hour.',
  closable: false,
  color: DBannerColor.warning,
)
```

## Preset Banners

### Announcement Banner

```
DBannerAnnouncement(
  message: 'Version 2.0 is here with amazing new features!',
  linkText: 'See what\'s new',
  linkHref: '/changelog',
  onClose: () => dismissAnnouncement(),
)
```

### Maintenance Banner

```
DBannerMaintenance(
  message: 'Scheduled maintenance on Saturday, 2 AM - 4 AM UTC.',
  onClose: () => dismissMaintenance(),
)
```

### Cookie Consent Banner

```
DBannerCookieConsent(
  privacyPolicyHref: '/privacy',
  onAccept: () => acceptCookies(),
  onDecline: () => declineCookies(),
)
```

## Complete Example

```
class AppWithBanner extends StatefulComponent {
  @override
  State createState() => _AppWithBannerState();
}

class _AppWithBannerState extends State<AppWithBanner> {
  bool showBanner = true;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      if (showBanner)
        DBanner(
          icon: div(classes: 'text-lg', [text('🎉')]),
          title: 'Black Friday Sale',
          description: 'Get 50% off all plans. Limited time offer!',
          color: DBannerColor.primary,
          variant: DBannerVariant.solid,
          actions: [
            DBannerAction(
              label: 'Shop now →',
              href: '/pricing',
            ),
          ],
          onClose: () => setState(() => showBanner = false),
        ),

      // Rest of your app
    ]);
  }
}
```

## Dark Mode Support

`DBanner` automatically adapts to dark mode:
- Background colors adjust for proper contrast
- Text remains readable
- Close button and actions adapt appropriately

## API Reference

### DBanner

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | Banner title |
| `description` | `String?` | `null` | Banner message |
| `color` | `DBannerColor` | `primary` | Color scheme |
| `variant` | `DBannerVariant` | `solid` | Visual style |
| `position` | `DBannerPosition` | `top` | Position |
| `icon` | `Component?` | `null` | Leading icon |
| `actions` | `List<Component>` | `[]` | Action links/buttons |
| `closable` | `bool` | `true` | Show close button |
| `onClose` | `VoidCallback?` | `null` | Close callback |
| `sticky` | `bool` | `false` | Stick to viewport |

### DBannerAction

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | required | Action text |
| `onClick` | `VoidCallback?` | `null` | Click callback |
| `href` | `String?` | `null` | Link URL |
