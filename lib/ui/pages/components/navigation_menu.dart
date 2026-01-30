import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Navigation Menu component documentation page
class NavigationMenuPage extends StatelessComponent {
  const NavigationMenuPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      // Header
      SiteHeader(
        logo: '/images/logo.svg',
        logoAlt: 'Duxt',
        duxtVersion: '0.3.7',
        duxtUiVersion: '0.2.3',
        items: [
          NavLink(href: '/duxt', text: 'Duxt'),
          NavLink(href: '/duxt-ui', text: 'Duxt UI'),
          NavLink(href: '/about', text: 'About'),
          ThemeToggle(),
        ],
      ),
      // Main content
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Navigation Menu')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('Horizontal and vertical navigation menus with dropdown support.'),
            ]),

            // Basic Horizontal Menu
            _section('Basic Horizontal Menu', [
              _preview([
                DNavigationMenu(
                  items: [
                    DNavigationItem(label: 'Home', href: '/'),
                    DNavigationItem(label: 'Products', href: '/products'),
                    DNavigationItem(label: 'About', href: '/about'),
                    DNavigationItem(label: 'Contact', href: '/contact'),
                  ],
                ),
              ], '''DNavigationMenu(
  items: [
    DNavigationItem(label: 'Home', href: '/'),
    DNavigationItem(label: 'Products', href: '/products'),
    DNavigationItem(label: 'About', href: '/about'),
    DNavigationItem(label: 'Contact', href: '/contact'),
  ],
)'''),
            ]),

            // Vertical Menu
            _section('Vertical Menu', [
              _preview([
                DNavigationMenu(
                  orientation: DNavigationOrientation.vertical,
                  items: [
                    DNavigationItem(label: 'Dashboard', href: '/dashboard'),
                    DNavigationItem(label: 'Projects', href: '/projects'),
                    DNavigationItem(label: 'Team', href: '/team'),
                    DNavigationItem(label: 'Settings', href: '/settings'),
                  ],
                ),
              ], '''DNavigationMenu(
  orientation: DNavigationOrientation.vertical,
  items: [
    DNavigationItem(label: 'Dashboard', href: '/dashboard'),
    DNavigationItem(label: 'Projects', href: '/projects'),
    DNavigationItem(label: 'Team', href: '/team'),
    DNavigationItem(label: 'Settings', href: '/settings'),
  ],
)'''),
            ]),

            // Navigation Item with Icon
            _section('With Icons', [
              _preview([
                DNavigationMenu(
                  orientation: DNavigationOrientation.vertical,
                  items: [
                    DNavigationItem(
                      label: 'Dashboard',
                      href: '/dashboard',
                      icon: DIcon(name: DIconNames.home, size: DIconSize.sm),
                      active: true,
                    ),
                    DNavigationItem(
                      label: 'Settings',
                      href: '/settings',
                      icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
                    ),
                    DNavigationItem(
                      label: 'Users',
                      href: '/users',
                      icon: DIcon(name: DIconNames.users, size: DIconSize.sm),
                    ),
                  ],
                ),
              ], '''DNavigationItem(
  label: 'Dashboard',
  href: '/dashboard',
  icon: DIcon(name: DIconNames.home, size: DIconSize.sm),
  active: true,
)

DNavigationItem(
  label: 'Settings',
  href: '/settings',
  icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
)'''),
            ]),

            // With Badge
            _section('With Badge', [
              _preview([
                DNavigationMenu(
                  orientation: DNavigationOrientation.vertical,
                  items: [
                    DNavigationItem(
                      label: 'Notifications',
                      href: '/notifications',
                      icon: DIcon(name: DIconNames.bell, size: DIconSize.sm),
                      badge: DBadge(label: '5', size: DBadgeSize.xs),
                    ),
                    DNavigationItem(
                      label: 'Messages',
                      href: '/messages',
                      icon: DIcon(name: DIconNames.mail, size: DIconSize.sm),
                      badge: DBadge(label: '12', size: DBadgeSize.xs, color: DBadgeColor.primary),
                    ),
                  ],
                ),
              ], '''DNavigationItem(
  label: 'Notifications',
  href: '/notifications',
  icon: DIcon(name: DIconNames.bell, size: DIconSize.sm),
  badge: DBadge(label: '5', size: DSize.xs),
)

DNavigationItem(
  label: 'Messages',
  href: '/messages',
  icon: DIcon(name: DIconNames.mail, size: DIconSize.sm),
  badge: DBadge(label: '12', size: DSize.xs, color: DBadgeColor.primary),
)'''),
            ]),

            // States
            _section('States', [
              _preview([
                DNavigationMenu(
                  items: [
                    DNavigationItem(label: 'Active', href: '#', active: true),
                    DNavigationItem(label: 'Normal', href: '#'),
                    DNavigationItem(label: 'Disabled', href: '#', disabled: true),
                  ],
                ),
              ], '''DNavigationItem(label: 'Active', href: '#', active: true)
DNavigationItem(label: 'Normal', href: '#')
DNavigationItem(label: 'Disabled', href: '#', disabled: true)'''),
            ]),

            // Dropdown Menu
            _section('Dropdown Menu', [
              p(classes: 'text-zinc-400 mb-4', [
                text('Items with children render as dropdown menus.'),
              ]),
              _preview([
                DNavigationMenu(
                  items: [
                    DNavigationItem(label: 'Home', href: '/'),
                    DNavigationItem(
                      label: 'Products',
                      children: [
                        DNavigationItem(label: 'All Products', href: '/products'),
                        DNavigationItem(label: 'Categories', href: '/categories'),
                        DNavigationItem(label: 'New Arrivals', href: '/new'),
                      ],
                    ),
                    DNavigationItem(label: 'Contact', href: '/contact'),
                  ],
                ),
              ], '''DNavigationMenu(
  items: [
    DNavigationItem(label: 'Home', href: '/'),
    DNavigationItem(
      label: 'Products',
      children: [
        DNavigationItem(label: 'All Products', href: '/products'),
        DNavigationItem(label: 'Categories', href: '/categories'),
        DNavigationItem(label: 'New Arrivals', href: '/new'),
      ],
    ),
    DNavigationItem(label: 'Contact', href: '/contact'),
  ],
)'''),
            ]),

            // Vertical Navigation with Groups
            _section('Vertical Navigation with Groups', [
              p(classes: 'text-zinc-400 mb-4', [
                text('Use DVerticalNavigation and DNavigationGroup for grouped sidebar navigation.'),
              ]),
              _preview([
                DVerticalNavigation(
                  groups: [
                    DNavigationGroup(
                      title: 'Main',
                      items: [
                        DNavigationItem(
                          label: 'Dashboard',
                          href: '/dashboard',
                          icon: DIcon(name: DIconNames.home, size: DIconSize.sm),
                          active: true,
                        ),
                        DNavigationItem(
                          label: 'Projects',
                          href: '/projects',
                          icon: DIcon(name: DIconNames.folder, size: DIconSize.sm),
                        ),
                      ],
                    ),
                    DNavigationGroup(
                      title: 'Settings',
                      items: [
                        DNavigationItem(
                          label: 'Account',
                          href: '/account',
                          icon: DIcon(name: DIconNames.user, size: DIconSize.sm),
                        ),
                        DNavigationItem(
                          label: 'Preferences',
                          href: '/preferences',
                          icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
                        ),
                      ],
                    ),
                  ],
                ),
              ], '''DVerticalNavigation(
  groups: [
    DNavigationGroup(
      title: 'Main',
      items: [
        DNavigationItem(
          label: 'Dashboard',
          href: '/dashboard',
          icon: DIcon(name: DIconNames.home, size: DIconSize.sm),
          active: true,
        ),
        DNavigationItem(
          label: 'Projects',
          href: '/projects',
          icon: DIcon(name: DIconNames.folder, size: DIconSize.sm),
        ),
      ],
    ),
    DNavigationGroup(
      title: 'Settings',
      items: [
        DNavigationItem(
          label: 'Account',
          href: '/account',
          icon: DIcon(name: DIconNames.user, size: DIconSize.sm),
        ),
        DNavigationItem(
          label: 'Preferences',
          href: '/preferences',
          icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
        ),
      ],
    ),
  ],
)'''),
            ]),

            // API Reference - DNavigationMenu
            h2([text('API Reference')]),
            h3([text('DNavigationMenu')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('items', 'List<DNavigationItem>', 'required', 'Menu items'),
                  _apiRow('orientation', 'DNavigationOrientation', 'horizontal', 'Menu orientation'),
                ]),
              ]),
            ]),

            // API Reference - DNavigationItem
            h3(classes: 'mt-8', [text('DNavigationItem')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('label', 'String', 'required', 'Item label'),
                  _apiRow('href', 'String?', 'null', 'Link URL'),
                  _apiRow('icon', 'Component?', 'null', 'Leading icon'),
                  _apiRow('badge', 'Component?', 'null', 'Badge component'),
                  _apiRow('active', 'bool', 'false', 'Active state'),
                  _apiRow('disabled', 'bool', 'false', 'Disabled state'),
                  _apiRow('onClick', 'VoidCallback?', 'null', 'Click handler'),
                  _apiRow('children', 'List<DNavigationItem>?', 'null', 'Dropdown items'),
                ]),
              ]),
            ]),

            // API Reference - DVerticalNavigation
            h3(classes: 'mt-8', [text('DVerticalNavigation')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('groups', 'List<DNavigationGroup>', 'required', 'Navigation groups'),
                ]),
              ]),
            ]),

            // API Reference - DNavigationGroup
            h3(classes: 'mt-8', [text('DNavigationGroup')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('title', 'String?', 'null', 'Group title'),
                  _apiRow('items', 'List<DNavigationItem>', 'required', 'Group items'),
                ]),
              ]),
            ]),

            // API Reference - DNavigationOrientation
            h3(classes: 'mt-8', [text('DNavigationOrientation')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Value')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
                  ]),
                ]),
                tbody([
                  tr(classes: 'border-b border-zinc-800/50', [
                    td(classes: 'py-3 px-4 font-mono text-cyan-400', [text('horizontal')]),
                    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text('Horizontal menu layout')]),
                  ]),
                  tr(classes: 'border-b border-zinc-800/50', [
                    td(classes: 'py-3 px-4 font-mono text-cyan-400', [text('vertical')]),
                    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text('Vertical menu layout')]),
                  ]),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) {
    return div(classes: 'my-8', [
      h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]),
      ...children,
    ]);
  }

  Component _preview(List<Component> components, String codeExample) {
    return div(
      classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden',
      [
        // Live preview
        div(
          classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]',
          styles: Styles(raw: {
            'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)',
            'background-size': '24px 24px',
          }),
          components,
        ),
        // Code
        div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [
          div(classes: 'flex items-center justify-between px-4 py-2 border-b border-zinc-800', [
            span(classes: 'text-xs text-zinc-500', [text('dart')]),
          ]),
          div(classes: 'p-4 overflow-x-auto', [
            pre(classes: 'text-sm', [
              code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)]),
            ]),
          ]),
        ]),
      ],
    );
  }

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
    ]);
  }
}
