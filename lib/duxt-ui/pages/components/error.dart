import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class ErrorPage extends StatelessComponent {
  const ErrorPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Error')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A component for displaying error states and error messages.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DError(
                    title: 'Something went wrong',
                    description: 'Please try again later.',
                  ),
                ]),
              ], code: "DError(\n  title: 'Something went wrong',\n  description: 'Please try again later.',\n)"),
            ]),

            _section('With Retry', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DError(
                    title: 'Failed to load data',
                    description: 'An error occurred while fetching your data.',
                    onRetry: () {},
                  ),
                ]),
              ], code: '''DError(
  title: 'Failed to load data',
  description: 'An error occurred while fetching your data.',
  onRetry: () => fetchData(),
)'''),
            ]),

            _section('Severity Levels', [
              ComponentPreviewCard(preview: [
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
              ], code: '''DError(severity: DErrorSeverity.warning, title: 'Warning', description: '...')
DError(severity: DErrorSeverity.error, title: 'Error', description: '...')
DError(severity: DErrorSeverity.fatal, title: 'Fatal', description: '...')'''),
            ]),

            _section('With Error Code', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DError(
                    title: 'Request failed',
                    description: 'The server returned an error response.',
                    errorCode: 'ERR_500',
                    onRetry: () {},
                  ),
                ]),
              ], code: '''DError(
  title: 'Request failed',
  description: 'The server returned an error response.',
  errorCode: 'ERR_500',
  onRetry: () => retry(),
)'''),
            ]),

            _section('Custom Icon', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DError(
                    iconComponent: DIcon(name: 'wifi-off', size: DIconSize.lg, className: 'text-red-500'),
                    title: 'No connection',
                    description: 'Please check your internet connection.',
                    onRetry: () {},
                  ),
                ]),
              ], code: '''DError(
  iconComponent: DIcon(name: 'wifi-off', size: 48, className: 'text-red-500'),
  title: 'No connection',
  description: 'Please check your internet connection.',
  onRetry: () => checkConnection(),
)'''),
            ]),

            _section('Preset: 404 Error', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DError404(
                    action: DButton(
                      label: 'Go Home',
                      variant: DButtonVariant.outline,
                    ),
                  ),
                ]),
              ], code: '''DError404(
  action: DButton(
    label: 'Go Home',
    onClick: () => navigateToHome(),
  ),
)'''),
            ]),

            _section('Preset: 500 Error', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DError500(
                    onRetry: () {},
                  ),
                ]),
              ], code: '''DError500(
  onRetry: () => reload(),
)'''),
            ]),

            _section('Preset: Network Error', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DErrorNetwork(
                    onRetry: () {},
                  ),
                ]),
              ], code: '''DErrorNetwork(
  onRetry: () => retryConnection(),
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
