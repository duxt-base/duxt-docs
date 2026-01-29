import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';

/// All components list page
class AllComponentsPage extends StatelessComponent {
  const AllComponentsPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'All Components',
      description: 'Complete list of all Duxt UI components.',
      currentPath: '/duxt-ui/components',
      tocItems: const [
        TocItem(label: 'Form', anchor: 'form'),
        TocItem(label: 'Layout', anchor: 'layout'),
        TocItem(label: 'Data Display', anchor: 'data-display'),
        TocItem(label: 'Feedback', anchor: 'feedback'),
        TocItem(label: 'Navigation', anchor: 'navigation'),
        TocItem(label: 'Overlay', anchor: 'overlay'),
      ],
      children: [
        p([
          text('Duxt UI provides a comprehensive set of components for building modern web applications. '),
          text('Click on any component to view its documentation.'),
        ]),

        // Form Components
        h2(id: 'form', [text('Form')]),
        p([text('Input and form control components.')]),
        _buildComponentList([
          _Component('UButton', 'Trigger actions with customizable buttons', '/components/button', true),
          _Component('UInput', 'Text input fields with validation', '/components/input', true),
          _Component('UTextarea', 'Multi-line text input', '/components/textarea', false),
          _Component('USelect', 'Dropdown selection menus', '/components/select', false),
          _Component('USelectMenu', 'Advanced searchable select', '/components/select-menu', false),
          _Component('UCheckbox', 'Toggle boolean values', '/components/checkbox', false),
          _Component('URadio', 'Select one option from a group', '/components/radio', false),
          _Component('UToggle', 'Switch toggle control', '/components/toggle', false),
          _Component('URange', 'Slider range input', '/components/range', false),
          _Component('UFormGroup', 'Group form controls with label', '/components/form-group', false),
        ]),

        // Layout Components
        h2(id: 'layout', [text('Layout')]),
        p([text('Structure and organize page content.')]),
        _buildComponentList([
          _Component('UCard', 'Container with header, body, footer', '/components/card', true),
          _Component('UContainer', 'Centered page container', '/components/container', false),
          _Component('UDivider', 'Visual separator line', '/components/divider', false),
          _Component('USkeleton', 'Loading placeholders', '/components/skeleton', false),
        ]),

        // Data Display
        h2(id: 'data-display', [text('Data Display')]),
        p([text('Present data in various formats.')]),
        _buildComponentList([
          _Component('UAvatar', 'User profile images', '/components/avatar', false),
          _Component('UBadge', 'Small status indicators', '/components/badge', false),
          _Component('UChip', 'Compact information elements', '/components/chip', false),
          _Component('UIcon', 'SVG icons', '/components/icon', false),
          _Component('UKbd', 'Keyboard key indicators', '/components/kbd', false),
          _Component('UProgress', 'Progress indicators', '/components/progress', false),
          _Component('UMeter', 'Value within a range', '/components/meter', false),
          _Component('UTable', 'Tabular data display', '/components/table', false),
        ]),

        // Feedback
        h2(id: 'feedback', [text('Feedback')]),
        p([text('Communicate status to users.')]),
        _buildComponentList([
          _Component('UAlert', 'Contextual feedback messages', '/components/alert', false),
          _Component('UNotification', 'Toast notifications', '/components/notification', false),
        ]),

        // Navigation
        h2(id: 'navigation', [text('Navigation')]),
        p([text('Navigate through the application.')]),
        _buildComponentList([
          _Component('ULink', 'Navigation links', '/components/link', false),
          _Component('UTabs', 'Tabbed navigation', '/components/tabs', false),
          _Component('UVerticalNavigation', 'Sidebar navigation', '/components/vertical-navigation', false),
          _Component('UHorizontalNavigation', 'Header navigation', '/components/horizontal-navigation', false),
          _Component('UCommandPalette', 'Command menu (Cmd+K)', '/components/command-palette', false),
          _Component('UPagination', 'Page navigation', '/components/pagination', false),
          _Component('UBreadcrumb', 'Hierarchical navigation', '/components/breadcrumb', false),
        ]),

        // Overlay
        h2(id: 'overlay', [text('Overlay')]),
        p([text('Overlay and popup components.')]),
        _buildComponentList([
          _Component('UModal', 'Dialog overlays', '/components/modal', false),
          _Component('USlideover', 'Slide-in panels', '/components/slideover', false),
          _Component('UPopover', 'Floating content', '/components/popover', false),
          _Component('UTooltip', 'Contextual hints', '/components/tooltip', false),
          _Component('UContextMenu', 'Right-click menus', '/components/context-menu', false),
          _Component('UDropdown', 'Dropdown menus', '/components/dropdown', false),
        ]),
      ],
    );
  }

  Component _buildComponentList(List<_Component> components) {
    return div(classes: 'grid grid-cols-1 md:grid-cols-2 gap-3 my-6 not-prose', [
      for (final component in components)
        a(
          href: component.path,
          classes: 'flex items-center justify-between p-3 bg-gray-900 border border-gray-800 rounded-lg hover:border-gray-700 transition-colors group ${!component.available ? 'opacity-50' : ''}',
          [
            div([
              div(classes: 'flex items-center gap-2', [
                span(classes: 'font-medium text-white group-hover:text-indigo-400 transition-colors', [
                  text(component.name),
                ]),
                if (!component.available)
                  span(classes: 'text-xs px-1.5 py-0.5 bg-gray-800 text-gray-500 rounded', [
                    text('Coming Soon'),
                  ]),
              ]),
              p(classes: 'text-sm text-gray-400 mt-0.5', [
                text(component.description),
              ]),
            ]),
            if (component.available)
              span(classes: 'text-gray-600 group-hover:text-gray-400 transition-colors', [
                text('→'),
              ]),
          ],
        ),
    ]);
  }
}

class _Component {
  final String name;
  final String description;
  final String path;
  final bool available;

  const _Component(this.name, this.description, this.path, this.available);
}
