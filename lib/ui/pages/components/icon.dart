import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Icon component documentation page
class IconPage extends StatelessComponent {
  const IconPage({super.key});

  @override
  Component build(BuildContext context) {
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
            h1([text('Icon')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('An icon component powered by Iconify, supporting thousands of icons from popular icon sets.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                div(classes: 'flex items-center gap-4', [
                  DIcon(name: 'lucide:home'),
                  DIcon(name: 'lucide:user'),
                  DIcon(name: 'lucide:settings'),
                  DIcon(name: 'lucide:mail'),
                  DIcon(name: 'lucide:heart'),
                ]),
              ], '''DIcon(name: 'lucide:home')
DIcon(name: 'lucide:user')
DIcon(name: 'lucide:settings')
DIcon(name: 'lucide:mail')
DIcon(name: 'lucide:heart')'''),
            ]),

            // Using DIconNames
            _section('Using DIconNames', [
              p(classes: 'text-zinc-400 mb-4 text-sm', [
                text('Duxt UI provides DIconNames class with commonly used icon names for convenience.'),
              ]),
              _preview([
                div(classes: 'flex items-center gap-4', [
                  DIcon(name: DIconNames.home),
                  DIcon(name: DIconNames.user),
                  DIcon(name: DIconNames.settings),
                  DIcon(name: DIconNames.mail),
                  DIcon(name: DIconNames.heart),
                ]),
              ], '''DIcon(name: DIconNames.home)
DIcon(name: DIconNames.user)
DIcon(name: DIconNames.settings)
DIcon(name: DIconNames.mail)
DIcon(name: DIconNames.heart)'''),
            ]),

            // Sizes
            _section('Sizes', [
              _preview([
                div(classes: 'flex items-end gap-4', [
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: DIconNames.star, size: DIconSize.xs),
                    span(classes: 'text-xs text-zinc-500', [text('xs')]),
                  ]),
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: DIconNames.star, size: DIconSize.sm),
                    span(classes: 'text-xs text-zinc-500', [text('sm')]),
                  ]),
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: DIconNames.star, size: DIconSize.md),
                    span(classes: 'text-xs text-zinc-500', [text('md')]),
                  ]),
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: DIconNames.star, size: DIconSize.lg),
                    span(classes: 'text-xs text-zinc-500', [text('lg')]),
                  ]),
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: DIconNames.star, size: DIconSize.xl),
                    span(classes: 'text-xs text-zinc-500', [text('xl')]),
                  ]),
                ]),
              ], '''DIcon(name: DIconNames.star, size: DIconSize.xs)  // 16px
DIcon(name: DIconNames.star, size: DIconSize.sm)  // 20px
DIcon(name: DIconNames.star, size: DIconSize.md)  // 24px (default)
DIcon(name: DIconNames.star, size: DIconSize.lg)  // 32px
DIcon(name: DIconNames.star, size: DIconSize.xl)  // 40px'''),
            ]),

            // Colors
            _section('Colors', [
              _preview([
                div(classes: 'flex items-center gap-4', [
                  DIcon(name: DIconNames.heart, color: 'text-red-500'),
                  DIcon(name: DIconNames.check, color: 'text-green-500'),
                  DIcon(name: DIconNames.warning, color: 'text-yellow-500'),
                  DIcon(name: DIconNames.info, color: 'text-blue-500'),
                  DIcon(name: DIconNames.star, color: 'text-purple-500'),
                ]),
              ], '''DIcon(name: DIconNames.heart, color: 'text-red-500')
DIcon(name: DIconNames.check, color: 'text-green-500')
DIcon(name: DIconNames.warning, color: 'text-yellow-500')
DIcon(name: DIconNames.info, color: 'text-blue-500')
DIcon(name: DIconNames.star, color: 'text-purple-500')'''),
            ]),

            // Icon Sets
            _section('Icon Sets', [
              p(classes: 'text-zinc-400 mb-4 text-sm', [
                text('DIcon supports all Iconify icon sets. Use the format "set:icon-name".'),
              ]),
              _preview([
                div(classes: 'flex items-center gap-4', [
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: 'lucide:rocket', size: DIconSize.lg),
                    span(classes: 'text-xs text-zinc-500', [text('lucide')]),
                  ]),
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: 'heroicons:rocket-launch', size: DIconSize.lg),
                    span(classes: 'text-xs text-zinc-500', [text('heroicons')]),
                  ]),
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: 'mdi:rocket', size: DIconSize.lg),
                    span(classes: 'text-xs text-zinc-500', [text('mdi')]),
                  ]),
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: 'tabler:rocket', size: DIconSize.lg),
                    span(classes: 'text-xs text-zinc-500', [text('tabler')]),
                  ]),
                  div(classes: 'flex flex-col items-center gap-2', [
                    DIcon(name: 'ph:rocket', size: DIconSize.lg),
                    span(classes: 'text-xs text-zinc-500', [text('phosphor')]),
                  ]),
                ]),
              ], '''DIcon(name: 'lucide:rocket')
DIcon(name: 'heroicons:rocket-launch')
DIcon(name: 'mdi:rocket')
DIcon(name: 'tabler:rocket')
DIcon(name: 'ph:rocket')'''),
            ]),

            // Navigation Icons
            _section('Navigation Icons', [
              _preview([
                div(classes: 'flex items-center gap-4', [
                  DIcon(name: DIconNames.chevronLeft),
                  DIcon(name: DIconNames.chevronRight),
                  DIcon(name: DIconNames.chevronUp),
                  DIcon(name: DIconNames.chevronDown),
                  DIcon(name: DIconNames.arrowLeft),
                  DIcon(name: DIconNames.arrowRight),
                ]),
              ], '''DIcon(name: DIconNames.chevronLeft)
DIcon(name: DIconNames.chevronRight)
DIcon(name: DIconNames.chevronUp)
DIcon(name: DIconNames.chevronDown)
DIcon(name: DIconNames.arrowLeft)
DIcon(name: DIconNames.arrowRight)'''),
            ]),

            // Action Icons
            _section('Action Icons', [
              _preview([
                div(classes: 'flex items-center gap-4', [
                  DIcon(name: DIconNames.plus),
                  DIcon(name: DIconNames.minus),
                  DIcon(name: DIconNames.close),
                  DIcon(name: DIconNames.check),
                  DIcon(name: DIconNames.edit),
                  DIcon(name: DIconNames.trash),
                  DIcon(name: DIconNames.search),
                  DIcon(name: DIconNames.copy),
                ]),
              ], '''DIcon(name: DIconNames.plus)
DIcon(name: DIconNames.minus)
DIcon(name: DIconNames.close)
DIcon(name: DIconNames.check)
DIcon(name: DIconNames.edit)
DIcon(name: DIconNames.trash)
DIcon(name: DIconNames.search)
DIcon(name: DIconNames.copy)'''),
            ]),

            // Status Icons
            _section('Status Icons', [
              _preview([
                div(classes: 'flex items-center gap-4', [
                  DIcon(name: DIconNames.success, color: 'text-green-500'),
                  DIcon(name: DIconNames.error, color: 'text-red-500'),
                  DIcon(name: DIconNames.warning, color: 'text-yellow-500'),
                  DIcon(name: DIconNames.info, color: 'text-blue-500'),
                ]),
              ], '''DIcon(name: DIconNames.success, color: 'text-green-500')
DIcon(name: DIconNames.error, color: 'text-red-500')
DIcon(name: DIconNames.warning, color: 'text-yellow-500')
DIcon(name: DIconNames.info, color: 'text-blue-500')'''),
            ]),

            // With Buttons
            _section('With Buttons', [
              _preview([
                div(classes: 'flex items-center gap-3', [
                  DButton(label: 'Settings', leadingIcon: DIcon(name: DIconNames.settings, size: DIconSize.sm)),
                  DButton(label: 'Download', trailingIcon: DIcon(name: DIconNames.download, size: DIconSize.sm)),
                  DButton(label: 'Send', leadingIcon: DIcon(name: DIconNames.send, size: DIconSize.sm), color: DButtonColor.success),
                ]),
              ], '''DButton(
  label: 'Settings',
  leadingIcon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
)

DButton(
  label: 'Download',
  trailingIcon: DIcon(name: DIconNames.download, size: DIconSize.sm),
)

DButton(
  label: 'Send',
  leadingIcon: DIcon(name: DIconNames.send, size: DIconSize.sm),
  color: DButtonColor.success,
)'''),
            ]),

            // All Available Icon Names
            _section('Available DIconNames', [
              div(classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden bg-zinc-950 p-6', [
                div(classes: 'grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4', [
                  _iconShowcase('home', DIconNames.home),
                  _iconShowcase('user', DIconNames.user),
                  _iconShowcase('users', DIconNames.users),
                  _iconShowcase('settings', DIconNames.settings),
                  _iconShowcase('search', DIconNames.search),
                  _iconShowcase('mail', DIconNames.mail),
                  _iconShowcase('bell', DIconNames.bell),
                  _iconShowcase('calendar', DIconNames.calendar),
                  _iconShowcase('clock', DIconNames.clock),
                  _iconShowcase('heart', DIconNames.heart),
                  _iconShowcase('star', DIconNames.star),
                  _iconShowcase('bookmark', DIconNames.bookmark),
                  _iconShowcase('file', DIconNames.file),
                  _iconShowcase('folder', DIconNames.folder),
                  _iconShowcase('image', DIconNames.image),
                  _iconShowcase('video', DIconNames.video),
                  _iconShowcase('link', DIconNames.link),
                  _iconShowcase('externalLink', DIconNames.externalLink),
                  _iconShowcase('github', DIconNames.github),
                  _iconShowcase('code', DIconNames.code),
                  _iconShowcase('terminal', DIconNames.terminal),
                  _iconShowcase('database', DIconNames.database),
                  _iconShowcase('server', DIconNames.server),
                  _iconShowcase('globe', DIconNames.globe),
                  _iconShowcase('sun', DIconNames.sun),
                  _iconShowcase('moon', DIconNames.moon),
                  _iconShowcase('loader', DIconNames.loader),
                  _iconShowcase('menu', DIconNames.menu),
                ]),
              ]),
            ]),

            // API Reference
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
                  _apiRow('name', 'String', 'required', 'Iconify icon name (e.g., "lucide:home")'),
                  _apiRow('size', 'DIconSize', 'md', 'Icon size (xs, sm, md, lg, xl)'),
                  _apiRow('color', 'String?', 'null', 'Tailwind color class (e.g., "text-red-500")'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
                ]),
              ]),
            ]),

            // Size Reference
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('Size Reference')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Size')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Value')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [text('Pixels')]),
                  ]),
                ]),
                tbody([
                  _sizeRow('DIconSize.xs', 'size-4', '16px'),
                  _sizeRow('DIconSize.sm', 'size-5', '20px'),
                  _sizeRow('DIconSize.md', 'size-6', '24px'),
                  _sizeRow('DIconSize.lg', 'size-8', '32px'),
                  _sizeRow('DIconSize.xl', 'size-10', '40px'),
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

  Component _iconShowcase(String name, String iconName) {
    return div(classes: 'flex items-center gap-3 p-3 rounded-lg bg-zinc-900/50 hover:bg-zinc-800/50 transition-colors', [
      DIcon(name: iconName, color: 'text-zinc-300'),
      span(classes: 'text-xs text-zinc-500 font-mono', [text(name)]),
    ]);
  }

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
    ]);
  }

  Component _sizeRow(String size, String value, String pixels) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(size)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [text(value)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(pixels)]),
    ]);
  }
}
