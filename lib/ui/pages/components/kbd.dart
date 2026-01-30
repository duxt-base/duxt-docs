import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Kbd component documentation page
class KbdPage extends StatelessComponent {
  const KbdPage({super.key});

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
            h1([text('Kbd')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('Display keyboard keys and shortcuts with proper styling.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                DKbd(value: 'K'),
              ], "DKbd(value: 'K')"),
            ]),

            // Multiple Keys (Shortcuts)
            _section('Keyboard Shortcuts', [
              _preview([
                div(classes: 'flex flex-wrap items-center gap-4', [
                  DKbd(keys: ['cmd', 'K']),
                  DKbd(keys: ['ctrl', 'shift', 'P']),
                  DKbd(keys: ['alt', 'tab']),
                ]),
              ], '''DKbd(keys: ['cmd', 'K'])
DKbd(keys: ['ctrl', 'shift', 'P'])
DKbd(keys: ['alt', 'tab'])'''),
            ]),

            // Sizes
            _section('Sizes', [
              _preview([
                div(classes: 'flex flex-wrap items-center gap-4', [
                  DKbd(value: 'XS', size: DKbdSize.xs),
                  DKbd(value: 'SM', size: DKbdSize.sm),
                  DKbd(value: 'MD', size: DKbdSize.md),
                ]),
              ], '''DKbd(value: 'XS', size: DKbdSize.xs)
DKbd(value: 'SM', size: DKbdSize.sm)
DKbd(value: 'MD', size: DKbdSize.md)'''),
            ]),

            // Special Keys
            _section('Special Keys', [
              p(classes: 'text-zinc-400 mb-4', [
                text('Special key names are automatically converted to their symbols.'),
              ]),
              _preview([
                div(classes: 'flex flex-wrap items-center gap-3', [
                  DKbd(value: 'cmd'),
                  DKbd(value: 'ctrl'),
                  DKbd(value: 'alt'),
                  DKbd(value: 'shift'),
                  DKbd(value: 'enter'),
                  DKbd(value: 'tab'),
                  DKbd(value: 'esc'),
                  DKbd(value: 'backspace'),
                ]),
              ], '''DKbd(value: 'cmd')      // ⌘
DKbd(value: 'ctrl')     // ⌃
DKbd(value: 'alt')      // ⌥
DKbd(value: 'shift')    // ⇧
DKbd(value: 'enter')    // ⏎
DKbd(value: 'tab')      // ⇥
DKbd(value: 'esc')      // ⎋
DKbd(value: 'backspace') // ⌫'''),
            ]),

            // Arrow Keys
            _section('Arrow Keys', [
              _preview([
                div(classes: 'flex flex-wrap items-center gap-3', [
                  DKbd(value: 'up'),
                  DKbd(value: 'down'),
                  DKbd(value: 'left'),
                  DKbd(value: 'right'),
                ]),
              ], '''DKbd(value: 'up')    // ↑
DKbd(value: 'down')  // ↓
DKbd(value: 'left')  // ←
DKbd(value: 'right') // →'''),
            ]),

            // DShortcut Component
            _section('DShortcut', [
              p(classes: 'text-zinc-400 mb-4', [
                text('A convenience wrapper for creating keyboard shortcuts.'),
              ]),
              _preview([
                div(classes: 'flex flex-wrap items-center gap-4', [
                  DShortcut(keys: ['cmd', 'S']),
                  DShortcut(keys: ['cmd', 'shift', 'Z']),
                ]),
              ], '''DShortcut(keys: ['cmd', 'S'])
DShortcut(keys: ['cmd', 'shift', 'Z'])'''),
            ]),

            // Platform-aware Shortcut
            _section('Platform-aware Shortcuts', [
              p(classes: 'text-zinc-400 mb-4', [
                text('DPlatformShortcut shows Cmd on Mac and Ctrl on other platforms.'),
              ]),
              _preview([
                div(classes: 'flex flex-wrap items-center gap-4', [
                  DPlatformShortcut(keyName: 'C'),
                  DPlatformShortcut(keyName: 'V', withShift: true),
                  DPlatformShortcut(keyName: 'Z', withAlt: true),
                ]),
              ], '''DPlatformShortcut(keyName: 'C')
DPlatformShortcut(keyName: 'V', withShift: true)
DPlatformShortcut(keyName: 'Z', withAlt: true)'''),
            ]),

            // API Reference
            h2([text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6', [text('DKbd')]),
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
                  _apiRow('value', 'String?', 'null', 'Single key to display'),
                  _apiRow('keys', 'List<String>?', 'null', 'Multiple keys for shortcuts'),
                  _apiRow('size', 'DKbdSize', 'sm', 'Key size (xs, sm, md)'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6', [text('DPlatformShortcut')]),
            div(classes: 'not-prose overflow-x-auto mt-4', [
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
                  _apiRow('keyName', 'String', 'required', 'The main key to display'),
                  _apiRow('withShift', 'bool', 'false', 'Include Shift modifier'),
                  _apiRow('withAlt', 'bool', 'false', 'Include Alt modifier'),
                  _apiRow('size', 'DKbdSize', 'sm', 'Key size'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
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
