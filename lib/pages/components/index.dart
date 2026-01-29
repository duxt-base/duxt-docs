import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';

/// Components overview page
class ComponentsPage extends StatelessComponent {
  const ComponentsPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'Components',
      description: 'A comprehensive collection of UI components for building modern web applications.',
      currentPath: '/components',
      tocItems: const [
        TocItem(label: 'Overview', anchor: 'overview'),
        TocItem(label: 'Form Components', anchor: 'form-components'),
        TocItem(label: 'Layout Components', anchor: 'layout-components'),
        TocItem(label: 'Data Display', anchor: 'data-display'),
        TocItem(label: 'Feedback', anchor: 'feedback'),
      ],
      children: [
        // Overview
        h2(id: 'overview', [text('Overview')]),
        p([
          text('Duxt UI provides a rich set of components designed to work seamlessly with Jaspr and Tailwind CSS. '),
          text('Each component is fully customizable with support for variants, colors, sizes, and states.'),
        ]),

        // Form Components
        h2(id: 'form-components', [text('Form Components')]),
        p([text('Build interactive forms with these input and control components:')]),
        _buildComponentGrid([
          _ComponentCard(
            name: 'Button',
            description: 'Trigger actions with customizable buttons',
            path: '/components/button',
          ),
          _ComponentCard(
            name: 'Input',
            description: 'Text input fields with validation',
            path: '/components/input',
          ),
          _ComponentCard(
            name: 'Textarea',
            description: 'Multi-line text input',
            path: '/components/textarea',
          ),
          _ComponentCard(
            name: 'Select',
            description: 'Dropdown selection menus',
            path: '/components/select',
          ),
          _ComponentCard(
            name: 'Checkbox',
            description: 'Toggle boolean values',
            path: '/components/checkbox',
          ),
          _ComponentCard(
            name: 'Radio',
            description: 'Select one option from a group',
            path: '/components/radio',
          ),
        ]),

        // Layout Components
        h2(id: 'layout-components', [text('Layout Components')]),
        p([text('Structure your pages with these layout primitives:')]),
        _buildComponentGrid([
          _ComponentCard(
            name: 'Card',
            description: 'Container with header, body, and footer',
            path: '/components/card',
          ),
          _ComponentCard(
            name: 'Modal',
            description: 'Overlay dialogs for focused content',
            path: '/components/modal',
          ),
          _ComponentCard(
            name: 'Tabs',
            description: 'Organize content in tabbed sections',
            path: '/components/tabs',
          ),
          _ComponentCard(
            name: 'Accordion',
            description: 'Collapsible content sections',
            path: '/components/accordion',
          ),
        ]),

        // Data Display
        h2(id: 'data-display', [text('Data Display')]),
        p([text('Present data in clear, organized formats:')]),
        _buildComponentGrid([
          _ComponentCard(
            name: 'Badge',
            description: 'Small status indicators',
            path: '/components/badge',
          ),
          _ComponentCard(
            name: 'Avatar',
            description: 'User profile images',
            path: '/components/avatar',
          ),
          _ComponentCard(
            name: 'Table',
            description: 'Tabular data display',
            path: '/components/table',
          ),
          _ComponentCard(
            name: 'Progress',
            description: 'Visual progress indicators',
            path: '/components/progress',
          ),
        ]),

        // Feedback
        h2(id: 'feedback', [text('Feedback')]),
        p([text('Communicate status and actions to users:')]),
        _buildComponentGrid([
          _ComponentCard(
            name: 'Alert',
            description: 'Contextual feedback messages',
            path: '/components/alert',
          ),
          _ComponentCard(
            name: 'Toast',
            description: 'Brief notification messages',
            path: '/components/toast',
          ),
          _ComponentCard(
            name: 'Tooltip',
            description: 'Contextual information on hover',
            path: '/components/tooltip',
          ),
          _ComponentCard(
            name: 'Skeleton',
            description: 'Loading placeholders',
            path: '/components/skeleton',
          ),
        ]),
      ],
    );
  }

  Component _buildComponentGrid(List<_ComponentCard> components) {
    return div(classes: 'grid grid-cols-1 md:grid-cols-2 gap-4 my-6 not-prose', [
      for (final component in components)
        a(
          href: component.path,
          classes: 'block p-4 bg-gray-900 border border-gray-800 rounded-lg hover:border-gray-700 transition-colors group',
          [
            h3(classes: 'text-white font-medium mb-1 group-hover:text-indigo-400 transition-colors', [
              text(component.name),
            ]),
            p(classes: 'text-sm text-gray-400', [
              text(component.description),
            ]),
          ],
        ),
    ]);
  }
}

class _ComponentCard {
  final String name;
  final String description;
  final String path;

  const _ComponentCard({
    required this.name,
    required this.description,
    required this.path,
  });
}
