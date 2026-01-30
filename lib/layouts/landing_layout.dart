import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:duxt/content.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

import '../components/nav_link.dart';
import '../components/site_header.dart';

/// A landing page layout with consistent header.
class LandingLayout extends PageLayoutBase {
  const LandingLayout();

  @override
  String get name => 'landing-layout';

  @override
  Component buildBody(Page page, Component child) {
    return div(classes: 'min-h-screen bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      // Shared header
      SiteHeader(
        logo: '/images/logo.svg',
        logoAlt: 'Duxt - The Meta-Framework for Jaspr',
        duxtVersion: '0.3.7',
        duxtUiVersion: '0.2.3',
        items: [
          NavLink(href: '/duxt', text: 'Duxt'),
          NavLink(href: '/duxt-ui', text: 'Duxt UI'),
          NavLink(href: '/about', text: 'About'),
          ThemeToggle(),
        ],
      ),
      // Page content with main landmark for accessibility
      main_(classes: 'pt-16', [child]),
    ]);
  }
}
