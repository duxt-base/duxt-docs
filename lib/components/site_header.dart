import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/components/sidebar_toggle_button.dart';
import 'package:jaspr_content/theme.dart';

/// A custom site header with logo and navigation items.
class SiteHeader extends StatelessComponent {
  const SiteHeader({
    required this.logo,
    this.logoAlt = 'Duxt',
    this.duxtVersion,
    this.duxtUiVersion,
    this.items = const [],
    super.key,
  });

  final String logo;
  final String logoAlt;
  final String? duxtVersion;
  final String? duxtUiVersion;
  final List<Component> items;

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Document.head(children: [
        Style(styles: _styles),
        Style(styles: _themeStyles),
        // Force dark mode as default
        RawText('''<script>
          (function() {
            var theme = localStorage.getItem('theme') || 'dark';
            document.documentElement.setAttribute('data-theme', theme);
            if (theme === 'dark') {
              document.documentElement.classList.add('dark');
            } else {
              document.documentElement.classList.remove('dark');
            }
          })();
        </script>'''),
      ]),
      header(classes: 'site-header', [
        SidebarToggleButton(),
        a(classes: 'site-logo', href: '/', [
          img(src: logo, alt: logoAlt, width: 32, height: 32),
        ]),
        div(classes: 'site-nav', [
          ...items,
          if (duxtVersion != null || duxtUiVersion != null)
            div(classes: 'site-versions', [
              if (duxtVersion != null)
                a(href: 'https://pub.dev/packages/duxt', target: Target.blank, classes: 'site-version', [text('v$duxtVersion')]),
              if (duxtUiVersion != null)
                a(href: 'https://pub.dev/packages/duxt_ui', target: Target.blank, classes: 'site-version site-version-ui', [text('UI $duxtUiVersion')]),
            ]),
        ]),
      ]),
    ]);
  }

  // Theme CSS variables (needed for component pages outside ContentApp)
  // Dark mode is default
  static List<StyleRule> get _themeStyles => [
    css(':root', [
      css('&').styles(raw: {
        '--background': 'oklch(0.141 0.005 285.823)',
        '--text': '#e4e4e7',
        '--primary': '#22d3ee',
        'color-scheme': 'dark',
      }),
    ]),
    css(':root[data-theme="light"]', [
      css('&').styles(raw: {
        '--background': 'oklch(0.984 0.003 247.858)',
        '--text': '#18181b',
        '--primary': '#06b6d4',
        'color-scheme': 'light',
      }),
    ]),
    css(':root[data-theme="dark"]', [
      css('&').styles(raw: {
        '--background': 'oklch(0.141 0.005 285.823)',
        '--text': '#e4e4e7',
        '--primary': '#22d3ee',
        'color-scheme': 'dark',
      }),
    ]),
  ];

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
          bottom: BorderSide(color: Color('#e4e4e7'), width: 1.px),
        ),
        backgroundColor: Color('#ffffff'),
        raw: {'backdrop-filter': 'blur(8px)'},
      ),
      css.media(MediaQuery.all(minWidth: 768.px), [
        css('&').styles(padding: Padding.symmetric(horizontal: 2.rem)),
      ]),
    ]),
    css(':root[data-theme="dark"] .site-header, .dark .site-header', [
      css('&').styles(
        border: Border.only(
          bottom: BorderSide(color: Color('#27272a'), width: 1.px),
        ),
        backgroundColor: Color('#09090b'),
      ),
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
    css('.site-versions', [
      css('&').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
        gap: Gap.column(0.5.rem),
      ),
    ]),
    css('.site-version', [
      css('&').styles(
        padding: Padding.symmetric(horizontal: 0.5.rem, vertical: 0.125.rem),
        backgroundColor: Color('#22d3ee40'),
        color: Color('#67e8f9'),
        raw: {
          'font-size': '0.75rem',
          'font-weight': '600',
          'border-radius': '4px',
          'text-decoration': 'none',
          'transition': 'opacity 0.2s',
          'border': '1px solid #22d3ee50',
        },
      ),
      css('&:hover').styles(
        raw: {'opacity': '0.9', 'background-color': '#22d3ee50'},
      ),
    ]),
    css('.site-version-ui', [
      css('&').styles(
        backgroundColor: Color('#a855f740'),
        color: Color('#c084fc'),
        raw: {'border': '1px solid #a855f750'},
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
