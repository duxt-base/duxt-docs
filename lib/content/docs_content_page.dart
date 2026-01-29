/// Documentation content page component
///
/// Renders markdown content with the docs layout using duxt content utilities.
library;

import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt/content.dart';
import '../shared/layouts/docs_layout.dart';
import '../shared/components/toc.dart';

/// A page component that loads and renders markdown content
class DocsContentPage extends AsyncStatelessComponent {
  final String contentPath;
  final String routePath;

  const DocsContentPage({
    required this.contentPath,
    required this.routePath,
  });

  @override
  Future<Component> build(BuildContext context) async {
    // Load the content document
    final loader = ContentLoader(
      config: ContentLoaderConfig(contentDir: 'content'),
    );

    final document = await loader.load(contentPath);

    if (document == null) {
      return DocsLayout(
        title: 'Not Found',
        description: 'The requested page could not be found.',
        currentPath: routePath,
        children: [
          p([text('Sorry, the page you are looking for does not exist.')]),
        ],
      );
    }

    // Convert TOC entries to TocItems
    final tocItems = document.tableOfContents
        .map((e) => TocItem(
              label: e.text,
              anchor: e.anchor,
              level: e.level,
            ))
        .toList();

    return DocsLayout(
      title: document.title,
      description: document.description,
      currentPath: routePath,
      tocItems: tocItems,
      children: [
        // Render the HTML content
        RawHtml(html: document.htmlContent),
      ],
    );
  }
}

/// Component to render raw HTML content
class RawHtml extends StatelessComponent {
  final String html;
  final String? classes;

  const RawHtml({
    super.key,
    required this.html,
    this.classes,
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes: classes ?? 'prose prose-invert max-w-none',
      attributes: {'innerHTML': html},
      [],
    );
  }
}

/// Sync version of content page for static content
class StaticContentPage extends StatelessComponent {
  final String title;
  final String? description;
  final String routePath;
  final String markdownContent;

  const StaticContentPage({
    super.key,
    required this.title,
    this.description,
    required this.routePath,
    required this.markdownContent,
  });

  @override
  Component build(BuildContext context) {
    // Parse markdown to HTML using duxt content utilities
    final parsed = _parseMarkdown(markdownContent);
    final toc = _extractToc(markdownContent);

    return DocsLayout(
      title: title,
      description: description,
      currentPath: routePath,
      tocItems: toc,
      children: [
        RawHtml(html: parsed),
      ],
    );
  }

