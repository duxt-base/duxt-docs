import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class BreadcrumbPage extends StatelessComponent {
  const BreadcrumbPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Breadcrumb')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Navigation path indicators.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DBreadcrumb(items: [
                  DBreadcrumbItem(label: 'Home', href: '/'),
                  DBreadcrumbItem(label: 'Components', href: '/components'),
                  DBreadcrumbItem(label: 'Breadcrumb'),
                ]),
              ], code: '''DBreadcrumb(items: [
  DBreadcrumbItem(label: 'Home', href: '/'),
  DBreadcrumbItem(label: 'Components', href: '/components'),
  DBreadcrumbItem(label: 'Breadcrumb'),
])'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
