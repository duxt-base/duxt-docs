import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Components index page - shows all components with live previews
class ComponentsIndexPage extends StatelessComponent {
  const ComponentsIndexPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
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
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8', [
          div(classes: 'max-w-6xl', [
            h1(classes: 'text-3xl font-bold text-zinc-900 dark:text-white mb-2', [text('Components')]),
            p(classes: 'text-lg text-zinc-500 dark:text-zinc-400 mb-8', [
              text('Explore all Duxt UI components with live previews.'),
            ]),

            // Form Components
            _section('Form', [
              _card('Button', 'Interactive buttons', '/duxt-ui/components/button', [
                DButton(label: 'Click', size: DButtonSize.sm),
                DButton(label: 'Me', variant: DButtonVariant.outline, size: DButtonSize.sm),
              ]),
              _card('Input', 'Text input fields', '/duxt-ui/components/input', [
                DInput(placeholder: 'Type...', size: DInputSize.sm),
              ]),
              _card('Checkbox', 'Selection controls', '/duxt-ui/components/checkbox', [
                DCheckbox(label: 'Option', checked: true),
              ]),
              _card('Switch', 'Toggle switches', '/duxt-ui/components/switch', [
                DSwitch(checked: true),
              ]),
              _card('Select', 'Dropdown selection', '/duxt-ui/components/select', [
                DBadge(label: 'Select', color: DBadgeColor.neutral),
              ]),
            ]),

            // Data Display
            _section('Data Display', [
              _card('Badge', 'Status indicators', '/duxt-ui/components/badge', [
                DBadge(label: 'New', color: DBadgeColor.primary),
                DBadge(label: 'Pro', color: DBadgeColor.warning),
              ]),
              _card('Avatar', 'User avatars', '/duxt-ui/components/avatar', [
                DAvatar(alt: 'JD', size: DAvatarSize.sm),
                DAvatar(alt: 'AB', size: DAvatarSize.md),
              ]),
              _card('Progress', 'Progress bars', '/duxt-ui/components/progress', [
                div(classes: 'w-32', [DProgress(value: 65)]),
              ]),
              _card('Skeleton', 'Loading placeholders', '/duxt-ui/components/skeleton', [
                div(classes: 'w-24 space-y-2', [
                  DSkeleton(classes: 'h-3 w-full'),
                  DSkeleton(classes: 'h-3 w-3/4'),
                ]),
              ]),
            ]),

            // Feedback
            _section('Feedback', [
              _card('Alert', 'Contextual messages', '/duxt-ui/components/alert', [
                div(classes: 'w-48 scale-90', [
                  DAlert(title: 'Note', description: 'Info here', color: DAlertColor.info),
                ]),
              ]),
              _card('Spinner', 'Loading spinners', '/duxt-ui/components/spinner', [
                DSpinner(size: DSpinnerSize.md),
              ]),
            ]),

            // Navigation
            _section('Navigation', [
              _card('Tabs', 'Tab navigation', '/duxt-ui/components/tabs', [
                DTabs(
                  items: [
                    DTabItem(label: 'Tab 1', value: '1'),
                    DTabItem(label: 'Tab 2', value: '2'),
                  ],
                  defaultValue: '1',
                ),
              ]),
              _card('Breadcrumb', 'Navigation path', '/duxt-ui/components/breadcrumb', [
                div(classes: 'scale-90', [
                  DBreadcrumb(items: [
                    DBreadcrumbItem(label: 'Home', href: '/'),
                    DBreadcrumbItem(label: 'Docs'),
                  ]),
                ]),
              ]),
              _card('Pagination', 'Page navigation', '/duxt-ui/components/pagination', [
                div(classes: 'scale-75', [
                  DPagination(currentPage: 2, totalPages: 5),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) {
    return div(classes: 'mb-12', [
      h2(classes: 'text-xl font-semibold text-zinc-600 dark:text-zinc-300 mb-6', [text(title)]),
      div(classes: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4', children),
    ]);
  }

  Component _card(String title, String desc, String href, List<Component> preview) {
    return a(
      href: href,
      classes: 'block rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden hover:border-cyan-500/50 transition-colors',
      [
        div(
          classes: 'aspect-[4/3] bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center gap-2 p-4',
          styles: Styles(raw: {
            'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.3) 1px, transparent 0)',
            'background-size': '16px 16px',
          }),
          preview,
        ),
        div(classes: 'p-4 border-t border-zinc-200 dark:border-zinc-800', [
          h3(classes: 'font-semibold text-zinc-900 dark:text-white', [text(title)]),
          p(classes: 'text-sm text-zinc-500 mt-1', [text(desc)]),
        ]),
      ],
    );
  }
}
