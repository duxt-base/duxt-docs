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
                    DDropdownItem(label: 'Edit', href: '#edit'),
                    DDropdownItem(label: 'Duplicate', href: '#duplicate'),
                    DDropdownItem(label: 'Delete', href: '#delete'),
                  ],
                ),
              ], code: '''DDropdown(
  trigger: DButton(label: 'Options'),
  items: [
    DDropdownItem(label: 'Edit', href: '/edit'),
    DDropdownItem(label: 'Duplicate', href: '/duplicate'),
    DDropdownItem(label: 'Delete', href: '/delete'),
  ],
)'''),
            ]),

            _section('With Icons', [
              ComponentPreviewCard(preview: [
                DDropdown(
                  trigger: DButton(
                    label: 'Actions',
                    trailingIcon: DIcon(name: DIconNames.chevronDown),
                  ),
                  items: [
                    DDropdownItem(
                      label: 'Edit',
                      icon: 'edit',
                      href: '#edit',
                    ),
                    DDropdownItem(
                      label: 'Copy',
                      icon: 'copy',
                      href: '#copy',
                    ),
                    DDropdownItem(
                      label: 'Share',
                      icon: 'share',
                      href: '#share',
                    ),
                  ],
                ),
              ], code: '''DDropdown(
  trigger: DButton(
    label: 'Actions',
    trailingIcon: DIcon(name: DIconNames.chevronDown),
  ),
  items: [
    DDropdownItem(label: 'Edit', icon: 'edit', href: '/edit'),
    DDropdownItem(label: 'Copy', icon: 'copy', href: '/copy'),
    DDropdownItem(label: 'Share', icon: 'share', href: '/share'),
  ],
)'''),
            ]),

            _section('With Dividers', [
              ComponentPreviewCard(preview: [
                DDropdown(
                  trigger: DButton(label: 'Menu'),
                  items: [
                    DDropdownItem(label: 'View', href: '#view'),
                    DDropdownItem(label: 'Edit', href: '#edit'),
                    DDropdownItem.divider(),
                    DDropdownItem(
                      label: 'Delete',
                      icon: 'trash',
                      href: '#delete',
                    ),
                  ],
                ),
              ], code: '''DDropdown(
  trigger: DButton(label: 'Menu'),
  items: [
    DDropdownItem(label: 'View', href: '/view'),
    DDropdownItem(label: 'Edit', href: '/edit'),
    DDropdownItem.divider(),  // Divider
    DDropdownItem(label: 'Delete', icon: 'trash', href: '/delete'),
  ],
)'''),
            ]),

            _section('Disabled Items', [
              ComponentPreviewCard(preview: [
                DDropdown(
                  trigger: DButton(label: 'Actions'),
                  items: [
                    DDropdownItem(label: 'Edit', href: '#edit'),
                    DDropdownItem(label: 'Archive', disabled: true),
                    DDropdownItem(label: 'Delete', href: '#delete'),
                  ],
                ),
              ], code: '''DDropdown(
  trigger: DButton(label: 'Actions'),
  items: [
    DDropdownItem(label: 'Edit', href: '/edit'),
    DDropdownItem(label: 'Archive', disabled: true),  // Cannot be clicked
    DDropdownItem(label: 'Delete', href: '/delete'),
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
                    DDropdownItem(label: 'Edit', icon: 'edit', href: '#edit'),
                    DDropdownItem(label: 'Delete', icon: 'trash', href: '#delete'),
                  ],
                ),
              ], code: '''DDropdown(
  trigger: DButton(
    leadingIcon: DIcon(name: 'more-vertical'),
    variant: DButtonVariant.ghost,
    square: true,
  ),
  items: [
    DDropdownItem(label: 'Edit', icon: 'edit', href: '/edit'),
    DDropdownItem(label: 'Delete', icon: 'trash', href: '/delete'),
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
                    DDropdownItem(label: 'Profile', icon: 'user', href: '/profile'),
                    DDropdownItem(label: 'Settings', icon: 'settings', href: '/settings'),
                    DDropdownItem(label: 'Billing', icon: 'credit-card', href: '/billing'),
                    DDropdownItem.divider(),
                    DDropdownItem(label: 'Sign out', icon: 'log-out', href: '/logout'),
                  ],
                ),
              ], code: '''DDropdown(
  trigger: div(classes: 'flex items-center gap-2 cursor-pointer', [
    DAvatar(src: '/user.jpg', size: DAvatarSize.sm),
    span([Component.text('John Doe')]),
    DIcon(name: 'chevron-down', size: DIconSize.sm),
  ]),
  items: [
    DDropdownItem(label: 'Profile', icon: 'user', href: '/profile'),
    DDropdownItem(label: 'Settings', icon: 'settings', href: '/settings'),
    DDropdownItem(label: 'Billing', icon: 'credit-card', href: '/billing'),
    DDropdownItem.divider(),
    DDropdownItem(label: 'Sign out', icon: 'log-out', href: '/logout'),
  ],
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
