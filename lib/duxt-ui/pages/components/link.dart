import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Link component documentation page
class LinkPage extends StatelessComponent {
  const LinkPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Link')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('Styled anchor components for navigation and external links.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DLink(label: 'Learn more', href: '/about'),
              ], code: "DLink(\n  label: 'Learn more',\n  href: '/about',\n)"),
            ]),

            // External Link
            _section('External Link', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('External links automatically open in a new tab with proper security attributes.'),
              ]),
              ComponentPreviewCard(preview: [
                DLink(
                  label: 'View on GitHub',
                  href: 'https://github.com/example/repo',
                  external: true,
                ),
              ], code: "DLink(\n  label: 'View on GitHub',\n  href: 'https://github.com/example/repo',\n  external: true,\n)"),
            ]),

            // Colors
            _section('Colors', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-4', [
                  DLink(color: DLinkColor.primary, label: 'Primary', href: '#'),
                  DLink(color: DLinkColor.neutral, label: 'Neutral', href: '#'),
                  DLink(color: DLinkColor.inherit, label: 'Inherit', href: '#'),
                ]),
              ], code: '''DLink(color: DLinkColor.primary, label: 'Primary', href: '#')
DLink(color: DLinkColor.neutral, label: 'Neutral', href: '#')
DLink(color: DLinkColor.inherit, label: 'Inherit', href: '#')'''),
            ]),

            // With Underline
            _section('With Underline', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-4', [
                  DLink(label: 'Hover underline', href: '#'),
                  DLink(label: 'Always underlined', href: '#', underline: true),
                ]),
              ], code: '''// Underline on hover (default)
DLink(label: 'Hover underline', href: '#')

// Always underlined
DLink(label: 'Always underlined', href: '#', underline: true)'''),
            ]),

            // States
            _section('States', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-4', [
                  DLink(label: 'Active Link', href: '#', active: true),
                  DLink(label: 'Disabled Link', href: '#', disabled: true),
                ]),
              ], code: '''DLink(label: 'Active Link', href: '#', active: true)
DLink(label: 'Disabled Link', href: '#', disabled: true)'''),
            ]),

            // With Icons
            _section('With Icons', [
              ComponentPreviewCard(preview: [
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
              ], code: '''DLink(
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
                Component.text('A navigation-specific link with padding and hover background.'),
              ]),
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-2', [
                  DNavLink(label: 'Dashboard', href: '/dashboard', active: true),
                  DNavLink(label: 'Settings', href: '/settings'),
                  DNavLink(
                    label: 'Profile',
                    href: '/profile',
                    icon: DIcon(name: DIconNames.user, size: DIconSize.sm),
                  ),
                ]),
              ], code: '''DNavLink(label: 'Dashboard', href: '/dashboard', active: true)
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
                Component.text('Styled for social media icons.'),
              ]),
              ComponentPreviewCard(preview: [
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
              ], code: '''DSocialLink(
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
            h2([Component.text('API Reference')]),
            h3([Component.text('DLink')]),
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
            h3(classes: 'mt-8', [Component.text('DNavLink')]),
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
                  _apiRow('label', 'String', 'required', 'Link text'),
                  _apiRow('href', 'String', 'required', 'Link URL'),
                  _apiRow('active', 'bool', 'false', 'Active state'),
                  _apiRow('exact', 'bool', 'false', 'Exact path match'),
                  _apiRow('icon', 'Component?', 'null', 'Leading icon'),
                ]),
              ]),
            ]),

            // API Reference - DSocialLink
            h3(classes: 'mt-8', [Component.text('DSocialLink')]),
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
                  _apiRow('href', 'String', 'required', 'Link URL'),
                  _apiRow('icon', 'Component', 'required', 'Icon component'),
                  _apiRow('label', 'String?', 'null', 'Screen reader label'),
                  _apiRow('ariaLabel', 'String?', 'null', 'Aria label'),
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
