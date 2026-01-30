/// The entrypoint for the **server** environment.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:duxt/content.dart';

import 'layouts/duxt_layout.dart';
import 'layouts/landing_layout.dart';
import 'components/ui_preview.dart';

// UI component pages (Dart-based for live components)
import 'ui/pages/index.dart';
import 'ui/pages/components/index.dart';
import 'ui/pages/components/button.dart';
import 'ui/pages/components/input.dart';
import 'ui/pages/components/badge.dart';
import 'ui/pages/components/alert.dart';
import 'ui/pages/components/avatar.dart';
import 'ui/pages/components/spinner.dart';
import 'ui/pages/components/progress.dart';
import 'ui/pages/components/switch.dart';
import 'ui/pages/components/checkbox.dart';
import 'ui/pages/components/tabs.dart';
import 'ui/pages/components/skeleton.dart';
import 'ui/pages/components/separator.dart';
import 'ui/pages/components/breadcrumb.dart';
import 'ui/pages/components/pagination.dart';
import 'ui/pages/components/textarea.dart';
import 'ui/pages/components/select.dart';
import 'ui/pages/components/checkbox_group.dart';
import 'ui/pages/components/radio_group.dart';
import 'ui/pages/components/slider.dart';
import 'ui/pages/components/input_number.dart';
import 'ui/pages/components/pin_input.dart';
import 'ui/pages/components/file_upload.dart';
import 'ui/pages/components/form.dart';
import 'ui/pages/components/table.dart';
import 'ui/pages/components/icon.dart';
import 'ui/pages/components/kbd.dart';
import 'ui/pages/components/calendar.dart';
import 'ui/pages/components/card.dart';
import 'ui/pages/components/container.dart';
import 'ui/pages/components/accordion.dart';
import 'ui/pages/components/collapsible.dart';
import 'ui/pages/components/scroll_area.dart';
import 'ui/pages/components/toast.dart';
import 'ui/pages/components/banner.dart';
import 'ui/pages/components/empty.dart';
import 'ui/pages/components/error.dart';
import 'ui/pages/components/dropdown.dart';
import 'ui/pages/components/link.dart';
import 'ui/pages/components/navigation_menu.dart';
import 'ui/pages/components/stepper.dart';
import 'ui/pages/components/modal.dart';
import 'ui/pages/components/slideover.dart';
import 'ui/pages/components/tooltip.dart';
import 'ui/pages/components/popover.dart';
import 'ui/pages/components/carousel.dart';
import 'ui/pages/components/marquee.dart';
import 'ui/pages/components/chat.dart';
import 'ui/pages/components/dashboard.dart';
import 'ui/pages/components/page.dart';
import 'ui/pages/components/pricing.dart';
import 'ui/pages/components/theme.dart';
import 'ui/pages/components/test.dart';

