import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class SeparatorPage extends StatelessComponent {
  const SeparatorPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Separator')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Visual dividers between content sections.')]),
            _section('Horizontal', [
              ComponentPreviewCard(preview: [div(classes: 'w-full max-w-sm', [
                div(classes: 'text-zinc-400 text-sm', [Component.text('Section 1')]),
                DSeparator(className: 'my-4'),
                div(classes: 'text-zinc-400 text-sm', [Component.text('Section 2')]),
              ])], code: 'DSeparator()'),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
