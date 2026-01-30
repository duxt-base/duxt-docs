import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Ecosystem section showing Duxt packages
class LandingEcosystem extends StatelessComponent {
  const LandingEcosystem({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'py-24 px-6 bg-slate-100/50 dark:bg-zinc-900/50', [
      div(classes: 'max-w-6xl mx-auto', [
        // Section header
        div(classes: 'text-center mb-16', [
          span(classes: 'inline-block text-cyan-600 dark:text-cyan-400 text-sm font-semibold uppercase tracking-wider mb-3', [
            Component.text('Ecosystem'),
          ]),
          h2(classes: 'text-3xl sm:text-4xl font-bold text-slate-900 dark:text-white mb-3', [
            Component.text('The Duxt Family'),
          ]),
          p(classes: 'text-lg text-slate-600 dark:text-zinc-400 max-w-xl mx-auto', [
            Component.text('A growing collection of packages to supercharge your Dart web development'),
          ]),
        ]),
        // Packages grid
        div(classes: 'grid grid-cols-1 md:grid-cols-3 gap-6', [
          _packageCard(
            'Duxt UI',
            'Beautiful, accessible UI components built for Duxt. 50+ components ready to use.',
            '/duxt-ui',
            'material-symbols:widgets-outline',
            true,
          ),
          _packageCard(
            'Duxt ORM',
            'ActiveRecord-style ORM with auto-migrations. Supports PostgreSQL, MySQL & SQLite.',
            '/duxt-orm',
            'material-symbols:database-outline',
            true,
          ),
          _comingSoonCard(),
        ]),
      ]),
    ]);
  }

  Component _packageCard(String title, String description, String href, String icon, bool available) {
    return a(
      href: href,
      classes: 'group block bg-white dark:bg-zinc-800/50 border border-slate-200 dark:border-zinc-700/50 rounded-2xl p-8 hover:border-cyan-500/50 dark:hover:border-cyan-500/50 hover:shadow-xl hover:shadow-cyan-500/5 dark:hover:shadow-cyan-500/10 transition-all duration-300',
      [
        div(classes: 'flex items-start justify-between mb-4', [
          div(classes: 'w-12 h-12 rounded-xl bg-cyan-500/10 dark:bg-cyan-400/10 flex items-center justify-center text-cyan-600 dark:text-cyan-400', [
            RawText('<iconify-icon icon="$icon" width="24" height="24"></iconify-icon>'),
          ]),
          span(classes: 'text-xs font-medium px-2.5 py-1 rounded-full bg-emerald-500/10 text-emerald-600 dark:text-emerald-400', [
            Component.text('Available'),
          ]),
        ]),
        h3(classes: 'text-xl font-semibold text-slate-900 dark:text-white mb-2 group-hover:text-cyan-600 dark:group-hover:text-cyan-400 transition-colors', [
          Component.text(title),
        ]),
        p(classes: 'text-slate-600 dark:text-zinc-400 leading-relaxed mb-4', [
          Component.text(description),
        ]),
        span(classes: 'inline-flex items-center gap-1 text-sm font-medium text-cyan-600 dark:text-cyan-400', [
          Component.text('Learn more'),
          RawText('<svg class="w-4 h-4 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>'),
        ]),
      ],
    );
  }

  Component _comingSoonCard() {
    return div(
      classes: 'bg-gradient-to-br from-slate-100 to-slate-50 dark:from-zinc-800/30 dark:to-zinc-900/30 border border-dashed border-slate-300 dark:border-zinc-700 rounded-2xl p-8 flex flex-col items-center justify-center text-center',
      [
        div(classes: 'w-12 h-12 rounded-xl bg-slate-200 dark:bg-zinc-700/50 flex items-center justify-center text-slate-400 dark:text-zinc-500 mb-4', [
          RawText('<iconify-icon icon="material-symbols:add" width="24" height="24"></iconify-icon>'),
        ]),
        h3(classes: 'text-xl font-semibold text-slate-500 dark:text-zinc-500 mb-2', [
          Component.text('More Coming Soon'),
        ]),
        p(classes: 'text-slate-400 dark:text-zinc-600 text-sm', [
          Component.text('Auth, Forms, Analytics, and more packages are in development'),
        ]),
      ],
    );
  }
}
