import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Home page - Landing page for Duxt documentation
class IndexPage extends StatelessComponent {
  const IndexPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen bg-gray-950', [
      // Header
      _buildHeader(),
      // Hero Section
      _buildHero(),
      // Features Section
      _buildFeatures(),
      // Quick Start Section
      _buildQuickStart(),
      // Footer
      _buildFooter(),
    ]);
  }

  Component _buildHeader() {
    return header(classes: 'fixed top-0 left-0 right-0 z-50 h-16 bg-gray-950/80 backdrop-blur-sm border-b border-gray-800', [
      div(classes: 'h-full px-6 flex items-center justify-between max-w-screen-xl mx-auto', [
        // Logo
        a(href: '/', classes: 'flex items-center gap-3', [
          div(classes: 'w-8 h-8 bg-gradient-to-br from-indigo-500 to-purple-600 rounded-lg flex items-center justify-center', [
            span(classes: 'text-white font-bold text-sm', [text('D')]),
          ]),
          span(classes: 'text-xl font-semibold text-white', [text('Duxt')]),
        ]),
        // Navigation
        nav(classes: 'hidden md:flex items-center gap-6', [
          a(href: '/getting-started', classes: 'text-sm text-gray-400 hover:text-white transition-colors', [text('Docs')]),
          a(href: '/components', classes: 'text-sm text-gray-400 hover:text-white transition-colors', [text('Components')]),
          a(href: '/duxt-ui', classes: 'text-sm text-gray-400 hover:text-white transition-colors', [text('Duxt UI')]),
          a(href: '/api', classes: 'text-sm text-gray-400 hover:text-white transition-colors', [text('API')]),
        ]),
        // Right side
        div(classes: 'flex items-center gap-4', [
          a(
            href: 'https://github.com/duxt-ui/duxt',
            target: Target.blank,
            classes: 'text-gray-400 hover:text-white transition-colors',
            [span(classes: 'text-sm', [text('GitHub')])],
          ),
        ]),
      ]),
    ]);
  }

  Component _buildHero() {
    return section(classes: 'pt-32 pb-20 px-6', [
      div(classes: 'max-w-screen-xl mx-auto text-center', [
        // Badge
        div(classes: 'inline-flex items-center gap-2 px-3 py-1 rounded-full bg-indigo-500/10 border border-indigo-500/20 text-indigo-400 text-sm mb-6', [
          text('v0.1.0'),
          span(classes: 'text-gray-500', [text('|')]),
          text('Inspired by Nuxt UI'),
        ]),
        // Title
        h1(classes: 'text-5xl md:text-6xl font-bold text-white mb-6 leading-tight', [
          text('Build beautiful web apps'),
          br(),
          span(classes: 'bg-gradient-to-r from-indigo-400 to-purple-400 bg-clip-text text-transparent', [
            text('with Flutter and Jaspr'),
          ]),
        ]),
        // Description
        p(classes: 'text-xl text-gray-400 max-w-2xl mx-auto mb-10', [
          text('A comprehensive UI component library for Jaspr, bringing the elegance of Nuxt UI to the Flutter web ecosystem.'),
        ]),
        // CTA Buttons
        div(classes: 'flex flex-wrap items-center justify-center gap-4', [
          a(href: '/getting-started', classes: 'px-6 py-3 bg-indigo-600 hover:bg-indigo-500 text-white font-medium rounded-lg transition-colors', [
            text('Get Started'),
          ]),
          a(href: '/components', classes: 'px-6 py-3 bg-gray-800 hover:bg-gray-700 text-white font-medium rounded-lg transition-colors', [
            text('Browse Components'),
          ]),
        ]),
        // Code example
        div(classes: 'mt-16 max-w-2xl mx-auto', [
          div(classes: 'bg-gray-900 border border-gray-800 rounded-lg p-6 text-left', [
            pre(classes: 'text-sm', [
              code(classes: 'text-gray-300', [
                span(classes: 'text-purple-400', [text('import ')]),
                span(classes: 'text-green-400', [text("'package:duxt_ui/duxt_ui.dart'")]),
                span(classes: 'text-purple-400', [text(';\n\n')]),
                span(classes: 'text-gray-500', [text('// Create beautiful buttons\n')]),
                span(classes: 'text-blue-400', [text('UButton')]),
                text('(\n  label: '),
                span(classes: 'text-green-400', [text("'Click me'")]),
                text(',\n  variant: '),
                span(classes: 'text-blue-400', [text('UButtonVariant')]),
                text('.solid,\n  color: '),
                span(classes: 'text-blue-400', [text('UColor')]),
                text('.primary,\n)'),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildFeatures() {
    final features = [
      {
        'title': 'Beautiful Components',
        'description': 'Carefully crafted UI components inspired by Nuxt UI, designed for modern web applications.',
        'icon': 'cube',
      },
      {
        'title': 'Fully Customizable',
        'description': 'Every component is themeable with support for colors, sizes, and variants.',
        'icon': 'paint',
      },
      {
        'title': 'Tailwind Integration',
        'description': 'Built with Tailwind CSS for maximum flexibility and consistent styling.',
        'icon': 'wind',
      },
      {
        'title': 'Dark Mode Ready',
        'description': 'All components work seamlessly in both light and dark modes.',
        'icon': 'moon',
      },
      {
        'title': 'Type Safe',
        'description': 'Full Dart type safety with comprehensive API documentation.',
        'icon': 'shield',
      },
      {
        'title': 'SSG Ready',
        'description': 'Works perfectly with Jaspr\'s static site generation for fast loading pages.',
        'icon': 'rocket',
      },
    ];

    return section(classes: 'py-20 px-6 bg-gray-900/50', [
      div(classes: 'max-w-screen-xl mx-auto', [
        // Section header
        div(classes: 'text-center mb-16', [
          h2(classes: 'text-3xl font-bold text-white mb-4', [text('Everything you need')]),
          p(classes: 'text-lg text-gray-400', [text('A complete toolkit for building professional web applications.')]),
        ]),
        // Features grid
        div(classes: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6', [
          for (final feature in features)
            div(classes: 'p-6 bg-gray-900 border border-gray-800 rounded-lg hover:border-gray-700 transition-colors', [
              div(classes: 'w-10 h-10 bg-indigo-500/10 rounded-lg flex items-center justify-center mb-4', [
                span(classes: 'text-indigo-400', [text(feature['icon']![0].toUpperCase())]),
              ]),
              h3(classes: 'text-lg font-semibold text-white mb-2', [text(feature['title']!)]),
              p(classes: 'text-gray-400 text-sm', [text(feature['description']!)]),
            ]),
        ]),
      ]),
    ]);
  }

  Component _buildQuickStart() {
    return section(classes: 'py-20 px-6', [
      div(classes: 'max-w-screen-xl mx-auto', [
        div(classes: 'text-center mb-12', [
          h2(classes: 'text-3xl font-bold text-white mb-4', [text('Quick Start')]),
          p(classes: 'text-lg text-gray-400', [text('Get up and running in minutes.')]),
        ]),
        div(classes: 'max-w-2xl mx-auto space-y-6', [
          // Step 1
          _buildStep('1', 'Add dependency', '''dependencies:
  duxt_ui:
    git:
      url: https://github.com/duxt-ui/duxt_ui.git'''),
          // Step 2
          _buildStep('2', 'Import and use', '''import 'package:duxt_ui/duxt_ui.dart';

UButton(
  label: 'Hello Duxt!',
  onPressed: () => print('Clicked!'),
)'''),
        ]),
      ]),
    ]);
  }

  Component _buildStep(String number, String title, String codeText) {
    return div(classes: 'flex gap-4', [
      div(classes: 'flex-shrink-0 w-8 h-8 bg-indigo-600 rounded-full flex items-center justify-center text-white font-semibold text-sm', [
        text(number),
      ]),
      div(classes: 'flex-1', [
        h3(classes: 'text-white font-medium mb-3', [text(title)]),
        div(classes: 'bg-gray-900 border border-gray-800 rounded-lg p-4', [
          pre(classes: 'text-sm text-gray-300 overflow-x-auto', [
            code([text(codeText)]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildFooter() {
    return footer(classes: 'py-12 px-6 border-t border-gray-800', [
      div(classes: 'max-w-screen-xl mx-auto', [
        div(classes: 'flex flex-col md:flex-row items-center justify-between gap-4', [
          div(classes: 'flex items-center gap-3', [
            div(classes: 'w-6 h-6 bg-gradient-to-br from-indigo-500 to-purple-600 rounded flex items-center justify-center', [
              span(classes: 'text-white font-bold text-xs', [text('D')]),
            ]),
            span(classes: 'text-gray-400 text-sm', [text('Duxt UI')]),
          ]),
          p(classes: 'text-gray-500 text-sm', [
            text('Built with Jaspr and Tailwind CSS. Inspired by Nuxt UI.'),
          ]),
        ]),
      ]),
    ]);
  }
}
