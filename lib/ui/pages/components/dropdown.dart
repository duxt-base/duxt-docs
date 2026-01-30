import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class DropdownPage extends StatelessComponent {
  const DropdownPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Dropdown')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A menu that appears when triggered, displaying a list of actions.')]),

            _section('Basic Usage', [
              _preview([
                DDropdown(
                  trigger: DButton(label: 'Options'),
                  items: [
                    DDropdownItem(label: 'Edit', onClick: () {}),
                    DDropdownItem(label: 'Duplicate', onClick: () {}),
                    DDropdownItem(label: 'Delete', onClick: () {}),
                  ],
                ),
              ], '''DDropdown(
  trigger: DButton(label: 'Options'),
  items: [
    DDropdownItem(label: 'Edit', onClick: () => handleEdit()),
    DDropdownItem(label: 'Duplicate', onClick: () => handleDuplicate()),
    DDropdownItem(label: 'Delete', onClick: () => handleDelete()),
  ],
)'''),
            ]),

            _section('With Icons', [
              _preview([
                DDropdown(
                  trigger: DButton(
                    label: 'Actions',
                    trailingIcon: DIcon(name: 'chevron-down'),
                  ),
                  items: [
                    DDropdownItem(
                      label: 'Edit',
                      icon: 'edit',
                      onClick: () {},
                    ),
                    DDropdownItem(
                      label: 'Copy',
                      icon: 'copy',
                      onClick: () {},
                    ),
                    DDropdownItem(
                      label: 'Share',
                      icon: 'share',
                      onClick: () {},
                    ),
                  ],
                ),
              ], '''DDropdown(
  trigger: DButton(
    label: 'Actions',
    trailingIcon: DIcon(name: 'chevron-down'),
  ),
  items: [
    DDropdownItem(label: 'Edit', icon: DIcon(name: 'edit'), onClick: () {}),
    DDropdownItem(label: 'Copy', icon: DIcon(name: 'copy'), onClick: () {}),
    DDropdownItem(label: 'Share', icon: DIcon(name: 'share'), onClick: () {}),
  ],
)'''),
            ]),

            _section('With Dividers', [
              _preview([
                DDropdown(
                  trigger: DButton(label: 'Menu'),
                  items: [
                    DDropdownItem(label: 'View', onClick: () {}),
                    DDropdownItem(label: 'Edit', onClick: () {}),
                    DDropdownItem(label: '---', divider: true),
                    DDropdownItem(
                      label: 'Delete',
                      icon: 'trash',
                      onClick: () {},
                    ),
                  ],
                ),
              ], '''DDropdown(
  trigger: DButton(label: 'Menu'),
  items: [
    DDropdownItem(label: 'View', onClick: () {}),
    DDropdownItem(label: 'Edit', onClick: () {}),
    DDropdownItem(divider: true),  // Divider
    DDropdownItem(label: 'Delete', icon: DIcon(name: 'trash'), onClick: () {}),
  ],
)'''),
            ]),

            _section('Disabled Items', [
              _preview([
                DDropdown(
                  trigger: DButton(label: 'Actions'),
                  items: [
                    DDropdownItem(label: 'Edit', onClick: () {}),
                    DDropdownItem(label: 'Archive', disabled: true),
                    DDropdownItem(label: 'Delete', onClick: () {}),
                  ],
                ),
              ], '''DDropdown(
  trigger: DButton(label: 'Actions'),
  items: [
    DDropdownItem(label: 'Edit', onClick: () {}),
    DDropdownItem(label: 'Archive', disabled: true),  // Cannot be clicked
    DDropdownItem(label: 'Delete', onClick: () {}),
  ],
)'''),
            ]),

            _section('Icon Button Trigger', [
              _preview([
                DDropdown(
                  trigger: DButton(
                    leadingIcon: DIcon(name: 'more-vertical'),
                    variant: DButtonVariant.ghost,
                    square: true,
                  ),
                  items: [
                    DDropdownItem(label: 'Edit', icon: 'edit', onClick: () {}),
                    DDropdownItem(label: 'Delete', icon: 'trash', onClick: () {}),
                  ],
                ),
              ], '''DDropdown(
  trigger: DButton(
    leadingIcon: DIcon(name: 'more-vertical'),
    variant: DButtonVariant.ghost,
    square: true,
  ),
  items: [
    DDropdownItem(label: 'Edit', icon: DIcon(name: 'edit')),
    DDropdownItem(label: 'Delete', icon: DIcon(name: 'trash')),
  ],
)'''),
            ]),

            _section('User Menu Example', [
              _preview([
                DDropdown(
                  trigger: div(classes: 'flex items-center gap-2 cursor-pointer px-3 py-2 rounded-lg hover:bg-zinc-800', [
                    DAvatar(src: '/images/avatar.jpg', size: DAvatarSize.sm),
                    span(classes: 'text-white', [text('John Doe')]),
                    DIcon(name: 'chevron-down', size: DIconSize.sm),
                  ]),
                  items: [
                    DDropdownItem(label: 'Profile', icon: 'user', onClick: () {}),
                    DDropdownItem(label: 'Settings', icon: 'settings', onClick: () {}),
                    DDropdownItem(label: 'Billing', icon: 'credit-card', onClick: () {}),
                    DDropdownItem(label: '---', divider: true),
                    DDropdownItem(label: 'Sign out', icon: 'log-out', onClick: () {}),
                  ],
                ),
              ], '''DDropdown(
  trigger: div(classes: 'flex items-center gap-2 cursor-pointer', [
    DAvatar(src: '/user.jpg', size: DAvatarSize.sm),
    span([text('John Doe')]),
    DIcon(name: 'chevron-down', size: 16),
  ]),
  items: [
    DDropdownItem(label: 'Profile', icon: DIcon(name: 'user'), onClick: () {}),
    DDropdownItem(label: 'Settings', icon: DIcon(name: 'settings'), onClick: () {}),
    DDropdownItem(label: 'Billing', icon: DIcon(name: 'credit-card'), onClick: () {}),
    DDropdownItem(divider: true),
    DDropdownItem(label: 'Sign out', icon: DIcon(name: 'log-out'), onClick: () {}),
  ],
)'''),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]), ...children]);

  Component _preview(List<Component> components, String codeExample) => div(classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden', [
    div(classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]', styles: Styles(raw: {'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)', 'background-size': '24px 24px'}), components),
    div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [
      div(classes: 'flex items-center px-4 py-2 border-b border-zinc-200 dark:border-zinc-800', [span(classes: 'text-xs text-zinc-500', [text('dart')])]),
      div(classes: 'p-4 overflow-x-auto', [pre(classes: 'text-sm', [code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)])])]),
    ]),
  ]);
}
