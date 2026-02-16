import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../shared/components/app_scaffold.dart';
import '../../shared/components/sidebar_ui.dart';
import '../../shared/components/code_preview.dart';

/// Customization documentation page
class CustomizationPage extends StatelessComponent {
  const CustomizationPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Customization')]),
        p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
          Component.text('Every Duxt UI component supports className overrides, HTML attributes, and event handlers for full control.'),
        ]),

        // className
        _section('Class Overrides with className', [
          p(classes: 'text-zinc-600 dark:text-zinc-400 mb-4 leading-relaxed', [
            Component.text('All components accept a '),
            code(classes: _codeCls, [Component.text('className')]),
            Component.text(' prop. When you pass Tailwind classes, they intelligently replace conflicting base classes using '),
            code(classes: _codeCls, [Component.text('twMerge')]),
            Component.text('. For example, passing '),
            code(classes: _codeCls, [Component.text("className: 'bg-purple-500'")]),
            Component.text(' to a primary button replaces '),
            code(classes: _codeCls, [Component.text('bg-cyan-500')]),
            Component.text(' instead of appending both.'),
          ]),
          ComponentPreviewCard(preview: [
            div(classes: 'flex flex-wrap gap-3', [
              DButton(label: 'Default', color: DButtonColor.primary),
              DButton(label: 'Purple BG', className: 'bg-purple-500 hover:bg-purple-600'),
              DButton(label: 'Rounded Full', className: 'rounded-full'),
              DButton(label: 'Large Shadow', className: 'shadow-xl'),
            ]),
          ], code: '''// Default button
DButton(label: 'Default', color: DButtonColor.primary)

// Override background color - replaces bg-cyan-500
DButton(label: 'Purple BG', className: 'bg-purple-500 hover:bg-purple-600')

// Override border radius
DButton(label: 'Rounded Full', className: 'rounded-full')

// Add extra classes (non-conflicting classes are appended)
DButton(label: 'Large Shadow', className: 'shadow-xl')'''),
        ]),

        // Supported merge groups
        _section('Smart Class Merging', [
          p(classes: 'text-zinc-600 dark:text-zinc-400 mb-4 leading-relaxed', [
            Component.text('The '),
            code(classes: _codeCls, [Component.text('twMerge')]),
            Component.text(' utility resolves conflicts between these Tailwind utility groups:'),
          ]),
          div(classes: 'not-prose overflow-x-auto mb-6', [
            table(classes: 'w-full text-sm', [
              thead(classes: 'border-b border-zinc-200 dark:border-zinc-800', [
                tr([
                  th(classes: _thCls, [Component.text('Group')]),
                  th(classes: _thCls, [Component.text('Prefix')]),
                  th(classes: _thCls, [Component.text('Example')]),
                ]),
              ]),
              tbody([
                _mergeRow('Background', 'bg-*', 'bg-red-500 replaces bg-cyan-500'),
                _mergeRow('Text Color', 'text-{color}', 'text-white replaces text-gray-700'),
                _mergeRow('Text Size', 'text-{size}', 'text-lg replaces text-sm'),
                _mergeRow('Font Weight', 'font-*', 'font-bold replaces font-medium'),
                _mergeRow('Border Radius', 'rounded*', 'rounded-full replaces rounded-md'),
                _mergeRow('Border Color', 'border-{color}', 'border-red-500 replaces border-gray-300'),
                _mergeRow('Ring', 'ring*', 'ring-2 replaces ring'),
                _mergeRow('Shadow', 'shadow*', 'shadow-xl replaces shadow-md'),
                _mergeRow('Padding', 'p-*, px-*, py-*', 'p-8 replaces p-4'),
                _mergeRow('Margin', 'm-*, mx-*, my-*', 'mt-4 replaces mt-2'),
                _mergeRow('Width/Height', 'w-*, h-*', 'w-full replaces w-auto'),
                _mergeRow('Display', 'flex, block, etc.', 'block replaces inline-flex'),
              ]),
            ]),
          ]),
          p(classes: 'text-zinc-600 dark:text-zinc-400 mb-4 leading-relaxed', [
            Component.text('Classes that do not conflict are always kept. Variant prefixes like '),
            code(classes: _codeCls, [Component.text('dark:')]),
            Component.text(', '),
            code(classes: _codeCls, [Component.text('hover:')]),
            Component.text(', '),
            code(classes: _codeCls, [Component.text('focus:')]),
            Component.text(' are handled correctly and only conflict within the same variant.'),
          ]),
        ]),

        // Works on all components
        _section('Works on All Components', [
          ComponentPreviewCard(preview: [
            div(classes: 'flex flex-wrap gap-3 items-start', [
              DAlert(title: 'Custom', description: 'Red border alert', color: DAlertColor.info, className: 'border-red-500'),
              DBadge(label: 'Custom', className: 'bg-purple-500 text-white'),
              DCard(className: 'max-w-xs border-cyan-500', children: [
                DCardBody(children: [p(classes: 'text-sm text-zinc-600 dark:text-zinc-400', [Component.text('Card with cyan border')])]),
              ]),
            ]),
          ], code: '''// Alert with custom border
DAlert(title: 'Custom', description: 'Red border', className: 'border-red-500')

// Badge with custom colors
DBadge(label: 'Custom', className: 'bg-purple-500 text-white')

// Card with custom border
DCard(className: 'border-cyan-500', children: [...])'''),
        ]),

        // HTML id
        _section('HTML id', [
          p(classes: 'text-zinc-600 dark:text-zinc-400 mb-4 leading-relaxed', [
            Component.text('Pass '),
            code(classes: _codeCls, [Component.text('id')]),
            Component.text(' to set the HTML id attribute on the root element. Useful for anchors, JavaScript integration, and testing.'),
          ]),
          div(classes: 'not-prose my-4', [
            CodePreview(source: '''DButton(label: 'Submit', id: 'submit-btn')
DInput(placeholder: 'Email', id: 'email-input')
DModal(id: 'settings-modal', trigger: DButton(label: 'Settings'), children: [...])''', language: 'dart'),
          ]),
        ]),

        // attributes
        _section('HTML Attributes', [
          p(classes: 'text-zinc-600 dark:text-zinc-400 mb-4 leading-relaxed', [
            Component.text('Pass any HTML attribute via the '),
            code(classes: _codeCls, [Component.text('attributes')]),
            Component.text(' map. These are applied to the root element. Components that have internal attributes (like ARIA labels) merge them so your values take precedence.'),
          ]),
          div(classes: 'not-prose my-4', [
            CodePreview(source: '''// Data attributes for testing
DButton(
  label: 'Delete',
  attributes: {'data-testid': 'delete-btn', 'data-action': 'delete'},
)

// ARIA attributes
DInput(
  placeholder: 'Search...',
  attributes: {'aria-label': 'Search products', 'role': 'searchbox'},
)

// Custom data attributes
DCard(
  attributes: {'data-card-id': '42', 'data-category': 'featured'},
  children: [...],
)''', language: 'dart'),
          ]),
        ]),

        // events
        _section('Event Handlers', [
          p(classes: 'text-zinc-600 dark:text-zinc-400 mb-4 leading-relaxed', [
            Component.text('Add custom event handlers via the '),
            code(classes: _codeCls, [Component.text('events')]),
            Component.text(' map. Any DOM event is supported. These are applied to the root element alongside any built-in handlers.'),
          ]),
          div(classes: 'not-prose my-4', [
            CodePreview(source: '''// Mouse events
DButton(
  label: 'Hover me',
  events: {
    'mouseenter': (e) => showTooltip(),
    'mouseleave': (e) => hideTooltip(),
  },
)

// Keyboard events
DInput(
  placeholder: 'Press Enter...',
  events: {
    'keydown': (e) => handleKeydown(e),
  },
)

// Focus events
DCard(
  events: {
    'focusin': (e) => highlight(),
    'focusout': (e) => unhighlight(),
  },
  children: [...],
)''', language: 'dart'),
          ]),
        ]),

        // twMerge utility
        _section('Using twMerge Directly', [
          p(classes: 'text-zinc-600 dark:text-zinc-400 mb-4 leading-relaxed', [
            Component.text('The '),
            code(classes: _codeCls, [Component.text('twMerge')]),
            Component.text(' and '),
            code(classes: _codeCls, [Component.text('mergeAttributes')]),
            Component.text(' utilities are exported from duxt_ui and can be used in your own components:'),
          ]),
          div(classes: 'not-prose my-4', [
            CodePreview(source: '''import 'package:duxt_ui/duxt_ui.dart';

// Smart class merging - conflicting classes are replaced
twMerge('bg-cyan-500 text-white rounded-md p-4', 'bg-red-500 rounded-full')
// => 'text-white p-4 bg-red-500 rounded-full'

// Non-conflicting classes are appended
twMerge('flex items-center gap-2', 'shadow-lg border')
// => 'flex items-center gap-2 shadow-lg border'

// Merge HTML attribute maps
mergeAttributes({'data-modal': 'true'}, {'data-testid': 'my-modal'})
// => {'data-modal': 'true', 'data-testid': 'my-modal'}''', language: 'dart'),
          ]),
        ]),
      ]),
    );
  }

  static const _codeCls = 'bg-zinc-200 dark:bg-zinc-800 text-cyan-600 dark:text-cyan-400 px-1.5 py-0.5 rounded text-sm font-mono';
  static const _thCls = 'text-left py-3 px-4 text-zinc-500 dark:text-zinc-400';

  Component _section(String title, List<Component> children) {
    return div(classes: 'my-8', [
      h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]),
      ...children,
    ]);
  }

  Component _mergeRow(String group, String prefix, String example) {
    return tr(classes: 'border-b border-zinc-200/50 dark:border-zinc-800/50', [
      td(classes: 'py-2 px-4 font-medium text-zinc-700 dark:text-zinc-300', [Component.text(group)]),
      td(classes: 'py-2 px-4 font-mono text-cyan-600 dark:text-cyan-400 text-sm', [Component.text(prefix)]),
      td(classes: 'py-2 px-4 text-zinc-500 dark:text-zinc-400 text-sm', [Component.text(example)]),
    ]);
  }
}
