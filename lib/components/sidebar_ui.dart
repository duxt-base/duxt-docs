import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

/// Sidebar for Duxt UI documentation.
class SidebarUi extends StatelessComponent {
  const SidebarUi({super.key});

  @override
  Component build(BuildContext context) {
    return aside(
      classes: 'w-64 shrink-0 border-r border-zinc-800 p-6 overflow-y-auto',
      [
        nav([
          // Getting Started
          _buildGroup('Getting Started', [
            _buildLink('Introduction', '/duxt-ui'),
            _buildLink('Components', '/duxt-ui/components'),
          ]),

          // Form Components
          _buildGroup('Form', [
            _buildLink('Button', '/duxt-ui/components/button'),
            _buildLink('Input', '/duxt-ui/components/input'),
            _buildLink('Textarea', '/duxt-ui/components/textarea'),
            _buildLink('Select', '/duxt-ui/components/select'),
            _buildLink('Checkbox', '/duxt-ui/components/checkbox'),
            _buildLink('Checkbox Group', '/duxt-ui/components/checkbox-group'),
            _buildLink('Radio Group', '/duxt-ui/components/radio-group'),
            _buildLink('Switch', '/duxt-ui/components/switch'),
            _buildLink('Slider', '/duxt-ui/components/slider'),
            _buildLink('Input Number', '/duxt-ui/components/input-number'),
            _buildLink('Pin Input', '/duxt-ui/components/pin-input'),
            _buildLink('File Upload', '/duxt-ui/components/file-upload'),
            _buildLink('Form', '/duxt-ui/components/form'),
          ]),

          // Data Display
          _buildGroup('Data Display', [
            _buildLink('Table', '/duxt-ui/components/table'),
            _buildLink('Avatar', '/duxt-ui/components/avatar'),
            _buildLink('Badge', '/duxt-ui/components/badge'),
            _buildLink('Progress', '/duxt-ui/components/progress'),
            _buildLink('Skeleton', '/duxt-ui/components/skeleton'),
            _buildLink('Icon', '/duxt-ui/components/icon'),
            _buildLink('Kbd', '/duxt-ui/components/kbd'),
            _buildLink('Calendar', '/duxt-ui/components/calendar'),
          ]),

          // Layout
          _buildGroup('Layout', [
            _buildLink('Card', '/duxt-ui/components/card'),
            _buildLink('Container', '/duxt-ui/components/container'),
            _buildLink('Separator', '/duxt-ui/components/separator'),
            _buildLink('Accordion', '/duxt-ui/components/accordion'),
            _buildLink('Collapsible', '/duxt-ui/components/collapsible'),
            _buildLink('Scroll Area', '/duxt-ui/components/scroll-area'),
          ]),

          // Feedback
          _buildGroup('Feedback', [
            _buildLink('Alert', '/duxt-ui/components/alert'),
            _buildLink('Toast', '/duxt-ui/components/toast'),
            _buildLink('Spinner', '/duxt-ui/components/spinner'),
            _buildLink('Banner', '/duxt-ui/components/banner'),
            _buildLink('Empty', '/duxt-ui/components/empty'),
            _buildLink('Error', '/duxt-ui/components/error'),
          ]),

          // Navigation
          _buildGroup('Navigation', [
            _buildLink('Tabs', '/duxt-ui/components/tabs'),
            _buildLink('Breadcrumb', '/duxt-ui/components/breadcrumb'),
            _buildLink('Pagination', '/duxt-ui/components/pagination'),
            _buildLink('Dropdown', '/duxt-ui/components/dropdown'),
            _buildLink('Link', '/duxt-ui/components/link'),
            _buildLink('Navigation Menu', '/duxt-ui/components/navigation-menu'),
            _buildLink('Stepper', '/duxt-ui/components/stepper'),
          ]),

          // Overlay
          _buildGroup('Overlay', [
            _buildLink('Modal', '/duxt-ui/components/modal'),
            _buildLink('Slideover', '/duxt-ui/components/slideover'),
            _buildLink('Tooltip', '/duxt-ui/components/tooltip'),
            _buildLink('Popover', '/duxt-ui/components/popover'),
          ]),

          // Utility
          _buildGroup('Utility', [
            _buildLink('Carousel', '/duxt-ui/components/carousel'),
            _buildLink('Marquee', '/duxt-ui/components/marquee'),
          ]),

          // Composite
          _buildGroup('Composite', [
            _buildLink('Chat', '/duxt-ui/components/chat'),
            _buildLink('Dashboard', '/duxt-ui/components/dashboard'),
            _buildLink('Page', '/duxt-ui/components/page'),
            _buildLink('Pricing', '/duxt-ui/components/pricing'),
          ]),

          // Theme
          _buildGroup('Theme', [
            _buildLink('Theme', '/duxt-ui/components/theme'),
          ]),
        ]),
      ],
    );
  }

  Component _buildGroup(String title, List<Component> links) {
    return div(classes: 'mb-6', [
      h4(classes: 'text-sm font-semibold text-zinc-400 mb-3', [Component.text(title)]),
      ul(classes: 'space-y-1', links),
    ]);
  }

  Component _buildLink(String label, String href) {
    return li([
      a(
        href: href,
        classes:
            'block px-3 py-2 text-sm text-zinc-300 hover:text-cyan-400 hover:bg-zinc-800/50 rounded-md transition-colors',
        [Component.text(label)],
      ),
    ]);
  }
}
