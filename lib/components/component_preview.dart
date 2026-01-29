import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// A preview card that displays a live component with title and description.
class ComponentPreview extends StatelessComponent {
  final String title;
  final String description;
  final String href;
  final Component preview;
  final String? previewClasses;

  const ComponentPreview({
    super.key,
    required this.title,
    required this.description,
    required this.href,
    required this.preview,
    this.previewClasses,
  });

  @override
  Component build(BuildContext context) {
    return a(
      href: href,
      classes: 'group block rounded-xl border border-zinc-800 hover:border-zinc-700 overflow-hidden transition-all hover:shadow-lg hover:shadow-cyan-500/5',
      [
        // Preview area
        div(
          classes: 'aspect-[4/3] bg-zinc-900/50 flex items-center justify-center p-6 ${previewClasses ?? ""}',
          [
            // Render the actual component
            preview,
          ],
        ),
        // Info area
        div(classes: 'p-4 border-t border-zinc-800', [
          h3(classes: 'font-semibold text-white group-hover:text-cyan-400 transition-colors', [
            Component.text(title),
          ]),
          p(classes: 'text-sm text-zinc-400 mt-1', [
            Component.text(description),
          ]),
        ]),
      ],
    );
  }
}

/// Grid container for component previews.
class ComponentGrid extends StatelessComponent {
  final List<Component> children;

  const ComponentGrid({
    super.key,
    required this.children,
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-6',
      children,
    );
  }
}

/// Section header for component categories.
class ComponentSection extends StatelessComponent {
  final String title;
  final String? description;

  const ComponentSection({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Component build(BuildContext context) {
    return div(classes: 'mt-12 first:mt-0', [
      h2(classes: 'text-2xl font-bold text-white', [Component.text(title)]),
      if (description != null)
        p(classes: 'text-zinc-400 mt-2', [Component.text(description!)]),
    ]);
  }
}
