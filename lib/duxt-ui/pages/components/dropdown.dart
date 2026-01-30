import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class DropdownPage extends StatelessComponent {
  const DropdownPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Dropdown')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A menu that appears when triggered, displaying a list of actions.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DDropdown(
                  trigger: DButton(label: 'Options'),
                  items: [
                    DDropdownItem(label: 'Edit', onClick: () {}),
                    DDropdownItem(label: 'Duplicate', onClick: () {}),
                    DDropdownItem(label: 'Delete', onClick: () {}),
                  ],
                ),
              ], code: '''DDropdown(
  trigger: DButton(label: 'Options'),
  items: [
    DDropdownItem(label: 'Edit', onClick: () => handleEdit()),
    DDropdownItem(label: 'Duplicate', onClick: () => handleDuplicate()),
    DDropdownItem(label: 'Delete', onClick: () => handleDelete()),
  ],
)'''),
            ]),

            _section('With Icons', [
              ComponentPreviewCard(preview: [
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
              ], code: '''DDropdown(
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
              ComponentPreviewCard(preview: [
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
              ], code: '''DDropdown(
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
              ComponentPreviewCard(preview: [
                DDropdown(
                  trigger: DButton(label: 'Actions'),
                  items: [
                    DDropdownItem(label: 'Edit', onClick: () {}),
                    DDropdownItem(label: 'Archive', disabled: true),
                    DDropdownItem(label: 'Delete', onClick: () {}),
                  ],
                ),
              ], code: '''DDropdown(
  trigger: DButton(label: 'Actions'),
  items: [
    DDropdownItem(label: 'Edit', onClick: () {}),
    DDropdownItem(label: 'Archive', disabled: true),  // Cannot be clicked
    DDropdownItem(label: 'Delete', onClick: () {}),
  ],
)'''),
            ]),

            _section('Icon Button Trigger', [
              ComponentPreviewCard(preview: [
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
              ], code: '''DDropdown(
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
              ComponentPreviewCard(preview: [
                DDropdown(
                  trigger: div(classes: 'flex items-center gap-2 cursor-pointer px-3 py-2 rounded-lg hover:bg-zinc-800', [
                    DAvatar(src: '/images/avatar.jpg', size: DAvatarSize.sm),
                    span(classes: 'text-white', [Component.text('John Doe')]),
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
              ], code: '''DDropdown(
  trigger: div(classes: 'flex items-center gap-2 cursor-pointer', [
    DAvatar(src: '/user.jpg', size: DAvatarSize.sm),
    span([Component.text('John Doe')]),
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
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
