import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../shared/components/app_scaffold.dart';
import '../../shared/components/sidebar_ui.dart';
import '../../shared/components/code_preview.dart';

/// Duxt UI overview page
class UiIndexPage extends StatelessComponent {
  const UiIndexPage({super.key});

  @override
  Component build(BuildContext context) {

    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Duxt UI')]),
        p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
          Component.text('A comprehensive UI component library for Duxt applications.'),
        ]),

        // Live component showcase
        div(classes: 'not-prose my-8', [
          h2(classes: 'text-2xl font-bold text-zinc-900 dark:text-white mb-6', [Component.text('Component Showcase')]),

          div(classes: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6', [
            _componentCard('Button', 'Interactive buttons with variants', [
              DButton(label: 'Primary', color: DButtonColor.primary),
              DButton(label: 'Outline', variant: DButtonVariant.outline),
            ]),
            _componentCard('Input', 'Text input fields', [
              DInput(placeholder: 'Type here...'),
            ]),
            _componentCard('Badge', 'Status indicators', [
              DBadge(label: 'New', color: DBadgeColor.primary),
              DBadge(label: 'Beta', color: DBadgeColor.warning),
            ]),
            _componentCard('Alert', 'Contextual feedback', [
              DAlert(title: 'Info', description: 'This is helpful.', color: DAlertColor.info),
            ]),
            _componentCard('Spinner', 'Loading indicators', [
              DSpinner(size: DSpinnerSize.md),
            ]),
            _componentCard('Switch', 'Toggle controls', [
              DSwitch(checked: true),
              DSwitch(checked: false),
            ]),
          ]),
        ]),

        h2(classes: 'text-zinc-900 dark:text-white', [Component.text('Installation')]),
        div(classes: 'not-prose my-4', [
          CodePreview(source: 'dependencies:\n  duxt_ui: ^0.2.3', language: 'yaml'),
        ]),

        h2(classes: 'text-zinc-900 dark:text-white', [Component.text('Usage')]),
        div(classes: 'not-prose my-4', [
          CodePreview(source: "import 'package:duxt_ui/duxt_ui.dart';\n\nDButton(\n  label: 'Click me',\n  onPressed: () => print('clicked'),\n)", language: 'dart'),
        ]),
      ]),
    );
  }

  Component _componentCard(String title, String description, List<Component> preview) {
    return div(
      classes: 'rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden',
      [
        div(
          classes: 'p-6 bg-zinc-100 dark:bg-zinc-900 flex items-center justify-center gap-3 min-h-[120px]',
          preview,
        ),
        div(classes: 'p-4 border-t border-zinc-200 dark:border-zinc-800', [
          h3(classes: 'font-semibold text-zinc-900 dark:text-white', [Component.text(title)]),
          p(classes: 'text-sm text-zinc-500 dark:text-zinc-400 mt-1', [Component.text(description)]),
        ]),
      ],
    );
  }
}
