import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class SwitchPage extends StatelessComponent {
  const SwitchPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Switch')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Toggle switches for on/off states.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [div(classes: 'flex gap-4', [DSwitch(checked: false), DSwitch(checked: true)])],
                code: "DSwitch(checked: false)\nDSwitch(checked: true)"),
            ]),

            _section('With Label', [
              ComponentPreviewCard(preview: [
                div(classes: 'space-y-4', [
                  DSwitch(label: 'Enable notifications', checked: true),
                  DSwitch(label: 'Dark mode', checked: false),
                ]),
              ], code: "DSwitch(label: 'Enable notifications', checked: true)"),
            ]),

            _section('Disabled', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex gap-4', [
                  DSwitch(checked: false, disabled: true),
                  DSwitch(checked: true, disabled: true),
                ]),
              ], code: "DSwitch(checked: true, disabled: true)"),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
