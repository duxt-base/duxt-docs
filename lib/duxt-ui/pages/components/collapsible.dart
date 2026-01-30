import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Collapsible component documentation page
class CollapsiblePage extends StatelessComponent {
  const CollapsiblePage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Collapsible')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A single collapsible panel for toggling visibility of content.')]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DCollapsible(
                    trigger: DCollapsibleTrigger(label: 'Click to expand'),
                    children: [
                      DCollapsibleContent(
                        children: [
                          Component.text('This is the collapsible content that can be shown or hidden.'),
                        ],
                      ),
                    ],
                  ),
                ]),
              ], code: '''DCollapsible(
  trigger: DCollapsibleTrigger(label: 'Click to expand'),
  children: [
    DCollapsibleContent(
      children: [
        Component.text('This is the collapsible content.'),
      ],
    ),
  ],
)'''),
            ]),

            // Default Open
            _section('Default Open', [
              ComponentPreviewCard(preview: [
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
                              Component.text('duxt-ui'),
                            ]),
                            p(classes: 'text-zinc-400 text-sm', [
                              Component.text('A modern UI component library for Dart web applications.'),
                            ]),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ]),
              ], code: '''DCollapsible(
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
              ComponentPreviewCard(preview: [
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
                              span(classes: 'text-zinc-700 dark:text-zinc-300', [Component.text('Enable notifications')]),
                              DSwitch(checked: true),
                            ]),
                            div(classes: 'flex items-center justify-between', [
                              span(classes: 'text-zinc-700 dark:text-zinc-300', [Component.text('Dark mode')]),
                              DSwitch(checked: false),
                            ]),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ]),
              ], code: '''DCollapsible(
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
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DCollapsible(
                    disabled: true,
                    trigger: DCollapsibleTrigger(label: 'Disabled Section'),
                    children: [
                      DCollapsibleContent(
                        children: [
                          Component.text('This content cannot be revealed.'),
                        ],
                      ),
                    ],
                  ),
                ]),
              ], code: '''DCollapsible(
  disabled: true,
  trigger: DCollapsibleTrigger(label: 'Disabled Section'),
  children: [
    DCollapsibleContent(
      children: [Component.text('This content cannot be revealed.')],
    ),
  ],
)'''),
            ]),

            // Custom Trigger
            _section('Custom Trigger', [
              ComponentPreviewCard(preview: [
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
                          Component.text('You can use any component as a trigger, including buttons, cards, or custom elements.'),
                        ]),
                      ]),
                    ],
                  ),
                ]),
              ], code: '''DCollapsible(
  trigger: DButton(
    label: 'Show More',
    variant: DButtonVariant.outline,
    size: DButtonSize.sm,
  ),
  children: [
    div(classes: 'mt-4 p-4 rounded-lg bg-zinc-800/50', [
      Component.text('Custom content...'),
    ]),
  ],
)'''),
            ]),

            // Nested Collapsibles
            _section('Nested Collapsibles', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DCollapsible(
                    trigger: DCollapsibleTrigger(label: 'Parent Section'),
                    children: [
                      DCollapsibleContent(
                        children: [
                          div(classes: 'space-y-2', [
                            Component.text('Parent content here.'),
                            div(classes: 'ml-4 mt-2', [
                              DCollapsible(
                                trigger: DCollapsibleTrigger(label: 'Nested Section'),
                                children: [
                                  DCollapsibleContent(
                                    children: [
                                      Component.text('Nested content inside parent.'),
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
              ], code: '''DCollapsible(
  trigger: DCollapsibleTrigger(label: 'Parent Section'),
  children: [
    DCollapsibleContent(
      children: [
        Component.text('Parent content here.'),
        DCollapsible(
          trigger: DCollapsibleTrigger(label: 'Nested Section'),
          children: [
            DCollapsibleContent(
              children: [Component.text('Nested content.')],
            ),
          ],
        ),
      ],
    ),
  ],
)'''),
            ]),

            // API Reference
            h2([Component.text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [Component.text('DCollapsible')]),
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
                  _apiRow('trigger', 'Component', 'required', 'Clickable element to toggle the collapsible'),
                  _apiRow('children', 'List<Component>', 'required', 'Content to show when expanded'),
                  _apiRow('defaultOpen', 'bool', 'false', 'Whether initially open'),
                  _apiRow('disabled', 'bool', 'false', 'Disable toggle interaction'),
                  _apiRow('onOpenChange', 'VoidCallback?', 'null', 'Callback when open state changes'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [Component.text('DCollapsibleTrigger')]),
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
                  _apiRow('label', 'String', 'required', 'Text label for the trigger'),
                  _apiRow('open', 'bool', 'false', 'Whether the collapsible is open (for chevron rotation)'),
                  _apiRow('icon', 'Component?', 'null', 'Optional icon before the label'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [Component.text('DCollapsibleContent')]),
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
                  _apiRow('children', 'List<Component>', 'required', 'Content with default padding and styling'),
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
