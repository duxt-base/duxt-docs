import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class AvatarPage extends StatelessComponent {
  const AvatarPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Avatar')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('User profile images and placeholders.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [DAvatar(alt: 'JD')], code: "DAvatar(alt: 'JD')"),
            ]),

            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex items-end gap-4', [
                  DAvatar(alt: 'XS', size: DAvatarSize.xs),
                  DAvatar(alt: 'SM', size: DAvatarSize.sm),
                  DAvatar(alt: 'MD', size: DAvatarSize.md),
                  DAvatar(alt: 'LG', size: DAvatarSize.lg),
                  DAvatar(alt: 'XL', size: DAvatarSize.xl),
                ]),
              ], code: '''DAvatar(alt: 'XS', size: DAvatarSize.xs)
DAvatar(alt: 'MD', size: DAvatarSize.md)
DAvatar(alt: 'XL', size: DAvatarSize.xl)'''),
            ]),

            _section('With Image', [
              ComponentPreviewCard(preview: [
                DAvatar(src: 'https://i.pravatar.cc/150?img=1', alt: 'User'),
              ], code: "DAvatar(\n  src: 'https://example.com/avatar.jpg',\n  alt: 'User',\n)"),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
