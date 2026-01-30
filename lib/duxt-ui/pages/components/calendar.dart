import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Calendar component documentation page
class CalendarPage extends StatelessComponent {
  const CalendarPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Calendar')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('A calendar component for date selection with month and year navigation.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DCalendar(),
              ], code: "DCalendar()"),
            ]),

            // With Selected Date
            _section('With Selected Date', [
              ComponentPreviewCard(preview: [
                DCalendar(
                  selectedDate: DateTime(2025, 1, 15),
                ),
              ], code: '''DCalendar(
  selectedDate: DateTime(2025, 1, 15),
)'''),
            ]),

            // Date Selection Callback
            _section('Date Selection', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('Use the onDateSelect callback to handle date selection.'),
              ]),
              ComponentPreviewCard(preview: [
                DCalendar(
                  selectedDate: DateTime(2025, 1, 20),
                  onDateSelect: (date) {
                    // Handle date selection
                  },
                ),
              ], code: '''DCalendar(
  selectedDate: DateTime(2025, 1, 20),
  onDateSelect: (date) {
    print('Selected: \$date');
  },
)'''),
            ]),

            // With Min/Max Date
            _section('Date Range Constraints', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('Restrict selectable dates with minDate and maxDate.'),
              ]),
              ComponentPreviewCard(preview: [
                DCalendar(
                  minDate: DateTime(2025, 1, 5),
                  maxDate: DateTime(2025, 1, 25),
                ),
              ], code: '''DCalendar(
  minDate: DateTime(2025, 1, 5),
  maxDate: DateTime(2025, 1, 25),
)'''),
            ]),

            // First Day of Week
            _section('First Day of Week', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('Configure whether the week starts on Sunday (0) or Monday (1).'),
              ]),
              ComponentPreviewCard(preview: [
                div(classes: 'flex flex-wrap gap-8', [
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [Component.text('Monday Start (default)')]),
                    DCalendar(firstDayOfWeek: 1),
                  ]),
                  div([
                    p(classes: 'text-sm text-zinc-500 mb-2', [Component.text('Sunday Start')]),
                    DCalendar(firstDayOfWeek: 0),
                  ]),
                ]),
              ], code: '''// Monday as first day (default)
DCalendar(firstDayOfWeek: 1)

// Sunday as first day
DCalendar(firstDayOfWeek: 0)'''),
            ]),

            // With Custom Classes
            _section('Custom Styling', [
              ComponentPreviewCard(preview: [
                DCalendar(
                  classes: 'shadow-lg',
                ),
              ], code: '''DCalendar(
  classes: 'shadow-lg',
)'''),
            ]),

            // Features
            _section('Features', [
              div(classes: 'not-prose', [
                ul(classes: 'space-y-2 text-zinc-300', [
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [Component.text('*')]),
                    Component.text('Month and year navigation with arrow buttons'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [Component.text('*')]),
                    Component.text('Today is highlighted with a distinct style'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [Component.text('*')]),
                    Component.text('Selected date is visually indicated'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [Component.text('*')]),
                    Component.text('Disabled dates are styled appropriately'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [Component.text('*')]),
                    Component.text('Dark mode support'),
                  ]),
                  li(classes: 'flex items-start gap-2', [
                    span(classes: 'text-cyan-400', [Component.text('*')]),
                    Component.text('Configurable first day of week'),
                  ]),
                ]),
              ]),
            ]),

            // API Reference
            h2([Component.text('API Reference')]),
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
