import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt/content.dart';

import '../components/site_header.dart';
import '../components/sidebar_duxt.dart';
import '../components/sidebar_ui.dart';
import '../components/sidebar_orm.dart';
import '../components/sidebar_signals.dart';

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
  }

  @override
  Component buildBody(Page page, Component child) {
    final hasSidebar = sidebar != null;

    return div(classes: 'scaffold', [
      const SiteHeader(),
      div(classes: 'scaffold-container has-header', [
        if (hasSidebar) aside(classes: 'scaffold-sidebar', [sidebar!]),
        main_(classes: 'scaffold-main ${hasSidebar ? "has-sidebar" : ""}', [
          article(classes: 'scaffold-content prose dark:prose-invert', [child]),
        ]),
      ]),
    ]);
  }

  static List<StyleRule> get _layoutStyles => [
    css('.scaffold', [
      css('&').styles(
        minHeight: 100.vh,
        backgroundColor: Color('var(--background, #09090b)'),
        color: Color('var(--text, #e4e4e7)'),
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

    // Mobile
    css.media(MediaQuery.all(maxWidth: 768.px), [
      css('.scaffold-sidebar').styles(display: Display.none),
      css('.scaffold-main.has-sidebar').styles(raw: {'margin-left': '0'}),
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

/// Landing page layout (no sidebar)
class LandingLayout extends DocsLayout {
  const LandingLayout() : super(
    sidebar: null,
    layoutName: 'landing-layout',
  );
}
