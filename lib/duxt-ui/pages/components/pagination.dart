import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class PaginationPage extends StatelessComponent {
  const PaginationPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Pagination')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Page navigation controls.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [DPagination(currentPage: 3, totalPages: 10)], code: 'DPagination(currentPage: 3, totalPages: 10)'),
            ]),
            _section('Different Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'space-y-4', [
                  DPagination(currentPage: 1, totalPages: 5),
                  DPagination(currentPage: 5, totalPages: 20),
                ]),
              ], code: '''DPagination(currentPage: 1, totalPages: 5)
DPagination(currentPage: 5, totalPages: 20)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
