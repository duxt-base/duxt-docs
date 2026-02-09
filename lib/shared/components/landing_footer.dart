import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Footer using Tailwind CSS with dark: variants.
class LandingFooter extends StatelessComponent {
  const LandingFooter({super.key});

  @override
  Component build(BuildContext context) {
    return footer(
      classes: 'border-t border-slate-300 dark:border-zinc-800 py-12 px-6 mt-16',
      [
        div(classes: 'max-w-6xl mx-auto text-center', [
          // Links
          div(classes: 'flex flex-wrap gap-6 justify-center mb-8', [
            _footerLink('/duxt', 'material-symbols:book-outline', 'Docs'),
            _footerLink('/duxt-ui', 'material-symbols:widgets-outline', 'Components'),
            _footerLink('/showcase', 'material-symbols:star-outline', 'Showcase'),
            _footerLink('https://github.com/duxt-base/duxt', 'mdi:github', 'GitHub', external: true),
            _footerLink('https://pub.dev/packages/duxt', 'simple-icons:dart', 'pub.dev', external: true),
          ]),
          // Divider
          div(classes: 'w-16 h-0.5 bg-gradient-to-r from-transparent via-cyan-600 to-transparent mx-auto mb-8', []),
          // Copyright
          p(classes: 'text-slate-500 dark:text-zinc-500 text-sm', [
            Component.text('Built with '),
            a(
              href: 'https://duxt.dev',
              target: Target.blank,
              classes: 'text-cyan-600 dark:text-cyan-400 font-medium hover:text-cyan-500 dark:hover:text-cyan-300 transition-colors',
              [Component.text('Duxt')],
            ),
            Component.text(', '),
            a(
              href: 'https://jaspr.site',
              target: Target.blank,
              classes: 'text-cyan-600 dark:text-cyan-400 font-medium hover:text-cyan-500 dark:hover:text-cyan-300 transition-colors',
              [Component.text('Jaspr')],
            ),
            Component.text(' and love '),
            span(classes: 'text-red-500', [Component.text('❤️')]),
          ]),
        ]),
      ],
    );
  }

  Component _footerLink(String href, String icon, String label, {bool external = false}) {
    return a(
      href: href,
      target: external ? Target.blank : null,
      classes: 'inline-flex items-center gap-2 px-4 py-2 rounded-lg text-slate-600 dark:text-zinc-400 hover:text-cyan-600 dark:hover:text-cyan-400 hover:bg-cyan-500/10 transition-all',
      [
        RawText('<iconify-icon icon="$icon" width="18" height="18"></iconify-icon>'),
        Component.text(label),
      ],
    );
  }
}
