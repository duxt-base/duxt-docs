import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';
import '../../shared/components/code_block.dart';

/// Button component documentation
class ButtonPage extends StatelessComponent {
  const ButtonPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'Button',
      description: 'Trigger actions and events with customizable buttons.',
      currentPath: '/components/button',
      tocItems: const [
        TocItem(label: 'Usage', anchor: 'usage'),
        TocItem(label: 'Variants', anchor: 'variants'),
        TocItem(label: 'Colors', anchor: 'colors'),
        TocItem(label: 'Sizes', anchor: 'sizes'),
        TocItem(label: 'States', anchor: 'states'),
        TocItem(label: 'Icons', anchor: 'icons'),
        TocItem(label: 'Props', anchor: 'props'),
      ],
      children: [
        // Usage
        h2(id: 'usage', [text('Usage')]),
        p([text('Import the component and use it in your Jaspr pages:')]),
        CodeBlock(
          code: '''import 'package:duxt_ui/duxt_ui.dart';

UButton(
  label: 'Click me',
  onPressed: () => print('Clicked!'),
)''',
          language: 'dart',
        ),

        // Variants
        h2(id: 'variants', [text('Variants')]),
        p([text('The button comes in several visual variants:')]),

        h3([text('Solid')]),
        p([text('The default filled button style.')]),
        _buildPreview(
          '''UButton(label: 'Solid', variant: UButtonVariant.solid)''',
        ),

        h3([text('Outline')]),
        p([text('A bordered button without fill.')]),
        _buildPreview(
          '''UButton(label: 'Outline', variant: UButtonVariant.outline)''',
        ),

        h3([text('Soft')]),
        p([text('A subtle button with muted background.')]),
        _buildPreview(
          '''UButton(label: 'Soft', variant: UButtonVariant.soft)''',
        ),

        h3([text('Ghost')]),
        p([text('A minimal button with no background.')]),
        _buildPreview(
          '''UButton(label: 'Ghost', variant: UButtonVariant.ghost)''',
        ),

        h3([text('Link')]),
        p([text('A button styled as a text link.')]),
        _buildPreview(
          '''UButton(label: 'Link', variant: UButtonVariant.link)''',
        ),

        // Colors
        h2(id: 'colors', [text('Colors')]),
        p([text('Apply different color themes to buttons:')]),
        CodeBlock(
          code: '''// Available colors
UButton(label: 'Primary', color: UColor.primary)
UButton(label: 'Secondary', color: UColor.secondary)
UButton(label: 'Success', color: UColor.success)
UButton(label: 'Warning', color: UColor.warning)
UButton(label: 'Error', color: UColor.error)
UButton(label: 'Gray', color: UColor.gray)''',
          language: 'dart',
        ),

        // Sizes
        h2(id: 'sizes', [text('Sizes')]),
        p([text('Buttons come in different sizes to fit your design:')]),
        CodeBlock(
          code: '''UButton(label: 'Extra Small', size: USize.xs)
UButton(label: 'Small', size: USize.sm)
UButton(label: 'Medium', size: USize.md) // default
UButton(label: 'Large', size: USize.lg)
UButton(label: 'Extra Large', size: USize.xl)''',
          language: 'dart',
        ),

        // States
        h2(id: 'states', [text('States')]),

        h3([text('Loading')]),
        p([text('Show a loading spinner while an action is in progress:')]),
        CodeBlock(
          code: '''UButton(
  label: 'Submitting...',
  loading: true,
)''',
          language: 'dart',
        ),

        h3([text('Disabled')]),
        p([text('Prevent interaction when the button is disabled:')]),
        CodeBlock(
          code: '''UButton(
  label: 'Disabled',
  disabled: true,
)''',
          language: 'dart',
        ),

        // Icons
        h2(id: 'icons', [text('Icons')]),
        p([text('Add icons to buttons for visual context:')]),
        CodeBlock(
          code: '''// Leading icon
UButton(
  label: 'Download',
  leadingIcon: Icons.download,
)

// Trailing icon
UButton(
  label: 'Next',
  trailingIcon: Icons.arrowRight,
)

// Icon only
UButton(
  icon: Icons.plus,
  variant: UButtonVariant.soft,
)''',
          language: 'dart',
        ),

        // Props
        h2(id: 'props', [text('Props')]),
        _buildPropsTable([
          ['label', 'String?', 'null', 'Button text content'],
          ['variant', 'UButtonVariant', 'solid', 'Visual style variant'],
          ['color', 'UColor', 'primary', 'Color theme'],
          ['size', 'USize', 'md', 'Button size'],
          ['disabled', 'bool', 'false', 'Disable interactions'],
          ['loading', 'bool', 'false', 'Show loading spinner'],
          ['block', 'bool', 'false', 'Full width button'],
          ['leadingIcon', 'IconData?', 'null', 'Icon before label'],
          ['trailingIcon', 'IconData?', 'null', 'Icon after label'],
          ['icon', 'IconData?', 'null', 'Icon only (no label)'],
          ['onPressed', 'VoidCallback?', 'null', 'Click handler'],
        ]),
      ],
    );
  }

  Component _buildPreview(String codeText) {
    return div(classes: 'my-4 border border-gray-800 rounded-lg overflow-hidden not-prose', [
      div(classes: 'p-6 bg-gray-900/50 flex items-center gap-4', [
        div(classes: 'px-4 py-2 bg-indigo-600 text-white rounded-md text-sm font-medium', [
          text('Button'),
        ]),
      ]),
      div(classes: 'border-t border-gray-800 p-4 bg-gray-900', [
        pre(classes: 'text-sm text-gray-300', [
          code([text(codeText)]),
        ]),
      ]),
    ]);
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
