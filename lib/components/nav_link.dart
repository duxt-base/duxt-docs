import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// A styled navigation link for the header.
class NavLink extends StatelessComponent {
  const NavLink({
    required this.href,
    required this.text,
    super.key,
  });

  final String href;
  final String text;

  @override
  Component build(BuildContext context) {
    return a(
      classes: 'px-3 py-2 text-sm font-medium text-zinc-700 dark:text-zinc-300 hover:text-cyan-600 dark:hover:text-cyan-400 hover:bg-cyan-500/10 rounded-md transition-all',
      href: href,
      [Component.text(text)],
    );
  }
}
