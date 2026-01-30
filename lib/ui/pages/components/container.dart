import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Container component documentation page
class ContainerPage extends StatelessComponent {
  const ContainerPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Container')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A max-width wrapper component with responsive padding for consistent layout.')]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                DContainer(
                  children: [
                    div(classes: 'bg-zinc-800 p-4 rounded text-center text-zinc-300', [
                      text('Content inside container'),
                    ]),
                  ],
                ),
              ], '''DContainer(
  children: [
    div(classes: 'bg-zinc-800 p-4 rounded', [
      text('Content inside container'),
    ]),
  ],
)'''),
            ]),

            // Sizes
            _section('Sizes', [
              _preview([
                div(classes: 'w-full space-y-4', [
                  DContainer(
                    size: DContainerSize.xs,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [text('XS Container')]),
                    ],
                  ),
                  DContainer(
                    size: DContainerSize.sm,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [text('SM Container')]),
                    ],
                  ),
                  DContainer(
                    size: DContainerSize.md,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [text('MD Container')]),
                    ],
                  ),
                  DContainer(
                    size: DContainerSize.lg,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [text('LG Container')]),
                    ],
                  ),
                  DContainer(
                    size: DContainerSize.xl,
                    children: [
                      div(classes: 'bg-cyan-900/50 p-3 rounded text-center text-xs text-zinc-700 dark:text-zinc-300', [text('XL Container (default)')]),
                    ],
                  ),
                ]),
              ], '''DContainer(size: DContainerSize.xs, children: [...])
DContainer(size: DContainerSize.sm, children: [...])
DContainer(size: DContainerSize.md, children: [...])
DContainer(size: DContainerSize.lg, children: [...])
DContainer(size: DContainerSize.xl, children: [...])
DContainer(size: DContainerSize.xxl, children: [...])
DContainer(size: DContainerSize.full, children: [...])'''),
            ]),

            // Without Padding
            _section('Without Padding', [
              _preview([
                DContainer(
                  padded: false,
                  children: [
                    div(classes: 'bg-purple-900/50 p-4 rounded text-center text-zinc-300', [
                      text('Container without padding'),
                    ]),
                  ],
                ),
              ], '''DContainer(
  padded: false,
  children: [
    text('Container without padding'),
  ],
)'''),
            ]),

            // Custom Classes
            _section('Custom Classes', [
              _preview([
                DContainer(
                  classes: 'bg-zinc-800/30 py-6 rounded-xl',
                  children: [
                    div(classes: 'text-center text-zinc-300', [
                      text('Container with custom classes'),
                    ]),
                  ],
                ),
              ], '''DContainer(
  classes: 'bg-zinc-800/30 py-6 rounded-xl',
  children: [
    text('Container with custom classes'),
  ],
)'''),
            ]),

            // API Reference
            h2([text('API Reference')]),
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
                  _apiRow('children', 'List<Component>', '[]', 'Content to render inside the container'),
                  _apiRow('size', 'DContainerSize', 'xl', 'Maximum width (xs, sm, md, lg, xl, xxl, full)'),
                  _apiRow('padded', 'bool', 'true', 'Whether to apply responsive horizontal padding'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]), ...children]);
  Component _preview(List<Component> components, String codeExample) => div(classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden', [
    div(classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]', styles: Styles(raw: {'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)', 'background-size': '24px 24px'}), components),
    div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [div(classes: 'flex items-center px-4 py-2 border-b border-zinc-200 dark:border-zinc-800', [span(classes: 'text-xs text-zinc-500', [text('dart')])]), div(classes: 'p-4 overflow-x-auto', [pre(classes: 'text-sm', [code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)])])])]),
  ]);
  Component _apiRow(String prop, String type, String defaultVal, String desc) => tr(classes: 'border-b border-zinc-800/50', [
    td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(prop)]),
    td(classes: 'py-3 px-4 font-mono text-purple-400', [text(type)]),
    td(classes: 'py-3 px-4 font-mono text-zinc-500', [text(defaultVal)]),
    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
  ]);
}
