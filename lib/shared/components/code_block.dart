import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart' hide code;
import 'package:jaspr/dom.dart' as dom show code;

/// Code block with syntax highlighting and copy button
class CodeBlock extends StatelessComponent {
  final String codeContent;
  final String language;
  final String? filename;
  final bool showLineNumbers;

  const CodeBlock({
    super.key,
    required String code,
    this.language = 'dart',
    this.filename,
    this.showLineNumbers = false,
  }) : codeContent = code;

  @override
  Component build(BuildContext context) {
    return div(classes: 'code-block group', [
      // Header with filename and copy button
      if (filename != null)
        div(classes: 'flex items-center justify-between px-4 py-2 bg-gray-900 border-b border-gray-800 text-sm', [
          span(classes: 'text-gray-400', [text(filename!)]),
          _buildCopyButton(),
        ]),
      // Code content
      div(classes: 'relative', [
        pre(classes: 'p-4 overflow-x-auto ${filename == null ? 'rounded-lg' : 'rounded-b-lg'} bg-gray-900 border border-gray-800 ${filename != null ? 'border-t-0 rounded-t-none' : ''}', [
          dom.code(classes: 'language-$language text-sm text-gray-300', [text(codeContent)]),
        ]),
        if (filename == null)
          div(classes: 'absolute top-2 right-2 opacity-0 group-hover:opacity-100 transition-opacity', [
            _buildCopyButton(),
          ]),
      ]),
    ]);
  }

  Component _buildCopyButton() {
    return button(
      classes: 'p-2 text-gray-500 hover:text-white hover:bg-gray-800 rounded transition-colors',
      attributes: {'onclick': 'navigator.clipboard.writeText(`${codeContent.replaceAll('`', '\\`')}`)', 'title': 'Copy to clipboard'},
      [
        span(classes: 'text-xs', [text('Copy')]),
      ],
    );
  }
}

/// Component preview with live example and code
class ComponentPreview extends StatelessComponent {
  final List<Component> preview;
  final String codeContent;
  final String? title;

  const ComponentPreview({
    super.key,
    required this.preview,
    required String code,
    this.title,
  }) : codeContent = code;

  @override
  Component build(BuildContext context) {
    return div(classes: 'component-preview', [
      // Preview area
      div(classes: 'component-preview-content', [
        if (title != null)
          div(classes: 'absolute top-2 left-3 text-xs text-gray-500', [text(title!)]),
        ...preview,
      ]),
      // Code area
      div(classes: 'component-preview-code', [
        CodeBlock(code: codeContent, language: 'dart'),
      ]),
    ]);
  }
}

/// Inline code snippet
class InlineCode extends StatelessComponent {
  final String codeText;

  const InlineCode(this.codeText, {super.key});

  @override
  Component build(BuildContext context) {
    return dom.code(
      classes: 'bg-gray-800 text-indigo-300 px-1.5 py-0.5 rounded text-sm',
      [text(codeText)],
    );
  }
}

/// Callout/Alert component for documentation
class Callout extends StatelessComponent {
  final String type; // info, warning, error, tip
  final String? title;
  final List<Component> children;

  const Callout({
    super.key,
    this.type = 'info',
    this.title,
    required this.children,
  });

  String get _borderColor {
    switch (type) {
      case 'warning':
        return 'border-yellow-500';
      case 'error':
        return 'border-red-500';
      case 'tip':
        return 'border-green-500';
      default:
        return 'border-indigo-500';
    }
  }

  String get _bgColor {
    switch (type) {
      case 'warning':
        return 'bg-yellow-500/10';
      case 'error':
        return 'bg-red-500/10';
      case 'tip':
        return 'bg-green-500/10';
      default:
        return 'bg-indigo-500/10';
    }
  }

  String get _titleColor {
    switch (type) {
      case 'warning':
        return 'text-yellow-400';
      case 'error':
        return 'text-red-400';
      case 'tip':
        return 'text-green-400';
      default:
        return 'text-indigo-400';
    }
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'rounded-lg border-l-4 $_borderColor $_bgColor p-4 my-4', [
      if (title != null)
        div(classes: 'font-semibold $_titleColor mb-2', [text(title!)]),
      div(classes: 'text-gray-300 text-sm', children),
    ]);
  }
}
