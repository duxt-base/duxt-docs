import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class SkeletonPage extends StatelessComponent {
  const SkeletonPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Skeleton')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Loading placeholders for content.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [div(classes: 'w-full max-w-sm space-y-3', [DSkeleton(className: 'h-4 w-full'), DSkeleton(className: 'h-4 w-3/4'), DSkeleton(className: 'h-4 w-1/2')])],
                code: "DSkeleton(className: 'h-4 w-full')\nDSkeleton(className: 'h-4 w-3/4')"),
            ]),
            _section('Card Skeleton', [
              ComponentPreviewCard(preview: [div(classes: 'w-full max-w-sm p-4 border border-zinc-800 rounded-lg space-y-4', [
                DSkeleton(className: 'h-32 w-full rounded-lg'),
                DSkeleton(className: 'h-4 w-3/4'),
                DSkeleton(className: 'h-4 w-1/2'),
              ])], code: "// Card skeleton\nDSkeleton(className: 'h-32 w-full rounded-lg')"),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
