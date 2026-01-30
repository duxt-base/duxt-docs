import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Marquee component documentation page
class MarqueePage extends StatelessComponent {
  const MarqueePage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Marquee')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('An infinite scrolling animation component for logos and content.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full overflow-hidden', [
                  DMarquee(
                    children: [
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [Component.text('Item 1')]),
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [Component.text('Item 2')]),
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [Component.text('Item 3')]),
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [Component.text('Item 4')]),
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [Component.text('Item 5')]),
                    ],
                  ),
                ]),
              ], code: '''DMarquee(
  children: [
    img(src: '/logos/logo1.svg', classes: 'h-8'),
    img(src: '/logos/logo2.svg', classes: 'h-8'),
    img(src: '/logos/logo3.svg', classes: 'h-8'),
    img(src: '/logos/logo4.svg', classes: 'h-8'),
    img(src: '/logos/logo5.svg', classes: 'h-8'),
  ],
)'''),
            ]),

            // Direction Left
            _section('Direction: Left (Default)', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full overflow-hidden', [
                  DMarquee(
                    direction: DMarqueeDirection.left,
                    children: [
                      div(classes: 'px-4 py-2 bg-blue-600 rounded-lg text-white', [Component.text('Left 1')]),
                      div(classes: 'px-4 py-2 bg-blue-600 rounded-lg text-white', [Component.text('Left 2')]),
                      div(classes: 'px-4 py-2 bg-blue-600 rounded-lg text-white', [Component.text('Left 3')]),
                      div(classes: 'px-4 py-2 bg-blue-600 rounded-lg text-white', [Component.text('Left 4')]),
                    ],
                  ),
                ]),
              ], code: '''DMarquee(
  direction: DMarqueeDirection.left,
  children: [...],
)'''),
            ]),

            // Direction Right
            _section('Direction: Right', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full overflow-hidden', [
                  DMarquee(
                    direction: DMarqueeDirection.right,
                    children: [
                      div(classes: 'px-4 py-2 bg-purple-600 rounded-lg text-white', [Component.text('Right 1')]),
                      div(classes: 'px-4 py-2 bg-purple-600 rounded-lg text-white', [Component.text('Right 2')]),
                      div(classes: 'px-4 py-2 bg-purple-600 rounded-lg text-white', [Component.text('Right 3')]),
                      div(classes: 'px-4 py-2 bg-purple-600 rounded-lg text-white', [Component.text('Right 4')]),
                    ],
                  ),
                ]),
              ], code: '''DMarquee(
  direction: DMarqueeDirection.right,
  children: [...],
)'''),
            ]),

            // Speed
            _section('Speed', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('Control the animation speed with the duration property (in seconds):'),
              ]),
              ComponentPreviewCard(preview: [
                div(classes: 'w-full space-y-4 overflow-hidden', [
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [Component.text('Slow (40s)')]),
                    DMarquee(
                      duration: 40,
                      children: [
                        div(classes: 'px-4 py-2 bg-green-600 rounded-lg text-white', [Component.text('Slow')]),
                        div(classes: 'px-4 py-2 bg-green-600 rounded-lg text-white', [Component.text('Motion')]),
                        div(classes: 'px-4 py-2 bg-green-600 rounded-lg text-white', [Component.text('Items')]),
                      ],
                    ),
                  ]),
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [Component.text('Fast (10s)')]),
                    DMarquee(
                      duration: 10,
                      children: [
                        div(classes: 'px-4 py-2 bg-red-600 rounded-lg text-white', [Component.text('Fast')]),
                        div(classes: 'px-4 py-2 bg-red-600 rounded-lg text-white', [Component.text('Motion')]),
                        div(classes: 'px-4 py-2 bg-red-600 rounded-lg text-white', [Component.text('Items')]),
                      ],
                    ),
                  ]),
                ]),
              ], code: '''// Slow
DMarquee(
  duration: 40,
  children: [...],
)

// Fast
DMarquee(
  duration: 10,
  children: [...],
)'''),
            ]),

            // Pause on Hover
            _section('Pause on Hover', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full space-y-4 overflow-hidden', [
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [Component.text('Pause enabled (default) - hover to pause')]),
                    DMarquee(
                      pauseOnHover: true,
                      children: [
                        div(classes: 'px-4 py-2 bg-cyan-600 rounded-lg text-white', [Component.text('Hover me')]),
                        div(classes: 'px-4 py-2 bg-cyan-600 rounded-lg text-white', [Component.text('To pause')]),
                        div(classes: 'px-4 py-2 bg-cyan-600 rounded-lg text-white', [Component.text('Animation')]),
                      ],
                    ),
                  ]),
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [Component.text('Pause disabled')]),
                    DMarquee(
                      pauseOnHover: false,
                      children: [
                        div(classes: 'px-4 py-2 bg-orange-600 rounded-lg text-white', [Component.text('No pause')]),
                        div(classes: 'px-4 py-2 bg-orange-600 rounded-lg text-white', [Component.text('On hover')]),
                        div(classes: 'px-4 py-2 bg-orange-600 rounded-lg text-white', [Component.text('Here')]),
                      ],
                    ),
                  ]),
                ]),
              ], code: '''// Enabled (default)
DMarquee(
  pauseOnHover: true,
  children: [...],
)

// Disabled
DMarquee(
  pauseOnHover: false,
  children: [...],
)'''),
            ]),

            // Custom Gap
            _section('Custom Gap', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full overflow-hidden', [
                  DMarquee(
                    gap: 'gap-12',
                    children: [
                      div(classes: 'px-4 py-2 bg-indigo-600 rounded-lg text-white', [Component.text('Wide')]),
                      div(classes: 'px-4 py-2 bg-indigo-600 rounded-lg text-white', [Component.text('Gap')]),
                      div(classes: 'px-4 py-2 bg-indigo-600 rounded-lg text-white', [Component.text('Between')]),
                      div(classes: 'px-4 py-2 bg-indigo-600 rounded-lg text-white', [Component.text('Items')]),
                    ],
                  ),
                ]),
              ], code: '''DMarquee(
  gap: 'gap-12',
  children: [...],
)'''),
            ]),

            // Multiple Rows
            _section('Multiple Rows', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full space-y-3 overflow-hidden', [
                  DMarquee(
                    direction: DMarqueeDirection.left,
                    duration: 25,
                    children: [
                      div(classes: 'px-4 py-2 bg-pink-600 rounded-lg text-white', [Component.text('Row 1')]),
                      div(classes: 'px-4 py-2 bg-pink-600 rounded-lg text-white', [Component.text('Item A')]),
                      div(classes: 'px-4 py-2 bg-pink-600 rounded-lg text-white', [Component.text('Item B')]),
                    ],
                  ),
                  DMarquee(
                    direction: DMarqueeDirection.right,
                    duration: 30,
                    children: [
                      div(classes: 'px-4 py-2 bg-violet-600 rounded-lg text-white', [Component.text('Row 2')]),
                      div(classes: 'px-4 py-2 bg-violet-600 rounded-lg text-white', [Component.text('Item C')]),
                      div(classes: 'px-4 py-2 bg-violet-600 rounded-lg text-white', [Component.text('Item D')]),
                    ],
                  ),
                  DMarquee(
                    direction: DMarqueeDirection.left,
                    duration: 20,
                    children: [
                      div(classes: 'px-4 py-2 bg-rose-600 rounded-lg text-white', [Component.text('Row 3')]),
                      div(classes: 'px-4 py-2 bg-rose-600 rounded-lg text-white', [Component.text('Item E')]),
                      div(classes: 'px-4 py-2 bg-rose-600 rounded-lg text-white', [Component.text('Item F')]),
                    ],
                  ),
                ]),
              ], code: '''div(classes: 'space-y-4', [
  DMarquee(
    direction: DMarqueeDirection.left,
    duration: 25,
    children: row1Items,
  ),
  DMarquee(
    direction: DMarqueeDirection.right,
    duration: 30,
    children: row2Items,
  ),
  DMarquee(
    direction: DMarqueeDirection.left,
    duration: 20,
    children: row3Items,
  ),
])'''),
            ]),

            // API Reference
            h2([Component.text('API Reference')]),
            h3([Component.text('DMarquee')]),
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
                  _apiRow('children', 'List<Component>', 'required', 'Content to scroll'),
                  _apiRow('direction', 'DMarqueeDirection', 'left', 'Scroll direction'),
                  _apiRow('duration', 'int', '20', 'Animation duration (seconds)'),
                  _apiRow('pauseOnHover', 'bool', 'true', 'Pause on hover'),
                  _apiRow('gap', 'String', "'gap-8'", 'Gap between items'),
                  _apiRow('classes', 'String?', 'null', 'Custom CSS classes'),
                ]),
              ]),
            ]),

            // DMarqueeItem
            h3(classes: 'mt-8', [Component.text('DMarqueeItem')]),
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
                  _apiRow('child', 'Component', 'required', 'Item content'),
                  _apiRow('classes', 'String?', 'null', 'Custom CSS classes'),
                ]),
              ]),
            ]),

            // DMarqueeDirection
            h3(classes: 'mt-8', [Component.text('DMarqueeDirection')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Value')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  _directionRow('left', 'Scroll left'),
                  _directionRow('right', 'Scroll right'),
                ]),
              ]),
            ]),
      ]),
    );
  }

  Component _section(String title, List<Component> children) {
    return div(classes: 'my-8', [
      h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]),
      ...children,
    ]);
  }

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [Component.text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [Component.text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text(desc)]),
    ]);
  }

  Component _directionRow(String value, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text(value)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text(desc)]),
    ]);
  }
}
