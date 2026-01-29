import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/theme.dart';

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
    return Component.fragment([
      Document.head(children: [Style(styles: _styles)]),
      a(classes: 'nav-link', href: href, [Component.text(text)]),
    ]);
  }

  static List<StyleRule> get _styles => [
    css('.nav-link', [
      css('&').styles(
        padding: Padding.symmetric(horizontal: 0.75.rem, vertical: 0.5.rem),
        fontSize: 0.875.rem,
        fontWeight: FontWeight.w500,
        color: ContentColors.text,
        radius: BorderRadius.circular(0.375.rem),
        transition: Transition('all', duration: 150.ms),
      ),
      css('&:hover').styles(
        color: ContentColors.primary,
        backgroundColor: Color('#06b6d410'),
      ),
    ]),
  ];
}
