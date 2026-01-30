import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class SpinnerPage extends StatelessComponent {
  const SpinnerPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Spinner')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Loading indicators for async operations.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [DSpinner()], code: 'DSpinner()'),
            ]),

            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex items-center gap-6', [
                  DSpinner(size: DSpinnerSize.xs),
                  DSpinner(size: DSpinnerSize.sm),
                  DSpinner(size: DSpinnerSize.md),
                  DSpinner(size: DSpinnerSize.lg),
                ]),
              ], code: '''DSpinner(size: DSpinnerSize.xs)
DSpinner(size: DSpinnerSize.sm)
DSpinner(size: DSpinnerSize.md)
DSpinner(size: DSpinnerSize.lg)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
