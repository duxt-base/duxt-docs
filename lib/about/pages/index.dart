import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../../shared/components/app_scaffold.dart';
import '../../shared/components/landing_footer.dart';

/// About page for duxt.dev
class AboutIndexPage extends StatelessComponent {
  const AboutIndexPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      contentClass: '',
      fullWidth: true,
      body: Component.fragment([
        const _AboutHero(),
        const _WhySection(),
        const _StackSection(),
        const _BottomSection(),
        const LandingFooter(),
      ]),
    );
  }
}

/// Hero section
class _AboutHero extends StatelessComponent {
  const _AboutHero();

  @override
  Component build(BuildContext context) {
    return section(
      classes: 'relative pt-32 pb-24 px-6 text-center',
      styles: Styles(raw: {'background': 'linear-gradient(to bottom, rgba(6, 182, 212, 0.05), transparent)'}),
      [
        // Glow effect
        div(
          classes: 'absolute inset-0 pointer-events-none',
          styles: Styles(raw: {'background': 'radial-gradient(ellipse at top, rgba(6, 182, 212, 0.15), transparent 50%)'}),
          [],
        ),
        div(classes: 'relative z-10 max-w-4xl mx-auto', [
          span(
            classes: 'inline-flex px-4 py-1.5 mb-8 text-sm font-medium text-cyan-400 bg-cyan-500/10 rounded-full border border-cyan-500/20',
            [Component.text('About')],
          ),
          h1(classes: 'text-5xl md:text-6xl font-bold text-white mb-6 tracking-tight', [
            Component.text('Building the future of'),
            br(),
            span(classes: 'bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent', [
              Component.text('Dart web development'),
            ]),
          ]),
          p(classes: 'text-xl text-zinc-400 max-w-2xl mx-auto', [
            Component.text('Duxt is a meta-framework built on top of Jaspr, designed to make building full-stack Dart web applications fast and enjoyable.'),
          ]),
        ]),
      ],
    );
  }
}

/// Why Dart? Why now? section
class _WhySection extends StatelessComponent {
  const _WhySection();

