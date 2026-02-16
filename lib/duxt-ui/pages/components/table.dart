import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Table component documentation page
class TablePage extends StatelessComponent {
  const TablePage({super.key});

  @override
  Component build(BuildContext context) {
    // Sample data for table examples
    final sampleData = [
      {'id': '1', 'name': 'John Doe', 'email': 'john@example.com', 'role': 'Admin'},
      {'id': '2', 'name': 'Jane Smith', 'email': 'jane@example.com', 'role': 'User'},
      {'id': '3', 'name': 'Bob Johnson', 'email': 'bob@example.com', 'role': 'Editor'},
    ];

    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Table')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('A flexible table component for displaying structured data with customizable columns and styling options.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'name', label: 'Name'),
                      DTableColumn(key: 'email', label: 'Email'),
                      DTableColumn(key: 'role', label: 'Role'),
                    ],
                    data: sampleData,
                  ),
                ]),
              ], code: '''DTable<Map<String, String>>(
  columns: [
    DTableColumn(key: 'name', label: 'Name'),
    DTableColumn(key: 'email', label: 'Email'),
    DTableColumn(key: 'role', label: 'Role'),
  ],
  data: [
    {'name': 'John Doe', 'email': 'john@example.com', 'role': 'Admin'},
    {'name': 'Jane Smith', 'email': 'jane@example.com', 'role': 'User'},
    {'name': 'Bob Johnson', 'email': 'bob@example.com', 'role': 'Editor'},
  ],
)'''),
            ]),

            // Striped Rows
            _section('Striped', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'name', label: 'Name'),
                      DTableColumn(key: 'email', label: 'Email'),
                      DTableColumn(key: 'role', label: 'Role'),
                    ],
                    data: sampleData,
                    striped: true,
                  ),
                ]),
              ], code: '''DTable<Map<String, String>>(
  columns: [...],
  data: [...],
  striped: true,
)'''),
            ]),

            // Bordered
            _section('Bordered', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'name', label: 'Name'),
                      DTableColumn(key: 'email', label: 'Email'),
                      DTableColumn(key: 'role', label: 'Role'),
                    ],
                    data: sampleData,
                    bordered: true,
                  ),
                ]),
              ], code: '''DTable<Map<String, String>>(
  columns: [...],
  data: [...],
  bordered: true,
)'''),
            ]),

            // Hoverable
            _section('Hoverable', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'name', label: 'Name'),
                      DTableColumn(key: 'email', label: 'Email'),
                      DTableColumn(key: 'role', label: 'Role'),
                    ],
                    data: sampleData,
                    hoverable: true,
                  ),
                ]),
              ], code: '''DTable<Map<String, String>>(
  columns: [...],
  data: [...],
  hoverable: true, // Enabled by default
)'''),
            ]),

            // Custom Cell Rendering
            _section('Custom Cell Rendering', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'name', label: 'Name'),
                      DTableColumn(key: 'email', label: 'Email'),
                      DTableColumn<Map<String, String>>(
                        key: 'role',
                        label: 'Role',
                        render: (item) => DBadge(
                          label: item['role'] ?? '',
                          color: item['role'] == 'Admin' ? DBadgeColor.primary : DBadgeColor.secondary,
                        ),
                      ),
                      DTableColumn<Map<String, String>>(
                        key: 'actions',
                        label: 'Actions',
                        render: (item) => div(classes: 'flex gap-2', [
                          DButton(label: 'Edit', size: DButtonSize.xs, variant: DButtonVariant.ghost),
                          DButton(label: 'Delete', size: DButtonSize.xs, variant: DButtonVariant.ghost, color: DButtonColor.error),
                        ]),
                      ),
                    ],
                    data: sampleData,
                  ),
                ]),
              ], code: '''DTable<Map<String, String>>(
  columns: [
    DTableColumn(key: 'name', label: 'Name'),
    DTableColumn(key: 'email', label: 'Email'),
    DTableColumn<Map<String, String>>(
      key: 'role',
      label: 'Role',
      render: (item) => DBadge(
        label: item['role'] ?? '',
        color: item['role'] == 'Admin'
          ? DBadgeColor.primary
          : DBadgeColor.secondary,
      ),
    ),
    DTableColumn<Map<String, String>>(
      key: 'actions',
      label: 'Actions',
      render: (item) => div(classes: 'flex gap-2', [
        DButton(label: 'Edit', size: DButtonSize.xs, variant: DButtonVariant.ghost),
        DButton(label: 'Delete', size: DButtonSize.xs, variant: DButtonVariant.ghost, color: DButtonColor.error),
      ]),
    ),
  ],
  data: [...],
)'''),
            ]),

            // Empty State
            _section('Empty State', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'name', label: 'Name'),
                      DTableColumn(key: 'email', label: 'Email'),
                      DTableColumn(key: 'role', label: 'Role'),
                    ],
                    data: [],
                    emptyState: div(classes: 'text-center py-8', [
                      DIcon(name: DIconNames.database, size: DIconSize.lg, color: 'text-zinc-500'),
                      p(classes: 'mt-2 text-zinc-500', [Component.text('No data available')]),
                    ]),
                  ),
                ]),
              ], code: '''DTable<Map<String, String>>(
  columns: [...],
  data: [],
  emptyState: div(classes: 'text-center py-8', [
    DIcon(name: DIconNames.database, size: DIconSize.lg, color: 'text-zinc-500'),
    p(classes: 'mt-2 text-zinc-500', [Component.text('No data available')]),
  ]),
)'''),
            ]),

            // Column Classes
            _section('Column Styling', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'id', label: 'ID', className: 'w-16'),
                      DTableColumn(key: 'name', label: 'Name', className: 'font-medium'),
                      DTableColumn(key: 'email', label: 'Email'),
                      DTableColumn(key: 'role', label: 'Role', className: 'text-right'),
                    ],
                    data: sampleData,
                  ),
                ]),
              ], code: '''DTable<Map<String, String>>(
  columns: [
    DTableColumn(key: 'id', label: 'ID', className: 'w-16'),
    DTableColumn(key: 'name', label: 'Name', className: 'font-medium'),
    DTableColumn(key: 'email', label: 'Email'),
    DTableColumn(key: 'role', label: 'Role', className: 'text-right'),
  ],
  data: [...],
)'''),
            ]),

            // Complete Example
            _section('Complete Example', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'id', label: '#', className: 'w-12'),
                      DTableColumn<Map<String, String>>(
                        key: 'name',
                        label: 'User',
                        render: (item) => div(classes: 'flex items-center gap-3', [
                          DAvatar(src: 'https://i.pravatar.cc/40?u=${item['id']}', size: DAvatarSize.sm),
                          div([
                            p(classes: 'font-medium text-gray-900', [Component.text(item['name'] ?? '')]),
                            p(classes: 'text-sm text-gray-500', [Component.text(item['email'] ?? '')]),
                          ]),
                        ]),
                      ),
                      DTableColumn<Map<String, String>>(
                        key: 'role',
                        label: 'Role',
                        render: (item) => DBadge(
                          label: item['role'] ?? '',
                          color: item['role'] == 'Admin' ? DBadgeColor.primary : DBadgeColor.secondary,
                        ),
                      ),
                      DTableColumn<Map<String, String>>(
                        key: 'actions',
                        label: '',
                        className: 'w-24 text-right',
                        render: (item) => DButton(
                          label: 'View',
                          size: DButtonSize.xs,
                          variant: DButtonVariant.outline,
                        ),
                      ),
                    ],
                    data: sampleData,
                    striped: true,
                    hoverable: true,
                  ),
                ]),
              ], code: '''DTable<Map<String, String>>(
  columns: [
    DTableColumn(key: 'id', label: '#', className: 'w-12'),
    DTableColumn<Map<String, String>>(
      key: 'name',
      label: 'User',
      render: (item) => div(classes: 'flex items-center gap-3', [
        DAvatar(src: 'https://i.pravatar.cc/40?u=\${item['id']}', size: DAvatarSize.sm),
        div([
          p(className: 'font-medium', [Component.text(item['name'] ?? '')]),
          p(classes: 'text-sm text-gray-500', [Component.text(item['email'] ?? '')]),
        ]),
      ]),
    ),
    DTableColumn<Map<String, String>>(
      key: 'role',
      label: 'Role',
      render: (item) => DBadge(
        label: item['role'] ?? '',
        variant: DBadgeVariant.soft,
      ),
    ),
    DTableColumn<Map<String, String>>(
      key: 'actions',
      label: '',
      render: (item) => DButton(label: 'View', size: DButtonSize.xs),
    ),
  ],
  data: [...],
  striped: true,
  hoverable: true,
)'''),
            ]),

            // API Reference - DTable
            h2([Component.text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [Component.text('DTable')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('columns', 'List<DTableColumn<T>>', 'required', 'Column definitions'),
                  _apiRow('data', 'List<T>', 'required', 'Data rows to display'),
                  _apiRow('rowKey', 'String Function(T)?', 'null', 'Function to get unique row key'),
                  _apiRow('striped', 'bool', 'false', 'Alternate row background colors'),
                  _apiRow('hoverable', 'bool', 'true', 'Highlight row on hover'),
                  _apiRow('bordered', 'bool', 'false', 'Add border around table'),
                  _apiRow('emptyState', 'Component?', 'null', 'Content shown when data is empty'),
                ]),
              ]),
            ]),

            // API Reference - DTableColumn
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [Component.text('DTableColumn')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('key', 'String', 'required', 'Data property key'),
                  _apiRow('label', 'String', 'required', 'Column header text'),
                  _apiRow('render', 'Component Function(T)?', 'null', 'Custom cell renderer'),
                  _apiRow('className', 'String?', 'null', 'CSS classes for column cells'),
                ]),
              ]),
            ]),
      ]),
    );
  }

  Component _section(String title, List<Component> children) {
    return div(classes: 'my-8', [
      h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]),
      ...children,
    ]);
  }

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [Component.text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [Component.text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text(desc)]),
    ]);
  }
}
