import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/components/sidebar_toggle_button.dart';
import 'package:jaspr_content/theme.dart';

/// A custom site header with logo and navigation items.
class SiteHeader extends StatelessComponent {
  const SiteHeader({
    required this.logo,
    this.logoAlt = 'Duxt',
    this.items = const [],
    super.key,
  });

  final String logo;
  final String logoAlt;
  final List<Component> items;

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Document.head(children: [Style(styles: _styles)]),
      header(classes: 'site-header', [
        SidebarToggleButton(),
        a(classes: 'site-logo', href: '/', [
          img(src: logo, alt: logoAlt, width: 32, height: 32),
        ]),
        div(classes: 'site-nav', items),
      ]),
    ]);
  }

  static List<StyleRule> get _styles => [
    css('.site-header', [
      css('&').styles(
        position: Position.fixed(top: Unit.zero, left: Unit.zero, right: Unit.zero),
        zIndex: ZIndex(50),
        height: 4.rem,
        display: Display.flex,
        alignItems: AlignItems.center,
        gap: Gap.column(1.rem),
        padding: Padding.symmetric(horizontal: 1.rem),
        border: Border.only(
          bottom: BorderSide(color: Color('#0000000d'), width: 1.px),
        ),
        backgroundColor: ContentColors.background,
        raw: {'backdrop-filter': 'blur(8px)'},
      ),
      css.media(MediaQuery.all(minWidth: 768.px), [
        css('&').styles(padding: Padding.symmetric(horizontal: 2.rem)),
      ]),
    ]),
    css('.site-logo', [
      css('&').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
      ),
      css('img').styles(
        height: 2.rem,
        width: Unit.auto,
      ),
    ]),
    css('.site-nav', [
      css('&').styles(
        display: Display.flex,
        flex: Flex(grow: 1),
        justifyContent: JustifyContent.end,
        alignItems: AlignItems.center,
        gap: Gap.column(0.5.rem),
      ),
    ]),
  ];
}
