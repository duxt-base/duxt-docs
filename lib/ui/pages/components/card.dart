import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Card component documentation page
class CardPage extends StatelessComponent {
  const CardPage({super.key});

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
            h1([text('Card')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('A versatile container for grouping related content and actions.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                DCard(
                  children: [
                    p([text('This is a basic card with some content.')]),
                  ],
                ),
              ], '''DCard(
  children: [
    p([text('This is a basic card with some content.')]),
  ],
)'''),
            ]),

            // With Header
            _section('With Header', [
              _preview([
                DCard(
                  header: DCardHeader(
                    title: 'Card Title',
                    description: 'A brief description of this card.',
                  ),
                  children: [
                    p([text('Card body content goes here.')]),
                  ],
                ),
              ], '''DCard(
  header: DCardHeader(
    title: 'Card Title',
    description: 'A brief description of this card.',
  ),
  children: [
    p([text('Card body content goes here.')]),
  ],
)'''),
            ]),

            // With Header and Footer
            _section('With Header and Footer', [
              _preview([
                DCard(
                  header: DCardHeader(
                    title: 'Settings',
                    description: 'Manage your account settings.',
                  ),
                  children: [
                    p([text('Configure your preferences below.')]),
                  ],
                  footer: DCardFooter(
                    children: [
                      DButton(label: 'Cancel', variant: DButtonVariant.ghost),
                      DButton(label: 'Save'),
                    ],
                  ),
                ),
              ], '''DCard(
  header: DCardHeader(
    title: 'Settings',
    description: 'Manage your account settings.',
  ),
  children: [
    p([text('Configure your preferences below.')]),
  ],
  footer: DCardFooter(
    children: [
      DButton(label: 'Cancel', variant: DButtonVariant.ghost),
      DButton(label: 'Save'),
    ],
  ),
)'''),
            ]),

            // Variants
            _section('Variants', [
              _preview([
                div(classes: 'flex flex-col gap-4 w-full max-w-md', [
                  DCard(
                    header: DCardHeader(title: 'Outline (default)'),
                    children: [p([text('Card with outline border.')])],
                  ),
                  DCard(
                    header: DCardHeader(title: 'Solid'),
                    children: [p([text('Card with solid background.')])],
                  ),
                  DCard(
                    header: DCardHeader(title: 'Soft'),
                    children: [p([text('Card with soft background.')])],
                  ),
                  DCard(
                    header: DCardHeader(title: 'Subtle'),
                    children: [p([text('Card with subtle styling.')])],
                  ),
                ]),
              ], '''DCard(...)
DCard(...)
DCard(...)
DCard(...)'''),
            ]),

            // Header with Trailing
            _section('Header with Trailing Action', [
              _preview([
                DCard(
                  header: DCardHeader(
                    title: 'Notifications',
                    description: 'Manage your notification preferences.',
                    trailing: DButton(
                      label: 'Edit',
                      variant: DButtonVariant.ghost,
                      size: DButtonSize.sm,
                    ),
                  ),
                  children: [
                    p([text('You have 3 unread notifications.')]),
                  ],
                ),
              ], '''DCard(
  header: DCardHeader(
    title: 'Notifications',
    description: 'Manage your notification preferences.',
    trailing: DButton(
      label: 'Edit',
      variant: DButtonVariant.ghost,
      size: DButtonSize.sm,
    ),
  ),
  children: [
    p([text('You have 3 unread notifications.')]),
  ],
)'''),
            ]),

            // No Padding
            _section('No Padding', [
              p(classes: 'text-zinc-400 mb-4', [
                text('Use noPadding for content that needs edge-to-edge display.'),
              ]),
              _preview([
                DCard(
                  noPadding: true,
                  header: DCardHeader(title: 'Image Card'),
                  children: [
                    div(
                      classes: 'h-32 bg-gradient-to-br from-cyan-500 to-purple-600 flex items-center justify-center',
                      [span(classes: 'text-white font-semibold', [text('Full-width content')])],
                    ),
                  ],
                ),
              ], '''DCard(
  noPadding: true,
  header: DCardHeader(title: 'Image Card'),
  children: [
    div(
      classes: 'h-32 bg-gradient-to-br from-cyan-500 to-purple-600',
      [text('Full-width content')],
    ),
  ],
)'''),
            ]),

            // Complex Example
            _section('Profile Card Example', [
              _preview([
                DCard(
                  header: DCardHeader(
                    title: 'John Doe',
                    description: 'Senior Developer',
                    trailing: DAvatar(src: 'https://api.dicebear.com/7.x/avataaars/svg?seed=John'),
                  ),
                  children: [
                    div(classes: 'space-y-2 text-sm', [
                      div(classes: 'flex items-center gap-2 text-zinc-400', [
                        DIcon(name: DIconNames.mail, size: DIconSize.sm),
                        text('john@example.com'),
                      ]),
                      div(classes: 'flex items-center gap-2 text-zinc-400', [
                        DIcon(name: DIconNames.home, size: DIconSize.sm),
                        text('San Francisco, CA'),
                      ]),
                    ]),
                  ],
                  footer: DCardFooter(
                    children: [
                      DButton(label: 'Message', variant: DButtonVariant.outline, size: DButtonSize.sm),
                      DButton(label: 'Follow', size: DButtonSize.sm),
                    ],
                  ),
                ),
              ], '''DCard(
  header: DCardHeader(
    title: 'John Doe',
    description: 'Senior Developer',
    trailing: DAvatar(src: '...'),
  ),
  children: [
    div(classes: 'space-y-2', [
      // Contact info
    ]),
  ],
  footer: DCardFooter(
    children: [
      DButton(label: 'Message', variant: DButtonVariant.outline),
      DButton(label: 'Follow'),
    ],
  ),
)'''),
            ]),

            // API Reference
            h2([text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6', [text('DCard')]),
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
                  _apiRow('header', 'Component?', 'null', 'Header content (use DCardHeader)'),
                  _apiRow('footer', 'Component?', 'null', 'Footer content (use DCardFooter)'),
                  _apiRow('children', 'List<Component>', '[]', 'Card body content'),
                  _apiRow('variant', 'DCardVariant', 'outline', 'Visual style'),
                  _apiRow('noPadding', 'bool', 'false', 'Remove body padding'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6', [text('DCardHeader')]),
            div(classes: 'not-prose overflow-x-auto mt-4', [
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
                  _apiRow('title', 'String?', 'null', 'Header title'),
                  _apiRow('description', 'String?', 'null', 'Header subtitle/description'),
                  _apiRow('trailing', 'Component?', 'null', 'Trailing component (button, avatar)'),
                  _apiRow('children', 'List<Component>', '[]', 'Additional header content'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6', [text('DCardFooter')]),
            div(classes: 'not-prose overflow-x-auto mt-4', [
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
                  _apiRow('children', 'List<Component>', '[]', 'Footer content'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
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
