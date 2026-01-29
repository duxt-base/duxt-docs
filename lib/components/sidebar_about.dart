import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Sidebar for About section.
class DocsSidebarAbout extends StatelessComponent {
  const DocsSidebarAbout({super.key});

  @override
  Component build(BuildContext context) {
    return aside(
      classes: 'w-64 shrink-0 border-r border-zinc-800 p-6 overflow-y-auto',
      [
        nav([
          // About
          _buildGroup('About', [
            _buildLink('Overview', '/about'),
          ]),
        ]),
      ],
    );
  }

  Component _buildGroup(String title, List<Component> links) {
    return div(classes: 'mb-6', [
      h4(classes: 'text-sm font-semibold text-zinc-400 mb-3', [text(title)]),
      ul(classes: 'space-y-1', links),
    ]);
  }

  Component _buildLink(String label, String href) {
    return li([
      a(
        href: href,
        classes:
            'block px-3 py-2 text-sm text-zinc-300 hover:text-cyan-400 hover:bg-zinc-800/50 rounded-md transition-colors',
        [text(label)],
      ),
    ]);
  }
}
