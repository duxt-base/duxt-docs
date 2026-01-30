import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Features section using Tailwind CSS with dark: variants.
class LandingFeatures extends StatelessComponent {
  const LandingFeatures({super.key});

  static const _features = [
    (
      icon: 'material-symbols:folder-outline',
      title: 'Module-Based Architecture',
      description: 'Organize code by feature with pages, components, models & APIs',
    ),
    (
      icon: 'material-symbols:route-outline',
      title: 'File-Based Routing',
      description: 'Pages auto-generate routes — no manual configuration needed',
    ),
    (
      icon: 'material-symbols:palette-outline',
      title: 'Built-in Tailwind CSS',
      description: 'Automatic Tailwind compilation with watch mode in development',
    ),
    (
      icon: 'material-symbols:database-outline',
      title: 'Fullstack Template',
      description: 'New projects include a complete blog example with SQLite',
    ),
    (
      icon: 'material-symbols:sync-outline',
      title: 'State Management',
      description: 'DuxtState mixin handles loading, error & data states',
    ),
    (
      icon: 'material-symbols:terminal',
      title: 'Scaffold Generator',
      description: 'Full CRUD generation with a single command',
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(classes: 'py-24 px-6 text-center', [
      // Section header
      span(classes: 'inline-block text-cyan-600 dark:text-cyan-400 text-sm font-semibold uppercase tracking-wider mb-3', [
        Component.text('Features'),
      ]),
      h2(classes: 'text-3xl sm:text-4xl font-bold text-slate-900 dark:text-white mb-3', [
        Component.text('Everything you need'),
      ]),
      p(classes: 'text-lg text-slate-600 dark:text-zinc-400 mb-16 max-w-xl mx-auto', [
        Component.text('Build production-ready Dart web applications with batteries included'),
      ]),
      // Features grid
      div(classes: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-6xl mx-auto', [
        for (var i = 0; i < _features.length; i++)
          _featureCard(_features[i], i),
      ]),
    ]);
  }

  Component _featureCard(({String icon, String title, String description}) feature, int index) {
    // Different cyan accent shades for variety
    final iconColors = [
      'text-cyan-500 bg-cyan-500/10 dark:text-cyan-400 dark:bg-cyan-400/10',
      'text-cyan-600 bg-cyan-600/10 dark:text-cyan-500 dark:bg-cyan-500/10',
      'text-cyan-400 bg-cyan-400/10 dark:text-cyan-300 dark:bg-cyan-300/10',
    ];
    final colorClass = iconColors[index % 3];

    return div(
      classes: 'bg-slate-200/50 dark:bg-zinc-900 border border-slate-300 dark:border-zinc-800 rounded-2xl p-8 text-left hover:border-cyan-500/50 dark:hover:border-cyan-600 hover:-translate-y-1 hover:shadow-xl hover:shadow-cyan-500/5 dark:hover:shadow-cyan-500/10 transition-all duration-300',
      [
        // Icon
        div(
          classes: 'w-14 h-14 rounded-xl flex items-center justify-center mb-5 $colorClass',
          [
            RawText('<iconify-icon icon="${feature.icon}" width="28" height="28"></iconify-icon>'),
          ],
        ),
        // Title
        h3(classes: 'text-lg font-semibold text-slate-900 dark:text-white mb-2', [
          Component.text(feature.title),
        ]),
        // Description
        p(classes: 'text-slate-600 dark:text-zinc-400 leading-relaxed', [
          Component.text(feature.description),
        ]),
      ],
    );
  }
}
