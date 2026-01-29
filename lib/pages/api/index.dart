import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';
import '../../shared/components/code_block.dart';

/// API Reference page
class APIPage extends StatelessComponent {
  const APIPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'API Reference',
      description: 'Complete API documentation for Duxt UI components.',
      currentPath: '/api',
      tocItems: const [
        TocItem(label: 'Overview', anchor: 'overview'),
        TocItem(label: 'UColor', anchor: 'ucolor'),
        TocItem(label: 'USize', anchor: 'usize'),
        TocItem(label: 'Variants', anchor: 'variants'),
      ],
      children: [
        h2(id: 'overview', [text('Overview')]),
        p([text('All components share common types and patterns:')]),

        CodeBlock(
          code: '''import 'package:duxt_ui/duxt_ui.dart';

// Components
UButton, UInput, UCard, UBadge, UAvatar, ...

// Types
UColor, USize, UButtonVariant, UInputVariant, ...''',
          language: 'dart',
        ),

        h2(id: 'ucolor', [text('UColor')]),
        p([text('Semantic color tokens for theming:')]),
        CodeBlock(
          code: '''enum UColor {
  primary,    // Main brand color
  secondary,  // Secondary actions
  success,    // Success states
  warning,    // Warning states
  error,      // Error states
  gray,       // Neutral
}''',
          language: 'dart',
        ),

        h2(id: 'usize', [text('USize')]),
        p([text('Size presets for components:')]),
        CodeBlock(
          code: '''enum USize {
  xs,   // Extra small
  sm,   // Small
  md,   // Medium (default)
  lg,   // Large
  xl,   // Extra large
}''',
          language: 'dart',
        ),

        _buildSizeTable([
          ['xs', '24px', '12px'],
          ['sm', '28px', '14px'],
          ['md', '36px', '14px'],
          ['lg', '44px', '16px'],
          ['xl', '52px', '18px'],
        ]),

        h2(id: 'variants', [text('Variants')]),
        h3([text('UButtonVariant')]),
        CodeBlock(
          code: '''enum UButtonVariant {
  solid,    // Filled background
  outline,  // Border only
  soft,     // Muted background
  ghost,    // No background
  link,     // Text link style
}''',
          language: 'dart',
        ),

        Callout(
          type: 'info',
          title: 'Consistent API',
          children: [
            p([
              text('Common props like '),
              code([text('variant')]),
              text(', '),
              code([text('color')]),
              text(', and '),
              code([text('size')]),
              text(' work the same across all components.'),
            ]),
          ],
        ),
      ],
    );
  }

  Component _buildSizeTable(List<List<String>> sizes) {
    return div(classes: 'my-6 overflow-x-auto not-prose', [
      table(classes: 'w-full text-sm', [
        thead([
          tr(classes: 'border-b border-gray-800', [
            th(classes: 'text-left p-3 font-semibold text-white', [text('Size')]),
            th(classes: 'text-left p-3 font-semibold text-white', [text('Height')]),
            th(classes: 'text-left p-3 font-semibold text-white', [text('Font Size')]),
          ]),
        ]),
        tbody([
          for (final size in sizes)
            tr(classes: 'border-b border-gray-800', [
              td(classes: 'p-3', [
                code(classes: 'text-indigo-400', [text(size[0])]),
              ]),
              td(classes: 'p-3 text-gray-300', [text(size[1])]),
              td(classes: 'p-3 text-gray-300', [text(size[2])]),
            ]),
        ]),
      ]),
    ]);
  }
}
