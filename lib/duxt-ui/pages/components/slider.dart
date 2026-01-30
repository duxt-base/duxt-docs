import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class SliderPage extends StatelessComponent {
  const SliderPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Slider')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Range slider for value selection.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [div(classes: 'w-64', [DSlider(value: 50)])],
                code: 'DSlider(value: 50)'),
            ]),
            _section('With Min/Max', [
              ComponentPreviewCard(preview: [div(classes: 'w-64', [DSlider(value: 25, min: 0, max: 100)])],
                code: 'DSlider(value: 25, min: 0, max: 100)'),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
