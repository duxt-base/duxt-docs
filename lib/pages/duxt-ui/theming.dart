import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';
import '../../shared/components/code_block.dart';

/// Theming documentation page
class ThemingPage extends StatelessComponent {
  const ThemingPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'Theming',
      description: 'Customize the look and feel of Duxt UI components.',
      currentPath: '/duxt-ui/theming',
      tocItems: const [
        TocItem(label: 'Color System', anchor: 'color-system'),
        TocItem(label: 'Customizing Colors', anchor: 'customizing-colors'),
        TocItem(label: 'Dark Mode', anchor: 'dark-mode'),
        TocItem(label: 'Component Variants', anchor: 'component-variants'),
      ],
      children: [
        h2(id: 'color-system', [text('Color System')]),
        p([text('Duxt UI uses a semantic color system:')]),

        _buildColorTable([
          ['primary', 'Indigo', 'Primary actions'],
          ['secondary', 'Purple', 'Secondary actions'],
          ['success', 'Green', 'Success states'],
          ['warning', 'Yellow', 'Warning states'],
          ['error', 'Red', 'Error states'],
          ['gray', 'Slate', 'Neutral elements'],
        ]),

        h2(id: 'customizing-colors', [text('Customizing Colors')]),
        p([text('Override colors in '), code([text('tailwind.config.js')]), text(':')]),
        CodeBlock(
          code: '''module.exports = {
  theme: {
    extend: {
      colors: {
        primary: {
          500: '#14b8a6',
          600: '#0d9488',
          // ... other shades
        },
      },
    },
  },
}''',
          language: 'javascript',
          filename: 'tailwind.config.js',
        ),

        Callout(
          type: 'tip',
          title: 'Color Generators',
          children: [
            p([
              text('Use tools like '),
              a(href: 'https://uicolors.app', [text('UI Colors')]),
              text(' to generate palettes.'),
            ]),
          ],
        ),

        h2(id: 'dark-mode', [text('Dark Mode')]),
        p([text('Duxt UI is designed for dark mode by default.')]),
        CodeBlock(
          code: '''// Text colors
text-white       // Primary text
text-gray-400    // Muted text

// Backgrounds
bg-gray-950      // Page background
bg-gray-900      // Card background''',
          language: 'css',
        ),

        h2(id: 'component-variants', [text('Component Variants')]),
        p([text('Components support multiple visual variants:')]),
        CodeBlock(
          code: '''UButton(label: 'Solid', variant: UButtonVariant.solid)
UButton(label: 'Outline', variant: UButtonVariant.outline)
UButton(label: 'Soft', variant: UButtonVariant.soft)
UButton(label: 'Ghost', variant: UButtonVariant.ghost)''',
          language: 'dart',
        ),
      ],
    );
  }

  Component _buildColorTable(List<List<String>> colors) {
    return div(classes: 'my-6 overflow-x-auto not-prose', [
      table(classes: 'w-full text-sm', [
        thead([
          tr(classes: 'border-b border-gray-800', [
            th(classes: 'text-left p-3 font-semibold text-white', [text('Token')]),
            th(classes: 'text-left p-3 font-semibold text-white', [text('Color')]),
            th(classes: 'text-left p-3 font-semibold text-white', [text('Usage')]),
          ]),
        ]),
        tbody([
          for (final color in colors)
            tr(classes: 'border-b border-gray-800', [
              td(classes: 'p-3', [
                code(classes: 'text-indigo-400', [text(color[0])]),
              ]),
              td(classes: 'p-3 text-gray-300', [text(color[1])]),
              td(classes: 'p-3 text-gray-400', [text(color[2])]),
            ]),
        ]),
      ]),
    ]);
  }
}
