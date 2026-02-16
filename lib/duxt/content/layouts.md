---
title: Layouts
description: Wrap pages with reusable layout components.
layout: duxt-layout
order: 7
---

# Layouts

## Overview

Layouts in Duxt provide a way to wrap pages with common UI elements like headers, footers, sidebars, and navigation. Instead of repeating this code in every page, you define it once in a layout.

## Creating Layouts

Extend `DuxtLayout` and implement the `build` method:

```
// lib/shared/layouts/default_layout.dart
import 'package:duxt/duxt.dart';

class DefaultLayout extends DuxtLayout {
  @override
  Component build(BuildContext context, Component child) {
    return div(classes: 'min-h-screen flex flex-col', [
      header(classes: 'h-16 border-b flex items-center px-6', [
        a(href: '/', [text('My App')]),
        nav(classes: 'ml-auto flex gap-4', [
          a(href: '/about', [text('About')]),
          a(href: '/contact', [text('Contact')]),
        ]),
      ]),
      main_(classes: 'flex-1', [child]),
      footer(classes: 'h-16 border-t flex items-center justify-center', [
        text('My App'),
      ]),
    ]);
  }
}
```

Generate a layout with the CLI:

```
duxt g layout dashboard
duxt g l dashboard
```

## Using Layouts

Apply a layout to a page using the `layout` getter:

```
// lib/pages/index.dart
import 'package:duxt/duxt.dart';
import '../shared/layouts/default_layout.dart';

class HomePage extends DuxtPage {
  @override
  Type get layout => DefaultLayout;

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('Welcome Home')]),
      p([text('This content is wrapped by DefaultLayout')]),
    ]);
  }
}
```

## Nested Layouts

Layouts can extend other layouts for nested structures:

```
// lib/shared/layouts/dashboard_layout.dart
import 'package:duxt/duxt.dart';
import 'default_layout.dart';

class DashboardLayout extends DuxtLayout {
  @override
  Type? get parent => DefaultLayout;

  @override
  Component build(BuildContext context, Component child) {
    return div(classes: 'flex', [
      aside(classes: 'w-64 border-r p-4', [
        nav([
          a(href: '/dashboard', [text('Overview')]),
          a(href: '/dashboard/analytics', [text('Analytics')]),
          a(href: '/dashboard/settings', [text('Settings')]),
        ]),
      ]),
      div(classes: 'flex-1 p-6', [child]),
    ]);
  }
}
```

The rendering order is: DefaultLayout -> DashboardLayout -> Page

## Common Layouts

### Marketing Layout

```
class MarketingLayout extends DuxtLayout {
  @override
  Component build(BuildContext context, Component child) {
    return div(classes: 'min-h-screen', [
      header(classes: 'sticky top-0 z-50 bg-white/80 backdrop-blur', [
        div(classes: 'max-w-7xl mx-auto px-4 h-16 flex items-center', [
          Logo(),
          NavigationMenu(),
          div(classes: 'ml-auto flex gap-4', [
            DButton(label: 'Sign In', variant: DButtonVariant.ghost),
            DButton(label: 'Get Started'),
          ]),
        ]),
      ]),
      main_([child]),
      Footer(),
    ]);
  }
}
```

### Dashboard Layout

```
class DashboardLayout extends DuxtLayout {
  @override
  Component build(BuildContext context, Component child) {
    return div(classes: 'min-h-screen flex', [
      aside(classes: 'w-64 bg-gray-900 text-white', [
        div(classes: 'p-4', [Logo()]),
        DashboardNav(),
      ]),
      div(classes: 'flex-1 flex flex-col', [
        header(classes: 'h-16 border-b flex items-center px-6', [
          SearchBar(),
          div(classes: 'ml-auto flex items-center gap-4', [
            NotificationBell(),
            UserMenu(),
          ]),
        ]),
        main_(classes: 'flex-1 p-6 bg-gray-50', [child]),
      ]),
    ]);
  }
}
```

### Namespace Layout

Namespace layouts auto-wrap all routes in a namespace. Create one with:

```
duxt g layout Admin
```

This creates `lib/admin/layouts/default.dart`:

```
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class AdminLayout extends StatelessComponent {
  final Component child;

  const AdminLayout({super.key, required this.child});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen', [
      header(classes: 'bg-gray-900 border-b border-gray-700', [
        div(classes: 'max-w-7xl mx-auto px-4 py-3 flex items-center justify-between', [
          a(href: '/admin', classes: 'text-white font-semibold', [
            text('Admin'),
          ]),
          nav(classes: 'flex gap-4', [
            a(href: '/admin/dashboard', classes: 'text-gray-300 hover:text-white', [text('Dashboard')]),
            a(href: '/admin/posts', classes: 'text-gray-300 hover:text-white', [text('Posts')]),
            a(href: '/admin/users', classes: 'text-gray-300 hover:text-white', [text('Users')]),
          ]),
        ]),
      ]),
      main_(classes: 'max-w-7xl mx-auto px-4 py-8', [
        child,
      ]),
    ]);
  }
}
```

All `/admin/*` routes are automatically wrapped. No per-page configuration needed.

See [Namespaces](/duxt/namespaces) for details.

### Auth Layout

```
class AuthLayout extends DuxtLayout {
  @override
  Component build(BuildContext context, Component child) {
    return div(classes: 'min-h-screen flex', [
      div(classes: 'hidden lg:flex w-1/2 bg-gradient-to-br from-cyan-600 to-blue-600', [
        div(classes: 'flex flex-col justify-center items-center text-white p-12', [
          Logo(size: 'lg'),
          h2(classes: 'text-3xl font-bold mt-8', [text('Welcome back')]),
          p(classes: 'text-white/80 mt-2', [text('Sign in to continue')]),
        ]),
      ]),
      div(classes: 'flex-1 flex items-center justify-center p-8', [
        div(classes: 'w-full max-w-md', [child]),
      ]),
    ]);
  }
}
```
