import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Popover component documentation page
class PopoverPage extends StatelessComponent {
  const PopoverPage({super.key});

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
            h1([text('Popover')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('A floating panel that appears on click with rich content.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                DPopover(
                  trigger: DButton(label: 'Click me'),
                  children: [
                    div(classes: 'p-4', [
                      text('Popover content'),
                    ]),
                  ],
                ),
              ], '''DPopover(
  trigger: DButton(label: 'Click me'),
  children: [
    div(classes: 'p-4', [
      text('Popover content'),
    ]),
  ],
)'''),
            ]),

            // Multiple Popovers
            _section('Multiple Popovers', [
              _preview([
                div(classes: 'flex flex-wrap gap-4', [
                  DPopover(
                    trigger: DButton(label: 'First'),
                    children: [
                      div(classes: 'p-3', [text('First popover content')]),
                    ],
                  ),
                  DPopover(
                    trigger: DButton(label: 'Second'),
                    children: [
                      div(classes: 'p-3', [text('Second popover content')]),
                    ],
                  ),
                  DPopover(
                    trigger: DButton(label: 'Third'),
                    children: [
                      div(classes: 'p-3', [text('Third popover content')]),
                    ],
                  ),
                ]),
              ], '''DPopover(
  trigger: DButton(label: 'First'),
  children: [
    div(classes: 'p-3', [text('First popover content')]),
  ],
)

DPopover(
  trigger: DButton(label: 'Second'),
  children: [
    div(classes: 'p-3', [text('Second popover content')]),
  ],
)

DPopover(
  trigger: DButton(label: 'Third'),
  children: [
    div(classes: 'p-3', [text('Third popover content')]),
  ],
)'''),
            ]),

            // Rich Content
            _section('Rich Content', [
              _preview([
                DPopover(
                  trigger: DButton(label: 'User Menu', variant: DButtonVariant.outline),
                  children: [
                    div(classes: 'w-64', [
                      div(classes: 'p-4 border-b border-zinc-700', [
                        div(classes: 'flex items-center gap-3', [
                          DAvatar(alt: 'JD', size: DAvatarSize.md),
                          div([
                            p(classes: 'font-medium text-white', [text('John Doe')]),
                            p(classes: 'text-sm text-zinc-400', [text('john@example.com')]),
                          ]),
                        ]),
                      ]),
                      div(classes: 'p-2', [
                        div(classes: 'px-3 py-2 hover:bg-zinc-800 rounded cursor-pointer text-zinc-700 dark:text-zinc-300', [text('Profile')]),
                        div(classes: 'px-3 py-2 hover:bg-zinc-800 rounded cursor-pointer text-zinc-700 dark:text-zinc-300', [text('Settings')]),
                        div(classes: 'px-3 py-2 hover:bg-zinc-800 rounded cursor-pointer text-zinc-700 dark:text-zinc-300', [text('Billing')]),
                      ]),
                      div(classes: 'p-2 border-t border-zinc-700', [
                        div(classes: 'px-3 py-2 hover:bg-zinc-800 rounded cursor-pointer text-red-400', [text('Sign out')]),
                      ]),
                    ]),
                  ],
                ),
              ], '''DPopover(
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
              _preview([
                DPopover(
                  trigger: DButton(
                    label: 'Add Item',
                    leadingIcon: DIcon(name: DIconNames.plus, size: DIconSize.sm),
                  ),
                  children: [
                    div(classes: 'w-80 p-4', [
                      h4(classes: 'font-semibold text-white mb-4', [text('Quick Add')]),
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
              ], '''DPopover(
  trigger: DButton(
    label: 'Add Item',
    leadingIcon: DIcon(name: DIconNames.plus),
  ),
  children: [
    div(classes: 'w-80 p-4', [
      h4(classes: 'font-semibold mb-4', [text('Quick Add')]),
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
            h2([text('API Reference')]),
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
                  _apiRow('trigger', 'Component', 'required', 'Element that opens the popover'),
                  _apiRow('children', 'List<Component>', 'required', 'Popover content'),
                  _apiRow('closeOnClickOutside', 'bool', 'true', 'Close when clicking outside'),
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
