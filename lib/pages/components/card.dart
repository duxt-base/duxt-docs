import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';
import '../../shared/components/code_block.dart';

/// Card component documentation
class CardPage extends StatelessComponent {
  const CardPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'Card',
      description: 'Container component for grouping related content.',
      currentPath: '/components/card',
      tocItems: const [
        TocItem(label: 'Usage', anchor: 'usage'),
        TocItem(label: 'Sections', anchor: 'sections'),
        TocItem(label: 'Variants', anchor: 'variants'),
        TocItem(label: 'Props', anchor: 'props'),
      ],
      children: [
        h2(id: 'usage', [text('Usage')]),
        p([text('Basic card with content:')]),
        CodeBlock(
          code: '''import 'package:duxt_ui/duxt_ui.dart';

UCard(
  children: [
    p([text('Card content goes here.')]),
  ],
)''',
          language: 'dart',
        ),

        h2(id: 'sections', [text('Sections')]),
        p([text('Cards can have optional header and footer sections:')]),

        h3([text('With Header')]),
        CodeBlock(
          code: '''UCard(
  header: [
    h3(classes: 'text-lg font-semibold', [text('Card Title')]),
  ],
  children: [
    p([text('Main content area.')]),
  ],
)''',
          language: 'dart',
        ),

        h3([text('With Footer')]),
        CodeBlock(
          code: '''UCard(
  children: [
    p([text('Main content area.')]),
  ],
  footer: [
    div(classes: 'flex justify-end gap-2', [
      UButton(label: 'Cancel', variant: UButtonVariant.ghost),
      UButton(label: 'Save', variant: UButtonVariant.solid),
    ]),
  ],
)''',
          language: 'dart',
        ),

        h2(id: 'variants', [text('Variants')]),
        h3([text('Bordered (Default)')]),
        CodeBlock(
          code: '''UCard(
  variant: UCardVariant.bordered,
  children: [...],
)''',
          language: 'dart',
        ),

        h3([text('Elevated')]),
        CodeBlock(
          code: '''UCard(
  variant: UCardVariant.elevated,
  children: [...],
)''',
          language: 'dart',
        ),

        h2(id: 'props', [text('Props')]),
        _buildPropsTable([
          ['variant', 'UCardVariant', 'bordered', 'Visual style variant'],
          ['header', 'List<Component>?', 'null', 'Header content'],
          ['children', 'List<Component>', 'required', 'Body content'],
          ['footer', 'List<Component>?', 'null', 'Footer content'],
          ['padding', 'bool', 'true', 'Apply padding'],
          ['hoverable', 'bool', 'false', 'Show hover effect'],
        ]),
      ],
    );
  }

  Component _buildPropsTable(List<List<String>> props) {
    return div(classes: 'my-6 overflow-x-auto not-prose', [
      table(classes: 'w-full text-sm', [
        thead([
          tr(classes: 'border-b border-gray-800', [
            th(classes: 'text-left p-3 font-semibold text-white', [text('Prop')]),
            th(classes: 'text-left p-3 font-semibold text-white', [text('Type')]),
            th(classes: 'text-left p-3 font-semibold text-white', [text('Default')]),
            th(classes: 'text-left p-3 font-semibold text-white', [text('Description')]),
          ]),
        ]),
        tbody([
          for (final prop in props)
            tr(classes: 'border-b border-gray-800', [
              td(classes: 'p-3', [
                code(classes: 'text-indigo-400', [text(prop[0])]),
              ]),
              td(classes: 'p-3 text-gray-400', [text(prop[1])]),
              td(classes: 'p-3', [
                code(classes: 'text-gray-500', [text(prop[2])]),
              ]),
              td(classes: 'p-3 text-gray-300', [text(prop[3])]),
            ]),
        ]),
      ]),
    ]);
  }
}
