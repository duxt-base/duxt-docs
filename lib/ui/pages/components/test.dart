import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Test page to verify component fixes
class TestPage extends StatelessComponent {
  const TestPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Component Tests')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('Test page to verify component fixes.')]),

            // Test 1: Tooltip
            _section('Test 1: DTooltip', [
              p(classes: 'text-zinc-400 mb-4', [text('Hover over the button to see the tooltip.')]),
              _preview([
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
              ], '''DTooltip(
  text: 'This is a tooltip!',
  child: DButton(label: 'Hover me'),
)'''),
            ]),

            // Test 2: PinInput
            _section('Test 2: DPinInput', [
              p(classes: 'text-zinc-400 mb-4', [text('Enter numbers - should auto-advance to next input.')]),
              _preview([
                div(classes: 'space-y-4', [
                  DPinInput(length: 4, label: '4-digit PIN'),
                  DPinInput(length: 6, label: '6-digit OTP', hint: 'Enter the code sent to your phone'),
                ]),
              ], '''DPinInput(length: 4, label: '4-digit PIN')
DPinInput(length: 6, label: '6-digit OTP')'''),
            ]),

            // Test 3: Dropdown
            _section('Test 3: DDropdown', [
              p(classes: 'text-zinc-400 mb-4', [text('Click the button to open the dropdown menu.')]),
              _preview([
                div(classes: 'flex gap-4', [
                  DDropdown(
                    trigger: DButton(label: 'Options'),
                    items: [
                      DDropdownItem(label: 'Edit', icon: 'lucide:edit', onClick: () {}),
                      DDropdownItem(label: 'Duplicate', icon: 'lucide:copy', onClick: () {}),
                      DDropdownItem.divider(),
                      DDropdownItem(label: 'Delete', icon: 'lucide:trash', onClick: () {}),
                    ],
                  ),
                  DDropdown(
                    trigger: DButton(label: 'User Menu', variant: DButtonVariant.outline),
                    placement: DDropdownPlacement.bottomStart,
                    items: [
                      DDropdownItem(label: 'Profile', icon: 'lucide:user', onClick: () {}),
                      DDropdownItem(label: 'Settings', icon: 'lucide:settings', onClick: () {}),
                      DDropdownItem.divider(),
                      DDropdownItem(label: 'Sign out', icon: 'lucide:log-out', onClick: () {}),
                    ],
                  ),
                ]),
              ], '''DDropdown(
  trigger: DButton(label: 'Options'),
  items: [
    DDropdownItem(label: 'Edit', icon: 'lucide:edit', onClick: () {}),
    DDropdownItem(label: 'Duplicate', icon: 'lucide:copy', onClick: () {}),
    DDropdownItem.divider(),
    DDropdownItem(label: 'Delete', icon: 'lucide:trash', onClick: () {}),
  ],
)'''),
            ]),

            // Test Summary
            _section('Expected Behaviors', [
              div(classes: 'not-prose bg-zinc-900 rounded-lg p-4 space-y-2 text-sm', [
                div(classes: 'flex items-start gap-2', [
                  span(classes: 'text-cyan-400', [text('1.')]),
                  span(classes: 'text-zinc-700 dark:text-zinc-300', [text('DTooltip: Should show tooltip on hover with CSS group-hover')]),
                ]),
                div(classes: 'flex items-start gap-2', [
                  span(classes: 'text-cyan-400', [text('2.')]),
                  span(classes: 'text-zinc-700 dark:text-zinc-300', [text('DPinInput: Should auto-focus next input when entering a digit')]),
                ]),
                div(classes: 'flex items-start gap-2', [
                  span(classes: 'text-cyan-400', [text('3.')]),
                  span(classes: 'text-zinc-700 dark:text-zinc-300', [text('DDropdown: Should open on click, close on outside click')]),
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
    div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [
      div(classes: 'flex items-center px-4 py-2 border-b border-zinc-200 dark:border-zinc-800', [span(classes: 'text-xs text-zinc-500', [text('dart')])]),
      div(classes: 'p-4 overflow-x-auto', [pre(classes: 'text-sm', [code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)])])]),
    ]),
  ]);
}
