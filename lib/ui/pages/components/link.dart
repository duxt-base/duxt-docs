import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Link component documentation page
class LinkPage extends StatelessComponent {
  const LinkPage({super.key});

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
            h1([text('Link')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('Styled anchor components for navigation and external links.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                DLink(label: 'Learn more', href: '/about'),
              ], "DLink(\n  label: 'Learn more',\n  href: '/about',\n)"),
            ]),

            // External Link
            _section('External Link', [
              p(classes: 'text-zinc-400 mb-4', [
                text('External links automatically open in a new tab with proper security attributes.'),
              ]),
              _preview([
                DLink(
                  label: 'View on GitHub',
                  href: 'https://github.com/example/repo',
                  external: true,
                ),
              ], "DLink(\n  label: 'View on GitHub',\n  href: 'https://github.com/example/repo',\n  external: true,\n)"),
            ]),

            // Colors
            _section('Colors', [
              _preview([
                div(classes: 'flex flex-wrap gap-4', [
                  DLink(color: DLinkColor.primary, label: 'Primary', href: '#'),
                  DLink(color: DLinkColor.neutral, label: 'Neutral', href: '#'),
                  DLink(color: DLinkColor.inherit, label: 'Inherit', href: '#'),
                ]),
              ], '''DLink(color: DLinkColor.primary, label: 'Primary', href: '#')
DLink(color: DLinkColor.neutral, label: 'Neutral', href: '#')
DLink(color: DLinkColor.inherit, label: 'Inherit', href: '#')'''),
            ]),

            // With Underline
            _section('With Underline', [
              _preview([
                div(classes: 'flex flex-wrap gap-4', [
                  DLink(label: 'Hover underline', href: '#'),
                  DLink(label: 'Always underlined', href: '#', underline: true),
                ]),
              ], '''// Underline on hover (default)
DLink(label: 'Hover underline', href: '#')

// Always underlined
DLink(label: 'Always underlined', href: '#', underline: true)'''),
            ]),

            // States
            _section('States', [
              _preview([
                div(classes: 'flex flex-wrap gap-4', [
                  DLink(label: 'Active Link', href: '#', active: true),
                  DLink(label: 'Disabled Link', href: '#', disabled: true),
                ]),
              ], '''DLink(label: 'Active Link', href: '#', active: true)
DLink(label: 'Disabled Link', href: '#', disabled: true)'''),
            ]),

            // With Icons
            _section('With Icons', [
              _preview([
                div(classes: 'flex flex-wrap gap-4', [
                  DLink(
                    label: 'Documentation',
                    href: '/docs',
                    icon: DIcon(name: DIconNames.file, size: DIconSize.sm),
                  ),
                  DLink(
                    label: 'Download',
                    href: '/download',
                    trailingIcon: DIcon(name: DIconNames.download, size: DIconSize.sm),
                  ),
                ]),
              ], '''DLink(
  label: 'Documentation',
  href: '/docs',
  icon: DIcon(name: DIconNames.book, size: DIconSize.sm),
)

DLink(
  label: 'Download',
  href: '/download',
  trailingIcon: DIcon(name: DIconNames.download, size: DIconSize.sm),
)'''),
            ]),

            // Navigation Link
            _section('Navigation Link', [
              p(classes: 'text-zinc-400 mb-4', [
                text('A navigation-specific link with padding and hover background.'),
              ]),
              _preview([
                div(classes: 'flex flex-wrap gap-2', [
                  DNavLink(label: 'Dashboard', href: '/dashboard', active: true),
                  DNavLink(label: 'Settings', href: '/settings'),
                  DNavLink(
                    label: 'Profile',
                    href: '/profile',
                    icon: DIcon(name: DIconNames.user, size: DIconSize.sm),
                  ),
                ]),
              ], '''DNavLink(label: 'Dashboard', href: '/dashboard', active: true)
DNavLink(label: 'Settings', href: '/settings')
DNavLink(
  label: 'Profile',
  href: '/profile',
  icon: DIcon(name: DIconNames.user, size: DIconSize.sm),
)'''),
            ]),

            // Social Link
            _section('Social Link', [
              p(classes: 'text-zinc-400 mb-4', [
                text('Styled for social media icons.'),
              ]),
              _preview([
                div(classes: 'flex flex-wrap gap-4', [
                  DSocialLink(
                    href: 'https://twitter.com/example',
                    icon: DIcon(name: DIconNames.link),
                    ariaLabel: 'Follow us on Twitter',
                  ),
                  DSocialLink(
                    href: 'https://github.com/example',
                    icon: DIcon(name: DIconNames.github),
                    ariaLabel: 'View our GitHub',
                  ),
                ]),
              ], '''DSocialLink(
  href: 'https://twitter.com/example',
  icon: DIcon(name: DIconNames.twitter),
  ariaLabel: 'Follow us on Twitter',
)

DSocialLink(
  href: 'https://github.com/example',
  icon: DIcon(name: DIconNames.github),
  ariaLabel: 'View our GitHub',
)'''),
            ]),

            // API Reference - DLink
            h2([text('API Reference')]),
            h3([text('DLink')]),
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
                  _apiRow('label', 'String?', 'null', 'Link text'),
                  _apiRow('href', 'String', 'required', 'Link URL'),
                  _apiRow('external', 'bool', 'false', 'Open in new tab'),
                  _apiRow('active', 'bool', 'false', 'Active state'),
                  _apiRow('disabled', 'bool', 'false', 'Disabled state'),
                  _apiRow('color', 'DLinkColor', 'primary', 'Color variant'),
                  _apiRow('underline', 'bool', 'false', 'Always show underline'),
                  _apiRow('icon', 'Component?', 'null', 'Leading icon'),
                  _apiRow('trailingIcon', 'Component?', 'null', 'Trailing icon'),
                  _apiRow('children', 'List<Component>', '[]', 'Custom content'),
                ]),
              ]),
            ]),

            // API Reference - DNavLink
            h3(classes: 'mt-8', [text('DNavLink')]),
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
                  _apiRow('label', 'String', 'required', 'Link text'),
                  _apiRow('href', 'String', 'required', 'Link URL'),
                  _apiRow('active', 'bool', 'false', 'Active state'),
                  _apiRow('exact', 'bool', 'false', 'Exact path match'),
                  _apiRow('icon', 'Component?', 'null', 'Leading icon'),
                ]),
              ]),
            ]),

            // API Reference - DSocialLink
            h3(classes: 'mt-8', [text('DSocialLink')]),
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
                  _apiRow('href', 'String', 'required', 'Link URL'),
                  _apiRow('icon', 'Component', 'required', 'Icon component'),
                  _apiRow('label', 'String?', 'null', 'Screen reader label'),
                  _apiRow('ariaLabel', 'String?', 'null', 'Aria label'),
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
