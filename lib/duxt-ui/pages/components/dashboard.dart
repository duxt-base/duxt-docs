import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class DashboardPage extends StatelessComponent {
  const DashboardPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Dashboard')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A composite dashboard component for building admin interfaces with sidebar navigation, header, and content areas.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('The DDashboardGroup component creates a flexible layout container for dashboard interfaces. It contains DDashboardSidebar for navigation and DDashboardPanel for main content.'),
                ]),
              ], code: '''DDashboardGroup(
  children: [
    DDashboardSidebar(
      children: [
        DSidebarItem(label: 'Home', icon: DIcon(name: 'home', size: 20)),
        DSidebarItem(label: 'Analytics', icon: DIcon(name: 'chart-bar', size: 20)),
        DSidebarItem(label: 'Users', icon: DIcon(name: 'users', size: 20)),
        DSidebarItem(label: 'Settings', icon: DIcon(name: 'cog', size: 20)),
      ],
    ),
    DDashboardPanel(
      children: [
        Component.text('Dashboard content goes here'),
      ],
    ),
  ],
)'''),
            ]),
            _section('With Navbar', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Add a DDashboardNavbar at the top of your dashboard for branding and global actions. Use vertical orientation to stack the navbar above the sidebar/panel group.'),
                ]),
              ], code: '''DDashboardGroup(
  orientation: DDashboardOrientation.vertical,
  children: [
    DDashboardNavbar(
      title: 'My Dashboard',
      trailing: DButton(label: 'New Item', variant: DButtonVariant.primary),
    ),
    DDashboardGroup(
      children: [
        DDashboardSidebar(
          children: [
            DSidebarItem(label: 'Home', icon: DIcon(name: 'home', size: 20)),
            DSidebarItem(label: 'Projects', icon: DIcon(name: 'folder', size: 20)),
          ],
        ),
        DDashboardPanel(
          children: [
            Component.text('Content area'),
          ],
        ),
      ],
    ),
  ],
)'''),
            ]),
            _section('With Sidebar Sections', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Organize sidebar items into logical groups using DSidebarSection. Each section can have a label and contains multiple DSidebarItem components. Items can show badges and active states.'),
                ]),
              ], code: '''DDashboardGroup(
  children: [
    DDashboardSidebar(
      children: [
        DSidebarSection(
          label: 'Main',
          children: [
            DSidebarItem(label: 'Dashboard', icon: DIcon(name: 'home', size: 20), active: true),
            DSidebarItem(label: 'Inbox', icon: DIcon(name: 'inbox', size: 20), badge: '5'),
          ],
        ),
        DSidebarSection(
          label: 'Management',
          children: [
            DSidebarItem(label: 'Team', icon: DIcon(name: 'users', size: 20)),
            DSidebarItem(label: 'Organization', icon: DIcon(name: 'building-office', size: 20)),
          ],
        ),
      ],
    ),
    DDashboardPanel(
      children: [
        Component.text('Grouped navigation content'),
      ],
    ),
  ],
)'''),
            ]),
            _section('Collapsible Sidebar', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('The sidebar can be collapsed to show only icons, saving screen space. Use initialCollapsed to set the default state. Users can toggle the sidebar visibility.'),
                ]),
              ], code: '''DDashboardGroup(
  children: [
    DDashboardSidebar(
      initialCollapsed: false,
      children: [
        DSidebarItem(label: 'Home', icon: DIcon(name: 'home', size: 20)),
        DSidebarItem(label: 'Documents', icon: DIcon(name: 'document', size: 20)),
      ],
    ),
    DDashboardPanel(
      children: [
        Component.text('Collapsible sidebar content'),
      ],
    ),
  ],
)'''),
            ]),
            _section('With Footer', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Add a footer section to the sidebar for user profile information, settings, or logout actions. The footer stays pinned to the bottom of the sidebar.'),
                ]),
              ], code: '''DDashboardGroup(
  children: [
    DDashboardSidebar(
      children: [
        DSidebarItem(label: 'Home', icon: DIcon(name: 'home', size: 20)),
      ],
      footer: div(classes: 'p-4 border-t', [
        div(classes: 'flex items-center gap-3', [
          DAvatar(text: 'JD', size: DAvatarSize.sm),
          div([
            div(classes: 'text-sm font-medium', [Component.text('John Doe')]),
            div(classes: 'text-xs text-zinc-400', [Component.text('john@example.com')]),
          ]),
        ]),
      ]),
    ),
    DDashboardPanel(
      children: [
        Component.text('Dashboard with user menu'),
      ],
    ),
  ],
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
