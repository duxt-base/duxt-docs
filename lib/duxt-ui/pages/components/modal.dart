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
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A dialog overlay for focused user interactions. Uses the native HTML dialog element.')]),

            _section('Basic Usage', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('The Modal component uses the native <dialog> element with automatic focus trapping, backdrop, and Escape key support.'),
              ]),
              ComponentPreviewCard(preview: [
                DModal(
                  trigger: DButton(label: 'Open Modal'),
                  title: 'Confirm Action',
                  children: [
                    p([Component.text('Are you sure you want to proceed?')]),
                  ],
                  footer: div(classes: 'flex gap-2 justify-end', [
                    DButton(label: 'Cancel', variant: DButtonVariant.ghost),
                    DButton(label: 'Confirm'),
                  ]),
                ),
              ], code: '''DModal(
  trigger: DButton(label: 'Open Modal'),
  title: 'Confirm Action',
  children: [
    p([Component.text('Are you sure you want to proceed?')]),
  ],
  footer: div(classes: 'flex gap-2 justify-end', [
    DButton(label: 'Cancel', variant: DButtonVariant.ghost),
    DButton(label: 'Confirm'),
  ]),
)'''),
            ]),

            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DModal(
                    trigger: DButton(label: 'XS', size: DButtonSize.sm),
                    size: DModalSize.xs,
                    title: 'Extra Small Modal',
                    children: [Component.text('This is an extra small modal.')],
                  ),
                  DModal(
                    trigger: DButton(label: 'SM', size: DButtonSize.sm),
                    size: DModalSize.sm,
                    title: 'Small Modal',
                    children: [Component.text('This is a small modal.')],
                  ),
                  DModal(
                    trigger: DButton(label: 'MD', size: DButtonSize.sm),
                    size: DModalSize.md,
                    title: 'Medium Modal',
                    children: [Component.text('This is a medium modal (default).')],
                  ),
                  DModal(
                    trigger: DButton(label: 'LG', size: DButtonSize.sm),
                    size: DModalSize.lg,
                    title: 'Large Modal',
                    children: [Component.text('This is a large modal.')],
                  ),
                  DModal(
                    trigger: DButton(label: 'XL', size: DButtonSize.sm),
                    size: DModalSize.xl,
                    title: 'Extra Large Modal',
                    children: [Component.text('This is an extra large modal.')],
                  ),
                ]),
              ], code: '''DModal(trigger: DButton(label: 'XS'), size: DModalSize.xs, ...)
DModal(trigger: DButton(label: 'SM'), size: DModalSize.sm, ...)
DModal(trigger: DButton(label: 'MD'), size: DModalSize.md, ...)  // Default
DModal(trigger: DButton(label: 'LG'), size: DModalSize.lg, ...)
DModal(trigger: DButton(label: 'XL'), size: DModalSize.xl, ...)'''),
            ]),

            _section('With Description', [
              ComponentPreviewCard(preview: [
                DModal(
                  trigger: DButton(label: 'Delete Item', color: DButtonColor.error),
                  title: 'Delete Item',
                  description: 'This action cannot be undone.',
                  children: [
                    p([Component.text('Are you sure you want to delete this item permanently?')]),
                  ],
                  footer: div(classes: 'flex gap-2 justify-end', [
                    DButton(label: 'Cancel', variant: DButtonVariant.ghost),
                    DButton(label: 'Delete', color: DButtonColor.error),
                  ]),
                ),
              ], code: '''DModal(
  trigger: DButton(label: 'Delete Item', color: DButtonColor.error),
  title: 'Delete Item',
  description: 'This action cannot be undone.',
  children: [
    p([Component.text('Are you sure you want to delete this item permanently?')]),
  ],
  footer: div(classes: 'flex gap-2 justify-end', [
    DButton(label: 'Cancel', variant: DButtonVariant.ghost),
    DButton(label: 'Delete', color: DButtonColor.error),
  ]),
)'''),
            ]),

            _section('Fullscreen Mode', [
              ComponentPreviewCard(preview: [
                DModal(
                  trigger: DButton(label: 'Fullscreen Modal'),
                  title: 'Fullscreen View',
                  fullscreen: true,
                  children: [
                    p([Component.text('This modal takes up the entire screen.')]),
                  ],
                ),
              ], code: '''DModal(
  trigger: DButton(label: 'Fullscreen Modal'),
  title: 'Fullscreen View',
  fullscreen: true,
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
                  _apiRow('trigger', 'Component', 'required', 'Element that opens the modal'),
                  _apiRow('title', 'String?', 'null', 'Modal title'),
                  _apiRow('description', 'String?', 'null', 'Subtitle below title'),
                  _apiRow('header', 'Component?', 'null', 'Custom header content'),
                  _apiRow('children', 'List<Component>', '[]', 'Modal body content'),
                  _apiRow('footer', 'Component?', 'null', 'Footer content'),
                  _apiRow('size', 'DModalSize', 'md', 'Modal width (xs, sm, md, lg, xl, xxl, xxxl, xxxxl, xxxxxl, full)'),
                  _apiRow('closeOnOverlay', 'bool', 'true', 'Close when clicking backdrop'),
                  _apiRow('fullscreen', 'bool', 'false', 'Fullscreen mode'),
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
