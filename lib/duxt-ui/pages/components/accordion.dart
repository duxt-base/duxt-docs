import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Accordion component documentation page
class AccordionPage extends StatelessComponent {
  const AccordionPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Accordion')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A vertically stacked set of collapsible panels for organizing content.')]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    items: [
                      DAccordionItem(
                        label: 'Is it accessible?',
                        content: Component.text('Yes. It adheres to the WAI-ARIA design pattern.'),
                      ),
                      DAccordionItem(
                        label: 'Is it styled?',
                        content: Component.text('Yes. It comes with default styles that match the other components.'),
                      ),
                      DAccordionItem(
                        label: 'Is it animated?',
                        content: Component.text('Yes. It has smooth open/close animations.'),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DAccordion(
  items: [
    DAccordionItem(
      label: 'Is it accessible?',
      content: Component.text('Yes. It adheres to the WAI-ARIA design pattern.'),
    ),
    DAccordionItem(
      label: 'Is it styled?',
      content: Component.text('Yes. It comes with default styles.'),
    ),
    DAccordionItem(
      label: 'Is it animated?',
      content: Component.text('Yes. It has smooth animations.'),
    ),
  ],
)'''),
            ]),

            // With Default Open
            _section('With Default Open', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    defaultValue: 'item-0',
                    items: [
                      DAccordionItem(
                        label: 'Account Settings',
                        content: Component.text('Manage your account settings and preferences.'),
                      ),
                      DAccordionItem(
                        label: 'Privacy',
                        content: Component.text('Control your privacy settings and data sharing.'),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DAccordion(
  defaultValue: 'item-0',
  items: [
    DAccordionItem(
      label: 'Account Settings',
      content: Component.text('Manage your account settings.'),
    ),
    DAccordionItem(
      label: 'Privacy',
      content: Component.text('Control your privacy settings.'),
    ),
  ],
)'''),
            ]),

            // Multiple Open
            _section('Multiple Open', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    multiple: true,
                    items: [
                      DAccordionItem(
                        label: 'Section One',
                        content: Component.text('Content for section one.'),
                      ),
                      DAccordionItem(
                        label: 'Section Two',
                        content: Component.text('Content for section two.'),
                      ),
                      DAccordionItem(
                        label: 'Section Three',
                        content: Component.text('Content for section three.'),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DAccordion(
  multiple: true,
  items: [
    DAccordionItem(label: 'Section One', content: ...),
    DAccordionItem(label: 'Section Two', content: ...),
    DAccordionItem(label: 'Section Three', content: ...),
  ],
)'''),
            ]),

            // With Descriptions
            _section('With Descriptions', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    items: [
                      DAccordionItem(
                        label: 'Getting Started',
                        description: 'Learn the basics',
                        content: Component.text('Start with installation and basic setup.'),
                      ),
                      DAccordionItem(
                        label: 'Advanced Usage',
                        description: 'Deep dive into features',
                        content: Component.text('Explore advanced patterns and customization.'),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DAccordion(
  items: [
    DAccordionItem(
      label: 'Getting Started',
      description: 'Learn the basics',
      content: Component.text('Start with installation...'),
    ),
    DAccordionItem(
      label: 'Advanced Usage',
      description: 'Deep dive into features',
      content: Component.text('Explore advanced patterns...'),
    ),
  ],
)'''),
            ]),

            // With Icons
            _section('With Icons', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    items: [
                      DAccordionItem(
                        label: 'Settings',
                        icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
                        content: Component.text('Configure your application settings.'),
                      ),
                      DAccordionItem(
                        label: 'Notifications',
                        icon: DIcon(name: DIconNames.bell, size: DIconSize.sm),
                        content: Component.text('Manage notification preferences.'),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DAccordion(
  items: [
    DAccordionItem(
      label: 'Settings',
      icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
      content: Component.text('Configure your settings.'),
    ),
    DAccordionItem(
      label: 'Notifications',
      icon: DIcon(name: DIconNames.bell, size: DIconSize.sm),
      content: Component.text('Manage notifications.'),
    ),
  ],
)'''),
            ]),

            // Disabled Items
            _section('Disabled Items', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    items: [
                      DAccordionItem(
                        label: 'Available',
                        content: Component.text('This item can be expanded.'),
                      ),
                      DAccordionItem(
                        label: 'Disabled',
                        disabled: true,
                        content: Component.text('This item cannot be expanded.'),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DAccordion(
  items: [
    DAccordionItem(
      label: 'Available',
      content: Component.text('This item can be expanded.'),
    ),
    DAccordionItem(
      label: 'Disabled',
      disabled: true,
      content: Component.text('This item cannot be expanded.'),
    ),
  ],
)'''),
            ]),

            // Sizes
            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full space-y-6', [
                  div([
                    span(classes: 'text-xs text-zinc-500 mb-2 block', [Component.text('Small')]),
                    DAccordion(
                      size: DSize.sm,
                      items: [
                        DAccordionItem(label: 'Small Size', content: Component.text('Compact accordion item.')),
                      ],
                    ),
                  ]),
                  div([
                    span(classes: 'text-xs text-zinc-500 mb-2 block', [Component.text('Medium (default)')]),
                    DAccordion(
                      size: DSize.md,
                      items: [
                        DAccordionItem(label: 'Medium Size', content: Component.text('Default accordion item.')),
                      ],
                    ),
                  ]),
                  div([
                    span(classes: 'text-xs text-zinc-500 mb-2 block', [Component.text('Large')]),
                    DAccordion(
                      size: DSize.lg,
                      items: [
                        DAccordionItem(label: 'Large Size', content: Component.text('Spacious accordion item.')),
                      ],
                    ),
                  ]),
                ]),
              ], code: '''DAccordion(size: DSize.sm, items: [...])
DAccordion(size: DSize.md, items: [...])
DAccordion(size: DSize.lg, items: [...])'''),
            ]),

            // API Reference
            h2([Component.text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [Component.text('DAccordion')]),
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
                  _apiRow('items', 'List<DAccordionItem>', 'required', 'List of accordion items'),
                  _apiRow('defaultValue', 'String?', 'null', 'Initially open item value'),
                  _apiRow('multiple', 'bool', 'false', 'Allow multiple items open at once'),
                  _apiRow('color', 'DColor', 'primary', 'Color theme'),
                  _apiRow('variant', 'DAccordionVariant', 'soft', 'Visual variant (soft, ghost)'),
                  _apiRow('size', 'DSize', 'md', 'Size of the accordion'),
                  _apiRow('onValueChange', 'ValueChanged<List<String>>?', 'null', 'Callback when open items change'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [Component.text('DAccordionItem')]),
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
                  _apiRow('label', 'String', 'required', 'Header text'),
                  _apiRow('content', 'Component', 'required', 'Content to show when expanded'),
                  _apiRow('description', 'String?', 'null', 'Optional description below label'),
                  _apiRow('icon', 'Component?', 'null', 'Optional icon before label'),
                  _apiRow('disabled', 'bool', 'false', 'Disable this item'),
                  _apiRow('value', 'String?', 'null', 'Unique value (defaults to item-index)'),
                ]),
              ]),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
  Component _apiRow(String prop, String type, String defaultVal, String desc) => tr(classes: 'border-b border-zinc-800/50', [
    td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text(prop)]),
    td(classes: 'py-3 px-4 font-mono text-purple-400', [Component.text(type)]),
    td(classes: 'py-3 px-4 font-mono text-zinc-500', [Component.text(defaultVal)]),
    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text(desc)]),
  ]);
}
