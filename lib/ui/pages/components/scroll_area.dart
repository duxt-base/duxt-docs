import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class ScrollAreaPage extends StatelessComponent {
  const ScrollAreaPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Scroll Area')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A scrollable container with customized scrollbar styling.')]),

            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DScrollArea(
                    maxHeight: '200px',
                    children: [
                      for (var i = 1; i <= 20; i++)
                        p(classes: 'py-2 px-4 text-zinc-700 dark:text-zinc-300', [text('Item $i')]),
                    ],
                  ),
                ]),
              ], '''DScrollArea(
  maxHeight: '200px',
  children: [
    for (var i = 1; i <= 20; i++)
      p(classes: 'py-2', [text('Item \$i')]),
  ],
)'''),
            ]),

            _section('Orientation', [
              _preview([
                div(classes: 'w-full', [
                  DScrollArea(
                    orientation: DScrollOrientation.horizontal,
                    children: [
                      div(classes: 'flex gap-4 p-4', [
                        for (var i = 1; i <= 10; i++)
                          div(classes: 'w-32 h-24 bg-zinc-800 rounded-lg flex-shrink-0 flex items-center justify-center text-zinc-400', [
                            text('Card $i'),
                          ]),
                      ]),
                    ],
                  ),
                ]),
              ], '''DScrollArea(
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
              _preview([
                div(classes: 'w-full max-w-md space-y-4', [
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [text('Always visible:')]),
                    DScrollArea(
                      maxHeight: '120px',
                      scrollbarVisibility: DScrollbarVisibility.always,
                      children: [
                        for (var i = 1; i <= 10; i++)
                          p(classes: 'py-1 px-4 text-zinc-700 dark:text-zinc-300', [text('Always visible item $i')]),
                      ],
                    ),
                  ]),
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [text('On hover:')]),
                    DScrollArea(
                      maxHeight: '120px',
                      scrollbarVisibility: DScrollbarVisibility.hover,
                      children: [
                        for (var i = 1; i <= 10; i++)
                          p(classes: 'py-1 px-4 text-zinc-700 dark:text-zinc-300', [text('Hover to see scrollbar $i')]),
                      ],
                    ),
                  ]),
                ]),
              ], '''// Always visible
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
              _preview([
                div(classes: 'w-full', [
                  DScrollArea(
                    orientation: DScrollOrientation.both,
                    maxHeight: '200px',
                    maxWidth: '400px',
                    children: [
                      div(classes: 'w-[600px] h-[400px] bg-zinc-800/50 p-4', [
                        p(classes: 'text-zinc-400', [text('This content is 600px x 400px')]),
                        p(classes: 'text-zinc-500', [text('Scroll both horizontally and vertically to see all content.')]),
                      ]),
                    ],
                  ),
                ]),
              ], '''DScrollArea(
  orientation: DScrollOrientation.both,
  maxHeight: '200px',
  maxWidth: '400px',
  children: [
    div(classes: 'w-[600px] h-[400px]', [...]),
  ],
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