  String _parseMarkdown(String markdown) {
    var html = markdown;

    // Code blocks (must be before inline code)
    html = html.replaceAllMapped(
      RegExp(r'```(\w*)\n([\s\S]*?)```', multiLine: true),
      (m) {
        final lang = m.group(1) ?? '';
        final codeContent = _escapeHtml(m.group(2) ?? '');
        return '<pre class="bg-gray-900 border border-gray-800 rounded-lg p-4 overflow-x-auto my-4"><code class="language-$lang text-sm text-gray-300">$codeContent</code></pre>';
      },
    );

    // Headers with IDs
    html = html.replaceAllMapped(
      RegExp(r'^######\s+(.+)$', multiLine: true),
      (m) => '<h6 id="${_slugify(m.group(1)!)}">${m.group(1)}</h6>',
    );
    html = html.replaceAllMapped(
      RegExp(r'^#####\s+(.+)$', multiLine: true),
      (m) => '<h5 id="${_slugify(m.group(1)!)}">${m.group(1)}</h5>',
    );
    html = html.replaceAllMapped(
      RegExp(r'^####\s+(.+)$', multiLine: true),
      (m) => '<h4 id="${_slugify(m.group(1)!)}">${m.group(1)}</h4>',
    );
    html = html.replaceAllMapped(
      RegExp(r'^###\s+(.+)$', multiLine: true),
      (m) => '<h3 id="${_slugify(m.group(1)!)}">${m.group(1)}</h3>',
    );
    html = html.replaceAllMapped(
      RegExp(r'^##\s+(.+)$', multiLine: true),
      (m) => '<h2 id="${_slugify(m.group(1)!)}">${m.group(1)}</h2>',
    );
    html = html.replaceAllMapped(
      RegExp(r'^#\s+(.+)$', multiLine: true),
      (m) => '<h1 id="${_slugify(m.group(1)!)}">${m.group(1)}</h1>',
    );

    // Blockquotes
    html = html.replaceAllMapped(
      RegExp(r'^>\s*(.+)$', multiLine: true),
      (m) => '<blockquote class="border-l-4 border-indigo-500 pl-4 italic text-gray-400">${m.group(1)}</blockquote>',
    );

    // Bold and italic
    html = html.replaceAllMapped(
      RegExp(r'\*\*\*(.+?)\*\*\*'),
      (m) => '<strong><em>${m.group(1)}</em></strong>',
    );
    html = html.replaceAllMapped(
      RegExp(r'\*\*(.+?)\*\*'),
      (m) => '<strong>${m.group(1)}</strong>',
    );
    html = html.replaceAllMapped(
      RegExp(r'\*(.+?)\*'),
      (m) => '<em>${m.group(1)}</em>',
    );

    // Inline code
    html = html.replaceAllMapped(
      RegExp(r'`([^`]+)`'),
      (m) => '<code class="bg-gray-800 text-indigo-300 px-1.5 py-0.5 rounded text-sm">${m.group(1)}</code>',
    );

    // Links
    html = html.replaceAllMapped(
      RegExp(r'\[([^\]]+)\]\(([^)]+)\)'),
      (m) => '<a href="${m.group(2)}" class="text-indigo-400 hover:text-indigo-300">${m.group(1)}</a>',
    );

    // Unordered lists
    html = html.replaceAllMapped(
      RegExp(r'^-\s+(.+)$', multiLine: true),
      (m) => '<li>${m.group(1)}</li>',
    );

    // Wrap consecutive li elements in ul
    html = html.replaceAllMapped(
      RegExp(r'(<li>.*?</li>\n?)+', multiLine: true),
      (m) => '<ul class="list-disc list-inside space-y-1 my-4">${m.group(0)}</ul>',
    );

    // Tables
    html = _parseTables(html);

    // Paragraphs (simple - wrap non-tag content)
    final lines = html.split('\n');
    final result = StringBuffer();
    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) {
        result.writeln();
      } else if (!trimmed.startsWith('<') && !trimmed.endsWith('>')) {
        result.writeln('<p class="my-4">$trimmed</p>');
      } else {
        result.writeln(line);
      }
    }

    return result.toString();
  }

  String _parseTables(String html) {
    final tableRegex = RegExp(
      r'^\|(.+)\|\n\|[-:\s|]+\|\n((?:\|.+\|\n?)+)',
      multiLine: true,
    );

    return html.replaceAllMapped(tableRegex, (m) {
      final headerRow = m.group(1)!.split('|').map((e) => e.trim()).where((e) => e.isNotEmpty);
      final bodyRows = m.group(2)!.trim().split('\n');

      final buffer = StringBuffer();
      buffer.writeln('<div class="overflow-x-auto my-4">');
      buffer.writeln('<table class="min-w-full divide-y divide-gray-700">');
      buffer.writeln('<thead class="bg-gray-800">');
      buffer.writeln('<tr>');
      for (final cell in headerRow) {
        buffer.writeln('<th class="px-4 py-2 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">$cell</th>');
      }
      buffer.writeln('</tr>');
      buffer.writeln('</thead>');
      buffer.writeln('<tbody class="bg-gray-900 divide-y divide-gray-800">');
      for (final row in bodyRows) {
        final cells = row.split('|').map((e) => e.trim()).where((e) => e.isNotEmpty);
        buffer.writeln('<tr>');
        for (final cell in cells) {
          buffer.writeln('<td class="px-4 py-2 text-sm text-gray-300">$cell</td>');
        }
        buffer.writeln('</tr>');
      }
      buffer.writeln('</tbody>');
      buffer.writeln('</table>');
      buffer.writeln('</div>');

      return buffer.toString();
    });
  }

  List<TocItem> _extractToc(String markdown) {
    final headingRegex = RegExp(r'^(#{2,4})\s+(.+)$', multiLine: true);
    final entries = <TocItem>[];

    for (final match in headingRegex.allMatches(markdown)) {
      final level = match.group(1)!.length;
      final text = match.group(2)!.trim();
      final anchor = _slugify(text);

      entries.add(TocItem(
        label: text,
        anchor: anchor,
        level: level,
      ));
    }

    return entries;
  }

  String _slugify(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'-+'), '-')
        .trim();
  }

  String _escapeHtml(String text) {
    return text
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;');
  }
}
