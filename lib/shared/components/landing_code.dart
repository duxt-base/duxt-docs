import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Code examples section using Tailwind CSS with dark: variants.
class LandingCode extends StatelessComponent {
  const LandingCode({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'py-16 px-6 max-w-6xl mx-auto text-center', [
      // Section header
      span(classes: 'inline-block text-cyan-600 dark:text-cyan-500 text-sm font-semibold uppercase tracking-wider mb-3', [
        Component.text('Quick Start'),
      ]),
      h2(classes: 'text-2xl sm:text-3xl font-bold text-slate-900 dark:text-white mb-12', [
        Component.text('Up and running in seconds'),
      ]),
      // Code blocks grid
      div(classes: 'grid grid-cols-1 lg:grid-cols-2 gap-6 text-left', [
        // Install & Create
        _codeBlock('Terminal', [
          _line(comment: '# Install Duxt CLI'),
          _line(prompt: '\$ ', text: 'dart pub global activate ', highlight: 'duxt'),
          _line(empty: true),
          _line(comment: '# Create a new project'),
          _line(prompt: '\$ ', text: 'duxt create ', string: 'my-app'),
          _line(prompt: '\$ ', text: 'cd my-app'),
          _line(empty: true),
          _line(comment: '# Start dev server'),
          _line(prompt: '\$ ', text: 'duxt dev'),
        ]),
        // Generators
        _codeBlock('Generators', [
          _line(comment: '# Generate a module'),
          _line(prompt: '\$ ', text: 'duxt g module ', string: 'posts'),
          _line(empty: true),
          _line(comment: '# Generate a page'),
          _line(prompt: '\$ ', text: 'duxt g page ', string: 'posts/[id]'),
          _line(empty: true),
          _line(comment: '# Scaffold full CRUD'),
          _line(prompt: '\$ ', text: 'duxt scaffold ', string: 'posts', suffix: ' title:', type: 'String'),
        ]),
      ]),
    ]);
  }

  Component _codeBlock(String title, List<Component> lines) {
    return div(
      classes: 'bg-slate-200 dark:bg-zinc-900 border border-slate-300 dark:border-zinc-800 rounded-2xl overflow-hidden',
      [
        // Header with dots
        div(classes: 'flex items-center gap-3 px-4 py-3 bg-slate-300/50 dark:bg-zinc-800/50 border-b border-slate-300 dark:border-zinc-800', [
          // Window dots
          div(classes: 'flex gap-1.5', [
            span(classes: 'w-3 h-3 rounded-full bg-red-500', []),
            span(classes: 'w-3 h-3 rounded-full bg-yellow-500', []),
            span(classes: 'w-3 h-3 rounded-full bg-green-500', []),
          ]),
          span(classes: 'text-sm font-medium text-slate-500 dark:text-zinc-500', [Component.text(title)]),
        ]),
        // Code content
        pre(classes: 'p-5 overflow-x-auto', [
          code(classes: 'text-sm font-mono leading-7', lines),
        ]),
      ],
    );
  }

  Component _line({
    String? comment,
    String? prompt,
    String? text,
    String? highlight,
    String? string,
    String? suffix,
    String? type,
    bool empty = false,
  }) {
    if (empty) return Component.text('\n');

    final parts = <Component>[];

    if (comment != null) {
      parts.add(span(classes: 'text-slate-500 dark:text-zinc-500', [Component.text('$comment\n')]));
    } else {
      if (prompt != null) {
        parts.add(span(classes: 'text-cyan-600 dark:text-cyan-500', [Component.text(prompt)]));
      }
      if (text != null) {
        parts.add(span(classes: 'text-slate-700 dark:text-zinc-300', [Component.text(text)]));
      }
      if (highlight != null) {
        parts.add(span(classes: 'text-cyan-600 dark:text-cyan-400 font-semibold', [Component.text(highlight)]));
      }
      if (string != null) {
        parts.add(span(classes: 'text-cyan-500 dark:text-cyan-300', [Component.text(string)]));
      }
      if (suffix != null) {
        parts.add(span(classes: 'text-slate-700 dark:text-zinc-300', [Component.text(suffix)]));
      }
      if (type != null) {
        parts.add(span(classes: 'text-cyan-700 dark:text-cyan-600', [Component.text(type)]));
      }
      parts.add(Component.text('\n'));
    }

    return Component.fragment(parts);
  }
}
