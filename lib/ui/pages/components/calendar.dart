import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Calendar component documentation page
class CalendarPage extends StatelessComponent {
  const CalendarPage({super.key});

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
            h1([text('Calendar')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('A calendar component for date selection with month and year navigation.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                DCalendar(),
              ], "DCalendar()"),
            ]),

            // With Selected Date
            _section('With Selected Date', [
              _preview([
                DCalendar(
                  selectedDate: DateTime(2025, 1, 15),
                ),
              ], '''DCalendar(
  selectedDate: DateTime(2025, 1, 15),
)'''),
            ]),

            // Date Selection Callback
            _section('Date Selection', [
              p(classes: 'text-zinc-400 mb-4', [
                text('Use the onDateSelect callback to handle date selection.'),
              ]),
              _preview([
                DCalendar(
                  selectedDate: DateTime(2025, 1, 20),
                  onDateSelect: (date) {
                    // Handle date selection
                  },
                ),
              ], '''DCalendar(
  selectedDate: DateTime(2025, 1, 20),
  onDateSelect: (date) {
    print('Selected: \$date');
  },
)'''),
            ]),

            // With Min/Max Date
            _section('Date Range Constraints', [
              p(classes: 'text-zinc-400 mb-4', [
                text('Restrict selectable dates with minDate and maxDate.'),
              ]),
              _preview([
                DCalendar(
                  minDate: DateTime(2025, 1, 5),
                  maxDate: DateTime(2025, 1, 25),
                ),
              ], '''DCalendar(
  minDate: DateTime(2025, 1, 5),
  maxDate: DateTime(2025, 1, 25),
)'''),
            ]),

            // First Day of Week
            _section('First Day of Week', [
              p(classes: 'text-zinc-400 mb-4', [
                text('Configure whether the week starts on Sunday (0) or Monday (1).'),
              ]),
              _preview([
                div(classes: 'flex flex-wrap gap-8', [
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [text('Monday Start (default)')]),
                    DCalendar(firstDayOfWeek: 1),
                  ]),
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [text('Sunday Start')]),
                    DCalendar(firstDayOfWeek: 0),
                  ]),
                ]),
              ], '''// Monday as first day (default)
DCalendar(firstDayOfWeek: 1)

// Sunday as first day
DCalendar(firstDayOfWeek: 0)'''),
            ]),

            // With Custom Classes
            _section('Custom Styling', [
              _preview([
                DCalendar(
                  classes: 'shadow-lg',
                ),
              ], '''DCalendar(
  classes: 'shadow-lg',
)'''),
            ]),

            // Features
            _section('Features', [
              div(classes: 'not-prose', [
                ul(classes: 'space-y-2 text-zinc-300', [
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [text('*')]),
                    text('Month and year navigation with arrow buttons'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [text('*')]),
                    text('Today is highlighted with a distinct style'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [text('*')]),
                    text('Selected date is visually indicated'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [text('*')]),
                    text('Disabled dates are styled appropriately'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [text('*')]),
                    text('Dark mode support'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [text('*')]),
                    text('Configurable first day of week'),
                  ]),
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
                  _apiRow('selectedDate', 'DateTime?', 'null', 'Currently selected date'),
                  _apiRow('onDateSelect', 'ValueChanged<DateTime>?', 'null', 'Callback when date is selected'),
                  _apiRow('minDate', 'DateTime?', 'null', 'Minimum selectable date'),
                  _apiRow('maxDate', 'DateTime?', 'null', 'Maximum selectable date'),
                  _apiRow('firstDayOfWeek', 'int', '1', 'First day of week (0=Sun, 1=Mon)'),
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
