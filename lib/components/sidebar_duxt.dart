import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Sidebar for Duxt Framework documentation.
class SidebarDuxt extends StatelessComponent {
  const SidebarDuxt({super.key});

  @override
  Component build(BuildContext context) {
    return aside(
      classes: 'w-64 shrink-0 border-r border-zinc-200 dark:border-zinc-800 bg-white dark:bg-zinc-950 p-6 overflow-y-auto',
      [
        nav([
          _buildGroup('Getting Started', [
            _buildLink('Introduction', '/duxt'),
          ]),
          _buildGroup('Core Concepts', [
            _buildLink('Modules', '/duxt/modules'),
            _buildLink('Routing', '/duxt/routing'),
            _buildLink('Layouts', '/duxt/layouts'),
            _buildLink('Middleware', '/duxt/middleware'),
          ]),
          _buildGroup('Features', [
            _buildLink('API Client', '/duxt/api-client'),
            _buildLink('State Management', '/duxt/state'),
            _buildLink('Server API', '/duxt/server'),
          ]),
          _buildGroup('CLI', [
            _buildLink('Commands', '/duxt/cli'),
          ]),
          _buildGroup('Deployment', [
            _buildLink('Deploy', '/duxt/deploy'),
          ]),
        ]),
      ],
    );
  }

  Component _buildGroup(String title, List<Component> links) {
    return div(classes: 'mb-6', [
      h4(classes: 'text-sm font-semibold text-zinc-500 dark:text-zinc-400 mb-3', [Component.text(title)]),
      ul(classes: 'space-y-1', links),
    ]);
  }

  Component _buildLink(String label, String href) {
    return li([
      a(
        href: href,
        classes: 'block px-3 py-2 text-sm text-zinc-600 dark:text-zinc-300 hover:text-cyan-600 dark:hover:text-cyan-400 hover:bg-zinc-100 dark:hover:bg-zinc-800/50 rounded-md transition-colors',
        [Component.text(label)],
      ),
    ]);
  }
}
