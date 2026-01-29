/// Server entry point for duxt-docs with jaspr_content
///
/// This file configures the ContentApp for documentation rendering
/// using jaspr_content's built-in markdown processing and layouts.
///
/// ## Usage
///
/// Run with: `jaspr serve`
/// Build with: `jaspr build`
///
/// ## Content Structure
///
/// Place markdown files in the `content/` directory:
/// - `content/getting-started/index.md` -> `/getting-started`
/// - `content/components/button.md` -> `/components/button`
library;

import 'package:jaspr/server.dart';
import 'package:jaspr_content/jaspr_content.dart';

void main() {
  Jaspr.initializeApp();

  runApp(ContentApp(
    // Source directory for content files
    directory: 'content',

    // Parsers for content processing
    parsers: [
      MarkdownParser(),
    ],

    // Layouts for different page types
    // Use `layout: docs` in frontmatter to apply DocsLayout
    layouts: [
      DocsLayout(
        // Header configuration
        header: Header(
          title: 'Duxt',
          links: [
            HeaderLink(label: 'Docs', href: '/getting-started'),
            HeaderLink(label: 'Components', href: '/components/button'),
            HeaderLink(label: 'API', href: '/api'),
            HeaderLink(label: 'GitHub', href: 'https://github.com/duxt-ui/duxt', external: true),
          ],
        ),
        // Sidebar navigation
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
              title: 'Resources',
              items: [
                SidebarItem(label: 'API Reference', href: '/api'),
              ],
            ),
          ],
        ),
        // Show table of contents
        tableOfContents: true,
      ),
    ],

    // Enable frontmatter for metadata
    enableFrontmatter: true,

    // Eagerly load all pages for faster navigation
    eagerlyLoadAllPages: true,
  ));
}
