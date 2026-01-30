import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

/// A styled navigation link for the header with active state.
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
    final currentPath = Router.of(context).matchList.uri.path;
    // Check exact match OR path is a subpath (followed by /)
    final isActive = currentPath == href ||
        (href != '/' && (currentPath.startsWith('$href/') || currentPath == href));

    return a(
      classes: 'nav-link px-3 py-2 text-sm font-medium rounded-md transition-all ${isActive ? "nav-link-active" : ""}',
      styles: Styles(raw: {
        'font-family': "'Nunito', system-ui, sans-serif",
      }),
      href: href,
      [Component.text(text)],
    );
  }
}
