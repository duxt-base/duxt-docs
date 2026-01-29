/// Content application configuration for duxt-docs
///
/// Uses jaspr_content for markdown rendering and documentation layouts.
library;

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_content/jaspr_content.dart';

/// Configure the content application with parsers and layouts
ContentApp createContentApp() {
  return ContentApp(
    parsers: [
      MarkdownParser(),
    ],
    layouts: {
      'docs': DocsLayout(
        header: Header(
          title: 'Duxt',
          logo: div(
            classes: 'w-8 h-8 bg-gradient-to-br from-indigo-500 to-purple-600 rounded-lg flex items-center justify-center',
            [span(classes: 'text-white font-bold text-sm', [text('D')])],
          ),
          links: [
            HeaderLink(label: 'Docs', href: '/getting-started'),
            HeaderLink(label: 'Components', href: '/components/button'),
            HeaderLink(label: 'Duxt UI', href: '/duxt-ui'),
            HeaderLink(label: 'API', href: '/api'),
            HeaderLink(label: 'GitHub', href: 'https://github.com/duxt-ui/duxt', external: true),
          ],
        ),
        sidebar: Sidebar(
          groups: [
            SidebarGroup(
              title: 'Getting Started',
              items: [
                SidebarItem(label: 'Introduction', href: '/getting-started'),
                SidebarItem(label: 'Installation', href: '/getting-started/installation'),
                SidebarItem(label: 'Quick Start', href: '/getting-started/quick-start'),
              ],
            ),
            SidebarGroup(
              title: 'Components',
              items: [
                SidebarItem(label: 'Button', href: '/components/button'),
                SidebarItem(label: 'Input', href: '/components/input'),
                SidebarItem(label: 'Card', href: '/components/card'),
              ],
            ),
            SidebarGroup(
              title: 'Duxt UI',
              items: [
                SidebarItem(label: 'Overview', href: '/duxt-ui'),
                SidebarItem(label: 'Theming', href: '/duxt-ui/theming'),
                SidebarItem(label: 'All Components', href: '/duxt-ui/components'),
              ],
            ),
            SidebarGroup(
              title: 'Resources',
              items: [
                SidebarItem(label: 'API Reference', href: '/api'),
              ],
            ),
          ],
        ),
        tableOfContents: true,
        theme: DocsTheme.dark(),
      ),
    },
    defaultLayout: 'docs',
  );
}

/// Create content routes from the content directory
List<ContentRoute> createContentRoutes(ContentApp app) {
  return [
    // Getting Started
    ContentRoute(
      path: '/getting-started',
      content: 'content/getting-started/index.md',
      app: app,
    ),
    ContentRoute(
      path: '/getting-started/installation',
      content: 'content/getting-started/installation.md',
      app: app,
    ),
    ContentRoute(
      path: '/getting-started/quick-start',
      content: 'content/getting-started/quick-start.md',
      app: app,
    ),
    // Components
    ContentRoute(
      path: '/components/button',
      content: 'content/components/button.md',
      app: app,
    ),
    ContentRoute(
      path: '/components/input',
      content: 'content/components/input.md',
      app: app,
    ),
    ContentRoute(
      path: '/components/card',
      content: 'content/components/card.md',
      app: app,
    ),
    // Duxt UI
    ContentRoute(
      path: '/duxt-ui',
      content: 'content/duxt-ui/index.md',
      app: app,
    ),
    // API Reference
    ContentRoute(
      path: '/api',
      content: 'content/api/index.md',
      app: app,
    ),
  ];
}
