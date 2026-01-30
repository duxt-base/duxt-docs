import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../layouts/ui_layout.dart';
import '../../components/site_header.dart';
import '../../components/sidebar_ui.dart';
import '../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Duxt UI overview page
class UiIndexPage extends StatelessComponent {
  const UiIndexPage({super.key});

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
            h1([text('Duxt UI')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('A comprehensive UI component library for Jaspr applications.'),
            ]),

            // Live component showcase
            div(classes: 'not-prose my-8', [
              h2(classes: 'text-2xl font-bold text-zinc-900 dark:text-white mb-6', [text('Component Showcase')]),

              div(classes: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6', [
                _componentCard('Button', 'Interactive buttons with variants', [
                  DButton(label: 'Primary', color: DButtonColor.primary),
                  DButton(label: 'Outline', variant: DButtonVariant.outline),
                ]),
                _componentCard('Input', 'Text input fields', [
                  DInput(placeholder: 'Type here...'),
                ]),
                _componentCard('Badge', 'Status indicators', [
                  DBadge(label: 'New', color: DBadgeColor.primary),
                  DBadge(label: 'Beta', color: DBadgeColor.warning),
                ]),
                _componentCard('Alert', 'Contextual feedback', [
                  DAlert(title: 'Info', description: 'This is helpful.', color: DAlertColor.info),
                ]),
                _componentCard('Spinner', 'Loading indicators', [
                  DSpinner(size: DSpinnerSize.md),
                ]),
                _componentCard('Switch', 'Toggle controls', [
                  DSwitch(checked: true),
                  DSwitch(checked: false),
                ]),
              ]),
            ]),

            h2(classes: 'text-zinc-900 dark:text-white', [text('Installation')]),
            pre(classes: 'not-prose bg-zinc-100 dark:bg-zinc-900 p-4 rounded-lg border border-zinc-200 dark:border-zinc-800', [
              code(classes: 'text-zinc-700 dark:text-zinc-300', [text('dependencies:\n  duxt_ui: ^0.2.3')]),
            ]),

            h2(classes: 'text-zinc-900 dark:text-white', [text('Usage')]),
            pre(classes: 'not-prose bg-zinc-100 dark:bg-zinc-900 p-4 rounded-lg border border-zinc-200 dark:border-zinc-800', [
              code(classes: 'text-zinc-700 dark:text-zinc-300', [text("import 'package:duxt_ui/duxt_ui.dart';\n\nDButton(\n  label: 'Click me',\n  onPressed: () => print('clicked'),\n)")]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _componentCard(String title, String description, List<Component> preview) {
    return div(
      classes: 'rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden',
      [
        div(
          classes: 'p-6 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center gap-3 min-h-[120px]',
          styles: Styles(raw: {
            'background-image': 'radial-gradient(circle at 1px 1px, rgb(161 161 170 / 0.3) 1px, transparent 0)',
            'background-size': '20px 20px',
          }),
          preview,
        ),
        div(classes: 'p-4 border-t border-zinc-200 dark:border-zinc-800', [
          h3(classes: 'font-semibold text-zinc-900 dark:text-white', [text(title)]),
          p(classes: 'text-sm text-zinc-500 dark:text-zinc-400 mt-1', [text(description)]),
        ]),
      ],
    );
  }
}
