import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Marquee component documentation page
class MarqueePage extends StatelessComponent {
  const MarqueePage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      // Header
      SiteHeader(
        logo: '/images/logo.svg',
        logoAlt: 'Duxt',
        duxtVersion: '0.3.7',
        duxtUiVersion: '0.2.3',
        items: [
          NavLink(href: '/duxt', text: 'Duxt'),
          NavLink(href: '/duxt-ui', text: 'Duxt UI'),
          NavLink(href: '/about', text: 'About'),
          ThemeToggle(),
        ],
      ),
      // Main content
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Marquee')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('An infinite scrolling animation component for logos and content.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full overflow-hidden', [
                  DMarquee(
                    children: [
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [text('Item 1')]),
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [text('Item 2')]),
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [text('Item 3')]),
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [text('Item 4')]),
                      div(classes: 'px-4 py-2 bg-zinc-800 rounded-lg', [text('Item 5')]),
                    ],
                  ),
                ]),
              ], '''DMarquee(
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
              _preview([
                div(classes: 'w-full overflow-hidden', [
                  DMarquee(
                    direction: DMarqueeDirection.left,
                    children: [
                      div(classes: 'px-4 py-2 bg-blue-600 rounded-lg text-white', [text('Left 1')]),
                      div(classes: 'px-4 py-2 bg-blue-600 rounded-lg text-white', [text('Left 2')]),
                      div(classes: 'px-4 py-2 bg-blue-600 rounded-lg text-white', [text('Left 3')]),
                      div(classes: 'px-4 py-2 bg-blue-600 rounded-lg text-white', [text('Left 4')]),
                    ],
                  ),
                ]),
              ], '''DMarquee(
  direction: DMarqueeDirection.left,
  children: [...],
)'''),
            ]),

            // Direction Right
            _section('Direction: Right', [
              _preview([
                div(classes: 'w-full overflow-hidden', [
                  DMarquee(
                    direction: DMarqueeDirection.right,
                    children: [
                      div(classes: 'px-4 py-2 bg-purple-600 rounded-lg text-white', [text('Right 1')]),
                      div(classes: 'px-4 py-2 bg-purple-600 rounded-lg text-white', [text('Right 2')]),
                      div(classes: 'px-4 py-2 bg-purple-600 rounded-lg text-white', [text('Right 3')]),
                      div(classes: 'px-4 py-2 bg-purple-600 rounded-lg text-white', [text('Right 4')]),
                    ],
                  ),
                ]),
              ], '''DMarquee(
  direction: DMarqueeDirection.right,
  children: [...],
)'''),
            ]),

            // Speed
            _section('Speed', [
              p(classes: 'text-zinc-400 mb-4', [
                text('Control the animation speed with the duration property (in seconds):'),
              ]),
              _preview([
                div(classes: 'w-full space-y-4 overflow-hidden', [
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [text('Slow (40s)')]),
                    DMarquee(
                      duration: 40,
                      children: [
                        div(classes: 'px-4 py-2 bg-green-600 rounded-lg text-white', [text('Slow')]),
                        div(classes: 'px-4 py-2 bg-green-600 rounded-lg text-white', [text('Motion')]),
                        div(classes: 'px-4 py-2 bg-green-600 rounded-lg text-white', [text('Items')]),
                      ],
                    ),
                  ]),
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [text('Fast (10s)')]),
                    DMarquee(
                      duration: 10,
                      children: [
                        div(classes: 'px-4 py-2 bg-red-600 rounded-lg text-white', [text('Fast')]),
                        div(classes: 'px-4 py-2 bg-red-600 rounded-lg text-white', [text('Motion')]),
                        div(classes: 'px-4 py-2 bg-red-600 rounded-lg text-white', [text('Items')]),
                      ],
                    ),
                  ]),
                ]),
              ], '''// Slow
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
              _preview([
                div(classes: 'w-full space-y-4 overflow-hidden', [
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [text('Pause enabled (default) - hover to pause')]),
                    DMarquee(
                      pauseOnHover: true,
                      children: [
                        div(classes: 'px-4 py-2 bg-cyan-600 rounded-lg text-white', [text('Hover me')]),
                        div(classes: 'px-4 py-2 bg-cyan-600 rounded-lg text-white', [text('To pause')]),
                        div(classes: 'px-4 py-2 bg-cyan-600 rounded-lg text-white', [text('Animation')]),
                      ],
                    ),
                  ]),
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [text('Pause disabled')]),
                    DMarquee(
                      pauseOnHover: false,
                      children: [
                        div(classes: 'px-4 py-2 bg-orange-600 rounded-lg text-white', [text('No pause')]),
                        div(classes: 'px-4 py-2 bg-orange-600 rounded-lg text-white', [text('On hover')]),
                        div(classes: 'px-4 py-2 bg-orange-600 rounded-lg text-white', [text('Here')]),
                      ],
                    ),
                  ]),
                ]),
              ], '''// Enabled (default)
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
              _preview([
                div(classes: 'w-full overflow-hidden', [
                  DMarquee(
                    gap: 'gap-12',
                    children: [
                      div(classes: 'px-4 py-2 bg-indigo-600 rounded-lg text-white', [text('Wide')]),
                      div(classes: 'px-4 py-2 bg-indigo-600 rounded-lg text-white', [text('Gap')]),
                      div(classes: 'px-4 py-2 bg-indigo-600 rounded-lg text-white', [text('Between')]),
                      div(classes: 'px-4 py-2 bg-indigo-600 rounded-lg text-white', [text('Items')]),
                    ],
                  ),
                ]),
              ], '''DMarquee(
  gap: 'gap-12',
  children: [...],
)'''),
            ]),

            // Multiple Rows
            _section('Multiple Rows', [
              _preview([
                div(classes: 'w-full space-y-3 overflow-hidden', [
                  DMarquee(
                    direction: DMarqueeDirection.left,
                    duration: 25,
                    children: [
                      div(classes: 'px-4 py-2 bg-pink-600 rounded-lg text-white', [text('Row 1')]),
                      div(classes: 'px-4 py-2 bg-pink-600 rounded-lg text-white', [text('Item A')]),
                      div(classes: 'px-4 py-2 bg-pink-600 rounded-lg text-white', [text('Item B')]),
                    ],
                  ),
                  DMarquee(
                    direction: DMarqueeDirection.right,
                    duration: 30,
                    children: [
                      div(classes: 'px-4 py-2 bg-violet-600 rounded-lg text-white', [text('Row 2')]),
                      div(classes: 'px-4 py-2 bg-violet-600 rounded-lg text-white', [text('Item C')]),
                      div(classes: 'px-4 py-2 bg-violet-600 rounded-lg text-white', [text('Item D')]),
                    ],
                  ),
                  DMarquee(
                    direction: DMarqueeDirection.left,
                    duration: 20,
                    children: [
                      div(classes: 'px-4 py-2 bg-rose-600 rounded-lg text-white', [text('Row 3')]),
                      div(classes: 'px-4 py-2 bg-rose-600 rounded-lg text-white', [text('Item E')]),
                      div(classes: 'px-4 py-2 bg-rose-600 rounded-lg text-white', [text('Item F')]),
                    ],
                  ),
                ]),
              ], '''div(classes: 'space-y-4', [
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
            h2([text('API Reference')]),
            h3([text('DMarquee')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
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
            h3(classes: 'mt-8', [text('DMarqueeItem')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('child', 'Component', 'required', 'Item content'),
                  _apiRow('classes', 'String?', 'null', 'Custom CSS classes'),
                ]),
              ]),
            ]),

            // DMarqueeDirection
            h3(classes: 'mt-8', [text('DMarqueeDirection')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Value')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
                  ]),
                ]),
                tbody([
                  _directionRow('left', 'Scroll left'),
                  _directionRow('right', 'Scroll right'),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) {
    return div(classes: 'my-8', [
      h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]),
      ...children,
    ]);
  }

  Component _preview(List<Component> components, String codeExample) {
    return div(
      classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden',
      [
        // Live preview
        div(
          classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]',
          styles: Styles(raw: {
            'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)',
            'background-size': '24px 24px',
          }),
          components,
        ),
        // Code
        div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [
          div(classes: 'flex items-center justify-between px-4 py-2 border-b border-zinc-800', [
            span(classes: 'text-xs text-zinc-500', [text('dart')]),
          ]),
          div(classes: 'p-4 overflow-x-auto', [
            pre(classes: 'text-sm', [
              code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)]),
            ]),
          ]),
        ]),
      ],
    );
  }

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
    ]);
  }

  Component _directionRow(String value, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(value)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
    ]);
  }
}
