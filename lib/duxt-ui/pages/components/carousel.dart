import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Carousel component documentation page
class CarouselPage extends StatelessComponent {
  const CarouselPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Carousel')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('A responsive image and content carousel with navigation controls.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-blue-500 to-purple-600 h-48 flex items-center justify-center rounded-lg', [
                          h2(classes: 'text-white text-2xl font-bold', [Component.text('Slide 1')]),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-green-500 to-teal-600 h-48 flex items-center justify-center rounded-lg', [
                          h2(classes: 'text-white text-2xl font-bold', [Component.text('Slide 2')]),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-orange-500 to-red-600 h-48 flex items-center justify-center rounded-lg', [
                          h2(classes: 'text-white text-2xl font-bold', [Component.text('Slide 3')]),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DCarousel(
  items: [
    DCarouselItem(image: '/slides/slide1.jpg', alt: 'First slide'),
    DCarouselItem(image: '/slides/slide2.jpg', alt: 'Second slide'),
    DCarouselItem(image: '/slides/slide3.jpg', alt: 'Third slide'),
  ],
)'''),
            ]),

            // With Custom Content
            _section('With Custom Content', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-pink-500 to-rose-600 h-48 flex items-center justify-center rounded-lg', [
                          div(classes: 'text-center text-white', [
                            h2(classes: 'text-2xl font-bold', [Component.text('Welcome')]),
                            p(classes: 'mt-2', [Component.text('Get started today')]),
                          ]),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-gradient-to-r from-cyan-500 to-blue-600 h-48 flex items-center justify-center rounded-lg', [
                          div(classes: 'text-center text-white', [
                            h2(classes: 'text-2xl font-bold', [Component.text('Features')]),
                            p(classes: 'mt-2', [Component.text('Explore our tools')]),
                          ]),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DCarousel(
  items: [
    DCarouselItem(
      content: div(classes: 'bg-gradient-to-r from-blue-500 to-purple-600 h-64 flex items-center justify-center', [
        h2(classes: 'text-white text-3xl font-bold', [Component.text('Welcome')]),
      ]),
    ),
    DCarouselItem(
      content: div(classes: 'bg-gradient-to-r from-green-500 to-teal-600 h-64 flex items-center justify-center', [
        h2(classes: 'text-white text-3xl font-bold', [Component.text('Features')]),
      ]),
    ),
  ],
)'''),
            ]),

            // Without Arrows
            _section('Without Arrows', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    showArrows: false,
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-zinc-800 h-32 flex items-center justify-center rounded-lg', [
                          Component.text('Slide 1 (No Arrows)'),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-zinc-700 h-32 flex items-center justify-center rounded-lg', [
                          Component.text('Slide 2 (No Arrows)'),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DCarousel(
  showArrows: false,
  items: [
    DCarouselItem(image: '/slide1.jpg'),
    DCarouselItem(image: '/slide2.jpg'),
  ],
)'''),
            ]),

            // Without Dots
            _section('Without Dots', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    showDots: false,
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-indigo-600 h-32 flex items-center justify-center rounded-lg', [
                          Component.text('Slide 1 (No Dots)'),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-indigo-500 h-32 flex items-center justify-center rounded-lg', [
                          Component.text('Slide 2 (No Dots)'),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DCarousel(
  showDots: false,
  items: [
    DCarouselItem(image: '/slide1.jpg'),
    DCarouselItem(image: '/slide2.jpg'),
  ],
)'''),
            ]),

            // Minimal Controls
            _section('Minimal Controls', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-lg', [
                  DCarousel(
                    showArrows: false,
                    showDots: false,
                    items: [
                      DCarouselItem(
                        content: div(classes: 'bg-emerald-600 h-32 flex items-center justify-center rounded-lg', [
                          Component.text('Minimal Slide 1'),
                        ]),
                      ),
                      DCarouselItem(
                        content: div(classes: 'bg-emerald-500 h-32 flex items-center justify-center rounded-lg', [
                          Component.text('Minimal Slide 2'),
                        ]),
                      ),
                    ],
                  ),
                ]),
              ], code: '''DCarousel(
  showArrows: false,
  showDots: false,
  items: [
    DCarouselItem(image: '/slide1.jpg'),
    DCarouselItem(image: '/slide2.jpg'),
  ],
)'''),
            ]),

            // API Reference
            h2([Component.text('API Reference')]),
            h3([Component.text('DCarousel')]),
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
            h3(classes: 'mt-8', [Component.text('DCarouselItem')]),
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
                  _apiRow('image', 'String?', 'null', 'Image URL'),
                  _apiRow('alt', 'String?', 'null', 'Image alt text'),
                  _apiRow('content', 'Component?', 'null', 'Custom content'),
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
}
