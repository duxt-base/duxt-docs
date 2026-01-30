import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class AlertPage extends StatelessComponent {
  const AlertPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Alert')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Contextual feedback messages for user actions.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DAlert(title: 'Heads up!', description: 'You can add components using the CLI.'),
                ]),
              ], code: "DAlert(\n  title: 'Heads up!',\n  description: 'You can add components using the CLI.',\n)"),
            ]),

            _section('Colors', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md space-y-4', [
                  DAlert(title: 'Info', description: 'This is an informational message.', color: DAlertColor.info),
                  DAlert(title: 'Success', description: 'Operation completed successfully.', color: DAlertColor.success),
                  DAlert(title: 'Warning', description: 'Please review before continuing.', color: DAlertColor.warning),
                  DAlert(title: 'Error', description: 'Something went wrong.', color: DAlertColor.error),
                ]),
              ], code: '''DAlert(title: 'Info', description: '...', color: DAlertColor.info)
DAlert(title: 'Success', description: '...', color: DAlertColor.success)
DAlert(title: 'Warning', description: '...', color: DAlertColor.warning)
DAlert(title: 'Error', description: '...', color: DAlertColor.error)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
