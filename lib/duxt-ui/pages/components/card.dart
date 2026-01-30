import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Card component documentation page
class CardPage extends StatelessComponent {
  const CardPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Card')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('A versatile container for grouping related content and actions.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DCard(
                  children: [
                    p([Component.text('This is a basic card with some content.')]),
                  ],
                ),
              ], code: '''DCard(
  children: [
    p([Component.text('This is a basic card with some content.')]),
  ],
)'''),
            ]),

            // With Header
            _section('With Header', [
              ComponentPreviewCard(preview: [
                DCard(
                  header: DCardHeader(
                    title: 'Card Title',
                    description: 'A brief description of this card.',
                  ),
                  children: [
                    p([Component.text('Card body content goes here.')]),
                  ],
                ),
              ], code: '''DCard(
  header: DCardHeader(
    title: 'Card Title',
    description: 'A brief description of this card.',
  ),
  children: [
    p([Component.text('Card body content goes here.')]),
  ],
)'''),
            ]),

            // With Header and Footer
            _section('With Header and Footer', [
              ComponentPreviewCard(preview: [
                DCard(
                  header: DCardHeader(
                    title: 'Settings',
                    description: 'Manage your account settings.',
                  ),
                  children: [
                    p([Component.text('Configure your preferences below.')]),
                  ],
                  footer: DCardFooter(
                    children: [
                      DButton(label: 'Cancel', variant: DButtonVariant.ghost),
                      DButton(label: 'Save'),
                    ],
                  ),
                ),
              ], code: '''DCard(
  header: DCardHeader(
    title: 'Settings',
    description: 'Manage your account settings.',
  ),
  children: [
    p([Component.text('Configure your preferences below.')]),
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
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-col gap-4 w-full max-w-md', [
                  DCard(
                    header: DCardHeader(title: 'Outline (default)'),
                    children: [p([Component.text('Card with outline border.')])],
                  ),
                  DCard(
                    header: DCardHeader(title: 'Solid'),
                    children: [p([Component.text('Card with solid background.')])],
                  ),
                  DCard(
                    header: DCardHeader(title: 'Soft'),
                    children: [p([Component.text('Card with soft background.')])],
                  ),
                  DCard(
                    header: DCardHeader(title: 'Subtle'),
                    children: [p([Component.text('Card with subtle styling.')])],
                  ),
                ]),
              ], code: '''DCard(...)
DCard(...)
DCard(...)
DCard(...)'''),
            ]),

            // Header with Trailing
            _section('Header with Trailing Action', [
              ComponentPreviewCard(preview: [
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
                    p([Component.text('You have 3 unread notifications.')]),
                  ],
                ),
              ], code: '''DCard(
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
    p([Component.text('You have 3 unread notifications.')]),
  ],
)'''),
            ]),

            // No Padding
            _section('No Padding', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('Use noPadding for content that needs edge-to-edge display.'),
              ]),
              ComponentPreviewCard(preview: [
                DCard(
                  noPadding: true,
                  header: DCardHeader(title: 'Image Card'),
                  children: [
                    div(
                      classes: 'h-32 bg-gradient-to-br from-cyan-500 to-purple-600 flex items-center justify-center',
                      [span(classes: 'text-white font-semibold', [Component.text('Full-width content')])],
                    ),
                  ],
                ),
              ], code: '''DCard(
  noPadding: true,
  header: DCardHeader(title: 'Image Card'),
  children: [
    div(
      classes: 'h-32 bg-gradient-to-br from-cyan-500 to-purple-600',
      [Component.text('Full-width content')],
    ),
  ],
)'''),
            ]),

            // Complex Example
            _section('Profile Card Example', [
              ComponentPreviewCard(preview: [
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
                        Component.text('john@example.com'),
                      ]),
                      div(classes: 'flex items-center gap-2 text-zinc-400', [
                        DIcon(name: DIconNames.home, size: DIconSize.sm),
                        Component.text('San Francisco, CA'),
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
              ], code: '''DCard(
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
            h2([Component.text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6', [Component.text('DCard')]),
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
                  _apiRow('header', 'Component?', 'null', 'Header content (use DCardHeader)'),
                  _apiRow('footer', 'Component?', 'null', 'Footer content (use DCardFooter)'),
                  _apiRow('children', 'List<Component>', '[]', 'Card body content'),
                  _apiRow('variant', 'DCardVariant', 'outline', 'Visual style'),
                  _apiRow('noPadding', 'bool', 'false', 'Remove body padding'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6', [Component.text('DCardHeader')]),
            div(classes: 'not-prose overflow-x-auto mt-4', [
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
                  _apiRow('title', 'String?', 'null', 'Header title'),
                  _apiRow('description', 'String?', 'null', 'Header subtitle/description'),
                  _apiRow('trailing', 'Component?', 'null', 'Trailing component (button, avatar)'),
                  _apiRow('children', 'List<Component>', '[]', 'Additional header content'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6', [Component.text('DCardFooter')]),
            div(classes: 'not-prose overflow-x-auto mt-4', [
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
                  _apiRow('children', 'List<Component>', '[]', 'Footer content'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
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
