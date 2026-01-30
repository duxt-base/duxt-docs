import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Popover component documentation page
class PopoverPage extends StatelessComponent {
  const PopoverPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Popover')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('A floating panel that appears on click with rich content.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DPopover(
                  trigger: DButton(label: 'Click me'),
                  children: [
                    div(classes: 'p-4', [
                      Component.text('Popover content'),
                    ]),
                  ],
                ),
              ], code: '''DPopover(
  trigger: DButton(label: 'Click me'),
  children: [
    div(classes: 'p-4', [
      Component.text('Popover content'),
    ]),
  ],
)'''),
            ]),

            // Multiple Popovers
            _section('Multiple Popovers', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-4', [
                  DPopover(
                    trigger: DButton(label: 'First'),
                    children: [
                      div(classes: 'p-3', [Component.text('First popover content')]),
                    ],
                  ),
                  DPopover(
                    trigger: DButton(label: 'Second'),
                    children: [
                      div(classes: 'p-3', [Component.text('Second popover content')]),
                    ],
                  ),
                  DPopover(
                    trigger: DButton(label: 'Third'),
                    children: [
                      div(classes: 'p-3', [Component.text('Third popover content')]),
                    ],
                  ),
                ]),
              ], code: '''DPopover(
  trigger: DButton(label: 'First'),
  children: [
    div(classes: 'p-3', [Component.text('First popover content')]),
  ],
)

DPopover(
  trigger: DButton(label: 'Second'),
  children: [
    div(classes: 'p-3', [Component.text('Second popover content')]),
  ],
)

DPopover(
  trigger: DButton(label: 'Third'),
  children: [
    div(classes: 'p-3', [Component.text('Third popover content')]),
  ],
)'''),
            ]),

            // Rich Content
            _section('Rich Content', [
              ComponentPreviewCard(preview: [
                DPopover(
                  trigger: DButton(label: 'User Menu', variant: DButtonVariant.outline),
                  children: [
                    div(classes: 'w-64', [
                      div(classes: 'p-4 border-b border-zinc-700', [
                        div(classes: 'flex items-center gap-3', [
                          DAvatar(alt: 'JD', size: DAvatarSize.md),
                          div([
                            p(classes: 'font-medium text-white', [Component.text('John Doe')]),
                            p(classes: 'text-sm text-zinc-400', [Component.text('john@example.com')]),
                          ]),
                        ]),
                      ]),
                      div(classes: 'p-2', [
                        div(classes: 'px-3 py-2 hover:bg-zinc-800 rounded cursor-pointer text-zinc-700 dark:text-zinc-300', [Component.text('Profile')]),
                        div(classes: 'px-3 py-2 hover:bg-zinc-800 rounded cursor-pointer text-zinc-700 dark:text-zinc-300', [Component.text('Settings')]),
                        div(classes: 'px-3 py-2 hover:bg-zinc-800 rounded cursor-pointer text-zinc-700 dark:text-zinc-300', [Component.text('Billing')]),
                      ]),
                      div(classes: 'p-2 border-t border-zinc-700', [
                        div(classes: 'px-3 py-2 hover:bg-zinc-800 rounded cursor-pointer text-red-400', [Component.text('Sign out')]),
                      ]),
                    ]),
                  ],
                ),
              ], code: '''DPopover(
  trigger: DButton(label: 'User Menu'),
  children: [
    div(classes: 'w-64', [
      // User info header
      div(classes: 'p-4 border-b', [...]),
      // Menu items
      div(classes: 'p-2', [...]),
      // Sign out
      div(classes: 'p-2 border-t', [...]),
    ]),
  ],
)'''),
            ]),

            // With Form
            _section('With Form', [
              ComponentPreviewCard(preview: [
                DPopover(
                  trigger: DButton(
                    label: 'Add Item',
                    leadingIcon: DIcon(name: DIconNames.plus, size: DIconSize.sm),
                  ),
                  children: [
                    div(classes: 'w-80 p-4', [
                      h4(classes: 'font-semibold text-white mb-4', [Component.text('Quick Add')]),
                      div(classes: 'space-y-3', [
                        DInput(label: 'Name', placeholder: 'Enter item name'),
                        div(classes: 'flex gap-2 pt-2', [
                          DButton(label: 'Cancel', variant: DButtonVariant.ghost, size: DButtonSize.sm),
                          DButton(label: 'Add', size: DButtonSize.sm),
                        ]),
                      ]),
                    ]),
                  ],
                ),
              ], code: '''DPopover(
  trigger: DButton(
    label: 'Add Item',
    leadingIcon: DIcon(name: DIconNames.plus),
  ),
  children: [
    div(classes: 'w-80 p-4', [
      h4(classes: 'font-semibold mb-4', [Component.text('Quick Add')]),
      div(classes: 'space-y-3', [
        DInput(label: 'Name', placeholder: 'Enter item name'),
        div(classes: 'flex gap-2 pt-2', [
          DButton(label: 'Cancel', variant: DButtonVariant.ghost),
          DButton(label: 'Add'),
        ]),
      ]),
    ]),
  ],
)'''),
            ]),

            // API Reference
            h2([Component.text('API Reference')]),
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
                  _apiRow('trigger', 'Component', 'required', 'Element that opens the popover'),
                  _apiRow('children', 'List<Component>', 'required', 'Popover content'),
                  _apiRow('closeOnClickOutside', 'bool', 'true', 'Close when clicking outside'),
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
