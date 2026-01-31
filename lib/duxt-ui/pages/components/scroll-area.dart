import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class ScrollAreaPage extends StatelessComponent {
  const ScrollAreaPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Scroll Area')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A scrollable container with customized scrollbar styling.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DScrollArea(
                    maxHeight: '200px',
                    children: [
                      for (var i = 1; i <= 20; i++)
                        p(classes: 'py-2 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Item $i')]),
                    ],
                  ),
                ]),
              ], code: '''DScrollArea(
  maxHeight: '200px',
  children: [
    for (var i = 1; i <= 20; i++)
      p(classes: 'py-2', [Component.text('Item \$i')]),
  ],
)'''),
            ]),

            _section('Orientation', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DScrollArea(
                    orientation: DScrollOrientation.horizontal,
                    children: [
                      div(classes: 'flex gap-4 p-4', [
                        for (var i = 1; i <= 10; i++)
                          div(classes: 'w-32 h-24 bg-zinc-800 rounded-lg flex-shrink-0 flex items-center justify-center text-zinc-400', [
                            Component.text('Card $i'),
                          ]),
                      ]),
                    ],
                  ),
                ]),
              ], code: '''DScrollArea(
  orientation: DScrollOrientation.horizontal,
  children: [
    div(classes: 'flex gap-4 p-4', [
      for (var i = 1; i <= 10; i++)
        div(classes: 'w-32 h-24 bg-zinc-800 rounded-lg', [...]),
    ]),
  ],
)'''),
            ]),

            _section('Scrollbar Visibility', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md space-y-4', [
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [Component.text('Always visible:')]),
                    DScrollArea(
                      maxHeight: '120px',
                      scrollbarVisibility: DScrollbarVisibility.always,
                      children: [
                        for (var i = 1; i <= 10; i++)
                          p(classes: 'py-1 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Always visible item $i')]),
                      ],
                    ),
                  ]),
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [Component.text('On hover:')]),
                    DScrollArea(
                      maxHeight: '120px',
                      scrollbarVisibility: DScrollbarVisibility.hover,
                      children: [
                        for (var i = 1; i <= 10; i++)
                          p(classes: 'py-1 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Hover to see scrollbar $i')]),
                      ],
                    ),
                  ]),
                ]),
              ], code: '''// Always visible
DScrollArea(
  scrollbarVisibility: DScrollbarVisibility.always,
  maxHeight: '120px',
  children: [...],
)

// On hover
DScrollArea(
  scrollbarVisibility: DScrollbarVisibility.hover,
  maxHeight: '120px',
  children: [...],
)'''),
            ]),

            _section('Both Directions', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DScrollArea(
                    orientation: DScrollOrientation.both,
                    maxHeight: '200px',
                    maxWidth: '400px',
                    children: [
                      div(classes: 'w-[600px] h-[400px] bg-zinc-800/50 p-4', [
                        p(classes: 'text-zinc-400', [Component.text('This content is 600px x 400px')]),
                        p(classes: 'text-zinc-500', [Component.text('Scroll both horizontally and vertically to see all content.')]),
                      ]),
                    ],
                  ),
                ]),
              ], code: '''DScrollArea(
  orientation: DScrollOrientation.both,
  maxHeight: '200px',
  maxWidth: '400px',
  children: [
    div(classes: 'w-[600px] h-[400px]', [...]),
  ],
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
