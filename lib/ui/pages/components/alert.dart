import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class AlertPage extends StatelessComponent {
  const AlertPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Alert')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('Contextual feedback messages for user actions.')]),

            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DAlert(title: 'Heads up!', description: 'You can add components using the CLI.'),
                ]),
              ], "DAlert(\n  title: 'Heads up!',\n  description: 'You can add components using the CLI.',\n)"),
            ]),

            _section('Colors', [
              _preview([
                div(classes: 'w-full max-w-md space-y-4', [
                  DAlert(title: 'Info', description: 'This is an informational message.', color: DAlertColor.info),
                  DAlert(title: 'Success', description: 'Operation completed successfully.', color: DAlertColor.success),
                  DAlert(title: 'Warning', description: 'Please review before continuing.', color: DAlertColor.warning),
                  DAlert(title: 'Error', description: 'Something went wrong.', color: DAlertColor.error),
                ]),
              ], '''DAlert(title: 'Info', description: '...', color: DAlertColor.info)
DAlert(title: 'Success', description: '...', color: DAlertColor.success)
DAlert(title: 'Warning', description: '...', color: DAlertColor.warning)
DAlert(title: 'Error', description: '...', color: DAlertColor.error)'''),
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
