import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';
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
    return div([
      // Shared header
      SiteHeader(
        logo: '/images/logo.svg',
        logoAlt: 'Duxt - The Meta-Framework for Jaspr',
        version: '0.3.3',
        items: [
          NavLink(href: '/duxt', text: 'Duxt'),
          NavLink(href: '/duxt-ui', text: 'Duxt UI'),
          NavLink(href: '/about', text: 'About'),
          ThemeToggle(),
        ],
      ),
      // Page content with main landmark for accessibility
      main_([child]),
    ]);
  }
}
