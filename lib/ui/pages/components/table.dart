import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

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
            h1([text('Table')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('A flexible table component for displaying structured data with customizable columns and styling options.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
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
              ], '''DTable<Map<String, String>>(
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
              _preview([
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
              ], '''DTable<Map<String, String>>(
  columns: [...],
  data: [...],
  striped: true,
)'''),
            ]),

            // Bordered
            _section('Bordered', [
              _preview([
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
              ], '''DTable<Map<String, String>>(
  columns: [...],
  data: [...],
  bordered: true,
)'''),
            ]),

            // Hoverable
            _section('Hoverable', [
              _preview([
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
              ], '''DTable<Map<String, String>>(
  columns: [...],
  data: [...],
  hoverable: true, // Enabled by default
)'''),
            ]),

            // Custom Cell Rendering
            _section('Custom Cell Rendering', [
              _preview([
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
              ], '''DTable<Map<String, String>>(
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
              _preview([
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
                      p(classes: 'mt-2 text-zinc-500', [text('No data available')]),
                    ]),
                  ),
                ]),
              ], '''DTable<Map<String, String>>(
  columns: [...],
  data: [],
  emptyState: div(classes: 'text-center py-8', [
    DIcon(name: DIconNames.database, size: DIconSize.lg, color: 'text-zinc-500'),
    p(classes: 'mt-2 text-zinc-500', [text('No data available')]),
  ]),
)'''),
            ]),

            // Column Classes
            _section('Column Styling', [
              _preview([
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'id', label: 'ID', classes: 'w-16'),
                      DTableColumn(key: 'name', label: 'Name', classes: 'font-medium'),
                      DTableColumn(key: 'email', label: 'Email'),
                      DTableColumn(key: 'role', label: 'Role', classes: 'text-right'),
                    ],
                    data: sampleData,
                  ),
                ]),
              ], '''DTable<Map<String, String>>(
  columns: [
    DTableColumn(key: 'id', label: 'ID', classes: 'w-16'),
    DTableColumn(key: 'name', label: 'Name', classes: 'font-medium'),
    DTableColumn(key: 'email', label: 'Email'),
    DTableColumn(key: 'role', label: 'Role', classes: 'text-right'),
  ],
  data: [...],
)'''),
            ]),

            // Complete Example
            _section('Complete Example', [
              _preview([
                div(classes: 'w-full', [
                  DTable<Map<String, String>>(
                    columns: [
                      DTableColumn(key: 'id', label: '#', classes: 'w-12'),
                      DTableColumn<Map<String, String>>(
                        key: 'name',
                        label: 'User',
                        render: (item) => div(classes: 'flex items-center gap-3', [
                          DAvatar(src: 'https://i.pravatar.cc/40?u=${item['id']}', size: DAvatarSize.sm),
                          div([
                            p(classes: 'font-medium text-gray-900', [text(item['name'] ?? '')]),
                            p(classes: 'text-sm text-gray-500', [text(item['email'] ?? '')]),
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
                        classes: 'w-24 text-right',
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
              ], '''DTable<Map<String, String>>(
  columns: [
    DTableColumn(key: 'id', label: '#', classes: 'w-12'),
    DTableColumn<Map<String, String>>(
      key: 'name',
      label: 'User',
      render: (item) => div(classes: 'flex items-center gap-3', [
        DAvatar(src: 'https://i.pravatar.cc/40?u=\${item['id']}', size: DAvatarSize.sm),
        div([
          p(classes: 'font-medium', [text(item['name'] ?? '')]),
          p(classes: 'text-sm text-gray-500', [text(item['email'] ?? '')]),
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
            h2([text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('DTable')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
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
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('DTableColumn')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Prop')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Type')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Default')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Description')]),
                  ]),
                ]),
                tbody([
                  _apiRow('key', 'String', 'required', 'Data property key'),
                  _apiRow('label', 'String', 'required', 'Column header text'),
                  _apiRow('render', 'Component Function(T)?', 'null', 'Custom cell renderer'),
                  _apiRow('classes', 'String?', 'null', 'CSS classes for column cells'),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) {
    return div(classes: 'my-8', [
      h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]),
      ...children,
    ]);
  }

  Component _preview(List<Component> components, String codeExample) {
    return div(
      classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden',
      [
        // Live preview
        div(
          classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]',
          styles: Styles(raw: {
            'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)',
            'background-size': '24px 24px',
          }),
          components,
        ),
        // Code
        div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [
          div(classes: 'flex items-center justify-between px-4 py-2 border-b border-zinc-800', [
            span(classes: 'text-xs text-zinc-500', [text('dart')]),
          ]),
          div(classes: 'p-4 overflow-x-auto', [
            pre(classes: 'text-sm', [
              code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)]),
            ]),
          ]),
        ]),
      ],
    );
  }

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
    ]);
  }
}
