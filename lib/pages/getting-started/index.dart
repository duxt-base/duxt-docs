import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';
import '../../shared/components/code_block.dart';

/// Getting Started - Installation page
class GettingStartedPage extends StatelessComponent {
  const GettingStartedPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'Getting Started',
      description: 'Learn how to install and set up Duxt UI in your Jaspr project.',
      currentPath: '/getting-started',
      tocItems: const [
        TocItem(label: 'Prerequisites', anchor: 'prerequisites'),
        TocItem(label: 'Installation', anchor: 'installation'),
        TocItem(label: 'Setup', anchor: 'setup'),
        TocItem(label: 'First Component', anchor: 'first-component'),
      ],
      children: [
        // Prerequisites
        h2(id: 'prerequisites', [text('Prerequisites')]),
        p([text('Before you begin, make sure you have the following installed:')]),
        ul([
          li([text('Dart SDK 3.0 or higher')]),
          li([text('Jaspr CLI ('), code([text('dart pub global activate jaspr_cli')]), text(')')]),
          li([text('A Jaspr project (create one with '), code([text('jaspr create my_app')]), text(')')]),
        ]),

        // Installation
        h2(id: 'installation', [text('Installation')]),
        p([text('Add Duxt UI to your project by adding the dependency to your '), code([text('pubspec.yaml')]), text(':')]),
        CodeBlock(
          code: '''dependencies:
  duxt_ui:
    git:
      url: https://github.com/duxt-ui/duxt_ui.git
      ref: main''',
          language: 'yaml',
          filename: 'pubspec.yaml',
        ),
        p([text('Then run:')]),
        CodeBlock(
          code: 'dart pub get',
          language: 'bash',
        ),

        // Setup
        h2(id: 'setup', [text('Setup')]),
        p([text('Duxt UI uses Tailwind CSS for styling. Make sure you have jaspr_tailwind configured in your project.')]),
        Callout(
          type: 'tip',
          title: 'Tailwind Configuration',
          children: [
            p([text('If you haven\'t set up Tailwind yet, add '), code([text('jaspr_tailwind')]), text(' to your dev dependencies and create a '), code([text('tailwind.config.js')]), text(' file.')]),
          ],
        ),
        p([text('Import Duxt UI in your Dart files:')]),
        CodeBlock(
          code: "import 'package:duxt_ui/duxt_ui.dart';",
          language: 'dart',
        ),

        // First Component
        h2(id: 'first-component', [text('Your First Component')]),
        p([text('Now you\'re ready to use Duxt UI components! Here\'s a simple example:')]),
        CodeBlock(
          code: '''import 'package:jaspr/jaspr.dart';
import 'package:duxt_ui/duxt_ui.dart';

class MyPage extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return UButton(
      label: 'Click me!',
      variant: UButtonVariant.solid,
      color: UColor.primary,
      onPressed: () {
        print('Button clicked!');
      },
    );
  }
}''',
          language: 'dart',
          filename: 'lib/pages/my_page.dart',
        ),
        p([text('This creates a solid primary button with a click handler.')]),

        // Next steps
        h2(id: 'next-steps', [text('Next Steps')]),
        ul([
          li([
            a(href: '/getting-started/quick-start', [text('Quick Start Guide')]),
            text(' - Build your first page with Duxt UI'),
          ]),
          li([
            a(href: '/components', [text('Components')]),
            text(' - Explore all available components'),
          ]),
          li([
            a(href: '/duxt-ui/theming', [text('Theming')]),
            text(' - Learn how to customize the look and feel'),
          ]),
        ]),
      ],
    );
  }
}
