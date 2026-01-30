import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class FileUploadPage extends StatelessComponent {
  const FileUploadPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('File Upload')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Drag and drop file upload component.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [DFileUpload()], code: 'DFileUpload()'),
            ]),
            _section('With Accept Types', [
              ComponentPreviewCard(preview: [DFileUpload(accept: 'image/*')], code: "DFileUpload(accept: 'image/*')"),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
