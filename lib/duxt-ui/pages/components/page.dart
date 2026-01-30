import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class PagePage extends StatelessComponent {
  const PagePage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Page')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A composite page layout component for building structured pages with header, body, and optional sidebar sections.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('The DPage component provides a structured layout with a header containing title and description, plus a body area for your main content.'),
                ]),
              ], code: '''DPage(
  header: DPageHeader(
    title: 'Page Title',
    description: 'A brief description of this page.',
  ),
  body: [
    p([Component.text('Page content goes here.')]),
  ],
)'''),
            ]),
            _section('With Breadcrumbs', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Add navigation breadcrumbs to help users understand their location in the app hierarchy. Each breadcrumb item can have a label and optional href for navigation.'),
                ]),
              ], code: '''DPage(
  header: DPageHeader(
    title: 'Settings',
    breadcrumbs: [
      DBreadcrumbItem(label: 'Home', href: '/'),
      DBreadcrumbItem(label: 'Account', href: '/account'),
      DBreadcrumbItem(label: 'Settings'),
    ],
  ),
  body: [
    Component.text('Settings page content'),
  ],
)'''),
            ]),
            _section('With Actions', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Add action buttons to the page header for common operations like export, create, or edit. Actions are displayed on the right side of the header.'),
                ]),
              ], code: '''DPage(
  header: DPageHeader(
    title: 'Users',
    description: 'Manage your team members.',
    actions: [
      DButton(label: 'Export', variant: DButtonVariant.outline),
      DButton(label: 'Add User', variant: DButtonVariant.primary),
    ],
  ),
  body: [
    Component.text('Users list content'),
  ],
)'''),
            ]),
            _section('With Sidebar', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Add a page sidebar for in-page navigation, table of contents, or secondary navigation. The sidebar appears alongside the main content area.'),
                ]),
              ], code: '''DPage(
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
    Component.text('Documentation content'),
  ],
)'''),
            ]),
            _section('Full Width', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Enable full-width mode to remove max-width constraints and allow content to span the entire available width. Useful for dashboards and data-heavy pages.'),
                ]),
              ], code: '''DPage(
  fullWidth: true,
  header: DPageHeader(
    title: 'Analytics Dashboard',
  ),
  body: [
    Component.text('Full width content area'),
  ],
)'''),
            ]),
            _section('With Footer', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Add a page footer for form actions, navigation controls, or status information. The footer stays at the bottom of the page content area.'),
                ]),
              ], code: '''DPage(
  header: DPageHeader(
    title: 'Profile',
  ),
  body: [
    Component.text('Profile form content'),
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
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
