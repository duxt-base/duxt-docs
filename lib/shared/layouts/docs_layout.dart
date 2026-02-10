import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt/content.dart';

import '../components/site_header.dart';
import '../components/sidebar_duxt.dart';
import '../components/sidebar_ui.dart';
import '../components/sidebar_orm.dart';
import '../components/sidebar_signals.dart';
import '../components/sidebar_cli.dart';
import '../components/sidebar_html.dart';
import '../components/sidebar_icons.dart';

/// Unified documentation layout that works for all doc sections.
///
/// Uses the same styling as AppScaffold for consistency.
/// Pass a sidebar component or null for landing-style (no sidebar).
class DocsLayout extends PageLayoutBase {
  const DocsLayout({
    this.sidebar,
    this.layoutName = 'docs-layout',
  });

  /// Sidebar component - null for landing pages (no sidebar)
  final Component? sidebar;

  /// Layout name for content matching
  final String layoutName;

  @override
  String get name => layoutName;

  @override
  Iterable<Component> buildHead(Page page) sync* {
    yield* super.buildHead(page);
    yield Style(styles: _layoutStyles);
    if (sidebar != null) {
      yield _sidebarDrawerScript();
    }
  }

  @override
  Component buildBody(Page page, Component child) {
    final hasSidebar = sidebar != null;

    return div(classes: 'scaffold', [
      const SiteHeader(),
      div(classes: 'scaffold-container has-header', [
        if (hasSidebar) ...[
          // Backdrop overlay for mobile sidebar
          div(
            classes: 'sidebar-backdrop',
            attributes: {'onclick': 'closeSidebarDrawer()'},
            [],
          ),
          aside(classes: 'scaffold-sidebar', [sidebar!]),
          // Floating docs menu button for mobile
          button(
            classes: 'sidebar-toggle-btn',
            attributes: {'aria-label': 'Open docs menu', 'onclick': 'toggleSidebarDrawer()'},
            [
              RawText('<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="15" y2="12"/><line x1="3" y1="18" x2="18" y2="18"/></svg>'),
              span([Component.text('Docs')]),
            ],
          ),
        ],
        main_(classes: 'scaffold-main ${hasSidebar ? "has-sidebar" : ""}', [
          article(classes: 'scaffold-content prose dark:prose-invert', [child]),
        ]),
      ]),
    ]);
  }

  static Component _sidebarDrawerScript() {
    return RawText('''<script>
      function toggleSidebarDrawer() {
        document.querySelector('.scaffold-container').classList.toggle('sidebar-open');
      }
      function closeSidebarDrawer() {
        document.querySelector('.scaffold-container').classList.remove('sidebar-open');
      }
      document.addEventListener('click', function(e) {
        var container = document.querySelector('.scaffold-container');
        if (container && container.classList.contains('sidebar-open')) {
          if (e.target.closest('.scaffold-sidebar a')) {
            container.classList.remove('sidebar-open');
          }
        }
      });
    </script>''');
  }