  @override
  Component build(BuildContext context) {
    return section(classes: 'py-24 px-6', [
      div(classes: 'max-w-3xl mx-auto', [
        // Section header
        div(classes: 'text-center mb-16', [
          span(classes: 'text-cyan-400 font-semibold text-sm tracking-wider uppercase mb-4 block', [
            Component.text('Philosophy'),
          ]),
          h2(classes: 'text-4xl font-bold text-white', [
            Component.text('Why Dart? Why now?'),
          ]),
        ]),
        // Why now - Jaspr
        div(classes: 'mb-14', [
          h3(classes: 'text-2xl font-semibold text-white mb-4', [
            Component.text('Why now? Because Jaspr exists.'),
          ]),
          p(classes: 'text-lg text-zinc-400 leading-relaxed mb-4', [
            Component.text('For years, Dart on the web was possible but not practical. Then '),
            a(href: 'https://github.com/schultek', target: Target.blank, classes: 'text-cyan-400 hover:text-cyan-300', [
              Component.text('Kilian Schulte'),
            ]),
            Component.text(' created '),
            a(href: 'https://github.com/schultek/jaspr', target: Target.blank, classes: 'text-cyan-400 hover:text-cyan-300', [
              Component.text('Jaspr'),
            ]),
            Component.text(' — a modern web framework that finally makes Dart a first-class citizen for building websites.'),
          ]),
          p(classes: 'text-lg text-zinc-400 leading-relaxed', [
            Component.text('Jaspr handles server-side rendering, hydration, and client-side interactivity with a familiar component model. It\'s the foundation that made Duxt possible. Without Jaspr, there would be no Duxt.'),
          ]),
        ]),
        // JavaScript fatigue
        div(classes: 'mb-14', [
          h3(classes: 'text-2xl font-semibold text-white mb-4', [
            Component.text('The JavaScript fatigue is real'),
          ]),
          p(classes: 'text-lg text-zinc-400 leading-relaxed mb-4', [
            Component.text('We\'ve all been there. A new JavaScript framework every week. Config files for config files. Build tools that need their own build tools. The web development ecosystem became exhausting.'),
          ]),
          p(classes: 'text-lg text-zinc-400 leading-relaxed', [
            Component.text('Dart offers something different: a single, cohesive language designed from the ground up for building applications. No transpilers fighting each other. No "module not found" at 2am. Just code that works.'),
          ]),
        ]),
        // DX
        div(classes: 'mb-14', [
          h3(classes: 'text-2xl font-semibold text-white mb-4', [
            Component.text('Developer Experience is everything'),
          ]),
          p(classes: 'text-lg text-zinc-400 leading-relaxed mb-4', [
            Component.text('We believe the best frameworks are the ones that get out of your way. Duxt isn\'t about adding complexity — it\'s about removing it. Convention over configuration. Sensible defaults. Zero boilerplate.'),
          ]),
          p(classes: 'text-lg text-zinc-400 leading-relaxed', [
            Component.text('When you run '),
            code(classes: 'bg-zinc-800 px-2 py-0.5 rounded text-cyan-400', [Component.text('duxt create')]),
            Component.text(', you should be productive in seconds, not hours. That\'s the bar we set for ourselves.'),
          ]),
        ]),
        // One language
        div(classes: 'mb-14', [
          h3(classes: 'text-2xl font-semibold text-white mb-4', [
            Component.text('One language to rule them all'),
          ]),
          p(classes: 'text-lg text-zinc-400 leading-relaxed mb-4', [
            Component.text('Frontend. Backend. Mobile. Desktop. Dart runs everywhere. With Duxt, your data models, validation logic, and business rules are shared across your entire stack. No more maintaining two codebases that do the same thing.'),
          ]),
          p(classes: 'text-lg text-zinc-400 leading-relaxed', [
            Component.text('Type safety isn\'t a feature — it\'s a philosophy. Catch bugs before your users do. Refactor with confidence. Sleep better at night.'),
          ]),
        ]),
        // Quote
        a(
          href: 'https://x.com/flakerimi/status/2016569333808320852',
          target: Target.blank,
          classes: 'block bg-cyan-500/5 border-l-4 border-cyan-500 py-6 px-8 rounded-r-xl hover:bg-cyan-500/10 transition-colors',
          [
            p(classes: 'text-lg text-zinc-200 italic mb-3', [
              Component.text('"Jaspr is underrated... I need to do a Nuxt-like thing with this."'),
            ]),
            p(classes: 'text-zinc-500 text-sm', [
              Component.text('— The tweet that started it all'),
            ]),
          ],
        ),
      ]),
    ]);
  }
}

/// Stack section
class _StackSection extends StatelessComponent {
  const _StackSection();

  @override
  Component build(BuildContext context) {
    return section(classes: 'py-24 px-6 bg-zinc-900/50', [
      div(classes: 'max-w-4xl mx-auto', [
        div(classes: 'text-center mb-16', [
          span(classes: 'text-cyan-400 font-semibold text-sm tracking-wider uppercase mb-4 block', [
            Component.text('The Stack'),
          ]),
          h2(classes: 'text-4xl font-bold text-white mb-4', [
            Component.text('Built on solid foundations'),
          ]),
          p(classes: 'text-lg text-zinc-400', [
            Component.text('Duxt combines the best tools in the Dart ecosystem.'),
          ]),
        ]),
        div(classes: 'space-y-4', [
          _stackCard(
            'Jaspr',
            'The modern Dart web framework by Kilian Schulte that made this all possible',
            'https://github.com/schultek/jaspr',
          ),
          _stackCard(
            'Tailwind CSS',
            'Utility-first CSS framework for rapid UI development',
            'https://tailwindcss.com',
          ),
          _stackCard(
            'Dart',
            'Client-optimized language for fast apps on any platform',
            'https://dart.dev',
          ),
        ]),
      ]),
    ]);
  }

