import 'package:jaspr/server.dart';
import 'package:jaspr/dom.dart';
import 'package:syntax_highlight_lite/syntax_highlight_lite.dart' hide Color;

/// Helper for hex colors
Color hexColor(String hex) => Color(hex);

/// A reusable syntax-highlighted code block for component documentation.
class CodePreview extends AsyncStatelessComponent {
  const CodePreview({
    required this.source,
    this.language = 'dart',
    this.filename,
    super.key,
  });

  final String source;
  final String language;
  final String? filename;

  static bool _initialized = false;

  /// Get display label for language
  String get _displayLabel {
    if (filename != null) return filename!;
    return switch (language) {
      'bash' || 'sh' || 'shell' || 'terminal' => 'Terminal',
      'dart' => 'dart',
      'yaml' || 'yml' => 'yaml',
      'json' => 'json',
      'html' => 'html',
      'css' => 'css',
      'js' || 'javascript' => 'javascript',
      'ts' || 'typescript' => 'typescript',
      _ => language,
    };
  }

  /// Check if this is a terminal/shell command
  bool get _isTerminal => ['bash', 'sh', 'shell', 'terminal'].contains(language);

  @override
  Future<Component> build(BuildContext context) async {
    if (!_initialized) {
      Highlighter.initialize(['dart']);
      _initialized = true;
    }

    // Only use highlighter for dart, fallback to plain text for others
    Highlighter? highlighter;
    if (language == 'dart') {
      highlighter = Highlighter(
        language: 'dart',
        theme: await HighlighterTheme.loadDarkTheme(),
      );
    }

    // Split source into lines for line numbers
    final lines = source.split('\n');

    return div(
      styles: Styles(raw: {
        'background-color': 'var(--code-bg)',
        'border-top': '1px solid var(--code-border)',
      }),
      [
        // Header with language/filename
        div(
          classes: 'flex items-center gap-2 px-4 py-2',
          styles: Styles(raw: {'border-bottom': '1px solid var(--code-border)'}),
          [
          // Icon based on type
          if (_isTerminal)
            span(styles: Styles(raw: {'color': 'var(--code-line-num)'}), [
              RawText('<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="4 17 10 11 4 5"></polyline><line x1="12" y1="19" x2="20" y2="19"></line></svg>'),
            ])
          else
            span(styles: Styles(raw: {'color': 'var(--code-line-num)'}), [
              RawText('<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>'),
            ]),
          span(
            classes: 'text-xs font-medium',
            styles: Styles(raw: {'color': 'var(--code-line-num)'}),
            [Component.text(_displayLabel)],
          ),
        ]),
        // Code content with line numbers
        div(classes: 'flex overflow-x-auto', [
          // Line numbers column
          div(
            classes: 'flex-shrink-0 py-4 pl-4 pr-4 text-right select-none font-mono',
            styles: Styles(raw: {
              'color': 'var(--code-line-num)',
              'font-family': 'JetBrains Mono, monospace !important',
            }),
            [
              for (var i = 1; i <= lines.length; i++)
                div(classes: 'text-sm leading-6', [Component.text('$i')]),
            ],
          ),
          // Code column
          div(classes: 'flex-1 py-4 pr-4 overflow-x-auto font-mono', [
            pre(
              classes: 'text-sm leading-6 font-mono',
              styles: Styles(raw: {
                'font-family': 'JetBrains Mono, monospace !important',
                'color': 'var(--code-text)',
              }),
              [
                code(
                  styles: Styles(raw: {'font-family': 'JetBrains Mono, monospace !important'}),
                  [
                    if (highlighter != null)
                      _buildSpan(highlighter.highlight(source))
                    else
                      Component.text(source),
                  ],
                ),
              ],
            ),
          ]),
        ]),
      ],
    );
  }

  Component _buildSpan(TextSpan textSpan) {
    Styles? styles;
    if (textSpan.style case final style?) {
      styles = Styles(
        color: Color.value(style.foreground.argb & 0x00FFFFFF),
        fontWeight: style.bold ? FontWeight.bold : null,
        fontStyle: style.italic ? FontStyle.italic : null,
      );
    }
    if (styles == null && textSpan.children.isEmpty) {
      return Component.text(textSpan.text ?? '');
    }
    return span(styles: styles, [
      if (textSpan.text != null) Component.text(textSpan.text!),
      for (final t in textSpan.children) _buildSpan(t),
    ]);
  }
}

/// A complete preview card with live component preview and syntax-highlighted code.
class ComponentPreviewCard extends StatelessComponent {
  const ComponentPreviewCard({
    required this.preview,
    this.code = '',
    this.language = 'dart',
    super.key,
  });

  final List<Component> preview;
  final String code;
  final String language;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'not-prose my-4 rounded-xl overflow-hidden',
      [
        // Preview area
        div(
          classes: 'p-8 flex items-center justify-center min-h-[120px]',
          styles: Styles(raw: {'background-color': 'var(--preview-bg, #f4f4f5)'}),
          preview,
        ),
        // Code area with syntax highlighting
        if (code.isNotEmpty) CodePreview(source: code, language: language),
      ],
    );
  }
}
