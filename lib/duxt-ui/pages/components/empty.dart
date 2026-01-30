import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class EmptyPage extends StatelessComponent {
  const EmptyPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Empty')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A component for displaying empty states when there is no data to show.')]),

            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DEmpty(
                    title: 'No items',
                    description: 'You haven\'t added any items yet.',
                  ),
                ]),
              ], code: "DEmpty(\n  title: 'No items',\n  description: 'You haven\\'t added any items yet.',\n)"),
            ]),

            _section('With Icon', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DEmpty(
                    icon: 'inbox',
                    title: 'No messages',
                    description: 'Your inbox is empty.',
                  ),
                ]),
              ], code: "DEmpty(\n  icon: 'inbox',\n  title: 'No messages',\n  description: 'Your inbox is empty.',\n)"),
            ]),

            _section('With Action', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DEmpty(
                    icon: 'folder',
                    title: 'No projects',
                    description: 'Create your first project to get started.',
                    action: DButton(
                      label: 'Create Project',
                      leadingIcon: DIcon(name: 'plus'),
                    ),
                  ),
                ]),
              ], code: '''DEmpty(
  icon: 'folder',
  title: 'No projects',
  description: 'Create your first project to get started.',
  action: DButton(
    label: 'Create Project',
    leadingIcon: DIcon(name: 'plus'),
  ),
)'''),
            ]),

            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full space-y-6', [
                  DEmpty(size: DSize.sm, title: 'Small empty state', description: 'This is a small empty state.'),
                  DEmpty(size: DSize.md, title: 'Medium empty state', description: 'This is the default size.'),
                  DEmpty(size: DSize.lg, title: 'Large empty state', description: 'This is a large empty state.'),
                ]),
              ], code: '''DEmpty(size: DSize.sm, title: 'Small', description: '...')
DEmpty(size: DSize.md, title: 'Medium', description: '...')  // Default
DEmpty(size: DSize.lg, title: 'Large', description: '...')'''),
            ]),

            _section('Preset: No Data', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DEmptyNoData(
                    action: DButton(
                      label: 'Add Data',
                      variant: DButtonVariant.outline,
                    ),
                  ),
                ]),
              ], code: '''DEmptyNoData(
  action: DButton(
    label: 'Add Data',
    variant: DButtonVariant.outline,
  ),
)'''),
            ]),

            _section('Preset: No Results', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md', [
                  DEmptyNoResults(
                    searchTerm: 'flutter',
                    action: DButton(
                      label: 'Clear Search',
                      variant: DButtonVariant.outline,
                    ),
                  ),
                ]),
              ], code: '''DEmptyNoResults(
  searchTerm: 'flutter',
  action: DButton(
    label: 'Clear Search',
    variant: DButtonVariant.outline,
  ),
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
