import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class TooltipPage extends StatelessComponent {
  const TooltipPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Tooltip')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A popup that displays information on hover.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DTooltip(
                  text: 'This is a tooltip',
                  child: DButton(label: 'Hover me'),
                ),
              ], code: '''DTooltip(
  text: 'This is a tooltip',
  child: DButton(label: 'Hover me'),
)'''),
            ]),

            _section('Placements', [
              ComponentPreviewCard(preview: [
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
              ], code: '''DTooltip(
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
              ComponentPreviewCard(preview: [
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
              ], code: '''DTooltip(
  text: 'Delete item',
  child: DButton(
    leadingIcon: DIcon(name: DIconNames.trash),
    variant: DButtonVariant.ghost,
    color: DButtonColor.error,
  ),
)'''),
            ]),

            _section('With Delay', [
              ComponentPreviewCard(preview: [
                DTooltip(
                  text: 'This appears after 500ms',
                  delayMs: 500,
                  child: DButton(label: 'Delayed tooltip', variant: DButtonVariant.soft),
                ),
              ], code: '''DTooltip(
  text: 'This appears after 500ms',
  delayMs: 500,  // milliseconds
  child: DButton(label: 'Delayed'),
)'''),
            ]),

            _section('Information Tooltip', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex items-center gap-2', [
                  span(classes: 'text-zinc-700 dark:text-zinc-300', [Component.text('API Key')]),
                  DTooltip(
                    text: 'Your API key is used to authenticate requests',
                    child: DIcon(
                      name: DIconNames.info,
                      size: DIconSize.sm,
                      classes: 'text-zinc-400 cursor-help',
                    ),
                  ),
                ]),
              ], code: '''div(classes: 'flex items-center gap-2', [
  span([Component.text('API Key')]),
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
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
