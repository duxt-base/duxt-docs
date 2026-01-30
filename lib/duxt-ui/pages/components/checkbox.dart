import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class CheckboxPage extends StatelessComponent {
  const CheckboxPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Checkbox')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Selection controls for multiple options.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [DCheckbox(label: 'Accept terms')], code: "DCheckbox(label: 'Accept terms')"),
            ]),

            _section('States', [
              ComponentPreviewCard(preview: [
                div(classes: 'space-y-3', [
                  DCheckbox(label: 'Unchecked', checked: false),
                  DCheckbox(label: 'Checked', checked: true),
                  DCheckbox(label: 'Disabled', disabled: true),
                  DCheckbox(label: 'Checked & Disabled', checked: true, disabled: true),
                ]),
              ], code: '''DCheckbox(label: 'Unchecked', checked: false)
DCheckbox(label: 'Checked', checked: true)
DCheckbox(label: 'Disabled', disabled: true)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
