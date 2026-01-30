import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import 'site_header.dart';

/// Unified scaffold component - like Flutter's Scaffold.
///
/// ```dart
/// // Full layout with sidebar
/// AppScaffold(
///   sidebar: SidebarUi(),
///   body: content,
/// )
///
/// // Landing page - no sidebar
/// AppScaffold(body: content)
///
/// // No header
/// AppScaffold(header: null, body: content)
/// ```
class AppScaffold extends StatelessComponent {
  const AppScaffold({
    required this.body,
    this.header = const SiteHeader(),
    this.sidebar,
    this.contentClass = 'prose dark:prose-invert',
    this.fullWidth = false,
    super.key,
  });

  /// Main content
  final Component body;

  /// Header - defaults to SiteHeader, set null to hide
  final Component? header;

  /// Sidebar - null means no sidebar (landing page style)
  final Component? sidebar;

  /// CSS classes for content wrapper
  final String contentClass;

  /// Full width content (no max-width constraint)
  final bool fullWidth;

  @override
  Component build(BuildContext context) {
    final hasSidebar = sidebar != null;
    final hasHeader = header != null;

    return Component.fragment([
      Document.head(children: [
        Style(styles: _styles),
      ]),
      div(classes: 'scaffold', [
        if (hasHeader) header!,
        div(classes: 'scaffold-container ${hasHeader ? "has-header" : ""}', [
          if (hasSidebar) aside(classes: 'scaffold-sidebar', [sidebar!]),
          main_(classes: 'scaffold-main ${hasSidebar ? "has-sidebar" : ""} ${fullWidth ? "full-width" : ""}', [
            article(classes: 'scaffold-content ${fullWidth ? "full-width" : ""} $contentClass', [body]),
          ]),
        ]),
      ]),
    ]);
  }

  static List<StyleRule> get _styles => [
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

    // Full width mode (landing pages)
    css('.scaffold-main.full-width', [
      css('&').styles(
        padding: Padding.zero,
      ),
    ]),
    css('.scaffold-content.full-width', [
      css('&').styles(
        maxWidth: Unit.percent(100),
        margin: Margin.zero,
      ),
    ]),

    // Mobile
    css.media(MediaQuery.all(maxWidth: 768.px), [
      css('.scaffold-sidebar').styles(display: Display.none),
      css('.scaffold-main.has-sidebar').styles(raw: {'margin-left': '0'}),
    ]),
  ];
}