import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(
    Document(
      lang: 'en',
      head: [
        link(href: 'https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;500;600;700&display=swap', rel: 'stylesheet'),
        link(href: 'styles.css', rel: 'stylesheet'),
      ],
      body: Router(
        routes: [
          // Duxt UI pages - Dart components for live demos
          Route(path: '/duxt-ui', builder: (context, state) => const UiIndexPage()),
          Route(path: '/duxt-ui/components', builder: (context, state) => const ComponentsIndexPage()),
          // Form components
          Route(path: '/duxt-ui/components/button', builder: (context, state) => const ButtonPage()),
          Route(path: '/duxt-ui/components/input', builder: (context, state) => const InputPage()),
          Route(path: '/duxt-ui/components/textarea', builder: (context, state) => const TextareaPage()),
          Route(path: '/duxt-ui/components/select', builder: (context, state) => const SelectPage()),
          Route(path: '/duxt-ui/components/checkbox', builder: (context, state) => const CheckboxPage()),
          Route(path: '/duxt-ui/components/checkbox-group', builder: (context, state) => const CheckboxGroupPage()),
          Route(path: '/duxt-ui/components/radio-group', builder: (context, state) => const RadioGroupPage()),
          Route(path: '/duxt-ui/components/switch', builder: (context, state) => const SwitchPage()),
          Route(path: '/duxt-ui/components/slider', builder: (context, state) => const SliderPage()),
          Route(path: '/duxt-ui/components/input-number', builder: (context, state) => const InputNumberPage()),
          Route(path: '/duxt-ui/components/pin-input', builder: (context, state) => const PinInputPage()),
          Route(path: '/duxt-ui/components/file-upload', builder: (context, state) => const FileUploadPage()),
          Route(path: '/duxt-ui/components/form', builder: (context, state) => const FormPage()),
          // Data Display components
          Route(path: '/duxt-ui/components/table', builder: (context, state) => const TablePage()),
          Route(path: '/duxt-ui/components/avatar', builder: (context, state) => const AvatarPage()),
          Route(path: '/duxt-ui/components/badge', builder: (context, state) => const BadgePage()),
          Route(path: '/duxt-ui/components/progress', builder: (context, state) => const ProgressPage()),
          Route(path: '/duxt-ui/components/skeleton', builder: (context, state) => const SkeletonPage()),
          Route(path: '/duxt-ui/components/icon', builder: (context, state) => const IconPage()),
          Route(path: '/duxt-ui/components/kbd', builder: (context, state) => const KbdPage()),
          Route(path: '/duxt-ui/components/calendar', builder: (context, state) => const CalendarPage()),
          // Layout components
          Route(path: '/duxt-ui/components/card', builder: (context, state) => const CardPage()),
          Route(path: '/duxt-ui/components/container', builder: (context, state) => const ContainerPage()),
          Route(path: '/duxt-ui/components/separator', builder: (context, state) => const SeparatorPage()),
          Route(path: '/duxt-ui/components/accordion', builder: (context, state) => const AccordionPage()),
          Route(path: '/duxt-ui/components/collapsible', builder: (context, state) => const CollapsiblePage()),
          Route(path: '/duxt-ui/components/scroll-area', builder: (context, state) => const ScrollAreaPage()),
          // Feedback components
          Route(path: '/duxt-ui/components/alert', builder: (context, state) => const AlertPage()),
          Route(path: '/duxt-ui/components/toast', builder: (context, state) => const ToastPage()),
          Route(path: '/duxt-ui/components/spinner', builder: (context, state) => const SpinnerPage()),
          Route(path: '/duxt-ui/components/banner', builder: (context, state) => const BannerPage()),
          Route(path: '/duxt-ui/components/empty', builder: (context, state) => const EmptyPage()),
          Route(path: '/duxt-ui/components/error', builder: (context, state) => const ErrorPage()),
          // Navigation components
          Route(path: '/duxt-ui/components/tabs', builder: (context, state) => const TabsPage()),
          Route(path: '/duxt-ui/components/breadcrumb', builder: (context, state) => const BreadcrumbPage()),
          Route(path: '/duxt-ui/components/pagination', builder: (context, state) => const PaginationPage()),
          Route(path: '/duxt-ui/components/dropdown', builder: (context, state) => const DropdownPage()),
          Route(path: '/duxt-ui/components/link', builder: (context, state) => const LinkPage()),
          Route(path: '/duxt-ui/components/navigation-menu', builder: (context, state) => const NavigationMenuPage()),
          Route(path: '/duxt-ui/components/stepper', builder: (context, state) => const StepperPage()),
          // Overlay components
          Route(path: '/duxt-ui/components/modal', builder: (context, state) => const ModalPage()),
          Route(path: '/duxt-ui/components/slideover', builder: (context, state) => const SlideoverPage()),
          Route(path: '/duxt-ui/components/tooltip', builder: (context, state) => const TooltipPage()),
          Route(path: '/duxt-ui/components/popover', builder: (context, state) => const PopoverPage()),
          // Utility components
          Route(path: '/duxt-ui/components/carousel', builder: (context, state) => const CarouselPage()),
          Route(path: '/duxt-ui/components/marquee', builder: (context, state) => const MarqueePage()),
          // Composite components
          Route(path: '/duxt-ui/components/chat', builder: (context, state) => const ChatPage()),
          Route(path: '/duxt-ui/components/dashboard', builder: (context, state) => const DashboardPage()),
          Route(path: '/duxt-ui/components/page', builder: (context, state) => const PagePage()),
          Route(path: '/duxt-ui/components/pricing', builder: (context, state) => const PricingPage()),
          // Theme
          Route(path: '/duxt-ui/components/theme', builder: (context, state) => const ThemePage()),
          // Test page
          Route(path: '/duxt-ui/components/test', builder: (context, state) => const TestPage()),

          // Content pages - explicit routes for ContentApp (no path params in static mode)
          Route(path: '/', builder: (context, state) => _contentApp()),
          Route(path: '/duxt', builder: (context, state) => _contentApp()),
          Route(path: '/duxt/routing', builder: (context, state) => _contentApp()),
          Route(path: '/duxt/modules', builder: (context, state) => _contentApp()),
          Route(path: '/duxt/layouts', builder: (context, state) => _contentApp()),
          Route(path: '/duxt/middleware', builder: (context, state) => _contentApp()),
          Route(path: '/duxt/state', builder: (context, state) => _contentApp()),
          Route(path: '/duxt/api-client', builder: (context, state) => _contentApp()),
          Route(path: '/duxt/server', builder: (context, state) => _contentApp()),
          Route(path: '/duxt/cli', builder: (context, state) => _contentApp()),
          Route(path: '/duxt/deploy', builder: (context, state) => _contentApp()),
          Route(path: '/about', builder: (context, state) => _contentApp()),
          Route(path: '/api', builder: (context, state) => _contentApp()),
        ],
      ),
    ),
  );
}

// Helper to create ContentApp instance
Component _contentApp() => DuxtContentApp(
  components: [
    Callout(),
    CodeBlock(),
    Image(zoom: true),
    DuxtUiComponents(),
    UiPreview(),
    UiPreviewCard(),
  ],
  layouts: [
    DuxtLayout(),
    LandingLayout(),
  ],
  theme: ContentTheme(
    primary: ThemeColor(ThemeColors.cyan.$500, dark: ThemeColors.cyan.$400),
    background: ThemeColor(ThemeColors.slate.$50, dark: ThemeColors.zinc.$950),
  ),
);
