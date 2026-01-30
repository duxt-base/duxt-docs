import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Button component documentation page
class ButtonPage extends StatelessComponent {
  const ButtonPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Button')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('Buttons allow users to take actions with a single tap.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DButton(label: 'Button'),
              ], code: "DButton(label: 'Button')"),
            ]),

            // Variants
            _section('Variants', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Solid', variant: DButtonVariant.solid),
                  DButton(label: 'Outline', variant: DButtonVariant.outline),
                  DButton(label: 'Soft', variant: DButtonVariant.soft),
                  DButton(label: 'Ghost', variant: DButtonVariant.ghost),
                  DButton(label: 'Link', variant: DButtonVariant.link),
                ]),
              ], code: '''DButton(label: 'Solid', variant: DButtonVariant.solid)
DButton(label: 'Outline', variant: DButtonVariant.outline)
DButton(label: 'Soft', variant: DButtonVariant.soft)
DButton(label: 'Ghost', variant: DButtonVariant.ghost)
DButton(label: 'Link', variant: DButtonVariant.link)'''),
            ]),

            // Colors
            _section('Colors', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Primary', color: DButtonColor.primary),
                  DButton(label: 'Secondary', color: DButtonColor.secondary),
                  DButton(label: 'Success', color: DButtonColor.success),
                  DButton(label: 'Warning', color: DButtonColor.warning),
                  DButton(label: 'Error', color: DButtonColor.error),
                  DButton(label: 'Info', color: DButtonColor.info),
                  DButton(label: 'Neutral', color: DButtonColor.neutral),
                ]),
              ], code: '''DButton(label: 'Primary', color: DButtonColor.primary)
DButton(label: 'Secondary', color: DButtonColor.secondary)
DButton(label: 'Success', color: DButtonColor.success)
DButton(label: 'Warning', color: DButtonColor.warning)
DButton(label: 'Error', color: DButtonColor.error)'''),
            ]),

            // Sizes
            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap items-center gap-3', [
                  DButton(label: 'XS', size: DButtonSize.xs),
                  DButton(label: 'SM', size: DButtonSize.sm),
                  DButton(label: 'MD', size: DButtonSize.md),
                  DButton(label: 'LG', size: DButtonSize.lg),
                  DButton(label: 'XL', size: DButtonSize.xl),
                ]),
              ], code: '''DButton(label: 'XS', size: DButtonSize.xs)
DButton(label: 'SM', size: DButtonSize.sm)
DButton(label: 'MD', size: DButtonSize.md)
DButton(label: 'LG', size: DButtonSize.lg)
DButton(label: 'XL', size: DButtonSize.xl)'''),
            ]),

            // States
            _section('States', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Loading', loading: true),
                  DButton(label: 'Disabled', disabled: true),
                ]),
              ], code: '''DButton(label: 'Loading', loading: true)
DButton(label: 'Disabled', disabled: true)'''),
            ]),

            // With Icons
            _section('With Icons', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Settings', leadingIcon: DIcon(name: DIconNames.settings, size: DIconSize.sm)),
                  DButton(label: 'Next', trailingIcon: DIcon(name: DIconNames.arrowRight, size: DIconSize.sm)),
                ]),
              ], code: '''DButton(label: 'Settings', leadingIcon: DIcon(name: DIconNames.settings))
DButton(label: 'Next', trailingIcon: DIcon(name: DIconNames.arrowRight))'''),
            ]),

            // API Reference
            h2([Component.text('API Reference')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-200 dark:border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-500 dark:text-zinc-400', [Component.text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-500 dark:text-zinc-400', [Component.text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-500 dark:text-zinc-400', [Component.text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-500 dark:text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('label', 'String', 'required', 'Button text'),
                  _apiRow('variant', 'DButtonVariant', 'solid', 'Visual style'),
                  _apiRow('color', 'DButtonColor', 'primary', 'Color scheme'),
                  _apiRow('size', 'DButtonSize', 'md', 'Button size'),
                  _apiRow('disabled', 'bool', 'false', 'Disable interactions'),
                  _apiRow('loading', 'bool', 'false', 'Show loading spinner'),
                  _apiRow('leadingIcon', 'String?', 'null', 'Icon before label'),
                  _apiRow('trailingIcon', 'String?', 'null', 'Icon after label'),
                  _apiRow('onPressed', 'VoidCallback?', 'null', 'Click handler'),
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
    return tr(classes: 'border-b border-zinc-200/50 dark:border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-600 dark:text-cyan-400', [Component.text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-600 dark:text-purple-400', [Component.text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [Component.text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text(desc)]),
    ]);
  }
}
