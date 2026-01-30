import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class BannerPage extends StatelessComponent {
  const BannerPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Banner')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A full-width notification banner for announcements and alerts.')]),

            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full', [
                  DBanner(
                    title: 'New Feature',
                    description: 'Check out our latest update!',
                  ),
                ]),
              ], '''DBanner(
  title: 'New Feature',
  description: 'Check out our latest update!',
  onClose: () => hideBanner(),
)'''),
            ]),

            _section('Colors', [
              _preview([
                div(classes: 'w-full space-y-3', [
                  DBanner(title: 'Primary Banner', color: DBannerColor.primary),
                  DBanner(title: 'Success Banner', color: DBannerColor.success),
                  DBanner(title: 'Warning Banner', color: DBannerColor.warning),
                  DBanner(title: 'Error Banner', color: DBannerColor.error),
                  DBanner(title: 'Info Banner', color: DBannerColor.info),
                ]),
              ], '''DBanner(title: 'Primary', color: DBannerColor.primary)
DBanner(title: 'Success', color: DBannerColor.success)
DBanner(title: 'Warning', color: DBannerColor.warning)
DBanner(title: 'Error', color: DBannerColor.error)
DBanner(title: 'Info', color: DBannerColor.info)'''),
            ]),

            _section('Variants', [
              _preview([
                div(classes: 'w-full space-y-3', [
                  DBanner(title: 'Solid Banner', variant: DBannerVariant.solid, color: DBannerColor.primary),
                  DBanner(title: 'Outline Banner', variant: DBannerVariant.outline, color: DBannerColor.info),
                  DBanner(title: 'Soft Banner', variant: DBannerVariant.soft, color: DBannerColor.success),
                  DBanner(title: 'Subtle Banner', variant: DBannerVariant.subtle, color: DBannerColor.warning),
                ]),
              ], '''DBanner(title: 'Solid', variant: DBannerVariant.solid)
DBanner(title: 'Outline', variant: DBannerVariant.outline)
DBanner(title: 'Soft', variant: DBannerVariant.soft)
DBanner(title: 'Subtle', variant: DBannerVariant.subtle)'''),
            ]),

            _section('With Icon', [
              _preview([
                div(classes: 'w-full', [
                  DBanner(
                    icon: DIcon(name: DIconNames.bell, size: DIconSize.md),
                    title: 'Announcement',
                    description: 'Big news coming soon!',
                    color: DBannerColor.primary,
                  ),
                ]),
              ], '''DBanner(
  icon: DIcon(name: DIconNames.bell, size: DIconSize.md),
  title: 'Announcement',
  description: 'Big news coming soon!',
)'''),
            ]),

            _section('With Actions', [
              _preview([
                div(classes: 'w-full', [
                  DBanner(
                    title: 'New Feature Available',
                    description: 'Try our new dashboard.',
                    color: DBannerColor.success,
                    actions: [
                      DBannerAction(label: 'Learn more', href: '/features'),
                      DBannerAction(label: 'Try now'),
                    ],
                  ),
                ]),
              ], '''DBanner(
  title: 'New Feature Available',
  description: 'Try our new dashboard.',
  actions: [
    DBannerAction(label: 'Learn more', href: '/features'),
    DBannerAction(label: 'Try now', onClick: () => openFeature()),
  ],
)'''),
            ]),

            _section('Non-Closable', [
              _preview([
                div(classes: 'w-full', [
                  DBanner(
                    title: 'Maintenance',
                    description: 'Scheduled maintenance in 1 hour.',
                    closable: false,
                    color: DBannerColor.warning,
                  ),
                ]),
              ], '''DBanner(
  title: 'Maintenance',
  description: 'Scheduled maintenance in 1 hour.',
  closable: false,
  color: DBannerColor.warning,
)'''),
            ]),

            _section('Sticky Banner', [
              _preview([
                div(classes: 'w-full', [
                  DBanner(
                    sticky: true,
                    position: DBannerPosition.top,
                    title: 'Sticky Banner',
                    description: 'This stays visible while scrolling.',
                    color: DBannerColor.info,
                  ),
                ]),
              ], '''DBanner(
  sticky: true,
  position: DBannerPosition.top,
  title: 'Sticky Banner',
  description: 'This stays visible while scrolling.',
)'''),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]), ...children]);

  Component _preview(List<Component> components, String codeExample) => div(classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden', [
    div(classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]', styles: Styles(raw: {'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)', 'background-size': '24px 24px'}), components),
    div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [
      div(classes: 'flex items-center px-4 py-2 border-b border-zinc-200 dark:border-zinc-800', [span(classes: 'text-xs text-zinc-500', [text('dart')])]),
      div(classes: 'p-4 overflow-x-auto', [pre(classes: 'text-sm', [code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)])])]),
    ]),
  ]);
}
