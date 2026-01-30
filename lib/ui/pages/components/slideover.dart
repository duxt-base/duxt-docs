import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class SlideoverPage extends StatelessComponent {
  const SlideoverPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Slideover')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A panel that slides in from the edge of the screen.')]),

            _section('Basic Usage', [
              _preview([
                DButton(label: 'Open Slideover'),
              ], '''DSlideover(
  open: isOpen,
  title: 'Panel Title',
  children: [
    text('Slideover content goes here.'),
  ],
  onClose: () => setState(() => isOpen = false),
)'''),
            ]),

            _section('Sides', [
              _preview([
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Right', variant: DButtonVariant.outline),
                  DButton(label: 'Left', variant: DButtonVariant.outline),
                  DButton(label: 'Top', variant: DButtonVariant.outline),
                  DButton(label: 'Bottom', variant: DButtonVariant.outline),
                ]),
              ], '''// Right (Default)
DSlideover(
  open: isOpen,
  side: DSlideoverSide.right,
  title: 'Right Panel',
  children: [...],
)

// Left
DSlideover(
  open: isOpen,
  side: DSlideoverSide.left,
  title: 'Left Panel',
  children: [...],
)

// Top
DSlideover(
  open: isOpen,
  side: DSlideoverSide.top,
  title: 'Top Panel',
  children: [...],
)

// Bottom
DSlideover(
  open: isOpen,
  side: DSlideoverSide.bottom,
  title: 'Bottom Panel',
  children: [...],
)'''),
            ]),

            _section('With Description', [
              _preview([
                DButton(label: 'Edit Profile'),
              ], '''DSlideover(
  open: isOpen,
  title: 'Edit Profile',
  description: 'Update your personal information.',
  children: [
    div(classes: 'space-y-4', [
      DInput(label: 'Name'),
      DInput(label: 'Email'),
    ]),
  ],
  onClose: () => setState(() => isOpen = false),
)'''),
            ]),

            _section('With Footer', [
              _preview([
                DButton(label: 'Open Form'),
              ], '''DSlideover(
  open: isOpen,
  title: 'Edit Item',
  children: [
    div(classes: 'space-y-4', [
      DInput(label: 'Name', value: item.name),
      DTextarea(label: 'Description', value: item.description),
    ]),
  ],
  footer: [
    div(classes: 'flex gap-2', [
      DButton(
        label: 'Cancel',
        variant: DButtonVariant.ghost,
        onClick: () => setState(() => isOpen = false),
      ),
      DButton(
        label: 'Save',
        onClick: () => saveItem(),
      ),
    ]),
  ],
  onClose: () => setState(() => isOpen = false),
)'''),
            ]),

            _section('Close Behavior', [
              _preview([
                div(classes: 'flex flex-wrap gap-3', [
                  DButton(label: 'Close on Overlay', variant: DButtonVariant.soft),
                  DButton(label: 'Close on Escape', variant: DButtonVariant.soft),
                ]),
              ], '''DSlideover(
  open: isOpen,
  closeOnOverlay: true,   // Close when clicking backdrop
  closeOnEscape: true,    // Close on Escape key
  preventClose: false,    // Allow all close methods
  onClose: () => setState(() => isOpen = false),
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
                  _apiRow('open', 'bool', 'required', 'Whether slideover is visible'),
                  _apiRow('side', 'DSlideoverSide', 'right', 'Edge to slide from'),
                  _apiRow('title', 'String?', 'null', 'Panel title'),
                  _apiRow('description', 'String?', 'null', 'Subtitle below title'),
                  _apiRow('header', 'List<Component>?', 'null', 'Custom header content'),
                  _apiRow('children', 'List<Component>', 'required', 'Panel body content'),
                  _apiRow('footer', 'List<Component>?', 'null', 'Footer content'),
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
