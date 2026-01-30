import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';

class ThemePage extends StatelessComponent {
  const ThemePage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Theme')]),
        p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
          Component.text(
              'Theme provider and color mode toggle for managing dark/light modes.')
        ]),

        _section('Theme Provider', [
          _codeBlock('''DThemeProvider(
  theme: DuxtTheme(),
  mode: DThemeMode.system,  // Follow system preference
  child: [
    // Your app content
  ],
)'''),
        ]),

        _section('Theme Modes', [
          _codeBlock('''// Light mode only
DThemeProvider(
  mode: DThemeMode.light,
  child: [...],
)

// Dark mode only
DThemeProvider(
  mode: DThemeMode.dark,
  child: [...],
)

// Follow system preference (default)
DThemeProvider(
  mode: DThemeMode.system,
  child: [...],
)'''),
        ]),

        _section('Custom Theme', [
          _codeBlock('''final customTheme = DuxtTheme(
  // Primary color (brand color)
  primary: DColorScale(
    light: '#3b82f6',  // Blue for light mode
    dark: '#60a5fa',   // Lighter blue for dark mode
  ),

  // Secondary color
  secondary: DColorScale(
    light: '#8b5cf6',  // Purple
    dark: '#a78bfa',
  ),

  // Semantic colors
  success: DColorScale(light: '#22c55e', dark: '#4ade80'),
  warning: DColorScale(light: '#f59e0b', dark: '#fbbf24'),
  error: DColorScale(light: '#ef4444', dark: '#f87171'),
  info: DColorScale(light: '#06b6d4', dark: '#22d3ee'),

  // Typography
  font: 'Inter, system-ui, sans-serif',
  codeFont: 'JetBrains Mono, monospace',
);

// Use the custom theme
DThemeProvider(
  theme: customTheme,
  child: [...],
)'''),
        ]),

        _section('Color Mode Switch', [
          p(classes: 'text-zinc-400 mb-4', [
            Component.text(
                'The color mode switch allows users to toggle between light and dark modes. Use the ThemeToggle component from jaspr_content for a ready-to-use theme switcher.'),
          ]),
          _codeBlock('''// Use ThemeToggle from jaspr_content

// In your header or navigation
ThemeToggle()'''),
        ]),

        _section('Semantic Colors', [
          div(classes: 'not-prose grid grid-cols-2 md:grid-cols-4 gap-4', [
            _colorCard('Primary', 'bg-primary-500', 'Brand color, links'),
            _colorCard('Secondary', 'bg-secondary-500', 'Accents'),
            _colorCard('Success', 'bg-green-500', 'Positive states'),
            _colorCard('Warning', 'bg-yellow-500', 'Caution'),
            _colorCard('Error', 'bg-red-500', 'Error states'),
            _colorCard('Info', 'bg-cyan-500', 'Informational'),
            _colorCard('Neutral', 'bg-zinc-500', 'Muted elements'),
          ]),
        ]),

        _section('Using Colors in Components', [
          _codeBlock('''// In components
DButton(color: DColor.primary)
DAlert(color: DColor.success)
DBadge(color: DColor.warning)

// Color utility functions
final bgClass = bgColor(DColor.primary);   // 'bg-primary-500'
final textClass = textColor(DColor.error); // 'text-error-500'
final ringClass = ringColor(DColor.info);  // 'ring-info-500'

// Text colors
DTextColors.highlighted  // Primary text color
DTextColors.defaultText  // Default text
DTextColors.muted        // Muted/secondary text
DTextColors.dimmed       // Very subtle text

// Background colors
DBgColors.defaultBg  // Default background
DBgColors.elevated   // Slightly elevated (cards)
DBgColors.muted      // Muted background'''),
        ]),

        _section('CSS Variables', [
          _codeBlock(''':root {
  --color-primary: #22c55e;
  --color-secondary: #3b82f6;
  --color-success: #22c55e;
  --color-warning: #f59e0b;
  --color-error: #ef4444;
  --color-info: #06b6d4;
}

.dark {
  --color-primary: #4ade80;
  --color-secondary: #60a5fa;
  --color-success: #4ade80;
  --color-warning: #fbbf24;
  --color-error: #f87171;
  --color-info: #22d3ee;
}'''),
        ]),

        _section('Dark Mode Styling', [
          _codeBlock('''// Use Tailwind's dark mode classes
div(
  classes: 'bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100',
  [
    Component.text('This adapts to dark mode'),
  ],
)'''),
        ]),

        // API Reference
        h2([Component.text('API Reference')]),
        h3([Component.text('DThemeProvider')]),
        div(classes: 'not-prose overflow-x-auto', [
          table(classes: 'w-full text-sm', [
            thead(classes: 'border-b border-zinc-800', [
              tr([
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Prop')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Type')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Default')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Description')]),
              ]),
            ]),
            tbody([
              _apiRow(
                  'theme', 'DuxtTheme?', 'null', 'Custom theme configuration'),
              _apiRow('mode', 'DThemeMode', 'system', 'Theme mode'),
              _apiRow('child', 'List<Component>', 'required', 'App content'),
            ]),
          ]),
        ]),

        h3([Component.text('DuxtTheme')]),
        div(classes: 'not-prose overflow-x-auto', [
          table(classes: 'w-full text-sm', [
            thead(classes: 'border-b border-zinc-800', [
              tr([
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Prop')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Type')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Default')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Description')]),
              ]),
            ]),
            tbody([
              _apiRow('primary', 'DColorScale', 'Green', 'Primary brand color'),
              _apiRow('secondary', 'DColorScale', 'Blue', 'Secondary color'),
              _apiRow('success', 'DColorScale', 'Green', 'Success color'),
              _apiRow('warning', 'DColorScale', 'Yellow', 'Warning color'),
              _apiRow('error', 'DColorScale', 'Red', 'Error color'),
              _apiRow('info', 'DColorScale', 'Cyan', 'Info color'),
              _apiRow('font', 'String?', 'null', 'Body font family'),
              _apiRow('codeFont', 'String?', 'null', 'Code font family'),
            ]),
          ]),
        ]),

        h3([Component.text('DColorModeSwitch')]),
        div(classes: 'not-prose overflow-x-auto', [
          table(classes: 'w-full text-sm', [
            thead(classes: 'border-b border-zinc-800', [
              tr([
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Prop')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Type')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Default')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Description')]),
              ]),
            ]),
            tbody([
              _apiRow('onModeChange', 'ValueChanged<bool>?', 'null',
                  'Mode change callback'),
            ]),
          ]),
        ]),

        h3([Component.text('DThemeMode')]),
        div(classes: 'not-prose overflow-x-auto', [
          table(classes: 'w-full text-sm', [
            thead(classes: 'border-b border-zinc-800', [
              tr([
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Value')]),
                th(
                    classes: 'text-left py-3 px-4 text-zinc-400',
                    [Component.text('Description')]),
              ]),
            ]),
            tbody([
              tr(classes: 'border-b border-zinc-800/50', [
                td(
                    classes: 'py-3 px-4 font-mono text-cyan-400',
                    [Component.text('light')]),
                td(
                    classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300',
                    [Component.text('Always use light mode')]),
              ]),
              tr(classes: 'border-b border-zinc-800/50', [
                td(
                    classes: 'py-3 px-4 font-mono text-cyan-400',
                    [Component.text('dark')]),
                td(
                    classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300',
                    [Component.text('Always use dark mode')]),
              ]),
              tr(classes: 'border-b border-zinc-800/50', [
                td(
                    classes: 'py-3 px-4 font-mono text-cyan-400',
                    [Component.text('system')]),
                td(
                    classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300',
                    [Component.text('Follow system preference')]),
              ]),
            ]),
          ]),
        ]),
      ]),
    );
  }

  Component _section(String title, List<Component> children) =>
      div(classes: 'my-8', [
        h2(
            classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4',
            [Component.text(title)]),
        ...children
      ]);

  Component _codeBlock(String codeContent) => div(
          classes:
              'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden',
          [
            div(classes: 'bg-zinc-950', [
              div(
                  classes:
                      'flex items-center px-4 py-2 border-b border-zinc-200 dark:border-zinc-800',
                  [
                    span(
                        classes: 'text-xs text-zinc-500',
                        [Component.text('dart')])
                  ]),
              div(classes: 'p-4 overflow-x-auto', [
                pre(classes: 'text-sm', [
                  code(
                      classes: 'text-zinc-700 dark:text-zinc-300',
                      [Component.text(codeContent)])
                ])
              ]),
            ]),
          ]);

  Component _colorCard(String name, String colorClass, String description) =>
      div(
          classes:
              'rounded-lg border border-zinc-200 dark:border-zinc-800 overflow-hidden',
          [
            div(classes: '$colorClass h-16', []),
            div(classes: 'p-3 bg-zinc-900', [
              div(
                  classes: 'text-sm font-medium text-white',
                  [Component.text(name)]),
              div(
                  classes: 'text-xs text-zinc-500',
                  [Component.text(description)]),
            ]),
          ]);

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text(prop)]),
      td(
          classes: 'py-3 px-4 font-mono text-purple-400',
          [Component.text(type)]),
      td(
          classes: 'py-3 px-4 font-mono text-zinc-500',
          [Component.text(defaultVal)]),
      td(
          classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300',
          [Component.text(desc)]),
    ]);
  }
}
