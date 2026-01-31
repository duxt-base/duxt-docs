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
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('The Slideover component includes its own trigger and manages state internally via JavaScript.'),
              ]),
              ComponentPreviewCard(preview: [
                DSlideover(
                  trigger: DButton(label: 'Open Slideover'),
                  title: 'Panel Title',
                  children: [
                    Component.text('Slideover content goes here.'),
                  ],
                ),
              ], code: '''DSlideover(
  trigger: DButton(label: 'Open Slideover'),
  title: 'Panel Title',
  children: [
    Component.text('Slideover content goes here.'),
  ],
)'''),
            ]),

            _section('Sides', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DSlideover(
                    trigger: DButton(label: 'Right', variant: DButtonVariant.outline),
                    side: DSlideoverSide.right,
                    title: 'Right Panel',
                    children: [Component.text('Content from the right.')],
                  ),
                  DSlideover(
                    trigger: DButton(label: 'Left', variant: DButtonVariant.outline),
                    side: DSlideoverSide.left,
                    title: 'Left Panel',
                    children: [Component.text('Content from the left.')],
                  ),
                ]),
              ], code: '''// Right (Default)
DSlideover(
  trigger: DButton(label: 'Right'),
  side: DSlideoverSide.right,
  title: 'Right Panel',
  children: [...],
)

// Left
DSlideover(
  trigger: DButton(label: 'Left'),
  side: DSlideoverSide.left,
  title: 'Left Panel',
  children: [...],
)'''),
            ]),

            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-3', [
                  DSlideover(
                    trigger: DButton(label: 'Small', size: DButtonSize.sm),
                    size: DSlideoverSize.sm,
                    title: 'Small Panel',
                    children: [Component.text('Small slideover.')],
                  ),
                  DSlideover(
                    trigger: DButton(label: 'Medium', size: DButtonSize.sm),
                    size: DSlideoverSize.md,
                    title: 'Medium Panel',
                    children: [Component.text('Medium slideover.')],
                  ),
                  DSlideover(
                    trigger: DButton(label: 'Large', size: DButtonSize.sm),
                    size: DSlideoverSize.lg,
                    title: 'Large Panel',
                    children: [Component.text('Large slideover.')],
                  ),
                ]),
              ], code: '''DSlideover(
  trigger: DButton(label: 'Small'),
  size: DSlideoverSize.sm,  // sm, md, lg, xl, full
  title: 'Panel',
  children: [...],
)'''),
            ]),

            _section('With Description', [
              ComponentPreviewCard(preview: [
                DSlideover(
                  trigger: DButton(label: 'Edit Profile'),
                  title: 'Edit Profile',
                  description: 'Update your personal information.',
                  children: [
                    div(classes: 'space-y-4', [
                      DInput(label: 'Name'),
                      DInput(label: 'Email'),
                    ]),
                  ],
                ),
              ], code: '''DSlideover(
  trigger: DButton(label: 'Edit Profile'),
  title: 'Edit Profile',
  description: 'Update your personal information.',
  children: [
    div(classes: 'space-y-4', [
      DInput(label: 'Name'),
      DInput(label: 'Email'),
    ]),
  ],
)'''),
            ]),

            _section('With Footer', [
              ComponentPreviewCard(preview: [
                DSlideover(
                  trigger: DButton(label: 'Open Form'),
                  title: 'Edit Item',
                  children: [
                    div(classes: 'space-y-4', [
                      DInput(label: 'Name'),
                      DTextarea(label: 'Description'),
                    ]),
                  ],
                  footer: div(classes: 'flex gap-2 justify-end', [
                    DButton(label: 'Cancel', variant: DButtonVariant.ghost),
                    DButton(label: 'Save'),
                  ]),
                ),
              ], code: '''DSlideover(
  trigger: DButton(label: 'Open Form'),
  title: 'Edit Item',
  children: [
    div(classes: 'space-y-4', [
      DInput(label: 'Name'),
      DTextarea(label: 'Description'),
    ]),
  ],
  footer: div(classes: 'flex gap-2 justify-end', [
    DButton(label: 'Cancel', variant: DButtonVariant.ghost),
    DButton(label: 'Save'),
  ]),
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
                  _apiRow('trigger', 'Component', 'required', 'Element that opens the slideover'),
                  _apiRow('side', 'DSlideoverSide', 'right', 'Edge to slide from (left, right)'),
                  _apiRow('size', 'DSlideoverSize', 'md', 'Panel width (sm, md, lg, xl, full)'),
                  _apiRow('title', 'String?', 'null', 'Panel title'),
                  _apiRow('description', 'String?', 'null', 'Subtitle below title'),
                  _apiRow('children', 'List<Component>', '[]', 'Panel body content'),
                  _apiRow('footer', 'Component?', 'null', 'Footer content'),
                  _apiRow('closeOnOverlay', 'bool', 'true', 'Close when clicking backdrop'),
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
