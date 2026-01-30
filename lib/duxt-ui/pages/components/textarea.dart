import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class TextareaPage extends StatelessComponent {
  const TextareaPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Textarea')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Multi-line text input field.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [DTextarea(placeholder: 'Enter your message...')], code: "DTextarea(placeholder: 'Enter your message...')"),
            ]),
            _section('With Label', [
              ComponentPreviewCard(preview: [DTextarea(label: 'Description', placeholder: 'Enter description...')], code: "DTextarea(label: 'Description', placeholder: 'Enter description...')"),
            ]),
            _section('Disabled', [
              ComponentPreviewCard(preview: [DTextarea(placeholder: 'Disabled textarea', disabled: true)], code: "DTextarea(placeholder: 'Disabled textarea', disabled: true)"),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
