import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class InputPage extends StatelessComponent {
  const InputPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Input')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Text input fields for user data entry.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [DInput(placeholder: 'Enter text...')], code: "DInput(placeholder: 'Enter text...')"),
            ]),

            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'space-y-3 w-full max-w-sm', [
                  DInput(placeholder: 'Extra Small', size: DInputSize.xs),
                  DInput(placeholder: 'Small', size: DInputSize.sm),
                  DInput(placeholder: 'Medium', size: DInputSize.md),
                  DInput(placeholder: 'Large', size: DInputSize.lg),
                ]),
              ], code: '''DInput(placeholder: 'Small', size: DInputSize.sm)
DInput(placeholder: 'Medium', size: DInputSize.md)
DInput(placeholder: 'Large', size: DInputSize.lg)'''),
            ]),

            _section('States', [
              ComponentPreviewCard(preview: [
                div(classes: 'space-y-3 w-full max-w-sm', [
                  DInput(placeholder: 'Disabled', disabled: true),
                ]),
              ], code: "DInput(placeholder: 'Disabled', disabled: true)"),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
