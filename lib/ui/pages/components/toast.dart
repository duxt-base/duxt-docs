import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class ToastPage extends StatelessComponent {
  const ToastPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Toast')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A notification component for displaying brief messages to users.')]),

            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full max-w-sm', [
                  DToast(
                    title: 'Success',
                    description: 'Your changes have been saved.',
                    color: DToastColor.success,
                  ),
                ]),
              ], '''DToast(
  title: 'Success',
  description: 'Your changes have been saved.',
  color: DColor.success,
)'''),
            ]),

            _section('Colors', [
              _preview([
                div(classes: 'w-full max-w-sm space-y-3', [
                  DToast(title: 'Primary notification', color: DToastColor.primary),
                  DToast(title: 'Success notification', color: DToastColor.success),
                  DToast(title: 'Warning notification', color: DToastColor.warning),
                  DToast(title: 'Error notification', color: DToastColor.error),
                  DToast(title: 'Info notification', color: DToastColor.info),
                ]),
              ], '''DToast(title: 'Primary', color: DColor.primary)
DToast(title: 'Success', color: DColor.success)
DToast(title: 'Warning', color: DColor.warning)
DToast(title: 'Error', color: DColor.error)
DToast(title: 'Info', color: DColor.info)'''),
            ]),

            _section('Variants', [
              _preview([
                div(classes: 'w-full max-w-sm space-y-3', [
                  DToast(title: 'Solid Toast', variant: DToastVariant.solid, color: DToastColor.success),
                  DToast(title: 'Outline Toast', variant: DToastVariant.outline, color: DToastColor.info),
                  DToast(title: 'Soft Toast', variant: DToastVariant.soft, color: DToastColor.warning),
                  DToast(title: 'Subtle Toast', variant: DToastVariant.subtle, color: DToastColor.error),
                ]),
              ], '''DToast(title: 'Solid', variant: DToastVariant.solid, color: DColor.success)
DToast(title: 'Outline', variant: DToastVariant.outline, color: DColor.info)
DToast(title: 'Soft', variant: DToastVariant.soft, color: DColor.warning)
DToast(title: 'Subtle', variant: DToastVariant.subtle, color: DColor.error)'''),
            ]),

            _section('With Description', [
              _preview([
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
              ], '''DToast(
  title: 'Event Created',
  description: 'Your event has been scheduled for tomorrow at 3:00 PM.',
  color: DColor.success,
)'''),
            ]),

            _section('Closable Toast', [
              _preview([
                div(classes: 'w-full max-w-sm', [
                  DToast(
                    title: 'Notification',
                    description: 'You have a new message.',
                    closable: true,
                    onClose: () {},
                  ),
                ]),
              ], '''DToast(
  title: 'Notification',
  description: 'You have a new message.',
  closable: true,
  onClose: () => print('Toast closed'),
)'''),
            ]),

            _section('With Action', [
              _preview([
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
              ], '''DToast(
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
