import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt/content.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

import '../components/sidebar_ui.dart';
import '../components/nav_link.dart';
import '../components/site_header.dart';

/// Documentation layout for Duxt UI docs.
class UiLayout extends PageLayoutBase {
  const UiLayout();

  @override
  String get name => 'ui-layout';

  @override
  Component buildBody(Page page, Component child) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      // Header
      SiteHeader(
        logo: '/images/logo.svg',
        logoAlt: 'Duxt',
        duxtVersion: '0.3.7',
        duxtUiVersion: '0.2.3',
        items: [
          NavLink(href: '/duxt', text: 'Duxt'),
          NavLink(href: '/duxt-ui', text: 'Duxt UI'),
          NavLink(href: '/about', text: 'About'),
          ThemeToggle(),
        ],
      ),
      // Main content area
      div(classes: 'flex flex-1 pt-16', [
        // Sidebar
        SidebarUi(),
        // Content
        main_(classes: 'flex-1 p-8 max-w-4xl bg-white dark:bg-zinc-950', [
          article(classes: 'prose dark:prose-invert max-w-none', [child]),
        ]),
      ]),
    ]);
  }
}
