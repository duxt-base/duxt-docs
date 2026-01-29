import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Navigation group in sidebar
class NavGroup {
  final String title;
  final List<NavItem> items;

  const NavGroup({required this.title, required this.items});
}

/// Navigation item
class NavItem {
  final String label;
  final String path;
  final String? icon;

  const NavItem({required this.label, required this.path, this.icon});
}

/// Sidebar navigation component
class Sidebar extends StatelessComponent {
  final String currentPath;

  const Sidebar({super.key, required this.currentPath});

  static const List<NavGroup> navigation = [
    NavGroup(
      title: 'Getting Started',
      items: [
        NavItem(label: 'Introduction', path: '/getting-started'),
        NavItem(label: 'Quick Start', path: '/getting-started/quick-start'),
      ],
    ),
    NavGroup(
      title: 'Components',
      items: [
        NavItem(label: 'Overview', path: '/components'),
        NavItem(label: 'Button', path: '/components/button'),
        NavItem(label: 'Input', path: '/components/input'),
        NavItem(label: 'Card', path: '/components/card'),
      ],
    ),
    NavGroup(
      title: 'Duxt UI',
      items: [
        NavItem(label: 'Overview', path: '/duxt-ui'),
        NavItem(label: 'Installation', path: '/duxt-ui/installation'),
        NavItem(label: 'Theming', path: '/duxt-ui/theming'),
        NavItem(label: 'All Components', path: '/duxt-ui/components'),
      ],
    ),
    NavGroup(
      title: 'Resources',
      items: [
        NavItem(label: 'API Reference', path: '/api'),
      ],
    ),
  ];

  @override
  Component build(BuildContext context) {
    return aside(
      classes: 'fixed left-0 top-16 bottom-0 w-64 bg-gray-950 border-r border-gray-800 overflow-y-auto scrollbar-thin',
      [
        nav(classes: 'p-4 space-y-6', [
          for (final group in navigation)
            div([
              div(classes: 'sidebar-group-title mb-2', [text(group.title)]),
              ul(classes: 'space-y-1', [
                for (final item in group.items)
                  li([
                    a(
                      href: item.path,
                      classes: 'sidebar-link ${currentPath == item.path ? 'active' : ''}',
                      [text(item.label)],
                    ),
                  ]),
              ]),
            ]),
        ]),
      ],
    );
  }
}
