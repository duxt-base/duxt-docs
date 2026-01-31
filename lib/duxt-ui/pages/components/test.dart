import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Test page to verify component fixes
class TestPage extends StatelessComponent {
  const TestPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Component Tests')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Test page to verify component fixes.')]),

            // Test 1: Tooltip
            _section('Test 1: DTooltip', [
              p(classes: 'text-zinc-400 mb-4', [Component.text('Hover over the button to see the tooltip.')]),
              ComponentPreviewCard(preview: [
                div(classes: 'flex gap-4', [
                  DTooltip(
                    text: 'This is a tooltip!',
                    child: DButton(label: 'Hover me'),
                  ),
                  DTooltip(
                    text: 'Bottom tooltip',
                    placement: DTooltipPlacement.bottom,
                    child: DButton(label: 'Bottom', variant: DButtonVariant.outline),
                  ),
                  DTooltip(
                    text: 'Left tooltip',
                    placement: DTooltipPlacement.left,
                    child: DButton(label: 'Left', variant: DButtonVariant.soft),
                  ),
                ]),
              ], code: '''DTooltip(
  text: 'This is a tooltip!',
  child: DButton(label: 'Hover me'),
)'''),
            ]),

            // Test 2: PinInput
            _section('Test 2: DPinInput', [
              p(classes: 'text-zinc-400 mb-4', [Component.text('Enter numbers - should auto-advance to next input.')]),
              ComponentPreviewCard(preview: [
                div(classes: 'space-y-4', [
                  DPinInput(length: 4, label: '4-digit PIN'),
                  DPinInput(length: 6, label: '6-digit OTP', hint: 'Enter the code sent to your phone'),
                ]),
              ], code: '''DPinInput(length: 4, label: '4-digit PIN')
DPinInput(length: 6, label: '6-digit OTP')'''),
            ]),

            // Test 3: Dropdown
            _section('Test 3: DDropdown', [
              p(classes: 'text-zinc-400 mb-4', [Component.text('Click the button to open the dropdown menu.')]),
              ComponentPreviewCard(preview: [
                div(classes: 'flex gap-4', [
                  DDropdown(
                    trigger: DButton(label: 'Options'),
                    items: [
                      DDropdownItem(label: 'Edit', icon: 'lucide:edit', href: '#edit'),
                      DDropdownItem(label: 'Duplicate', icon: 'lucide:copy', href: '#duplicate'),
                      DDropdownItem.divider(),
                      DDropdownItem(label: 'Delete', icon: 'lucide:trash', href: '#delete'),
                    ],
                  ),
                  DDropdown(
                    trigger: DButton(label: 'User Menu', variant: DButtonVariant.outline),
                    placement: DDropdownPlacement.bottomStart,
                    items: [
                      DDropdownItem(label: 'Profile', icon: 'lucide:user', href: '/profile'),
                      DDropdownItem(label: 'Settings', icon: 'lucide:settings', href: '/settings'),
                      DDropdownItem.divider(),
                      DDropdownItem(label: 'Sign out', icon: 'lucide:log-out', href: '/logout'),
                    ],
                  ),
                ]),
              ], code: '''DDropdown(
  trigger: DButton(label: 'Options'),
  items: [
    DDropdownItem(label: 'Edit', icon: 'lucide:edit', href: '/edit'),
    DDropdownItem(label: 'Duplicate', icon: 'lucide:copy', href: '/duplicate'),
    DDropdownItem.divider(),
    DDropdownItem(label: 'Delete', icon: 'lucide:trash', href: '/delete'),
  ],
)'''),
            ]),

            // Test Summary
            _section('Expected Behaviors', [
              div(classes: 'not-prose bg-zinc-900 rounded-lg p-4 space-y-2 text-sm', [
                div(classes: 'flex items-start gap-2', [
                  span(classes: 'text-cyan-400', [Component.text('1.')]),
                  span(classes: 'text-zinc-700 dark:text-zinc-300', [Component.text('DTooltip: Should show tooltip on hover with CSS group-hover')]),
                ]),
                div(classes: 'flex items-start gap-2', [
                  span(classes: 'text-cyan-400', [Component.text('2.')]),
                  span(classes: 'text-zinc-700 dark:text-zinc-300', [Component.text('DPinInput: Should auto-focus next input when entering a digit')]),
                ]),
                div(classes: 'flex items-start gap-2', [
                  span(classes: 'text-cyan-400', [Component.text('3.')]),
                  span(classes: 'text-zinc-700 dark:text-zinc-300', [Component.text('DDropdown: Should open on click, close on outside click')]),
                ]),
              ]),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
