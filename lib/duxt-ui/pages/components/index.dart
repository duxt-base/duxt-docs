import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';

/// Components index page - shows all components with live previews
class ComponentsIndexPage extends StatelessComponent {
  const ComponentsIndexPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      contentClass: '',
      body: div(classes: 'max-w-6xl', [
        h1(classes: 'text-3xl font-bold text-zinc-900 dark:text-white mb-2', [Component.text('Components')]),
        p(classes: 'text-lg text-zinc-500 dark:text-zinc-400 mb-8', [
          Component.text('Explore all Duxt UI components with live previews.'),
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
    );
  }

  Component _section(String title, List<Component> children) {
    return div(classes: 'mb-12', [
      h2(classes: 'text-xl font-semibold text-zinc-600 dark:text-zinc-300 mb-6', [Component.text(title)]),
      div(classes: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4', children),
    ]);
  }

  Component _card(String title, String desc, String href, List<Component> preview) {
    return a(
      href: href,
      classes: 'block rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden hover:border-cyan-500/50 transition-colors',
      [
        div(
          classes: 'aspect-[4/3] bg-zinc-100 dark:bg-zinc-900 flex items-center justify-center gap-2 p-4',
          preview,
        ),
        div(classes: 'p-4 border-t border-zinc-200 dark:border-zinc-800', [
          h3(classes: 'font-semibold text-zinc-900 dark:text-white', [Component.text(title)]),
          p(classes: 'text-sm text-zinc-500 mt-1', [Component.text(desc)]),
        ]),
      ],
    );
  }
}