  static List<StyleRule> get _layoutStyles => [
    css('.scaffold', [
      css('&').styles(
        minHeight: 100.vh,
        width: 100.percent,
        backgroundColor: Color('var(--background, #09090b)'),
        color: Color('var(--text, #e4e4e7)'),
        raw: {'overflow-x': 'hidden'},
      ),
    ]),

    css('.scaffold-container', [
      css('&').styles(display: Display.flex),
    ]),
    css('.scaffold-container.has-header', [
      css('&').styles(raw: {'padding-top': '64px'}),
    ]),

    css('.scaffold-sidebar', [
      css('&').styles(
        position: Position.fixed(top: Unit.pixels(64), left: Unit.zero, bottom: Unit.zero),
        width: Unit.pixels(280),
        padding: Padding.all(1.rem),
        backgroundColor: Color('var(--background, #09090b)'),
        border: Border.only(right: BorderSide(color: Color('#27272a'), width: 1.px)),
        raw: {'overflow-y': 'auto'},
      ),
    ]),
    css(':root[data-theme="light"] .scaffold-sidebar', [
      css('&').styles(
        backgroundColor: Color('#cbd5e1'),
        border: Border.only(right: BorderSide(color: Color('#e2e8f0'), width: 1.px)),
      ),
    ]),

    css('.scaffold-main', [
      css('&').styles(
        flex: Flex(grow: 1),
        minHeight: 100.vh,
        padding: Padding.all(2.rem),
      ),
    ]),
    css('.scaffold-main.has-sidebar', [
      css('&').styles(raw: {'margin-left': '280px'}),
    ]),

    css('.scaffold-content', [
      css('&').styles(
        maxWidth: 900.px,
        margin: Margin.symmetric(horizontal: Unit.auto),
      ),
    ]),

    // Sidebar backdrop (hidden by default)
    css('.sidebar-backdrop', [
      css('&').styles(raw: {
        'display': 'none',
        'position': 'fixed',
        'top': '0',
        'left': '0',
        'right': '0',
        'bottom': '0',
        'background': 'rgba(0, 0, 0, 0.5)',
        'z-index': '49',
      }),
    ]),

    // Floating sidebar toggle button (hidden by default, shown on mobile)
    css('.sidebar-toggle-btn', [
      css('&').styles(raw: {
        'display': 'none',
        'position': 'fixed',
        'bottom': '1.5rem',
        'left': '1.5rem',
        'z-index': '48',
        'background': 'var(--nav-hover, #22d3ee)',
        'color': '#09090b',
        'border': 'none',
        'border-radius': '2rem',
        'padding': '0.625rem 1rem',
        'font-family': "'Nunito', system-ui, sans-serif",
        'font-size': '0.875rem',
        'font-weight': '600',
        'cursor': 'pointer',
        'align-items': 'center',
        'gap': '0.5rem',
        'box-shadow': '0 4px 12px rgba(0, 0, 0, 0.3)',
        'transition': 'transform 0.2s, box-shadow 0.2s',
      }),
      css('&:hover').styles(raw: {
        'transform': 'scale(1.05)',
        'box-shadow': '0 6px 16px rgba(0, 0, 0, 0.4)',
      }),
    ]),

    // Mobile responsive
    css.media(MediaQuery.all(maxWidth: 768.px), [
      // Sidebar becomes drawer (off-screen by default)
      css('.scaffold-sidebar').styles(raw: {
        'transform': 'translateX(-100%)',
        'transition': 'transform 0.3s ease',
        'z-index': '50',
        'top': '0',
        'padding-top': '1.5rem',
      }),
      css('.scaffold-main.has-sidebar').styles(raw: {'margin-left': '0'}),
      // Show floating button
      css('.sidebar-toggle-btn').styles(raw: {'display': 'flex'}),
      // Responsive padding
      css('.scaffold-main').styles(raw: {'padding': '1rem'}),

      // When sidebar is open
      css('.scaffold-container.sidebar-open .sidebar-backdrop').styles(raw: {
        'display': 'block',
      }),
      css('.scaffold-container.sidebar-open .scaffold-sidebar').styles(raw: {
        'transform': 'translateX(0)',
      }),
      css('.scaffold-container.sidebar-open .sidebar-toggle-btn').styles(raw: {
        'display': 'none',
      }),
    ]),

    // Extra small screens
    css.media(MediaQuery.all(maxWidth: 480.px), [
      css('.scaffold-main').styles(raw: {'padding': '0.75rem'}),
    ]),

    // Overflow handling for code blocks and tables
    css('.scaffold-content pre', [
      css('&').styles(raw: {'overflow-x': 'auto'}),
    ]),
    css('.scaffold-content table', [
      css('&').styles(raw: {'overflow-x': 'auto', 'display': 'block'}),
    ]),
  ];
}

/// Duxt Framework docs layout (with SidebarDuxt)
class DuxtLayout extends DocsLayout {
  const DuxtLayout() : super(
    sidebar: const SidebarDuxt(),
    layoutName: 'duxt-layout',
  );
}

/// Duxt UI docs layout (with SidebarUi)
class UiLayout extends DocsLayout {
  const UiLayout() : super(
    sidebar: const SidebarUi(),
    layoutName: 'ui-layout',
  );
}

/// Duxt ORM docs layout (with SidebarOrm)
class OrmLayout extends DocsLayout {
  const OrmLayout() : super(
    sidebar: const SidebarOrm(),
    layoutName: 'orm-layout',
  );
}

/// Duxt Signals docs layout (with SidebarSignals)
class SignalsLayout extends DocsLayout {
  const SignalsLayout() : super(
    sidebar: const SidebarSignals(),
    layoutName: 'signals-layout',
  );
}

/// Duxt CLI docs layout (with SidebarCli)
class CliLayout extends DocsLayout {
  const CliLayout() : super(
    sidebar: const SidebarCli(),
    layoutName: 'cli-layout',
  );
}

/// Duxt HTML docs layout (with SidebarHtml)
class HtmlLayout extends DocsLayout {
  const HtmlLayout() : super(
    sidebar: const SidebarHtml(),
    layoutName: 'html-layout',
  );
}

/// Duxt Icons docs layout (with SidebarIcons)
class IconsLayout extends DocsLayout {
  const IconsLayout() : super(
    sidebar: const SidebarIcons(),
    layoutName: 'icons-layout',
  );
}

/// Landing page layout (no sidebar)
class LandingLayout extends DocsLayout {
  const LandingLayout() : super(
    sidebar: null,
    layoutName: 'landing-layout',
  );
}
