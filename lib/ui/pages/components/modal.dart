import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class ModalPage extends StatelessComponent {
  const ModalPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Modal')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A dialog overlay for focused user interactions.')]),

            _section('Basic Usage', [
              _preview([
                DButton(label: 'Open Modal'),
              ], '''DModal(
  open: isOpen,
  title: 'Confirm Action',
  children: [
    p([text('Are you sure you want to proceed?')]),
  ],
  footer: [
    DButton(
      label: 'Cancel',
      variant: DButtonVariant.ghost,
      onClick: () => setState(() => isOpen = false),
    ),
    DButton(
      label: 'Confirm',
      onClick: () => handleConfirm(),
    ),
  ],
)'''),
            ]),

            _section('Sizes', [
              _preview([
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'XS', size: DButtonSize.sm),
                  DButton(label: 'SM', size: DButtonSize.sm),
                  DButton(label: 'MD', size: DButtonSize.sm),
                  DButton(label: 'LG', size: DButtonSize.sm),
                  DButton(label: 'XL', size: DButtonSize.sm),
                  DButton(label: 'Full', size: DButtonSize.sm),
                ]),
              ], '''DModal(open: true, title: 'XS Modal', size: DModalSize.xs, ...)
DModal(open: true, title: 'SM Modal', size: DModalSize.sm, ...)
DModal(open: true, title: 'MD Modal', size: DModalSize.md, ...)  // Default
DModal(open: true, title: 'LG Modal', size: DModalSize.lg, ...)
DModal(open: true, title: 'XL Modal', size: DModalSize.xl, ...)
DModal(open: true, title: 'Full Modal', size: DModalSize.full, ...)'''),
            ]),

            _section('With Description', [
              _preview([
                DButton(label: 'Delete Item', color: DButtonColor.error),
              ], '''DModal(
  open: isOpen,
  title: 'Delete Item',
  description: 'This action cannot be undone.',
  children: [
    p([text('Are you sure you want to delete this item?')]),
  ],
)'''),
            ]),

            _section('Close Behavior', [
              _preview([
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Close on Overlay', variant: DButtonVariant.outline),
                  DButton(label: 'Close on Escape', variant: DButtonVariant.outline),
                  DButton(label: 'Prevent Close', variant: DButtonVariant.outline),
                ]),
              ], '''// Close on overlay click (default: true)
DModal(
  open: isOpen,
  closeOnOverlay: true,
  onClose: () => setState(() => isOpen = false),
  children: [...],
)

// Close on escape key (default: true)
DModal(
  open: isOpen,
  closeOnEscape: true,
  onClose: () => setState(() => isOpen = false),
  children: [...],
)

// Prevent close - requires explicit action
DModal(
  open: isOpen,
  preventClose: true,
  title: 'Required Action',
  children: [...],
)'''),
            ]),

            h2([text('API Reference')]),
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
                  _apiRow('open', 'bool', 'required', 'Whether modal is visible'),
                  _apiRow('title', 'String?', 'null', 'Modal title'),
                  _apiRow('description', 'String?', 'null', 'Subtitle below title'),
                  _apiRow('header', 'List<Component>?', 'null', 'Custom header content'),
                  _apiRow('children', 'List<Component>', 'required', 'Modal body content'),
                  _apiRow('footer', 'List<Component>?', 'null', 'Footer content'),
                  _apiRow('size', 'DModalSize', 'md', 'Modal width'),
                  _apiRow('closeOnOverlay', 'bool', 'true', 'Close when clicking backdrop'),
                  _apiRow('closeOnEscape', 'bool', 'true', 'Close on Escape key'),
                  _apiRow('preventClose', 'bool', 'false', 'Disable all close methods'),
                  _apiRow('onClose', 'VoidCallback?', 'null', 'Close callback'),
                ]),
              ]),
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

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
    ]);
  }
}
