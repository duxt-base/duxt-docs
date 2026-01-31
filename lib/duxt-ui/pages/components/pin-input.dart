import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class PinInputPage extends StatelessComponent {
  const PinInputPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Pin Input')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('PIN/OTP code input with individual digit fields.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [DPinInput(length: 4)], code: 'DPinInput(length: 4)'),
            ]),
            _section('Six Digits', [
              ComponentPreviewCard(preview: [DPinInput(length: 6)], code: 'DPinInput(length: 6)'),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
