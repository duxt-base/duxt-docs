import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class PagePage extends StatelessComponent {
  const PagePage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Page')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A composite page layout component for building structured pages with header, body, and optional sidebar sections.')]),
            _section('Basic Usage', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('The DPage component provides a structured layout with a header containing title and description, plus a body area for your main content.'),
                ]),
              ], '''DPage(
  header: DPageHeader(
    title: 'Page Title',
    description: 'A brief description of this page.',
  ),
  body: [
    p([text('Page content goes here.')]),
  ],
)'''),
            ]),
            _section('With Breadcrumbs', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Add navigation breadcrumbs to help users understand their location in the app hierarchy. Each breadcrumb item can have a label and optional href for navigation.'),
                ]),
              ], '''DPage(
  header: DPageHeader(
    title: 'Settings',
    breadcrumbs: [
      DBreadcrumbItem(label: 'Home', href: '/'),
      DBreadcrumbItem(label: 'Account', href: '/account'),
      DBreadcrumbItem(label: 'Settings'),
    ],
  ),
  body: [
    text('Settings page content'),
  ],
)'''),
            ]),
            _section('With Actions', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Add action buttons to the page header for common operations like export, create, or edit. Actions are displayed on the right side of the header.'),
                ]),
              ], '''DPage(
  header: DPageHeader(
    title: 'Users',
    description: 'Manage your team members.',
    actions: [
      DButton(label: 'Export', variant: DButtonVariant.outline),
      DButton(label: 'Add User', variant: DButtonVariant.primary),
    ],
  ),
  body: [
    text('Users list content'),
  ],
)'''),
            ]),
            _section('With Sidebar', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Add a page sidebar for in-page navigation, table of contents, or secondary navigation. The sidebar appears alongside the main content area.'),
                ]),
              ], '''DPage(
  header: DPageHeader(
    title: 'Documentation',
  ),
  sidebar: DPageSidebar(
    items: [
      DPageSidebarItem(label: 'Getting Started', href: '#getting-started'),
      DPageSidebarItem(label: 'Installation', href: '#installation'),
      DPageSidebarItem(label: 'Configuration', href: '#configuration'),
      DPageSidebarItem(label: 'Examples', href: '#examples'),
    ],
  ),
  body: [
    text('Documentation content'),
  ],
)'''),
            ]),
            _section('Full Width', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Enable full-width mode to remove max-width constraints and allow content to span the entire available width. Useful for dashboards and data-heavy pages.'),
                ]),
              ], '''DPage(
  fullWidth: true,
  header: DPageHeader(
    title: 'Analytics Dashboard',
  ),
  body: [
    text('Full width content area'),
  ],
)'''),
            ]),
            _section('With Footer', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Add a page footer for form actions, navigation controls, or status information. The footer stays at the bottom of the page content area.'),
                ]),
              ], '''DPage(
  header: DPageHeader(
    title: 'Profile',
  ),
  body: [
    text('Profile form content'),
  ],
  footer: DPageFooter(
    children: [
      DButton(label: 'Cancel', variant: DButtonVariant.ghost),
      DButton(label: 'Save Changes', variant: DButtonVariant.primary),
    ],
  ),
)'''),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]), ...children]);
  Component _preview(List<Component> components, String codeExample) => div(classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden', [
    div(classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]', styles: Styles(raw: {'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)', 'background-size': '24px 24px'}), components),
    div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [div(classes: 'flex items-center px-4 py-2 border-b border-zinc-200 dark:border-zinc-800', [span(classes: 'text-xs text-zinc-500', [text('dart')])]), div(classes: 'p-4 overflow-x-auto', [pre(classes: 'text-sm', [code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)])])])]),
  ]);
}
