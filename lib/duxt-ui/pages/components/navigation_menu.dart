import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Navigation Menu component documentation page
class NavigationMenuPage extends StatelessComponent {
  const NavigationMenuPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Navigation Menu')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('Horizontal and vertical navigation menus with dropdown support.'),
            ]),

            // Basic Horizontal Menu
            _section('Basic Horizontal Menu', [
              ComponentPreviewCard(preview: [
                DNavigationMenu(
                  items: [
                    DNavigationItem(label: 'Home', href: '/'),
                    DNavigationItem(label: 'Products', href: '/products'),
                    DNavigationItem(label: 'About', href: '/about'),
                    DNavigationItem(label: 'Contact', href: '/contact'),
                  ],
                ),
              ], code: '''DNavigationMenu(
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
              ComponentPreviewCard(preview: [
                DNavigationMenu(
                  orientation: DNavigationOrientation.vertical,
                  items: [
                    DNavigationItem(label: 'Dashboard', href: '/dashboard'),
                    DNavigationItem(label: 'Projects', href: '/projects'),
                    DNavigationItem(label: 'Team', href: '/team'),
                    DNavigationItem(label: 'Settings', href: '/settings'),
                  ],
                ),
              ], code: '''DNavigationMenu(
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
              ComponentPreviewCard(preview: [
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
              ], code: '''DNavigationItem(
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
              ComponentPreviewCard(preview: [
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
              ], code: '''DNavigationItem(
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
              ComponentPreviewCard(preview: [
                DNavigationMenu(
                  items: [
                    DNavigationItem(label: 'Active', href: '#', active: true),
                    DNavigationItem(label: 'Normal', href: '#'),
                    DNavigationItem(label: 'Disabled', href: '#', disabled: true),
                  ],
                ),
              ], code: '''DNavigationItem(label: 'Active', href: '#', active: true)
DNavigationItem(label: 'Normal', href: '#')
DNavigationItem(label: 'Disabled', href: '#', disabled: true)'''),
            ]),

            // Dropdown Menu
            _section('Dropdown Menu', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('Items with children render as dropdown menus.'),
              ]),
              ComponentPreviewCard(preview: [
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
              ], code: '''DNavigationMenu(
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
                Component.text('Use DVerticalNavigation and DNavigationGroup for grouped sidebar navigation.'),
              ]),
              ComponentPreviewCard(preview: [
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
              ], code: '''DVerticalNavigation(
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
            h2([Component.text('API Reference')]),
            h3([Component.text('DNavigationMenu')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('items', 'List<DNavigationItem>', 'required', 'Menu items'),
                  _apiRow('orientation', 'DNavigationOrientation', 'horizontal', 'Menu orientation'),
                ]),
              ]),
            ]),

            // API Reference - DNavigationItem
            h3(classes: 'mt-8', [Component.text('DNavigationItem')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
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
            h3(classes: 'mt-8', [Component.text('DVerticalNavigation')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('groups', 'List<DNavigationGroup>', 'required', 'Navigation groups'),
                ]),
              ]),
            ]),

            // API Reference - DNavigationGroup
            h3(classes: 'mt-8', [Component.text('DNavigationGroup')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('title', 'String?', 'null', 'Group title'),
                  _apiRow('items', 'List<DNavigationItem>', 'required', 'Group items'),
                ]),
              ]),
            ]),

            // API Reference - DNavigationOrientation
            h3(classes: 'mt-8', [Component.text('DNavigationOrientation')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Value')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  tr(classes: 'border-b border-zinc-800/50', [
                    td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text('horizontal')]),
                    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Horizontal menu layout')]),
                  ]),
                  tr(classes: 'border-b border-zinc-800/50', [
                    td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text('vertical')]),
                    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Vertical menu layout')]),
                  ]),
                ]),
              ]),
            ]),
      ]),
    );
  }

  Component _section(String title, List<Component> children) {
    return div(classes: 'my-8', [
      h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]),
      ...children,
    ]);
  }

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [Component.text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [Component.text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text(desc)]),
    ]);
  }
}
