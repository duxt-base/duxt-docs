import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Kbd component documentation page
class KbdPage extends StatelessComponent {
  const KbdPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Kbd')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('Display keyboard keys and shortcuts with proper styling.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DKbd(value: 'K'),
              ], code: "DKbd(value: 'K')"),
            ]),

            // Multiple Keys (Shortcuts)
            _section('Keyboard Shortcuts', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap items-center gap-4', [
                  DKbd(keys: ['cmd', 'K']),
                  DKbd(keys: ['ctrl', 'shift', 'P']),
                  DKbd(keys: ['alt', 'tab']),
                ]),
              ], code: '''DKbd(keys: ['cmd', 'K'])
DKbd(keys: ['ctrl', 'shift', 'P'])
DKbd(keys: ['alt', 'tab'])'''),
            ]),

            // Sizes
            _section('Sizes', [
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap items-center gap-4', [
                  DKbd(value: 'XS', size: DKbdSize.xs),
                  DKbd(value: 'SM', size: DKbdSize.sm),
                  DKbd(value: 'MD', size: DKbdSize.md),
                ]),
              ], code: '''DKbd(value: 'XS', size: DKbdSize.xs)
DKbd(value: 'SM', size: DKbdSize.sm)
DKbd(value: 'MD', size: DKbdSize.md)'''),
            ]),

            // Special Keys
            _section('Special Keys', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('Special key names are automatically converted to their symbols.'),
              ]),
              ComponentPreviewCard(preview: [
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
              ], code: '''DKbd(value: 'cmd')      // ⌘
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
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap items-center gap-3', [
                  DKbd(value: 'up'),
                  DKbd(value: 'down'),
                  DKbd(value: 'left'),
                  DKbd(value: 'right'),
                ]),
              ], code: '''DKbd(value: 'up')    // ↑
DKbd(value: 'down')  // ↓
DKbd(value: 'left')  // ←
DKbd(value: 'right') // →'''),
            ]),

            // DShortcut Component
            _section('DShortcut', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('A convenience wrapper for creating keyboard shortcuts.'),
              ]),
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap items-center gap-4', [
                  DShortcut(keys: ['cmd', 'S']),
                  DShortcut(keys: ['cmd', 'shift', 'Z']),
                ]),
              ], code: '''DShortcut(keys: ['cmd', 'S'])
DShortcut(keys: ['cmd', 'shift', 'Z'])'''),
            ]),

            // Platform-aware Shortcut
            _section('Platform-aware Shortcuts', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('DPlatformShortcut shows Cmd on Mac and Ctrl on other platforms.'),
              ]),
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap items-center gap-4', [
                  DPlatformShortcut(keyName: 'C'),
                  DPlatformShortcut(keyName: 'V', withShift: true),
                  DPlatformShortcut(keyName: 'Z', withAlt: true),
                ]),
              ], code: '''DPlatformShortcut(keyName: 'C')
DPlatformShortcut(keyName: 'V', withShift: true)
DPlatformShortcut(keyName: 'Z', withAlt: true)'''),
            ]),

            // API Reference
            h2([Component.text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6', [Component.text('DKbd')]),
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
                  _apiRow('value', 'String?', 'null', 'Single key to display'),
                  _apiRow('keys', 'List<String>?', 'null', 'Multiple keys for shortcuts'),
                  _apiRow('size', 'DKbdSize', 'sm', 'Key size (xs, sm, md)'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
                ]),
              ]),
            ]),

            h3(classes: 'text-lg font-semibold text-white mt-6', [Component.text('DPlatformShortcut')]),
            div(classes: 'not-prose overflow-x-auto mt-4', [
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
                  _apiRow('keyName', 'String', 'required', 'The main key to display'),
                  _apiRow('withShift', 'bool', 'false', 'Include Shift modifier'),
                  _apiRow('withAlt', 'bool', 'false', 'Include Alt modifier'),
                  _apiRow('size', 'DKbdSize', 'sm', 'Key size'),
                  _apiRow('classes', 'String?', 'null', 'Additional CSS classes'),
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
