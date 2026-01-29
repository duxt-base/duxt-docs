import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';
import '../../shared/components/code_block.dart';

/// Installation page for Duxt UI
class InstallationPage extends StatelessComponent {
  const InstallationPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'Installation',
      description: 'How to install and configure Duxt UI in your Jaspr project.',
      currentPath: '/duxt-ui/installation',
      tocItems: const [
        TocItem(label: 'Requirements', anchor: 'requirements'),
        TocItem(label: 'Install Package', anchor: 'install-package'),
        TocItem(label: 'Configure Tailwind', anchor: 'configure-tailwind'),
        TocItem(label: 'Verify Installation', anchor: 'verify-installation'),
      ],
      children: [
        h2(id: 'requirements', [text('Requirements')]),
        p([text('Before installing Duxt UI, ensure you have:')]),
        ul([
          li([text('Dart SDK 3.0 or higher')]),
          li([text('A Jaspr project (v0.22.0+)')]),
          li([text('jaspr_tailwind configured')]),
        ]),

        Callout(
          type: 'warning',
          title: 'Jaspr Version',
          children: [
            p([text('Duxt UI requires Jaspr 0.22.0 or higher.')]),
          ],
        ),

        h2(id: 'install-package', [text('Install Package')]),
        p([text('Add Duxt UI to your '), code([text('pubspec.yaml')]), text(':')]),

        CodeBlock(
          code: '''dependencies:
  duxt_ui:
    git:
      url: https://github.com/duxt-ui/duxt_ui.git
      ref: main''',
          language: 'yaml',
          filename: 'pubspec.yaml',
        ),

        p([text('Then fetch the dependencies:')]),
        CodeBlock(
          code: 'dart pub get',
          language: 'bash',
        ),

        h2(id: 'configure-tailwind', [text('Configure Tailwind')]),
        p([text('Duxt UI requires Tailwind CSS. If not already configured:')]),

        h3([text('1. Add jaspr_tailwind')]),
        CodeBlock(
          code: '''dev_dependencies:
  jaspr_tailwind: ^0.3.0''',
          language: 'yaml',
          filename: 'pubspec.yaml',
        ),

        h3([text('2. Import Components')]),
        CodeBlock(
          code: "import 'package:duxt_ui/duxt_ui.dart';",
          language: 'dart',
        ),

        h2(id: 'verify-installation', [text('Verify Installation')]),
        p([text('Test with a simple component:')]),
        CodeBlock(
          code: '''import 'package:jaspr/jaspr.dart';
import 'package:duxt_ui/duxt_ui.dart';

class TestPage extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return UButton(
      label: 'Duxt UI Works!',
      variant: UButtonVariant.solid,
      color: UColor.primary,
    );
  }
}''',
          language: 'dart',
        ),

        Callout(
          type: 'tip',
          title: 'Success!',
          children: [
            p([text('If you see a styled button, Duxt UI is installed!')]),
          ],
        ),
      ],
    );
  }
}
