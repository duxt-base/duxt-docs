import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class TabsPage extends StatelessComponent {
  const TabsPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Tabs')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Tabbed navigation for organizing content.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DTabs(
                  items: [
                    DTabItem(label: 'Account', value: 'account'),
                    DTabItem(label: 'Password', value: 'password'),
                    DTabItem(label: 'Settings', value: 'settings'),
                  ],
                  defaultValue: 'account',
                ),
              ], code: '''DTabs(
  items: [
    DTabItem(label: 'Account', value: 'account'),
    DTabItem(label: 'Password', value: 'password'),
    DTabItem(label: 'Settings', value: 'settings'),
  ],
  defaultValue: 'account',
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
