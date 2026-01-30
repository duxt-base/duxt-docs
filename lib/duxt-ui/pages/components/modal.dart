import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class ModalPage extends StatelessComponent {
  const ModalPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Modal')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A dialog overlay for focused user interactions.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DButton(label: 'Open Modal'),
              ], code: '''DModal(
  open: isOpen,
  title: 'Confirm Action',
  children: [
    p([Component.text('Are you sure you want to proceed?')]),
  ],
  footer: [
    DButton(
      label: 'Cancel',
      variant: DButtonVariant.ghost,
      onClick: () => setState(() => isOpen = false),
    ),
    DButton(
      label: 'Confirm',
      onClick: () => handleConfirm(),
    ),
  ],
)'''),
            ]),

            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'XS', size: DButtonSize.sm),
                  DButton(label: 'SM', size: DButtonSize.sm),
                  DButton(label: 'MD', size: DButtonSize.sm),
                  DButton(label: 'LG', size: DButtonSize.sm),
                  DButton(label: 'XL', size: DButtonSize.sm),
                  DButton(label: 'Full', size: DButtonSize.sm),
                ]),
              ], code: '''DModal(open: true, title: 'XS Modal', size: DModalSize.xs, ...)
DModal(open: true, title: 'SM Modal', size: DModalSize.sm, ...)
DModal(open: true, title: 'MD Modal', size: DModalSize.md, ...)  // Default
DModal(open: true, title: 'LG Modal', size: DModalSize.lg, ...)
DModal(open: true, title: 'XL Modal', size: DModalSize.xl, ...)
DModal(open: true, title: 'Full Modal', size: DModalSize.full, ...)'''),
            ]),

            _section('With Description', [
              ComponentPreviewCard(preview: [
                DButton(label: 'Delete Item', color: DButtonColor.error),
              ], code: '''DModal(
  open: isOpen,
  title: 'Delete Item',
  description: 'This action cannot be undone.',
  children: [
    p([Component.text('Are you sure you want to delete this item?')]),
  ],
)'''),
            ]),

            _section('Close Behavior', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Close on Overlay', variant: DButtonVariant.outline),
                  DButton(label: 'Close on Escape', variant: DButtonVariant.outline),
                  DButton(label: 'Prevent Close', variant: DButtonVariant.outline),
                ]),
              ], code: '''// Close on overlay click (default: true)
DModal(
  open: isOpen,
  closeOnOverlay: true,
  onClose: () => setState(() => isOpen = false),
  children: [...],
)

// Close on escape key (default: true)
DModal(
  open: isOpen,
  closeOnEscape: true,
  onClose: () => setState(() => isOpen = false),
  children: [...],
)

// Prevent close - requires explicit action
DModal(
  open: isOpen,
  preventClose: true,
  title: 'Required Action',
  children: [...],
)'''),
            ]),

            h2([Component.text('API Reference')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('open', 'bool', 'required', 'Whether modal is visible'),
                  _apiRow('title', 'String?', 'null', 'Modal title'),
                  _apiRow('description', 'String?', 'null', 'Subtitle below title'),
                  _apiRow('header', 'List<Component>?', 'null', 'Custom header content'),
                  _apiRow('children', 'List<Component>', 'required', 'Modal body content'),
                  _apiRow('footer', 'List<Component>?', 'null', 'Footer content'),
                  _apiRow('size', 'DModalSize', 'md', 'Modal width'),
                  _apiRow('closeOnOverlay', 'bool', 'true', 'Close when clicking backdrop'),
                  _apiRow('closeOnEscape', 'bool', 'true', 'Close on Escape key'),
                  _apiRow('preventClose', 'bool', 'false', 'Disable all close methods'),
                  _apiRow('onClose', 'VoidCallback?', 'null', 'Close callback'),
                ]),
              ]),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [Component.text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [Component.text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text(desc)]),
    ]);
  }
}
