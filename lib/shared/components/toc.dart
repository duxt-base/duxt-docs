import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Table of contents item
class TocItem {
  final String label;
  final String anchor;
  final int level;

  const TocItem({
    required this.label,
    required this.anchor,
    this.level = 2,
  });
}

/// Table of contents component
class TableOfContents extends StatelessComponent {
  final List<TocItem> items;

  const TableOfContents({super.key, required this.items});

  @override
  Component build(BuildContext context) {
    return aside(
      classes: 'fixed right-0 top-16 bottom-0 w-64 bg-gray-950 border-l border-gray-800 overflow-y-auto scrollbar-thin hidden lg:block',
      [
        div(classes: 'p-4', [
          div(classes: 'text-xs font-semibold text-gray-500 uppercase tracking-wider mb-4', [
            text('On this page'),
          ]),
          nav(classes: 'space-y-1', [
            for (final item in items)
              a(
                href: '#${item.anchor}',
                classes: 'toc-link ${item.level > 2 ? 'pl-6' : ''}',
                [text(item.label)],
              ),
          ]),
        ]),
      ],
    );
  }
}
