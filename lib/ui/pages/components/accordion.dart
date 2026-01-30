import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Accordion component documentation page
class AccordionPage extends StatelessComponent {
  const AccordionPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Accordion')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A vertically stacked set of collapsible panels for organizing content.')]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    items: [
                      DAccordionItem(
                        label: 'Is it accessible?',
                        content: text('Yes. It adheres to the WAI-ARIA design pattern.'),
                      ),
                      DAccordionItem(
                        label: 'Is it styled?',
                        content: text('Yes. It comes with default styles that match the other components.'),
                      ),
                      DAccordionItem(
                        label: 'Is it animated?',
                        content: text('Yes. It has smooth open/close animations.'),
                      ),
                    ],
                  ),
                ]),
              ], '''DAccordion(
  items: [
    DAccordionItem(
      label: 'Is it accessible?',
      content: text('Yes. It adheres to the WAI-ARIA design pattern.'),
    ),
    DAccordionItem(
      label: 'Is it styled?',
      content: text('Yes. It comes with default styles.'),
    ),
    DAccordionItem(
      label: 'Is it animated?',
      content: text('Yes. It has smooth animations.'),
    ),
  ],
)'''),
            ]),

            // With Default Open
            _section('With Default Open', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    defaultValue: 'item-0',
                    items: [
                      DAccordionItem(
                        label: 'Account Settings',
                        content: text('Manage your account settings and preferences.'),
                      ),
                      DAccordionItem(
                        label: 'Privacy',
                        content: text('Control your privacy settings and data sharing.'),
                      ),
                    ],
                  ),
                ]),
              ], '''DAccordion(
  defaultValue: 'item-0',
  items: [
    DAccordionItem(
      label: 'Account Settings',
      content: text('Manage your account settings.'),
    ),
    DAccordionItem(
      label: 'Privacy',
      content: text('Control your privacy settings.'),
    ),
  ],
)'''),
            ]),

            // Multiple Open
            _section('Multiple Open', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    multiple: true,
                    items: [
                      DAccordionItem(
                        label: 'Section One',
                        content: text('Content for section one.'),
                      ),
                      DAccordionItem(
                        label: 'Section Two',
                        content: text('Content for section two.'),
                      ),
                      DAccordionItem(
                        label: 'Section Three',
                        content: text('Content for section three.'),
                      ),
                    ],
                  ),
                ]),
              ], '''DAccordion(
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
              _preview([
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    items: [
                      DAccordionItem(
                        label: 'Getting Started',
                        description: 'Learn the basics',
                        content: text('Start with installation and basic setup.'),
                      ),
                      DAccordionItem(
                        label: 'Advanced Usage',
                        description: 'Deep dive into features',
                        content: text('Explore advanced patterns and customization.'),
                      ),
                    ],
                  ),
                ]),
              ], '''DAccordion(
  items: [
    DAccordionItem(
      label: 'Getting Started',
      description: 'Learn the basics',
      content: text('Start with installation...'),
    ),
    DAccordionItem(
      label: 'Advanced Usage',
      description: 'Deep dive into features',
      content: text('Explore advanced patterns...'),
    ),
  ],
)'''),
            ]),

            // With Icons
            _section('With Icons', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    items: [
                      DAccordionItem(
                        label: 'Settings',
                        icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
                        content: text('Configure your application settings.'),
                      ),
                      DAccordionItem(
                        label: 'Notifications',
                        icon: DIcon(name: DIconNames.bell, size: DIconSize.sm),
                        content: text('Manage notification preferences.'),
                      ),
                    ],
                  ),
                ]),
              ], '''DAccordion(
  items: [
    DAccordionItem(
      label: 'Settings',
      icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
      content: text('Configure your settings.'),
    ),
    DAccordionItem(
      label: 'Notifications',
      icon: DIcon(name: DIconNames.bell, size: DIconSize.sm),
      content: text('Manage notifications.'),
    ),
  ],
)'''),
            ]),

            // Disabled Items
            _section('Disabled Items', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DAccordion(
                    items: [
                      DAccordionItem(
                        label: 'Available',
                        content: text('This item can be expanded.'),
                      ),
                      DAccordionItem(
                        label: 'Disabled',
                        disabled: true,
                        content: text('This item cannot be expanded.'),
                      ),
                    ],
                  ),
                ]),
              ], '''DAccordion(
  items: [
    DAccordionItem(
      label: 'Available',
      content: text('This item can be expanded.'),
    ),
    DAccordionItem(
      label: 'Disabled',
      disabled: true,
      content: text('This item cannot be expanded.'),
    ),
  ],
)'''),
            ]),

            // Sizes
            _section('Sizes', [
              _preview([
                div(classes: 'w-full space-y-6', [
                  div([
                    span(classes: 'text-xs text-zinc-500 mb-2 block', [text('Small')]),
                    DAccordion(
                      size: DSize.sm,
                      items: [
                        DAccordionItem(label: 'Small Size', content: text('Compact accordion item.')),
                      ],
                    ),
                  ]),
                  div([
                    span(classes: 'text-xs text-zinc-500 mb-2 block', [text('Medium (default)')]),
                    DAccordion(
                      size: DSize.md,
                      items: [
                        DAccordionItem(label: 'Medium Size', content: text('Default accordion item.')),
                      ],
                    ),
                  ]),
                  div([
                    span(classes: 'text-xs text-zinc-500 mb-2 block', [text('Large')]),
                    DAccordion(
                      size: DSize.lg,
                      items: [
                        DAccordionItem(label: 'Large Size', content: text('Spacious accordion item.')),
                      ],
                    ),
                  ]),
                ]),
              ], '''DAccordion(size: DSize.sm, items: [...])
DAccordion(size: DSize.md, items: [...])
DAccordion(size: DSize.lg, items: [...])'''),
            ]),

            // API Reference
            h2([text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('DAccordion')]),
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

            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('DAccordionItem')]),
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
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]), ...children]);
  Component _preview(List<Component> components, String codeExample) => div(classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden', [
    div(classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]', styles: Styles(raw: {'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)', 'background-size': '24px 24px'}), components),
    div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [div(classes: 'flex items-center px-4 py-2 border-b border-zinc-200 dark:border-zinc-800', [span(classes: 'text-xs text-zinc-500', [text('dart')])]), div(classes: 'p-4 overflow-x-auto', [pre(classes: 'text-sm', [code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)])])])]),
  ]);
  Component _apiRow(String prop, String type, String defaultVal, String desc) => tr(classes: 'border-b border-zinc-800/50', [
    td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(prop)]),
    td(classes: 'py-3 px-4 font-mono text-purple-400', [text(type)]),
    td(classes: 'py-3 px-4 font-mono text-zinc-500', [text(defaultVal)]),
    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
  ]);
}
