import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Sidebar navigation for Duxt Framework documentation.
class SidebarDuxt extends StatelessComponent {
  const SidebarDuxt({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Document.head(children: [Style(styles: _styles)]),
      nav(classes: 'sidebar-nav', [
        _group('Getting Started', [
          _link('Introduction', '/duxt'),
        ]),
        _group('Core Concepts', [
          _link('Modules', '/duxt/modules'),
          _link('Namespaces', '/duxt/namespaces'),
          _link('Routing', '/duxt/routing'),
          _link('Pages', '/duxt/pages'),
          _link('Layouts', '/duxt/layouts'),
          _link('Middleware', '/duxt/middleware'),
        ]),
        _group('Data & State', [
          _link('API Client', '/duxt/api-client'),
          _link('State Management', '/duxt/state'),
          _link('Server API', '/duxt/server'),
        ]),
        _group('Styling & Config', [
          _link('Configuration', '/duxt/configuration'),
          _link('Tailwind CSS', '/duxt/tailwind'),
        ]),
        _group('Tools', [
          _link('CLI Commands', '/duxt-cli'),
          _link('Content System', '/duxt/content'),
        ]),
        _group('Deployment', [
          _link('Deploy', '/duxt/deploy'),
        ]),
      ]),
    ]);
  }

  Component _group(String title, List<Component> links) {
    return div(classes: 'sidebar-group', [
      div(classes: 'sidebar-group-title', [Component.text(title)]),
      ul(classes: 'sidebar-links', links),
    ]);
  }

  Component _link(String label, String href) {
    return li([
      a(href: href, classes: 'sidebar-link', [Component.text(label)]),
    ]);
  }

  static List<StyleRule> get _styles => [
    css('.sidebar-nav', [
      css('&').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        gap: Gap.row(1.5.rem),
      ),
    ]),

    css('.sidebar-group', [
      css('&').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        gap: Gap.row(0.5.rem),
      ),
    ]),

    css('.sidebar-group-title', [
      css('&').styles(
        padding: Padding.only(left: 0.75.rem),
        raw: {
          'font-size': '0.75rem',
          'font-weight': '600',
          'text-transform': 'uppercase',
          'letter-spacing': '0.05em',
          'color': '#71717a',
        },
      ),
    ]),

    css('.sidebar-links', [
      css('&').styles(
        margin: Margin.zero,
        padding: Padding.zero,
        listStyle: ListStyle.none,
      ),
    ]),

    css('.sidebar-link', [
      css('&').styles(
        display: Display.block,
        padding: Padding.symmetric(horizontal: 0.75.rem, vertical: 0.5.rem),
        raw: {
          'font-size': '0.875rem',
          'color': '#a1a1aa',
          'text-decoration': 'none',
          'border-radius': '6px',
          'transition': 'all 0.15s ease',
        },
      ),
      css('&:hover').styles(
        backgroundColor: Color('#27272a'),
        color: Color('#22d3ee'),
      ),
    ]),

    // Light mode
    css(':root[data-theme="light"] .sidebar-group-title', [
      css('&').styles(color: Color('#71717a')),
    ]),
    css(':root[data-theme="light"] .sidebar-link', [
      css('&').styles(color: Color('#52525b')),
      css('&:hover').styles(
        backgroundColor: Color('#f4f4f5'),
        color: Color('#0891b2'),
      ),
    ]),
  ];
}
