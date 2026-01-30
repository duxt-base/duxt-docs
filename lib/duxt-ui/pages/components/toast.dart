import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class ToastPage extends StatelessComponent {
  const ToastPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Toast')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A notification component for displaying brief messages to users.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-sm', [
                  DToast(
                    title: 'Success',
                    description: 'Your changes have been saved.',
                    color: DToastColor.success,
                  ),
                ]),
              ], code: '''DToast(
  title: 'Success',
  description: 'Your changes have been saved.',
  color: DColor.success,
)'''),
            ]),

            _section('Colors', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-sm space-y-3', [
                  DToast(title: 'Primary notification', color: DToastColor.primary),
                  DToast(title: 'Success notification', color: DToastColor.success),
                  DToast(title: 'Warning notification', color: DToastColor.warning),
                  DToast(title: 'Error notification', color: DToastColor.error),
                  DToast(title: 'Info notification', color: DToastColor.info),
                ]),
              ], code: '''DToast(title: 'Primary', color: DColor.primary)
DToast(title: 'Success', color: DColor.success)
DToast(title: 'Warning', color: DColor.warning)
DToast(title: 'Error', color: DColor.error)
DToast(title: 'Info', color: DColor.info)'''),
            ]),

            _section('Variants', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-sm space-y-3', [
                  DToast(title: 'Solid Toast', variant: DToastVariant.solid, color: DToastColor.success),
                  DToast(title: 'Outline Toast', variant: DToastVariant.outline, color: DToastColor.info),
                  DToast(title: 'Soft Toast', variant: DToastVariant.soft, color: DToastColor.warning),
                  DToast(title: 'Subtle Toast', variant: DToastVariant.subtle, color: DToastColor.error),
                ]),
              ], code: '''DToast(title: 'Solid', variant: DToastVariant.solid, color: DColor.success)
DToast(title: 'Outline', variant: DToastVariant.outline, color: DColor.info)
DToast(title: 'Soft', variant: DToastVariant.soft, color: DColor.warning)
DToast(title: 'Subtle', variant: DToastVariant.subtle, color: DColor.error)'''),
            ]),

            _section('With Description', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-sm space-y-3', [
                  DToast(
                    title: 'Event Created',
                    description: 'Your event has been scheduled for tomorrow at 3:00 PM.',
                    color: DToastColor.success,
                  ),
                  DToast(
                    title: 'Error Occurred',
                    description: 'Something went wrong. Please try again later.',
                    color: DToastColor.error,
                  ),
                ]),
              ], code: '''DToast(
  title: 'Event Created',
  description: 'Your event has been scheduled for tomorrow at 3:00 PM.',
  color: DColor.success,
)'''),
            ]),

            _section('Closable Toast', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-sm', [
                  DToast(
                    title: 'Notification',
                    description: 'You have a new message.',
                    closable: true,
                    onClose: () {},
                  ),
                ]),
              ], code: '''DToast(
  title: 'Notification',
  description: 'You have a new message.',
  closable: true,
  onClose: () => print('Toast closed'),
)'''),
            ]),

            _section('With Action', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-sm', [
                  DToast(
                    title: 'File Uploaded',
                    description: 'Your document has been uploaded successfully.',
                    color: DToastColor.success,
                    action: DButton(
                      label: 'View',
                      size: DButtonSize.sm,
                      variant: DButtonVariant.ghost,
                    ),
                  ),
                ]),
              ], code: '''DToast(
  title: 'File Uploaded',
  description: 'Your document has been uploaded successfully.',
  color: DColor.success,
  action: DButton(
    label: 'View',
    size: DSize.sm,
    variant: DButtonVariant.ghost,
    onClick: () => viewFile(),
  ),
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
