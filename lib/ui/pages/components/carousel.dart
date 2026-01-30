import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Carousel component documentation page
class CarouselPage extends StatelessComponent {
  const CarouselPage({super.key});

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
            h1([text('Carousel')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('A responsive image and content carousel with navigation controls.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-blue-500 to-purple-600 h-48 flex items-center justify-center rounded-lg', [
                          h2(classes: 'text-white text-2xl font-bold', [text('Slide 1')]),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-green-500 to-teal-600 h-48 flex items-center justify-center rounded-lg', [
                          h2(classes: 'text-white text-2xl font-bold', [text('Slide 2')]),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-orange-500 to-red-600 h-48 flex items-center justify-center rounded-lg', [
                          h2(classes: 'text-white text-2xl font-bold', [text('Slide 3')]),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], '''DCarousel(
  items: [
    DCarouselItem(image: '/slides/slide1.jpg', alt: 'First slide'),
    DCarouselItem(image: '/slides/slide2.jpg', alt: 'Second slide'),
    DCarouselItem(image: '/slides/slide3.jpg', alt: 'Third slide'),
  ],
)'''),
            ]),

            // With Custom Content
            _section('With Custom Content', [
              _preview([
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-pink-500 to-rose-600 h-48 flex items-center justify-center rounded-lg', [
                          div(classes: 'text-center text-white', [
                            h2(classes: 'text-2xl font-bold', [text('Welcome')]),
                            p(classes: 'mt-2', [text('Get started today')]),
                          ]),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-cyan-500 to-blue-600 h-48 flex items-center justify-center rounded-lg', [
                          div(classes: 'text-center text-white', [
                            h2(classes: 'text-2xl font-bold', [text('Features')]),
                            p(classes: 'mt-2', [text('Explore our tools')]),
                          ]),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], '''DCarousel(
  items: [
    DCarouselItem(
      content: div(classes: 'bg-gradient-to-r from-blue-500 to-purple-600 h-64 flex items-center justify-center', [
        h2(classes: 'text-white text-3xl font-bold', [text('Welcome')]),
      ]),
    ),
    DCarouselItem(
      content: div(classes: 'bg-gradient-to-r from-green-500 to-teal-600 h-64 flex items-center justify-center', [
        h2(classes: 'text-white text-3xl font-bold', [text('Features')]),
      ]),
    ),
  ],
)'''),
            ]),

            // Without Arrows
            _section('Without Arrows', [
              _preview([
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    showArrows: false,
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-zinc-800 h-32 flex items-center justify-center rounded-lg', [
                          text('Slide 1 (No Arrows)'),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-zinc-700 h-32 flex items-center justify-center rounded-lg', [
                          text('Slide 2 (No Arrows)'),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], '''DCarousel(
  showArrows: false,
  items: [
    DCarouselItem(image: '/slide1.jpg'),
    DCarouselItem(image: '/slide2.jpg'),
  ],
)'''),
            ]),

            // Without Dots
            _section('Without Dots', [
              _preview([
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    showDots: false,
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-indigo-600 h-32 flex items-center justify-center rounded-lg', [
                          text('Slide 1 (No Dots)'),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-indigo-500 h-32 flex items-center justify-center rounded-lg', [
                          text('Slide 2 (No Dots)'),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], '''DCarousel(
  showDots: false,
  items: [
    DCarouselItem(image: '/slide1.jpg'),
    DCarouselItem(image: '/slide2.jpg'),
  ],
)'''),
            ]),

            // Minimal Controls
            _section('Minimal Controls', [
              _preview([
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    showArrows: false,
                    showDots: false,
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-emerald-600 h-32 flex items-center justify-center rounded-lg', [
                          text('Minimal Slide 1'),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-emerald-500 h-32 flex items-center justify-center rounded-lg', [
                          text('Minimal Slide 2'),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], '''DCarousel(
  showArrows: false,
  showDots: false,
  items: [
    DCarouselItem(image: '/slide1.jpg'),
    DCarouselItem(image: '/slide2.jpg'),
  ],
)'''),
            ]),

            // API Reference
            h2([text('API Reference')]),
            h3([text('DCarousel')]),
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
                  _apiRow('items', 'List<DCarouselItem>', 'required', 'Carousel items'),
                  _apiRow('showArrows', 'bool', 'true', 'Show navigation arrows'),
                  _apiRow('showDots', 'bool', 'true', 'Show dot indicators'),
                  _apiRow('autoPlay', 'bool', 'false', 'Auto-advance slides'),
                  _apiRow('autoPlayInterval', 'int', '5000', 'Auto-play interval (ms)'),
                  _apiRow('classes', 'String?', 'null', 'Custom CSS classes'),
                ]),
              ]),
            ]),

            // DCarouselItem
            h3(classes: 'mt-8', [text('DCarouselItem')]),
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
                  _apiRow('image', 'String?', 'null', 'Image URL'),
                  _apiRow('alt', 'String?', 'null', 'Image alt text'),
                  _apiRow('content', 'Component?', 'null', 'Custom content'),
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
}
