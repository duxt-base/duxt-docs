import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class TooltipPage extends StatelessComponent {
  const TooltipPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Tooltip')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A popup that displays information on hover.')]),

            _section('Basic Usage', [
              _preview([
                DTooltip(
                  text: 'This is a tooltip',
                  child: DButton(label: 'Hover me'),
                ),
              ], '''DTooltip(
  text: 'This is a tooltip',
  child: DButton(label: 'Hover me'),
)'''),
            ]),

            _section('Placements', [
              _preview([
                div(classes: 'flex flex-wrap gap-3', [
                  DTooltip(
                    text: 'Top tooltip',
                    placement: DTooltipPlacement.top,
                    child: DButton(label: 'Top', variant: DButtonVariant.outline),
                  ),
                  DTooltip(
                    text: 'Bottom tooltip',
                    placement: DTooltipPlacement.bottom,
                    child: DButton(label: 'Bottom', variant: DButtonVariant.outline),
                  ),
                  DTooltip(
                    text: 'Left tooltip',
                    placement: DTooltipPlacement.left,
                    child: DButton(label: 'Left', variant: DButtonVariant.outline),
                  ),
                  DTooltip(
                    text: 'Right tooltip',
                    placement: DTooltipPlacement.right,
                    child: DButton(label: 'Right', variant: DButtonVariant.outline),
                  ),
                ]),
              ], '''DTooltip(
  text: 'Top tooltip',
  placement: DTooltipPlacement.top,
  child: DButton(label: 'Top'),
)

DTooltip(
  text: 'Bottom tooltip',
  placement: DTooltipPlacement.bottom,
  child: DButton(label: 'Bottom'),
)'''),
            ]),

            _section('With Icon Button', [
              _preview([
                div(classes: 'flex gap-3', [
                  DTooltip(
                    text: 'Edit item',
                    child: DButton(
                      leadingIcon: DIcon(name: DIconNames.edit, size: DIconSize.sm),
                      variant: DButtonVariant.ghost,
                    ),
                  ),
                  DTooltip(
                    text: 'Delete item',
                    child: DButton(
                      leadingIcon: DIcon(name: DIconNames.trash, size: DIconSize.sm),
                      variant: DButtonVariant.ghost,
                      color: DButtonColor.error,
                    ),
                  ),
                ]),
              ], '''DTooltip(
  text: 'Delete item',
  child: DButton(
    leadingIcon: DIcon(name: DIconNames.trash),
    variant: DButtonVariant.ghost,
    color: DButtonColor.error,
  ),
)'''),
            ]),

            _section('With Delay', [
              _preview([
                DTooltip(
                  text: 'This appears after 500ms',
                  delayMs: 500,
                  child: DButton(label: 'Delayed tooltip', variant: DButtonVariant.soft),
                ),
              ], '''DTooltip(
  text: 'This appears after 500ms',
  delayMs: 500,  // milliseconds
  child: DButton(label: 'Delayed'),
)'''),
            ]),

            _section('Information Tooltip', [
              _preview([
                div(classes: 'flex items-center gap-2', [
                  span(classes: 'text-zinc-700 dark:text-zinc-300', [text('API Key')]),
                  DTooltip(
                    text: 'Your API key is used to authenticate requests',
                    child: DIcon(
                      name: DIconNames.info,
                      size: DIconSize.sm,
                      classes: 'text-zinc-400 cursor-help',
                    ),
                  ),
                ]),
              ], '''div(classes: 'flex items-center gap-2', [
  span([text('API Key')]),
  DTooltip(
    text: 'Your API key is used to authenticate requests',
    child: DIcon(
      name: DIconNames.info,
      size: DIconSize.sm,
      classes: 'text-gray-400 cursor-help',
    ),
  ),
])'''),
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
