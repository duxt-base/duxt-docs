import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class SelectPage extends StatelessComponent {
  const SelectPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Select')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Dropdown selection component.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DSelect(
                  placeholder: 'Select an option',
                  options: [
                    DSelectOption(label: 'Option 1', value: 'opt1'),
                    DSelectOption(label: 'Option 2', value: 'opt2'),
                    DSelectOption(label: 'Option 3', value: 'opt3'),
                  ],
                ),
              ], code: '''DSelect(
  placeholder: 'Select an option',
  options: [
    DSelectOption(label: 'Option 1', value: 'opt1'),
    DSelectOption(label: 'Option 2', value: 'opt2'),
    DSelectOption(label: 'Option 3', value: 'opt3'),
  ],
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
