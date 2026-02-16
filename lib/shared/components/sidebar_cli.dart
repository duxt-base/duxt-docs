import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Sidebar navigation for Duxt CLI documentation.
class SidebarCli extends StatelessComponent {
  const SidebarCli({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Document.head(children: [Style(styles: _styles)]),
      nav(classes: 'sidebar-nav', [
        _group('Getting Started', [
          _link('Overview', '/duxt-cli'),
          _link('Installation', '/duxt-cli#installation'),
          _link('Scaffold Tutorial', '/duxt-cli/tutorial'),
        ]),
        _group('Project', [
          _link('create', '/duxt-cli/create'),
        ]),
        _group('Development', [
          _link('dev', '/duxt-cli/dev'),
          _link('build', '/duxt-cli/build'),
          _link('desktop', '/duxt-cli/desktop'),
          _link('preview', '/duxt-cli/build#preview'),
          _link('generate (SSG)', '/duxt-cli/build#generate'),
        ]),
        _group('Code Generation', [
          _link('scaffold', '/duxt-cli/scaffold'),
          _link('g (generate)', '/duxt-cli/generators'),
          _link('d (delete)', '/duxt-cli/generators#delete'),
        ]),
        _group('Documentation', [
          _link('docs', '/duxt-cli/docs'),
        ]),
        _group('Utilities', [
          _link('info', '/duxt-cli/utilities#info'),
          _link('doctor', '/duxt-cli/utilities#doctor'),
          _link('clean', '/duxt-cli/utilities#clean'),
          _link('update', '/duxt-cli/utilities#update'),
          _link('version', '/duxt-cli/utilities#version'),
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
