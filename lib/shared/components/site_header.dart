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
        _mobileMenuScript(),
      ]),
      header(classes: 'site-header', [
        // Logo
        a(classes: 'site-logo', href: '/', [
          img(src: logo, alt: logoAlt, width: 56, height: 56),
        ]),
        // Hamburger button (mobile only)
        RawText('''<button class="hamburger-btn" aria-label="Open menu" onclick="toggleMobileMenu()">
          <svg class="hamburger-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg>
          <svg class="close-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
        </button>'''),
        // Navigation - use custom items if provided, otherwise default nav
        if (items != null)
          nav(classes: 'site-nav', items!)
        else
          nav(classes: 'site-nav', [
            NavLink(href: '/duxt', text: 'Duxt'),
            NavLink(href: '/duxt-cli', text: "Duxt CLI"),
            NavLink(href: '/duxt-ui', text: 'Duxt UI'),
            NavLink(href: '/duxt-orm', text: 'Duxt ORM'),
            NavLink(href: '/duxt-html', text: 'Duxt HTML'),
            NavLink(href: '/duxt-signals', text: 'Duxt Signals'),
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

  static Component _mobileMenuScript() {
    return RawText('''<script>
      function toggleMobileMenu() {
        document.querySelector('.site-header').classList.toggle('mobile-open');
      }
      document.addEventListener('click', function(e) {
        var header = document.querySelector('.site-header');
        if (header && header.classList.contains('mobile-open')) {
          if (e.target.closest('.nav-link')) {
            header.classList.remove('mobile-open');
          }
        }
      });
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
            position: Position.fixed(
                top: Unit.zero, left: Unit.zero, right: Unit.zero),
            zIndex: ZIndex(100),
            height: Unit.pixels(64),
            display: Display.flex,
            alignItems: AlignItems.center,
            gap: Gap.column(1.5.rem),
            padding: Padding.symmetric(horizontal: 1.5.rem),
            backgroundColor: Color('var(--background)'),
            border: Border.only(
                bottom: BorderSide(color: Color('#27272a'), width: 1.px)),
          ),
        ]),

        // Light mode header
        css(':root[data-theme="light"] .site-header', [
          css('&').styles(
            border: Border.only(
                bottom: BorderSide(color: Color('#e4e4e7'), width: 1.px)),
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

        // Hamburger button - hidden on desktop
        css('.hamburger-btn', [
          css('&').styles(raw: {
            'display': 'none',
            'background': 'none',
            'border': 'none',
            'color': 'var(--text)',
            'cursor': 'pointer',
            'padding': '0.5rem',
            'margin-left': 'auto',
            'z-index': '101',
          }),
          css('.close-icon').styles(raw: {'display': 'none'}),
        ]),
        // Show close icon when open
        css('.site-header.mobile-open .hamburger-btn', [
          css('.hamburger-icon').styles(raw: {'display': 'none'}),
          css('.close-icon').styles(raw: {'display': 'block'}),
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

        // Mobile styles
        css.media(MediaQuery.all(maxWidth: 768.px), [
          css('.site-header').styles(raw: {
            'padding': '0 1rem',
            'flex-wrap': 'wrap',
          }),
          css('.site-logo img').styles(raw: {
            'width': '40px',
            'height': '40px',
          }),
          css('.hamburger-btn').styles(raw: {
            'display': 'flex',
            'align-items': 'center',
          }),
          css('.site-nav').styles(raw: {
            'display': 'none',
          }),
          css('.site-header-right').styles(raw: {
            'display': 'none',
          }),

          // Mobile open state - full screen overlay
          css('.site-header.mobile-open').styles(raw: {
            'position': 'fixed',
            'top': '0',
            'left': '0',
            'right': '0',
            'bottom': '0',
            'height': '100vh',
            'flex-direction': 'column',
            'align-items': 'flex-start',
            'padding-top': '1rem',
            'overflow-y': 'auto',
            'z-index': '1000',
          }),
          css('.site-header.mobile-open .site-logo').styles(raw: {
            'width': '100%',
            'padding-bottom': '1rem',
            'border-bottom': '1px solid #27272a',
          }),
          css('.site-header.mobile-open .hamburger-btn').styles(raw: {
            'position': 'absolute',
            'top': '1rem',
            'right': '1rem',
          }),
          css('.site-header.mobile-open .site-nav').styles(raw: {
            'display': 'flex',
            'flex-direction': 'column',
            'width': '100%',
            'gap': '0.25rem',
            'padding': '1rem 0',
          }),
          css('.site-header.mobile-open .nav-link').styles(raw: {
            'padding': '0.75rem 1rem',
            'font-size': '1.125rem',
            'border-radius': '0.5rem',
            'width': '100%',
          }),
          css('.site-header.mobile-open .site-header-right').styles(raw: {
            'display': 'flex',
            'width': '100%',
            'padding-top': '1rem',
            'border-top': '1px solid #27272a',
            'justify-content': 'center',
            'gap': '1.5rem',
          }),
        ]),
      ];
}
