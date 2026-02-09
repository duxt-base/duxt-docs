import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../../shared/components/app_scaffold.dart';
import '../../shared/components/landing_footer.dart';

/// Showcase page — sites built with Duxt.
class ShowcaseIndexPage extends StatelessComponent {
  const ShowcaseIndexPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      contentClass: '',
      fullWidth: true,
      body: Component.fragment([
        const _ShowcaseHero(),
        const _ShowcaseGrid(),
        const _SubmitSection(),
        const LandingFooter(),
      ]),
    );
  }
}

/// Hero section
class _ShowcaseHero extends StatelessComponent {
  const _ShowcaseHero();

  @override
  Component build(BuildContext context) {
    return section(
      classes: 'relative pt-32 pb-16 px-6 text-center',
      styles: Styles(raw: {'background': 'linear-gradient(to bottom, rgba(6, 182, 212, 0.05), transparent)'}),
      [
        div(
          classes: 'absolute inset-0 pointer-events-none',
          styles: Styles(raw: {'background': 'radial-gradient(ellipse at top, rgba(6, 182, 212, 0.15), transparent 50%)'}),
          [],
        ),
        div(classes: 'relative z-10 max-w-4xl mx-auto', [
          span(
            classes: 'inline-flex px-4 py-1.5 mb-8 text-sm font-medium text-cyan-400 bg-cyan-500/10 rounded-full border border-cyan-500/20',
            [Component.text('Showcase')],
          ),
          h1(classes: 'text-5xl md:text-6xl font-bold text-white mb-6 tracking-tight', [
            Component.text('Built with '),
            span(classes: 'bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent', [
              Component.text('Duxt'),
            ]),
          ]),
          p(classes: 'text-xl text-zinc-400 max-w-2xl mx-auto', [
            Component.text('Real-world applications and websites powered by the Duxt framework.'),
          ]),
        ]),
      ],
    );
  }
}

/// Showcase grid
class _ShowcaseGrid extends StatelessComponent {
  const _ShowcaseGrid();

  @override
  Component build(BuildContext context) {
    return section(classes: 'py-16 px-6', [
      div(classes: 'max-w-6xl mx-auto', [
        div(classes: 'grid grid-cols-1 md:grid-cols-2 gap-8', [
          _showcaseCard(
            name: 'Omnius',
            description: 'Complete streaming platform with server, admin panel, and client apps for Android TV and macOS. Built with Duxt for the marketing site.',
            url: 'https://omnius.stream',
            image: '/images/showcase-omnius.png',
            tags: ['Streaming', 'SaaS', 'Marketing Site'],
          ),
        ]),
      ]),
    ]);
  }

  Component _showcaseCard({
    required String name,
    required String description,
    required String url,
    String? image,
    required List<String> tags,
  }) {
    return a(
      href: url,
      target: Target.blank,
      classes: 'group block rounded-2xl border border-zinc-700/50 bg-zinc-800/30 overflow-hidden hover:border-cyan-500/50 hover:shadow-2xl hover:shadow-cyan-500/10 transition-all duration-300',
      [
        // Screenshot area
        div(
          classes: 'aspect-video bg-gradient-to-br from-zinc-800 to-zinc-900 relative overflow-hidden',
          [
            if (image != null)
              img(
                src: image,
                alt: '$name screenshot',
                classes: 'w-full h-full object-cover object-top group-hover:scale-105 transition-transform duration-500',
              )
            else
              div(classes: 'absolute inset-0 flex items-center justify-center', [
                div(classes: 'text-center', [
                  div(
                    classes: 'w-20 h-20 rounded-2xl bg-gradient-to-br from-rose-500 to-rose-700 flex items-center justify-center mx-auto mb-4 shadow-xl shadow-rose-500/20',
                    [
                      span(classes: 'text-3xl font-bold text-white', [
                        Component.text(name[0].toUpperCase()),
                      ]),
                    ],
                  ),
                  span(classes: 'text-zinc-500 text-sm font-mono', [Component.text(url.replaceAll('https://', ''))]),
                ]),
              ]),
            // Hover overlay
            div(
              classes: 'absolute inset-0 bg-black/0 group-hover:bg-black/30 transition-colors duration-300 flex items-center justify-center',
              [
                span(
                  classes: 'opacity-0 group-hover:opacity-100 transition-opacity duration-300 inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-white/10 backdrop-blur-sm text-white text-sm font-medium',
                  [
                    Component.text('Visit site'),
                    RawText('<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>'),
                  ],
                ),
              ],
            ),
          ],
        ),
        // Info
        div(classes: 'p-6', [
          h3(classes: 'text-xl font-semibold text-white mb-2 group-hover:text-cyan-400 transition-colors', [
            Component.text(name),
          ]),
          p(classes: 'text-zinc-400 text-sm leading-relaxed mb-4', [
            Component.text(description),
          ]),
          // Tags
          div(classes: 'flex flex-wrap gap-2', [
            ...tags.map((tag) => span(
              classes: 'px-2.5 py-1 text-xs font-medium rounded-full bg-zinc-700/50 text-zinc-300 border border-zinc-600/50',
              [Component.text(tag)],
            )),
          ]),
        ]),
      ],
    );
  }
}

/// Submit your site section
class _SubmitSection extends StatelessComponent {
  const _SubmitSection();

  @override
  Component build(BuildContext context) {
    return section(
      classes: 'py-24 px-6',
      styles: Styles(raw: {'background': 'linear-gradient(135deg, rgba(6, 182, 212, 0.05), rgba(59, 130, 246, 0.05))'}),
      [
        div(classes: 'max-w-2xl mx-auto text-center', [
          div(classes: 'w-14 h-14 bg-cyan-500/10 rounded-2xl flex items-center justify-center mx-auto mb-6 border border-cyan-500/20', [
            RawText('<iconify-icon icon="material-symbols:add-circle-outline" width="28" height="28" style="color: rgb(34, 211, 238)"></iconify-icon>'),
          ]),
          h2(classes: 'text-3xl font-bold text-white mb-4', [
            Component.text('Built something with Duxt?'),
          ]),
          p(classes: 'text-zinc-400 mb-8', [
            Component.text('We\'d love to feature your project. Open an issue on GitHub to submit your site to the showcase.'),
          ]),
          a(
            href: 'https://github.com/duxt-base/duxt/issues/new?title=Showcase%20submission&body=Site%20name:%0ASite%20URL:%0ADescription:',
            target: Target.blank,
            classes: 'inline-flex items-center gap-2 px-6 py-3 text-sm font-semibold rounded-lg bg-cyan-500 text-white hover:bg-cyan-600 transition-colors',
            [
              RawText('<iconify-icon icon="mdi:github" width="18" height="18"></iconify-icon>'),
              Component.text('Submit Your Site'),
            ],
          ),
        ]),
      ],
    );
  }
}
