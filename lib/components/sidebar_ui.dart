import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Sidebar for Duxt UI documentation.
class SidebarUi extends StatelessComponent {
  const SidebarUi({super.key});

  @override
  Component build(BuildContext context) {
    return aside(
      classes: 'w-64 shrink-0 border-r border-zinc-800 p-6 overflow-y-auto',
      [
        nav([
          // Getting Started
          _buildGroup('Getting Started', [
            _buildLink('Introduction', '/duxt-ui'),
          ]),
          // Components
          _buildGroup('Components', [
            _buildLink('Button', '/duxt-ui/components/button'),
            _buildLink('Card', '/duxt-ui/components/card'),
            _buildLink('Input', '/duxt-ui/components/input'),
          ]),
        ]),
      ],
    );
  }

  Component _buildGroup(String title, List<Component> links) {
    return div(classes: 'mb-6', [
      h4(classes: 'text-sm font-semibold text-zinc-400 mb-3', [Component.text(title)]),
      ul(classes: 'space-y-1', links),
    ]);
  }

  Component _buildLink(String label, String href) {
    return li([
      a(
        href: href,
        classes:
            'block px-3 py-2 text-sm text-zinc-300 hover:text-cyan-400 hover:bg-zinc-800/50 rounded-md transition-colors',
        [Component.text(label)],
      ),
    ]);
  }
}
