import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class DashboardPage extends StatelessComponent {
  const DashboardPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Dashboard')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A composite dashboard component for building admin interfaces with sidebar navigation, header, and content areas.')]),
            _section('Basic Usage', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('The DDashboardGroup component creates a flexible layout container for dashboard interfaces. It contains DDashboardSidebar for navigation and DDashboardPanel for main content.'),
                ]),
              ], '''DDashboardGroup(
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
        text('Dashboard content goes here'),
      ],
    ),
  ],
)'''),
            ]),
            _section('With Navbar', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Add a DDashboardNavbar at the top of your dashboard for branding and global actions. Use vertical orientation to stack the navbar above the sidebar/panel group.'),
                ]),
              ], '''DDashboardGroup(
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
            text('Content area'),
          ],
        ),
      ],
    ),
  ],
)'''),
            ]),
            _section('With Sidebar Sections', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Organize sidebar items into logical groups using DSidebarSection. Each section can have a label and contains multiple DSidebarItem components. Items can show badges and active states.'),
                ]),
              ], '''DDashboardGroup(
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
        text('Grouped navigation content'),
      ],
    ),
  ],
)'''),
            ]),
            _section('Collapsible Sidebar', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('The sidebar can be collapsed to show only icons, saving screen space. Use initialCollapsed to set the default state. Users can toggle the sidebar visibility.'),
                ]),
              ], '''DDashboardGroup(
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
        text('Collapsible sidebar content'),
      ],
    ),
  ],
)'''),
            ]),
            _section('With Footer', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Add a footer section to the sidebar for user profile information, settings, or logout actions. The footer stays pinned to the bottom of the sidebar.'),
                ]),
              ], '''DDashboardGroup(
  children: [
    DDashboardSidebar(
      children: [
        DSidebarItem(label: 'Home', icon: DIcon(name: 'home', size: 20)),
      ],
      footer: div(classes: 'p-4 border-t', [
        div(classes: 'flex items-center gap-3', [
          DAvatar(text: 'JD', size: DAvatarSize.sm),
          div([
            div(classes: 'text-sm font-medium', [text('John Doe')]),
            div(classes: 'text-xs text-zinc-400', [text('john@example.com')]),
          ]),
        ]),
      ]),
    ),
    DDashboardPanel(
      children: [
        text('Dashboard with user menu'),
      ],
    ),
  ],
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
