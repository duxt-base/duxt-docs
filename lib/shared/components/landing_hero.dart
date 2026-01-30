import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Hero section for the landing page using Tailwind CSS with dark: variants.
class LandingHero extends StatelessComponent {
  const LandingHero({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      classes: 'min-h-[calc(100vh-64px)] flex items-center justify-center text-center px-6 py-16 relative overflow-hidden',
      [
        // Background glow (subtle in light, visible in dark)
        div(
          classes: 'absolute top-0 left-1/2 -translate-x-1/2 w-full max-w-3xl h-96 bg-gradient-radial from-cyan-500/5 dark:from-cyan-500/10 to-transparent pointer-events-none',
          [],
        ),
        // Content
        div(classes: 'max-w-3xl relative z-10', [
          // Logo with glow effect
          div(classes: 'inline-block mb-8 relative', [
            div(classes: 'absolute inset-0 bg-cyan-400/10 dark:bg-cyan-400/20 blur-2xl rounded-full', []),
            img(
              src: '/images/logo.svg',
              alt: 'Duxt',
              classes: 'w-24 h-auto relative',
            ),
          ]),
          // Title with gradient
          h1(
            classes: 'text-4xl sm:text-5xl lg:text-6xl font-bold mb-6 bg-gradient-to-br from-cyan-500 via-cyan-600 to-cyan-700 dark:from-cyan-300 dark:via-cyan-400 dark:to-cyan-600 bg-clip-text text-transparent',
            [Component.text('Build Full-Stack Dart Web Apps')],
          ),
          // Description
          p(classes: 'text-lg sm:text-xl text-slate-600 dark:text-zinc-400 mb-8 leading-relaxed', [
            Component.text('The meta-framework for '),
            span(classes: 'text-cyan-600 dark:text-cyan-400 font-semibold', [Component.text('Jaspr')]),
            Component.text(' with module-based architecture, file-based routing, and powerful scaffolding.'),
          ]),
          // CTA Buttons
          div(classes: 'flex flex-wrap gap-4 justify-center mb-8', [
            a(
              href: '/duxt',
              classes: 'px-8 py-3 rounded-lg font-semibold bg-gradient-to-br from-cyan-500 to-cyan-700 dark:from-cyan-400 dark:to-cyan-600 text-white dark:text-cyan-950 shadow-lg shadow-cyan-500/25 hover:shadow-cyan-500/40 hover:-translate-y-0.5 transition-all',
              [Component.text('Get Started')],
            ),
            a(
              href: 'https://github.com/duxt-base/duxt',
              target: Target.blank,
              classes: 'px-8 py-3 rounded-lg font-semibold border border-slate-300 dark:border-zinc-700 text-slate-700 dark:text-zinc-100 hover:border-cyan-500 hover:text-cyan-600 dark:hover:text-cyan-400 hover:bg-cyan-500/5 transition-all',
              [Component.text('GitHub')],
            ),
          ]),
          // Install command
          div(
            classes: 'inline-flex items-center gap-1 bg-slate-200 dark:bg-zinc-900 border border-slate-300 dark:border-zinc-800 border-l-4 border-l-cyan-500 rounded-lg px-5 py-3 mb-6',
            [
              span(classes: 'text-cyan-600 dark:text-cyan-500 font-mono font-bold', [Component.text('\$')]),
              code(classes: 'text-cyan-700 dark:text-cyan-300 font-mono', [Component.text(' dart pub global activate duxt')]),
            ],
          ),
          // Version badge
          div(classes: 'flex items-center justify-center gap-2', [
            span(
              classes: 'bg-gradient-to-r from-cyan-600 to-cyan-700 text-cyan-50 dark:text-cyan-100 px-3 py-1 rounded-full text-sm font-semibold font-mono',
              [Component.text('v0.3.7')],
            ),
            span(classes: 'text-cyan-600 dark:text-cyan-500 text-sm', [Component.text('Latest')]),
          ]),
        ]),
      ],
    );
  }
}
