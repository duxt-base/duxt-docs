import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Button component documentation page
class ButtonPage extends StatelessComponent {
  const ButtonPage({super.key});

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
            h1([text('Button')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('Buttons allow users to take actions with a single tap.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                DButton(label: 'Button'),
              ], "DButton(label: 'Button')"),
            ]),

            // Variants
            _section('Variants', [
              _preview([
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Solid', variant: DButtonVariant.solid),
                  DButton(label: 'Outline', variant: DButtonVariant.outline),
                  DButton(label: 'Soft', variant: DButtonVariant.soft),
                  DButton(label: 'Ghost', variant: DButtonVariant.ghost),
                  DButton(label: 'Link', variant: DButtonVariant.link),
                ]),
              ], '''DButton(label: 'Solid', variant: DButtonVariant.solid)
DButton(label: 'Outline', variant: DButtonVariant.outline)
DButton(label: 'Soft', variant: DButtonVariant.soft)
DButton(label: 'Ghost', variant: DButtonVariant.ghost)
DButton(label: 'Link', variant: DButtonVariant.link)'''),
            ]),

            // Colors
            _section('Colors', [
              _preview([
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Primary', color: DButtonColor.primary),
                  DButton(label: 'Secondary', color: DButtonColor.secondary),
                  DButton(label: 'Success', color: DButtonColor.success),
                  DButton(label: 'Warning', color: DButtonColor.warning),
                  DButton(label: 'Error', color: DButtonColor.error),
                  DButton(label: 'Info', color: DButtonColor.info),
                  DButton(label: 'Neutral', color: DButtonColor.neutral),
                ]),
              ], '''DButton(label: 'Primary', color: DButtonColor.primary)
DButton(label: 'Secondary', color: DButtonColor.secondary)
DButton(label: 'Success', color: DButtonColor.success)
DButton(label: 'Warning', color: DButtonColor.warning)
DButton(label: 'Error', color: DButtonColor.error)'''),
            ]),

            // Sizes
            _section('Sizes', [
              _preview([
                div(classes: 'flex flex-wrap items-center gap-3', [
                  DButton(label: 'XS', size: DButtonSize.xs),
                  DButton(label: 'SM', size: DButtonSize.sm),
                  DButton(label: 'MD', size: DButtonSize.md),
                  DButton(label: 'LG', size: DButtonSize.lg),
                  DButton(label: 'XL', size: DButtonSize.xl),
                ]),
              ], '''DButton(label: 'XS', size: DButtonSize.xs)
DButton(label: 'SM', size: DButtonSize.sm)
DButton(label: 'MD', size: DButtonSize.md)
DButton(label: 'LG', size: DButtonSize.lg)
DButton(label: 'XL', size: DButtonSize.xl)'''),
            ]),

            // States
            _section('States', [
              _preview([
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Loading', loading: true),
                  DButton(label: 'Disabled', disabled: true),
                ]),
              ], '''DButton(label: 'Loading', loading: true)
DButton(label: 'Disabled', disabled: true)'''),
            ]),

            // With Icons
            _section('With Icons', [
              _preview([
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Settings', leadingIcon: DIcon(name: DIconNames.settings, size: DIconSize.sm)),
                  DButton(label: 'Next', trailingIcon: DIcon(name: DIconNames.arrowRight, size: DIconSize.sm)),
                ]),
              ], '''DButton(label: 'Settings', leadingIcon: DIcon(name: DIconNames.settings))
DButton(label: 'Next', trailingIcon: DIcon(name: DIconNames.arrowRight))'''),
            ]),

            // API Reference
            h2([text('API Reference')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-200 dark:border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-500 dark:text-zinc-400', [text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-500 dark:text-zinc-400', [text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-500 dark:text-zinc-400', [text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-500 dark:text-zinc-400', [text('Description')]),
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
            'background-image': 'radial-gradient(circle at 1px 1px, rgb(161 161 170 / 0.3) 1px, transparent 0)',
            'background-size': '24px 24px',
          }),
          components,
        ),
        // Code
        div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [
          div(classes: 'flex items-center justify-between px-4 py-2 border-b border-zinc-200 dark:border-zinc-800', [
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
    return tr(classes: 'border-b border-zinc-200/50 dark:border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-600 dark:text-cyan-400', [text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-600 dark:text-purple-400', [text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
    ]);
  }
}
