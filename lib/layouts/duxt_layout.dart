import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

import '../components/sidebar_duxt.dart';
import '../components/nav_link.dart';
import '../components/site_header.dart';

/// Documentation layout for Duxt Framework docs.
class DuxtLayout extends PageLayoutBase {
  const DuxtLayout();

  @override
  String get name => 'duxt-layout';

  @override
  Component buildBody(Page page, Component child) {
    return div(classes: 'min-h-screen flex flex-col', [
      // Header
      SiteHeader(
        logo: '/images/logo.svg',
        logoAlt: 'Duxt',
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
        SidebarDuxt(),
        // Content
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose prose-invert max-w-none', [child]),
        ]),
      ]),
    ]);
  }
}
