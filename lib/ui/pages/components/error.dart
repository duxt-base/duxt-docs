import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class ErrorPage extends StatelessComponent {
  const ErrorPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Error')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A component for displaying error states and error messages.')]),

            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DError(
                    title: 'Something went wrong',
                    description: 'Please try again later.',
                  ),
                ]),
              ], "DError(\n  title: 'Something went wrong',\n  description: 'Please try again later.',\n)"),
            ]),

            _section('With Retry', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DError(
                    title: 'Failed to load data',
                    description: 'An error occurred while fetching your data.',
                    onRetry: () {},
                  ),
                ]),
              ], '''DError(
  title: 'Failed to load data',
  description: 'An error occurred while fetching your data.',
  onRetry: () => fetchData(),
)'''),
            ]),

            _section('Severity Levels', [
              _preview([
                div(classes: 'w-full max-w-md space-y-4', [
                  DError(
                    severity: DErrorSeverity.warning,
                    title: 'Connection unstable',
                    description: 'Your internet connection appears to be slow.',
                  ),
                  DError(
                    severity: DErrorSeverity.error,
                    title: 'Something went wrong',
                    description: 'An unexpected error occurred.',
                  ),
                  DError(
                    severity: DErrorSeverity.fatal,
                    title: 'Critical error',
                    description: 'The application encountered a fatal error.',
                  ),
                ]),
              ], '''DError(severity: DErrorSeverity.warning, title: 'Warning', description: '...')
DError(severity: DErrorSeverity.error, title: 'Error', description: '...')
DError(severity: DErrorSeverity.fatal, title: 'Fatal', description: '...')'''),
            ]),

            _section('With Error Code', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DError(
                    title: 'Request failed',
                    description: 'The server returned an error response.',
                    errorCode: 'ERR_500',
                    onRetry: () {},
                  ),
                ]),
              ], '''DError(
  title: 'Request failed',
  description: 'The server returned an error response.',
  errorCode: 'ERR_500',
  onRetry: () => retry(),
)'''),
            ]),

            _section('Custom Icon', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DError(
                    iconComponent: DIcon(name: 'wifi-off', size: DIconSize.lg, classes: 'text-red-500'),
                    title: 'No connection',
                    description: 'Please check your internet connection.',
                    onRetry: () {},
                  ),
                ]),
              ], '''DError(
  iconComponent: DIcon(name: 'wifi-off', size: 48, classes: 'text-red-500'),
  title: 'No connection',
  description: 'Please check your internet connection.',
  onRetry: () => checkConnection(),
)'''),
            ]),

            _section('Preset: 404 Error', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DError404(
                    action: DButton(
                      label: 'Go Home',
                      variant: DButtonVariant.outline,
                    ),
                  ),
                ]),
              ], '''DError404(
  action: DButton(
    label: 'Go Home',
    onClick: () => navigateToHome(),
  ),
)'''),
            ]),

            _section('Preset: 500 Error', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DError500(
                    onRetry: () {},
                  ),
                ]),
              ], '''DError500(
  onRetry: () => reload(),
)'''),
            ]),

            _section('Preset: Network Error', [
              _preview([
                div(classes: 'w-full max-w-md', [
                  DErrorNetwork(
                    onRetry: () {},
                  ),
                ]),
              ], '''DErrorNetwork(
  onRetry: () => retryConnection(),
)'''),
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
