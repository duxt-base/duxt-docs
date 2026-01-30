import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class SlideoverPage extends StatelessComponent {
  const SlideoverPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Slideover')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A panel that slides in from the edge of the screen.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DButton(label: 'Open Slideover'),
              ], code: '''DSlideover(
  open: isOpen,
  title: 'Panel Title',
  children: [
    Component.text('Slideover content goes here.'),
  ],
  onClose: () => setState(() => isOpen = false),
)'''),
            ]),

            _section('Sides', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Right', variant: DButtonVariant.outline),
                  DButton(label: 'Left', variant: DButtonVariant.outline),
                  DButton(label: 'Top', variant: DButtonVariant.outline),
                  DButton(label: 'Bottom', variant: DButtonVariant.outline),
                ]),
              ], code: '''// Right (Default)
DSlideover(
  open: isOpen,
  side: DSlideoverSide.right,
  title: 'Right Panel',
  children: [...],
)

// Left
DSlideover(
  open: isOpen,
  side: DSlideoverSide.left,
  title: 'Left Panel',
  children: [...],
)

// Top
DSlideover(
  open: isOpen,
  side: DSlideoverSide.top,
  title: 'Top Panel',
  children: [...],
)

// Bottom
DSlideover(
  open: isOpen,
  side: DSlideoverSide.bottom,
  title: 'Bottom Panel',
  children: [...],
)'''),
            ]),

            _section('With Description', [
              ComponentPreviewCard(preview: [
                DButton(label: 'Edit Profile'),
              ], code: '''DSlideover(
  open: isOpen,
  title: 'Edit Profile',
  description: 'Update your personal information.',
  children: [
    div(classes: 'space-y-4', [
      DInput(label: 'Name'),
      DInput(label: 'Email'),
    ]),
  ],
  onClose: () => setState(() => isOpen = false),
)'''),
            ]),

            _section('With Footer', [
              ComponentPreviewCard(preview: [
                DButton(label: 'Open Form'),
              ], code: '''DSlideover(
  open: isOpen,
  title: 'Edit Item',
  children: [
    div(classes: 'space-y-4', [
      DInput(label: 'Name', value: item.name),
      DTextarea(label: 'Description', value: item.description),
    ]),
  ],
  footer: [
    div(classes: 'flex gap-2', [
      DButton(
        label: 'Cancel',
        variant: DButtonVariant.ghost,
        onClick: () => setState(() => isOpen = false),
      ),
      DButton(
        label: 'Save',
        onClick: () => saveItem(),
      ),
    ]),
  ],
  onClose: () => setState(() => isOpen = false),
)'''),
            ]),

            _section('Close Behavior', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Close on Overlay', variant: DButtonVariant.soft),
                  DButton(label: 'Close on Escape', variant: DButtonVariant.soft),
                ]),
              ], code: '''DSlideover(
  open: isOpen,
  closeOnOverlay: true,   // Close when clicking backdrop
  closeOnEscape: true,    // Close on Escape key
  preventClose: false,    // Allow all close methods
  onClose: () => setState(() => isOpen = false),
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
                  _apiRow('open', 'bool', 'required', 'Whether slideover is visible'),
                  _apiRow('side', 'DSlideoverSide', 'right', 'Edge to slide from'),
                  _apiRow('title', 'String?', 'null', 'Panel title'),
                  _apiRow('description', 'String?', 'null', 'Subtitle below title'),
                  _apiRow('header', 'List<Component>?', 'null', 'Custom header content'),
                  _apiRow('children', 'List<Component>', 'required', 'Panel body content'),
                  _apiRow('footer', 'List<Component>?', 'null', 'Footer content'),
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
