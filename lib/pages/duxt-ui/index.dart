import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';
import '../../shared/components/code_block.dart';

/// Duxt UI overview page
class DuxtUIPage extends StatelessComponent {
  const DuxtUIPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'Duxt UI',
      description: 'A comprehensive UI component library for Jaspr, inspired by Nuxt UI.',
      currentPath: '/duxt-ui',
      tocItems: const [
        TocItem(label: 'Introduction', anchor: 'introduction'),
        TocItem(label: 'Features', anchor: 'features'),
        TocItem(label: 'Design Principles', anchor: 'design-principles'),
        TocItem(label: 'Getting Started', anchor: 'getting-started'),
      ],
      children: [
        h2(id: 'introduction', [text('Introduction')]),
        p([
          text('Duxt UI is a modern UI component library built specifically for '),
          a(href: 'https://jaspr.dev', [text('Jaspr')]),
          text(' - the Dart framework for building web applications.'),
        ]),

        Callout(
          type: 'info',
          title: 'Built for Jaspr',
          children: [
            p([text('Duxt UI is designed to work seamlessly with Jaspr\'s component model and Tailwind CSS integration.')]),
          ],
        ),

        h2(id: 'features', [text('Features')]),
        div(classes: 'grid grid-cols-1 md:grid-cols-2 gap-4 my-6 not-prose', [
          _buildFeatureCard('Tailwind CSS', 'Built on Tailwind CSS for maximum flexibility.'),
          _buildFeatureCard('Dark Mode', 'Full dark mode support out of the box.'),
          _buildFeatureCard('Customizable', 'Variants, colors, sizes, and custom styling.'),
          _buildFeatureCard('Type Safe', 'Full Dart type safety with documentation.'),
        ]),

        h2(id: 'design-principles', [text('Design Principles')]),
        h3([text('Consistency')]),
        p([
          text('All components share a consistent API with common properties like '),
          code([text('variant')]),
          text(', '),
          code([text('color')]),
          text(', and '),
          code([text('size')]),
          text('.'),
        ]),

        h3([text('Composability')]),
        p([text('Components are designed to work together seamlessly.')]),

        h2(id: 'getting-started', [text('Getting Started')]),
        p([text('Ready to build with Duxt UI? Follow these guides:')]),
        ul([
          li([a(href: '/duxt-ui/installation', [text('Installation')])]),
          li([a(href: '/duxt-ui/theming', [text('Theming')])]),
          li([a(href: '/duxt-ui/components', [text('All Components')])]),
        ]),

        CodeBlock(
          code: '''import 'package:duxt_ui/duxt_ui.dart';

class MyPage extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return UButton(
      label: 'Get Started',
      variant: UButtonVariant.solid,
      color: UColor.primary,
    );
  }
}''',
          language: 'dart',
        ),
      ],
    );
  }

  Component _buildFeatureCard(String title, String description) {
    return div(classes: 'p-4 bg-gray-900 border border-gray-800 rounded-lg', [
      h4(classes: 'font-semibold text-white mb-2', [text(title)]),
      p(classes: 'text-sm text-gray-400', [text(description)]),
    ]);
  }
}
