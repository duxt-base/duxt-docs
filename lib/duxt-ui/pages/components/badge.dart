import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class BadgePage extends StatelessComponent {
  const BadgePage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Badge')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Small status indicators and labels.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [DBadge(label: 'Badge')], code: "DBadge(label: 'Badge')"),
            ]),

            _section('Colors', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DBadge(label: 'Primary', color: DBadgeColor.primary),
                  DBadge(label: 'Secondary', color: DBadgeColor.secondary),
                  DBadge(label: 'Success', color: DBadgeColor.success),
                  DBadge(label: 'Warning', color: DBadgeColor.warning),
                  DBadge(label: 'Error', color: DBadgeColor.error),
                  DBadge(label: 'Info', color: DBadgeColor.info),
                  DBadge(label: 'Neutral', color: DBadgeColor.neutral),
                ]),
              ], code: '''DBadge(label: 'Primary', color: DBadgeColor.primary)
DBadge(label: 'Success', color: DBadgeColor.success)
DBadge(label: 'Warning', color: DBadgeColor.warning)
DBadge(label: 'Error', color: DBadgeColor.error)'''),
            ]),

            _section('Variants', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DBadge(label: 'Solid'),
                  DBadge(label: 'Soft'),
                  DBadge(label: 'Outline'),
                ]),
              ], code: '''DBadge(label: 'Solid')
DBadge(label: 'Soft')
DBadge(label: 'Outline')'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
