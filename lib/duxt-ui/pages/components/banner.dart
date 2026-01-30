import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class BannerPage extends StatelessComponent {
  const BannerPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Banner')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A full-width notification banner for announcements and alerts.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DBanner(
                    title: 'New Feature',
                    description: 'Check out our latest update!',
                  ),
                ]),
              ], code: '''DBanner(
  title: 'New Feature',
  description: 'Check out our latest update!',
  onClose: () => hideBanner(),
)'''),
            ]),

            _section('Colors', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full space-y-3', [
                  DBanner(title: 'Primary Banner', color: DBannerColor.primary),
                  DBanner(title: 'Success Banner', color: DBannerColor.success),
                  DBanner(title: 'Warning Banner', color: DBannerColor.warning),
                  DBanner(title: 'Error Banner', color: DBannerColor.error),
                  DBanner(title: 'Info Banner', color: DBannerColor.info),
                ]),
              ], code: '''DBanner(title: 'Primary', color: DBannerColor.primary)
DBanner(title: 'Success', color: DBannerColor.success)
DBanner(title: 'Warning', color: DBannerColor.warning)
DBanner(title: 'Error', color: DBannerColor.error)
DBanner(title: 'Info', color: DBannerColor.info)'''),
            ]),

            _section('Variants', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full space-y-3', [
                  DBanner(title: 'Solid Banner', variant: DBannerVariant.solid, color: DBannerColor.primary),
                  DBanner(title: 'Outline Banner', variant: DBannerVariant.outline, color: DBannerColor.info),
                  DBanner(title: 'Soft Banner', variant: DBannerVariant.soft, color: DBannerColor.success),
                  DBanner(title: 'Subtle Banner', variant: DBannerVariant.subtle, color: DBannerColor.warning),
                ]),
              ], code: '''DBanner(title: 'Solid', variant: DBannerVariant.solid)
DBanner(title: 'Outline', variant: DBannerVariant.outline)
DBanner(title: 'Soft', variant: DBannerVariant.soft)
DBanner(title: 'Subtle', variant: DBannerVariant.subtle)'''),
            ]),

            _section('With Icon', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DBanner(
                    icon: DIcon(name: DIconNames.bell, size: DIconSize.md),
                    title: 'Announcement',
                    description: 'Big news coming soon!',
                    color: DBannerColor.primary,
                  ),
                ]),
              ], code: '''DBanner(
  icon: DIcon(name: DIconNames.bell, size: DIconSize.md),
  title: 'Announcement',
  description: 'Big news coming soon!',
)'''),
            ]),

            _section('With Actions', [
              ComponentPreviewCard(preview: [
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
              ], code: '''DBanner(
  title: 'New Feature Available',
  description: 'Try our new dashboard.',
  actions: [
    DBannerAction(label: 'Learn more', href: '/features'),
    DBannerAction(label: 'Try now', onClick: () => openFeature()),
  ],
)'''),
            ]),

            _section('Non-Closable', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DBanner(
                    title: 'Maintenance',
                    description: 'Scheduled maintenance in 1 hour.',
                    closable: false,
                    color: DBannerColor.warning,
                  ),
                ]),
              ], code: '''DBanner(
  title: 'Maintenance',
  description: 'Scheduled maintenance in 1 hour.',
  closable: false,
  color: DBannerColor.warning,
)'''),
            ]),

            _section('Sticky Banner', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DBanner(
                    sticky: true,
                    position: DBannerPosition.top,
                    title: 'Sticky Banner',
                    description: 'This stays visible while scrolling.',
                    color: DBannerColor.info,
                  ),
                ]),
              ], code: '''DBanner(
  sticky: true,
  position: DBannerPosition.top,
  title: 'Sticky Banner',
  description: 'This stays visible while scrolling.',
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
