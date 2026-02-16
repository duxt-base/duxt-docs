import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Container component documentation page
class ContainerPage extends StatelessComponent {
  const ContainerPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Container')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A max-width wrapper component with responsive padding for consistent layout.')]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DContainer(
                  children: [
                    div(classes: 'bg-zinc-800 p-4 rounded text-center text-zinc-300', [
                      Component.text('Content inside container'),
                    ]),
                  ],
                ),
              ], code: '''DContainer(
  children: [
    div(classes: 'bg-zinc-800 p-4 rounded', [
      Component.text('Content inside container'),
    ]),
  ],
)'''),
            ]),

            // Sizes
            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full space-y-4', [
                  DContainer(
                    size: DContainerSize.xs,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [Component.text('XS Container')]),
                    ],
                  ),
                  DContainer(
                    size: DContainerSize.sm,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [Component.text('SM Container')]),
                    ],
                  ),
                  DContainer(
                    size: DContainerSize.md,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [Component.text('MD Container')]),
                    ],
                  ),
                  DContainer(
                    size: DContainerSize.lg,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [Component.text('LG Container')]),
                    ],
                  ),
                  DContainer(
                    size: DContainerSize.xl,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [Component.text('XL Container (default)')]),
                    ],
                  ),
                ]),
              ], code: '''DContainer(size: DContainerSize.xs, children: [...])
DContainer(size: DContainerSize.sm, children: [...])
DContainer(size: DContainerSize.md, children: [...])
DContainer(size: DContainerSize.lg, children: [...])
DContainer(size: DContainerSize.xl, children: [...])
DContainer(size: DContainerSize.xxl, children: [...])
DContainer(size: DContainerSize.full, children: [...])'''),
            ]),

            // Without Padding
            _section('Without Padding', [
              ComponentPreviewCard(preview: [
                DContainer(
                  padded: false,
                  children: [
                    div(classes: 'bg-purple-900/50 p-4 rounded text-center text-zinc-300', [
                      Component.text('Container without padding'),
                    ]),
                  ],
                ),
              ], code: '''DContainer(
  padded: false,
  children: [
    Component.text('Container without padding'),
  ],
)'''),
            ]),

            // Custom Classes
            _section('Custom Classes', [
              ComponentPreviewCard(preview: [
                DContainer(
                  className: 'bg-zinc-800/30 py-6 rounded-xl',
                  children: [
                    div(classes: 'text-center text-zinc-300', [
                      Component.text('Container with custom classes'),
                    ]),
                  ],
                ),
              ], code: '''DContainer(
  className: 'bg-zinc-800/30 py-6 rounded-xl',
  children: [
    Component.text('Container with custom classes'),
  ],
)'''),
            ]),

            // API Reference
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
                  _apiRow('children', 'List<Component>', '[]', 'Content to render inside the container'),
                  _apiRow('size', 'DContainerSize', 'xl', 'Maximum width (xs, sm, md, lg, xl, xxl, full)'),
                  _apiRow('padded', 'bool', 'true', 'Whether to apply responsive horizontal padding'),
                  _apiRow('className', 'String?', 'null', 'Additional CSS classes'),
                ]),
              ]),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
  Component _apiRow(String prop, String type, String defaultVal, String desc) => tr(classes: 'border-b border-zinc-800/50', [
    td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text(prop)]),
    td(classes: 'py-3 px-4 font-mono text-purple-400', [Component.text(type)]),
    td(classes: 'py-3 px-4 font-mono text-zinc-500', [Component.text(defaultVal)]),
    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text(desc)]),
  ]);
}
