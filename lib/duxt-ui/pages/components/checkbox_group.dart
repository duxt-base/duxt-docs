import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class CheckboxGroupPage extends StatelessComponent {
  const CheckboxGroupPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Checkbox Group')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Group of checkboxes for multiple selections.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(
                preview: [
                  DCheckboxGroup<String>(
                    label: 'Select options',
                    options: [
                      DCheckboxOption(label: 'Option 1', value: 'opt1'),
                      DCheckboxOption(label: 'Option 2', value: 'opt2'),
                      DCheckboxOption(label: 'Option 3', value: 'opt3'),
                    ],
                  ),
                ],
                code: '''DCheckboxGroup<String>(
  label: 'Select options',
  options: [
    DCheckboxOption(label: 'Option 1', value: 'opt1'),
    DCheckboxOption(label: 'Option 2', value: 'opt2'),
    DCheckboxOption(label: 'Option 3', value: 'opt3'),
  ],
)''',
              ),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
