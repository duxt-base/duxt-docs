/// Markdown content pages for documentation
///
/// These components embed markdown content directly for static site generation.
library;

import 'package:jaspr/jaspr.dart';
import '../shared/layouts/docs_layout.dart';
import '../shared/components/toc.dart';
import '../shared/components/code_block.dart';

/// Getting Started page with embedded markdown
class GettingStartedMarkdownPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DocsLayout(
      title: 'Getting Started',
      description: 'Learn how to install and set up Duxt UI in your Jaspr project.',
      currentPath: '/getting-started',
      tocItems: [
        TocItem(label: 'Prerequisites', anchor: 'prerequisites'),
        TocItem(label: 'Installation', anchor: 'installation'),
        TocItem(label: 'Setup', anchor: 'setup'),
        TocItem(label: 'Your First Component', anchor: 'your-first-component'),
        TocItem(label: 'Next Steps', anchor: 'next-steps'),
      ],
      children: [
        _buildContent(),
      ],
    );
  }

  Component _buildContent() {
    return div(classes: 'prose prose-invert max-w-none', [
      h1(id: 'getting-started', [text('Getting Started')]),
      p([text('Welcome to Duxt UI! This guide will help you get started with building beautiful web applications using Duxt UI components.')]),

      h2(id: 'prerequisites', [text('Prerequisites')]),
      p([text('Before you begin, make sure you have the following installed:')]),
      ul([
        li([strong([text('Dart SDK 3.0')]), text(' or higher')]),
        li([strong([text('Jaspr CLI')]), text(' - Install with '), code([text('dart pub global activate jaspr_cli')])]),
        li([strong([text('A Jaspr project')]), text(' - Create one with '), code([text('jaspr create my_app')])]),
      ]),

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
      CodeBlock(code: 'dart pub get', language: 'bash'),

      h2(id: 'setup', [text('Setup')]),
      p([text('Duxt UI uses Tailwind CSS for styling. Make sure you have '), code([text('jaspr_tailwind')]), text(' configured in your project.')]),
      Callout(
        type: 'tip',
        title: 'Tailwind Configuration',
        children: [
          p([text('If you haven\'t set up Tailwind yet, add '), code([text('jaspr_tailwind')]), text(' to your dev dependencies and create a '), code([text('tailwind.config.js')]), text(' file.')]),
        ],
      ),
      p([text('Import Duxt UI in your Dart files:')]),
      CodeBlock(code: "import 'package:duxt_ui/duxt_ui.dart';", language: 'dart'),

      h2(id: 'your-first-component', [text('Your First Component')]),
      p([text('Now you\'re ready to use Duxt UI components! Here\'s a simple example:')]),
      CodeBlock(
        code: '''import 'package:jaspr/jaspr.dart';
import 'package:duxt_ui/duxt_ui.dart';

class MyPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield UButton(
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
    ]);
  }
}

/// Button documentation page with embedded markdown
class ButtonMarkdownPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DocsLayout(
      title: 'Button',
      description: 'A versatile button component with multiple variants, sizes, and states.',
      currentPath: '/components/button',
      tocItems: [
        TocItem(label: 'Basic Usage', anchor: 'basic-usage'),
        TocItem(label: 'Variants', anchor: 'variants'),
        TocItem(label: 'Colors', anchor: 'colors'),
        TocItem(label: 'Sizes', anchor: 'sizes'),
        TocItem(label: 'With Icons', anchor: 'with-icons'),
        TocItem(label: 'States', anchor: 'states'),
        TocItem(label: 'API Reference', anchor: 'api-reference'),
      ],
      children: [
        _buildContent(),
      ],
    );
  }

  Component _buildContent() {
    return div(classes: 'prose prose-invert max-w-none', [
      h1(id: 'button', [text('Button')]),
      p([text('The '), code([text('UButton')]), text(' component is a versatile button that supports multiple variants, sizes, colors, and states.')]),

      h2(id: 'basic-usage', [text('Basic Usage')]),
      CodeBlock(
        code: '''UButton(
  label: 'Click me',
  onPressed: () => print('Clicked!'),
)''',
        language: 'dart',
      ),

      h2(id: 'variants', [text('Variants')]),
      p([text('Buttons come in several variants:')]),

      h3([text('Solid')]),
      CodeBlock(
        code: '''UButton(
  label: 'Solid Button',
  variant: UButtonVariant.solid,
)''',
        language: 'dart',
      ),

      h3([text('Outline')]),
      CodeBlock(
        code: '''UButton(
  label: 'Outline Button',
  variant: UButtonVariant.outline,
)''',
        language: 'dart',
      ),

      h3([text('Soft')]),
      CodeBlock(
        code: '''UButton(
  label: 'Soft Button',
  variant: UButtonVariant.soft,
)''',
        language: 'dart',
      ),

      h3([text('Ghost')]),
      CodeBlock(
        code: '''UButton(
  label: 'Ghost Button',
  variant: UButtonVariant.ghost,
)''',
        language: 'dart',
      ),

      h2(id: 'colors', [text('Colors')]),
      p([text('Buttons support all theme colors:')]),
      CodeBlock(
        code: '''// Primary (default)
UButton(label: 'Primary', color: UColor.primary)

// Secondary
UButton(label: 'Secondary', color: UColor.secondary)

// Success
UButton(label: 'Success', color: UColor.success)

// Warning
UButton(label: 'Warning', color: UColor.warning)

// Error
UButton(label: 'Error', color: UColor.error)''',
        language: 'dart',
      ),

      h2(id: 'sizes', [text('Sizes')]),
      CodeBlock(
        code: '''// Extra small
UButton(label: 'XS', size: USize.xs)

// Small
UButton(label: 'SM', size: USize.sm)

// Medium (default)
UButton(label: 'MD', size: USize.md)

// Large
UButton(label: 'LG', size: USize.lg)

// Extra large
UButton(label: 'XL', size: USize.xl)''',
        language: 'dart',
      ),

      h2(id: 'with-icons', [text('With Icons')]),
      CodeBlock(
        code: '''UButton(
  label: 'Download',
  leadingIcon: Icons.download,
)

UButton(
  label: 'Next',
  trailingIcon: Icons.arrow_right,
)''',
        language: 'dart',
      ),

      h2(id: 'states', [text('States')]),
      h3([text('Loading')]),
      CodeBlock(
        code: '''UButton(
  label: 'Submit',
  loading: true,
)''',
        language: 'dart',
      ),

      h3([text('Disabled')]),
      CodeBlock(
        code: '''UButton(
  label: 'Disabled',
  disabled: true,
)''',
        language: 'dart',
      ),

      h2(id: 'api-reference', [text('API Reference')]),
      _buildApiTable(),
    ]);
  }

  Component _buildApiTable() {
    return div(classes: 'overflow-x-auto my-4', [
      table(classes: 'min-w-full divide-y divide-gray-700', [
        thead(classes: 'bg-gray-800', [
          tr([
            th(classes: 'px-4 py-2 text-left text-xs font-medium text-gray-300 uppercase', [text('Property')]),
            th(classes: 'px-4 py-2 text-left text-xs font-medium text-gray-300 uppercase', [text('Type')]),
            th(classes: 'px-4 py-2 text-left text-xs font-medium text-gray-300 uppercase', [text('Default')]),
            th(classes: 'px-4 py-2 text-left text-xs font-medium text-gray-300 uppercase', [text('Description')]),
          ]),
        ]),
        tbody(classes: 'bg-gray-900 divide-y divide-gray-800', [
          _tableRow('label', 'String', 'required', 'Button text'),
          _tableRow('variant', 'UButtonVariant', 'solid', 'Visual style'),
          _tableRow('color', 'UColor', 'primary', 'Color scheme'),
          _tableRow('size', 'USize', 'md', 'Button size'),
          _tableRow('loading', 'bool', 'false', 'Show loading state'),
          _tableRow('disabled', 'bool', 'false', 'Disable interaction'),
          _tableRow('block', 'bool', 'false', 'Full width'),
          _tableRow('leadingIcon', 'IconData?', 'null', 'Icon before label'),
          _tableRow('trailingIcon', 'IconData?', 'null', 'Icon after label'),
          _tableRow('onPressed', 'VoidCallback?', 'null', 'Click handler'),
        ]),
      ]),
    ]);
  }

  Component _tableRow(String prop, String type, String defaultVal, String desc) {
    return tr([
      td(classes: 'px-4 py-2 text-sm', [code([text(prop)])]),
      td(classes: 'px-4 py-2 text-sm text-gray-300', [code([text(type)])]),
      td(classes: 'px-4 py-2 text-sm text-gray-400', [code([text(defaultVal)])]),
      td(classes: 'px-4 py-2 text-sm text-gray-300', [text(desc)]),
    ]);
  }
}

/// Card documentation page with embedded markdown
class CardMarkdownPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DocsLayout(
      title: 'Card',
      description: 'A flexible card component for displaying content in a contained format.',
      currentPath: '/components/card',
      tocItems: [
        TocItem(label: 'Basic Usage', anchor: 'basic-usage'),
        TocItem(label: 'With Header', anchor: 'with-header'),
        TocItem(label: 'With Footer', anchor: 'with-footer'),
        TocItem(label: 'Variants', anchor: 'variants'),
        TocItem(label: 'API Reference', anchor: 'api-reference'),
      ],
      children: [
        _buildContent(),
      ],
    );
  }

  Component _buildContent() {
    return div(classes: 'prose prose-invert max-w-none', [
      h1(id: 'card', [text('Card')]),
      p([text('The '), code([text('UCard')]), text(' component provides a flexible container for displaying content with optional header, body, and footer sections.')]),

      h2(id: 'basic-usage', [text('Basic Usage')]),
      CodeBlock(
        code: '''UCard(
  body: [
    p([text('This is a basic card.')]),
  ],
)''',
        language: 'dart',
      ),

      h2(id: 'with-header', [text('With Header')]),
      CodeBlock(
        code: '''UCard(
  header: [
    h3([text('Card Title')]),
  ],
  body: [
    p([text('Card content goes here.')]),
  ],
)''',
        language: 'dart',
      ),

      h2(id: 'with-footer', [text('With Footer')]),
      CodeBlock(
        code: '''UCard(
  body: [
    p([text('Card content')]),
  ],
  footer: [
    UButton(label: 'Action'),
  ],
)''',
        language: 'dart',
      ),

      h2(id: 'variants', [text('Variants')]),
      h3([text('Default')]),
      CodeBlock(
        code: '''UCard(
  variant: UCardVariant.default_,
  body: [text('Default card')],
)''',
        language: 'dart',
      ),

      h3([text('Outlined')]),
      CodeBlock(
        code: '''UCard(
  variant: UCardVariant.outlined,
  body: [text('Outlined card')],
)''',
        language: 'dart',
      ),

      h3([text('Elevated')]),
      CodeBlock(
        code: '''UCard(
  variant: UCardVariant.elevated,
  body: [text('Elevated card')],
)''',
        language: 'dart',
      ),

      h2(id: 'api-reference', [text('API Reference')]),
      _buildApiTable(),
    ]);
  }

  Component _buildApiTable() {
    return div(classes: 'overflow-x-auto my-4', [
      table(classes: 'min-w-full divide-y divide-gray-700', [
        thead(classes: 'bg-gray-800', [
          tr([
            th(classes: 'px-4 py-2 text-left text-xs font-medium text-gray-300 uppercase', [text('Property')]),
            th(classes: 'px-4 py-2 text-left text-xs font-medium text-gray-300 uppercase', [text('Type')]),
            th(classes: 'px-4 py-2 text-left text-xs font-medium text-gray-300 uppercase', [text('Default')]),
            th(classes: 'px-4 py-2 text-left text-xs font-medium text-gray-300 uppercase', [text('Description')]),
          ]),
        ]),
        tbody(classes: 'bg-gray-900 divide-y divide-gray-800', [
          _tableRow('header', 'List<Component>?', 'null', 'Header content'),
          _tableRow('body', 'List<Component>', 'required', 'Main content'),
          _tableRow('footer', 'List<Component>?', 'null', 'Footer content'),
          _tableRow('variant', 'UCardVariant', 'default_', 'Visual style'),
          _tableRow('padding', 'bool', 'true', 'Add padding to sections'),
          _tableRow('onPressed', 'VoidCallback?', 'null', 'Click handler'),
        ]),
      ]),
    ]);
  }

  Component _tableRow(String prop, String type, String defaultVal, String desc) {
    return tr([
      td(classes: 'px-4 py-2 text-sm', [code([text(prop)])]),
      td(classes: 'px-4 py-2 text-sm text-gray-300', [code([text(type)])]),
      td(classes: 'px-4 py-2 text-sm text-gray-400', [code([text(defaultVal)])]),
      td(classes: 'px-4 py-2 text-sm text-gray-300', [text(desc)]),
    ]);
  }
}
