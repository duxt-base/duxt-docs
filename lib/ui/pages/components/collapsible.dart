import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Collapsible component documentation page
class CollapsiblePage extends StatelessComponent {
  const CollapsiblePage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Collapsible')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A single collapsible panel for toggling visibility of content.')]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DCollapsible(
                    trigger: DCollapsibleTrigger(label: 'Click to expand'),
                    children: [
                      DCollapsibleContent(
                        children: [
                          text('This is the collapsible content that can be shown or hidden.'),
                        ],
                      ),
                    ],
                  ),
                ]),
              ], '''DCollapsible(
  trigger: DCollapsibleTrigger(label: 'Click to expand'),
  children: [
    DCollapsibleContent(
      children: [
        text('This is the collapsible content.'),
      ],
    ),
  ],
)'''),
            ]),

            // Default Open
            _section('Default Open', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DCollapsible(
                    defaultOpen: true,
                    trigger: DCollapsibleTrigger(label: 'Repository Info', open: true),
                    children: [
                      DCollapsibleContent(
                        children: [
                          div(classes: 'space-y-2', [
                            div(classes: 'flex items-center gap-2 text-zinc-300', [
                              DIcon(name: DIconNames.folder, size: DIconSize.sm),
                              text('duxt-ui'),
                            ]),
                            p(classes: 'text-zinc-400 text-sm', [
                              text('A modern UI component library for Dart web applications.'),
                            ]),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ]),
              ], '''DCollapsible(
  defaultOpen: true,
  trigger: DCollapsibleTrigger(
    label: 'Repository Info',
    open: true,
  ),
  children: [
    DCollapsibleContent(children: [...]),
  ],
)'''),
            ]),

            // With Icon
            _section('With Icon', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DCollapsible(
                    trigger: DCollapsibleTrigger(
                      label: 'Advanced Settings',
                      icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
                    ),
                    children: [
                      DCollapsibleContent(
                        children: [
                          div(classes: 'space-y-3', [
                            div(classes: 'flex items-center justify-between', [
                              span(classes: 'text-zinc-700 dark:text-zinc-300', [text('Enable notifications')]),
                              DSwitch(checked: true),
                            ]),
                            div(classes: 'flex items-center justify-between', [
                              span(classes: 'text-zinc-700 dark:text-zinc-300', [text('Dark mode')]),
                              DSwitch(checked: false),
                            ]),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ]),
              ], '''DCollapsible(
  trigger: DCollapsibleTrigger(
    label: 'Advanced Settings',
    icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
  ),
  children: [
    DCollapsibleContent(children: [...]),
  ],
)'''),
            ]),

            // Disabled
            _section('Disabled', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DCollapsible(
                    disabled: true,
                    trigger: DCollapsibleTrigger(label: 'Disabled Section'),
                    children: [
                      DCollapsibleContent(
                        children: [
                          text('This content cannot be revealed.'),
                        ],
                      ),
                    ],
                  ),
                ]),
              ], '''DCollapsible(
  disabled: true,
  trigger: DCollapsibleTrigger(label: 'Disabled Section'),
  children: [
    DCollapsibleContent(
      children: [text('This content cannot be revealed.')],
    ),
  ],
)'''),
            ]),

            // Custom Trigger
            _section('Custom Trigger', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DCollapsible(
                    trigger: DButton(
                      label: 'Show More',
                      variant: DButtonVariant.outline,
                      size: DButtonSize.sm,
                    ),
                    children: [
                      div(classes: 'mt-4 p-4 rounded-lg bg-zinc-800/50', [
                        p(classes: 'text-zinc-300', [
                          text('You can use any component as a trigger, including buttons, cards, or custom elements.'),
                        ]),
                      ]),
                    ],
                  ),
                ]),
              ], '''DCollapsible(
  trigger: DButton(
    label: 'Show More',
    variant: DButtonVariant.outline,
    size: DButtonSize.sm,
  ),
  children: [
    div(classes: 'mt-4 p-4 rounded-lg bg-zinc-800/50', [
      text('Custom content...'),
    ]),
  ],
)'''),
            ]),

            // Nested Collapsibles
            _section('Nested Collapsibles', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DCollapsible(
                    trigger: DCollapsibleTrigger(label: 'Parent Section'),
                    children: [
                      DCollapsibleContent(
                        children: [
                          div(classes: 'space-y-2', [
                            text('Parent content here.'),
                            div(classes: 'ml-4 mt-2', [
                              DCollapsible(
                                trigger: DCollapsibleTrigger(label: 'Nested Section'),
                                children: [
                                  DCollapsibleContent(
                                    children: [
                                      text('Nested content inside parent.'),
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ]),
              ], '''DCollapsible(
  trigger: DCollapsibleTrigger(label: 'Parent Section'),
  children: [
    DCollapsibleContent(
      children: [
        text('Parent content here.'),
        DCollapsible(
          trigger: DCollapsibleTrigger(label: 'Nested Section'),
          children: [
            DCollapsibleContent(
              children: [text('Nested content.')],
            ),
          ],
        ),
      ],
    ),
  ],
)'''),
            ]),

            // API Reference
            h2([text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('DCollapsible')]),
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
                  _apiRow('trigger', 'Component', 'required', 'Clickable element to toggle the collapsible'),
                  _apiRow('children', 'List<Component>', 'required', 'Content to show when expanded'),
                  _apiRow('defaultOpen', 'bool', 'false', 'Whether initially open'),
                  _apiRow('disabled', 'bool', 'false', 'Disable toggle interaction'),
                  _apiRow('onOpenChange', 'VoidCallback?', 'null', 'Callback when open state changes'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('DCollapsibleTrigger')]),
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
                  _apiRow('label', 'String', 'required', 'Text label for the trigger'),
                  _apiRow('open', 'bool', 'false', 'Whether the collapsible is open (for chevron rotation)'),
                  _apiRow('icon', 'Component?', 'null', 'Optional icon before the label'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('DCollapsibleContent')]),
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
                  _apiRow('children', 'List<Component>', 'required', 'Content with default padding and styling'),
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
