import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Sidebar navigation for Duxt UI documentation.
class SidebarUi extends StatelessComponent {
  const SidebarUi({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Document.head(children: [Style(styles: _styles)]),
      nav(classes: 'sidebar-nav', [
        _group('Getting Started', [
          _link('Introduction', '/duxt-ui'),
          _link('Components', '/duxt-ui/components'),
        ]),
        _group('Form', [
          _link('Button', '/duxt-ui/components/button'),
          _link('Input', '/duxt-ui/components/input'),
          _link('Textarea', '/duxt-ui/components/textarea'),
          _link('Select', '/duxt-ui/components/select'),
          _link('Checkbox', '/duxt-ui/components/checkbox'),
          _link('Checkbox Group', '/duxt-ui/components/checkbox-group'),
          _link('Radio Group', '/duxt-ui/components/radio-group'),
          _link('Switch', '/duxt-ui/components/switch'),
          _link('Slider', '/duxt-ui/components/slider'),
          _link('Input Number', '/duxt-ui/components/input-number'),
          _link('Pin Input', '/duxt-ui/components/pin-input'),
          _link('File Upload', '/duxt-ui/components/file-upload'),
          _link('Form', '/duxt-ui/components/form'),
        ]),
        _group('Data Display', [
          _link('Table', '/duxt-ui/components/table'),
          _link('Avatar', '/duxt-ui/components/avatar'),
          _link('Badge', '/duxt-ui/components/badge'),
          _link('Progress', '/duxt-ui/components/progress'),
          _link('Skeleton', '/duxt-ui/components/skeleton'),
          _link('Icon', '/duxt-ui/components/icon'),
          _link('Kbd', '/duxt-ui/components/kbd'),
          _link('Calendar', '/duxt-ui/components/calendar'),
        ]),
        _group('Layout', [
          _link('Card', '/duxt-ui/components/card'),
          _link('Container', '/duxt-ui/components/container'),
          _link('Separator', '/duxt-ui/components/separator'),
          _link('Accordion', '/duxt-ui/components/accordion'),
          _link('Collapsible', '/duxt-ui/components/collapsible'),
          _link('Scroll Area', '/duxt-ui/components/scroll-area'),
        ]),
        _group('Feedback', [
          _link('Alert', '/duxt-ui/components/alert'),
          _link('Toast', '/duxt-ui/components/toast'),
          _link('Spinner', '/duxt-ui/components/spinner'),
          _link('Banner', '/duxt-ui/components/banner'),
          _link('Empty', '/duxt-ui/components/empty'),
          _link('Error', '/duxt-ui/components/error'),
        ]),
        _group('Navigation', [
          _link('Tabs', '/duxt-ui/components/tabs'),
          _link('Breadcrumb', '/duxt-ui/components/breadcrumb'),
          _link('Pagination', '/duxt-ui/components/pagination'),
          _link('Dropdown', '/duxt-ui/components/dropdown'),
          _link('Link', '/duxt-ui/components/link'),
          _link('Navigation Menu', '/duxt-ui/components/navigation-menu'),
          _link('Stepper', '/duxt-ui/components/stepper'),
        ]),
        _group('Overlay', [
          _link('Modal', '/duxt-ui/components/modal'),
          _link('Slideover', '/duxt-ui/components/slideover'),
          _link('Tooltip', '/duxt-ui/components/tooltip'),
          _link('Popover', '/duxt-ui/components/popover'),
        ]),
        _group('Utility', [
          _link('Carousel', '/duxt-ui/components/carousel'),
          _link('Marquee', '/duxt-ui/components/marquee'),
        ]),
        _group('Composite', [
          _link('Chat', '/duxt-ui/components/chat'),
          _link('Dashboard', '/duxt-ui/components/dashboard'),
          _link('Page', '/duxt-ui/components/page'),
          _link('Pricing', '/duxt-ui/components/pricing'),
        ]),
        _group('Theme', [
          _link('Theme', '/duxt-ui/components/theme'),
        ]),
      ]),
    ]);
  }

  Component _group(String title, List<Component> links) {
    return div(classes: 'sidebar-group', [
      div(classes: 'sidebar-group-title', [Component.text(title)]),
      ul(classes: 'sidebar-links', links),
    ]);
  }

  Component _link(String label, String href) {
    return li([
      a(href: href, classes: 'sidebar-link', [Component.text(label)]),
    ]);
  }

  static List<StyleRule> get _styles => [
    css('.sidebar-nav', [
      css('&').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        gap: Gap.row(1.5.rem),
      ),
    ]),

    css('.sidebar-group', [
      css('&').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        gap: Gap.row(0.5.rem),
      ),
    ]),

    css('.sidebar-group-title', [
      css('&').styles(
        padding: Padding.only(left: 0.75.rem),
        raw: {
          'font-size': '0.75rem',
          'font-weight': '600',
          'text-transform': 'uppercase',
          'letter-spacing': '0.05em',
          'color': '#71717a',
        },
      ),
    ]),

    css('.sidebar-links', [
      css('&').styles(
        margin: Margin.zero,
        padding: Padding.zero,
        listStyle: ListStyle.none,
      ),
    ]),

    css('.sidebar-link', [
      css('&').styles(
        display: Display.block,
        padding: Padding.symmetric(horizontal: 0.75.rem, vertical: 0.5.rem),
        raw: {
          'font-size': '0.875rem',
          'color': '#a1a1aa',
          'text-decoration': 'none',
          'border-radius': '6px',
          'transition': 'all 0.15s ease',
        },
      ),
      css('&:hover').styles(
        backgroundColor: Color('#27272a'),
        color: Color('#22d3ee'),
      ),
    ]),

    // Light mode
    css(':root[data-theme="light"] .sidebar-group-title', [
      css('&').styles(color: Color('#71717a')),
    ]),
    css(':root[data-theme="light"] .sidebar-link', [
      css('&').styles(color: Color('#52525b')),
      css('&:hover').styles(
        backgroundColor: Color('#f4f4f5'),
        color: Color('#0891b2'),
      ),
    ]),
  ];
}
