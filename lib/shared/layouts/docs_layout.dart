import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../components/sidebar.dart';
import '../components/toc.dart';

/// Documentation layout with sidebar, main content, and table of contents
class DocsLayout extends StatelessComponent {
  final String title;
  final String? description;
  final List<Component> children;
  final List<TocItem> tocItems;
  final String currentPath;

  const DocsLayout({
    super.key,
    required this.title,
    this.description,
    required this.children,
    this.tocItems = const [],
    required this.currentPath,
  });

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex', [
      // Header
      header(classes: 'fixed top-0 left-0 right-0 z-50 h-16 bg-gray-950/80 backdrop-blur-sm border-b border-gray-800', [
        div(classes: 'h-full px-6 flex items-center justify-between max-w-screen-2xl mx-auto', [
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
              [
                // GitHub icon placeholder
                span(classes: 'text-sm', [text('GitHub')]),
              ],
            ),
          ]),
        ]),
      ]),

      // Sidebar
      Sidebar(currentPath: currentPath),

      // Main content
      main_(classes: 'flex-1 ml-64 mr-64 pt-16', [
        div(classes: 'max-w-3xl mx-auto px-8 py-12', [
          // Page header
          div(classes: 'mb-8', [
            h1(classes: 'text-3xl font-bold text-white mb-2', [text(title)]),
            if (description != null)
              p(classes: 'text-lg text-gray-400', [text(description!)]),
          ]),
          // Content
          div(classes: 'prose', children),
        ]),
      ]),

      // Table of contents
      if (tocItems.isNotEmpty)
        TableOfContents(items: tocItems),
    ]);
  }
}