  Component _stackCard(String title, String desc, String url) {
    return a(
      href: url,
      target: Target.blank,
      classes: 'flex items-center gap-4 p-6 bg-zinc-800/50 rounded-2xl border border-zinc-700/50 hover:border-cyan-500/50 transition-colors',
      [
        div(classes: 'w-12 h-12 bg-cyan-500/10 rounded-xl flex items-center justify-center flex-shrink-0', [
          RawText('<svg class="w-6 h-6 text-cyan-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>'),
        ]),
        div(classes: 'flex-1', [
          div(classes: 'text-white font-semibold mb-1', [Component.text(title)]),
          div(classes: 'text-zinc-500 text-sm', [Component.text(desc)]),
        ]),
        RawText('<svg class="w-5 h-5 text-zinc-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>'),
      ],
    );
  }
}

/// Combined Open Source + CTA section in 2 columns
class _BottomSection extends StatelessComponent {
  const _BottomSection();

  @override
  Component build(BuildContext context) {
    return section(
      classes: 'py-24 px-6',
      styles: Styles(raw: {'background': 'linear-gradient(135deg, rgba(6, 182, 212, 0.05), rgba(59, 130, 246, 0.05))'}),
      [
        div(classes: 'max-w-5xl mx-auto grid md:grid-cols-2 gap-12 md:gap-16 items-center', [
          // Left: Open Source
          div(classes: 'text-center md:text-left', [
            div(classes: 'w-14 h-14 bg-cyan-500/10 rounded-2xl flex items-center justify-center mx-auto md:mx-0 mb-6 border border-cyan-500/20', [
              RawText('<svg class="w-7 h-7 text-cyan-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path></svg>'),
            ]),
            h2(classes: 'text-3xl font-bold text-white mb-4', [
              Component.text('Open Source'),
            ]),
            p(classes: 'text-zinc-400 mb-6', [
              Component.text('Duxt is open source and available on GitHub. We welcome contributions from the community.'),
            ]),
            div(classes: 'flex gap-3 justify-center md:justify-start flex-wrap', [
              a(
                href: 'https://github.com/duxt-base/duxt',
                target: Target.blank,
                classes: 'inline-flex items-center gap-2 px-4 py-2 text-sm font-medium rounded-lg border border-zinc-700 text-zinc-300 bg-zinc-800/50 hover:bg-zinc-800 transition-colors',
                [
                  RawText('<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24"><path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/></svg>'),
                  Component.text('Duxt'),
                ],
              ),
              a(
                href: 'https://github.com/duxt-base/duxt-ui',
                target: Target.blank,
                classes: 'inline-flex items-center gap-2 px-4 py-2 text-sm font-medium rounded-lg border border-zinc-700 text-zinc-300 bg-zinc-800/50 hover:bg-zinc-800 transition-colors',
                [
                  RawText('<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24"><path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/></svg>'),
                  Component.text('Duxt UI'),
                ],
              ),
            ]),
          ]),
          // Right: Get Started
          div(classes: 'text-center md:text-left', [
            div(classes: 'w-14 h-14 bg-cyan-500/10 rounded-2xl flex items-center justify-center mx-auto md:mx-0 mb-6 border border-cyan-500/20', [
              RawText('<svg class="w-7 h-7 text-cyan-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>'),
            ]),
            h2(classes: 'text-3xl font-bold text-white mb-4', [
              Component.text('Ready to get started?'),
            ]),
            p(classes: 'text-zinc-400 mb-6', [
              Component.text('Jump into the documentation and start building your next Dart web application with Duxt.'),
            ]),
            div(classes: 'flex gap-3 justify-center md:justify-start flex-wrap', [
              a(
                href: '/duxt',
                classes: 'inline-flex items-center justify-center px-5 py-2.5 text-sm font-semibold rounded-lg bg-cyan-500 text-white hover:bg-cyan-600 transition-colors',
                [Component.text('Read the Docs')],
              ),
              a(
                href: '/duxt-ui',
                classes: 'inline-flex items-center justify-center px-5 py-2.5 text-sm font-semibold rounded-lg border border-zinc-700 text-zinc-300 bg-zinc-800/50 hover:bg-zinc-800 transition-colors',
                [Component.text('Components')],
              ),
            ]),
          ]),
        ]),
      ],
    );
  }
}
