import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

import 'nav_link.dart';

/// Unified site header used across all layouts.
/// Can be used with no parameters for a clean default header,
/// or with custom items for backwards compatibility.
class SiteHeader extends StatelessComponent {
  const SiteHeader({
    this.logo = '/images/logo.svg',
    this.logoAlt = 'Duxt',
    this.duxtVersion,
    this.duxtUiVersion,
    this.items,
    super.key,
  });

  final String logo;
  final String logoAlt;
  final String? duxtVersion;
  final String? duxtUiVersion;
  final List<Component>? items;

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Document.head(children: [
        Style(styles: _styles),
        _themeScript(),
      ]),
      header(classes: 'site-header', [
        // Logo
        a(classes: 'site-logo', href: '/', [
          img(src: logo, alt: logoAlt, width: 56, height: 56),
        ]),
        // Navigation - use custom items if provided, otherwise default nav
        if (items != null)
          nav(classes: 'site-nav', items!)
        else
          nav(classes: 'site-nav', [
            NavLink(href: '/duxt', text: 'Duxt'),
            NavLink(href: '/duxt-ui', text: 'Duxt UI'),
            NavLink(href: '/duxt-orm', text: 'Duxt ORM'),
            NavLink(href: '/about', text: 'About'),
          ]),
        // Right side - only show if no custom items (items handle their own right content)
        if (items == null)
          div(classes: 'site-header-right', [
            a(
              href: 'https://github.com/duxt-base/duxt',
              target: Target.blank,
              classes: 'site-github',
              [
                RawText(
                    '<svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/></svg>'),
              ],
            ),
            ThemeToggle(),
          ]),
      ]),
    ]);
  }

  static Component _themeScript() {
    return RawText('''<script>
      (function() {
        var theme = localStorage.getItem('jaspr:theme') || localStorage.getItem('theme') || 'dark';
        document.documentElement.setAttribute('data-theme', theme);
        if (theme === 'dark') {
          document.documentElement.classList.add('dark');
        } else {
          document.documentElement.classList.remove('dark');
        }
        var observer = new MutationObserver(function(mutations) {
          mutations.forEach(function(mutation) {
            if (mutation.attributeName === 'data-theme') {
              var newTheme = document.documentElement.getAttribute('data-theme');
              if (newTheme === 'dark') {
                document.documentElement.classList.add('dark');
              } else {
                document.documentElement.classList.remove('dark');
              }
            }
          });
        });
        observer.observe(document.documentElement, { attributes: true });
      })();
    </script>''');
  }

  static List<StyleRule> get _styles => [
    // CSS Variables
    css(':root', [
      css('&').styles(raw: {
        '--background': '#09090b',
        '--text': '#e4e4e7',
        '--nav-text': '#a1a1aa',
        '--nav-hover': '#22d3ee',
      }),
    ]),
    css(':root[data-theme="light"]', [
      css('&').styles(raw: {
        '--background': '#cbd5e1',
        '--text': '#1e293b',
        '--nav-text': '#3f3f46',
        '--nav-hover': '#0891b2',
      }),
    ]),

    // Nav links
    css('.nav-link', [
      css('&').styles(raw: {
        'color': 'var(--nav-text)',
        'font-family': "'Nunito', system-ui, sans-serif",
      }),
      css('&:hover').styles(raw: {
        'color': 'var(--nav-hover)',
        'background-color': 'rgba(6, 182, 212, 0.1)',
      }),
    ]),
    css('.nav-link.nav-link-active', [
      css('&').styles(raw: {
        'color': 'var(--nav-hover) !important',
        'background-color': 'rgba(6, 182, 212, 0.15)',
      }),
    ]),

    // Header
    css('.site-header', [
      css('&').styles(
        position: Position.fixed(top: Unit.zero, left: Unit.zero, right: Unit.zero),
        zIndex: ZIndex(100),
        height: Unit.pixels(64),
        display: Display.flex,
        alignItems: AlignItems.center,
        gap: Gap.column(1.5.rem),
        padding: Padding.symmetric(horizontal: 1.5.rem),
        backgroundColor: Color('var(--background)'),
        border: Border.only(bottom: BorderSide(color: Color('#27272a'), width: 1.px)),
      ),
    ]),

    // Light mode header
    css(':root[data-theme="light"] .site-header', [
      css('&').styles(
        border: Border.only(bottom: BorderSide(color: Color('#e4e4e7'), width: 1.px)),
      ),
    ]),

    // Logo
    css('.site-logo', [
      css('&').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
        gap: Gap.column(0.5.rem),
        raw: {
          'text-decoration': 'none',
          'font-weight': '700',
          'font-size': '1.25rem',
          'color': 'var(--text)',
        },
      ),
      css('img').styles(height: 56.px, width: 56.px),
    ]),

    // Navigation
    css('.site-nav', [
      css('&').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
        gap: Gap.column(0.25.rem),
        flex: Flex(grow: 1),
      ),
    ]),

    // Header right
    css('.site-header-right', [
      css('&').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
        gap: Gap.column(0.75.rem),
      ),
    ]),

    // GitHub link
    css('.site-github', [
      css('&').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
        padding: Padding.all(0.5.rem),
        color: Color('var(--text)'),
        raw: {
          'opacity': '0.7',
          'transition': 'opacity 0.2s',
        },
      ),
      css('&:hover').styles(raw: {'opacity': '1'}),
    ]),
  ];
}
