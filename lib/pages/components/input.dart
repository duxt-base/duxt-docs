import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';
import '../../shared/components/code_block.dart';

/// Input component documentation
class InputPage extends StatelessComponent {
  const InputPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'Input',
      description: 'Text input fields for forms and user input.',
      currentPath: '/components/input',
      tocItems: const [
        TocItem(label: 'Usage', anchor: 'usage'),
        TocItem(label: 'Types', anchor: 'types'),
        TocItem(label: 'Variants', anchor: 'variants'),
        TocItem(label: 'States', anchor: 'states'),
        TocItem(label: 'Icons', anchor: 'icons'),
        TocItem(label: 'Validation', anchor: 'validation'),
        TocItem(label: 'Props', anchor: 'props'),
      ],
      children: [
        h2(id: 'usage', [text('Usage')]),
        p([text('Basic text input with label and placeholder:')]),
        CodeBlock(
          code: '''import 'package:duxt_ui/duxt_ui.dart';

UInput(
  label: 'Email',
  placeholder: 'Enter your email',
  type: 'email',
)''',
          language: 'dart',
        ),

        h2(id: 'types', [text('Types')]),
        p([text('Standard HTML input types are supported:')]),
        CodeBlock(
          code: '''// Text input (default)
UInput(label: 'Name', type: 'text')

// Email input
UInput(label: 'Email', type: 'email')

// Password input
UInput(label: 'Password', type: 'password')

// Number input
UInput(label: 'Age', type: 'number')''',
          language: 'dart',
        ),

        h2(id: 'variants', [text('Variants')]),
        h3([text('Outline (Default)')]),
        p([text('Standard bordered input:')]),
        CodeBlock(
          code: '''UInput(
  label: 'Email',
  variant: UInputVariant.outline,
)''',
          language: 'dart',
        ),

        h3([text('Filled')]),
        p([text('Input with background fill:')]),
        CodeBlock(
          code: '''UInput(
  label: 'Email',
  variant: UInputVariant.filled,
)''',
          language: 'dart',
        ),

        h2(id: 'states', [text('States')]),
        h3([text('Disabled')]),
        CodeBlock(
          code: '''UInput(
  label: 'Disabled',
  disabled: true,
  value: 'Cannot edit',
)''',
          language: 'dart',
        ),

        h3([text('Required')]),
        CodeBlock(
          code: '''UInput(
  label: 'Required Field',
  required: true,
)''',
          language: 'dart',
        ),

        h2(id: 'icons', [text('Icons')]),
        p([text('Add icons for visual context:')]),
        CodeBlock(
          code: '''// Leading icon
UInput(
  label: 'Email',
  leadingIcon: Icons.email,
)

// Trailing icon
UInput(
  label: 'Search',
  trailingIcon: Icons.search,
)''',
          language: 'dart',
        ),

        h2(id: 'validation', [text('Validation')]),
        h3([text('Error State')]),
        CodeBlock(
          code: '''UInput(
  label: 'Email',
  error: true,
  errorMessage: 'Please enter a valid email address',
)''',
          language: 'dart',
        ),

        h2(id: 'props', [text('Props')]),
        _buildPropsTable([
          ['label', 'String?', 'null', 'Input label text'],
          ['placeholder', 'String?', 'null', 'Placeholder text'],
          ['type', 'String', 'text', 'Input type'],
          ['variant', 'UInputVariant', 'outline', 'Visual style'],
          ['size', 'USize', 'md', 'Input size'],
          ['disabled', 'bool', 'false', 'Disable the input'],
          ['required', 'bool', 'false', 'Mark as required'],
          ['error', 'bool', 'false', 'Show error state'],
          ['errorMessage', 'String?', 'null', 'Error message'],
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
