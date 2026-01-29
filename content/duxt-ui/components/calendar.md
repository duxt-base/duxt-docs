---
title: Calendar
description: A date picker calendar component for selecting dates.
layout: ui-layout
order: 51
---

# Calendar

The `DCalendar` component provides a date picker grid with month/year navigation for selecting dates.

## Basic Usage

```dart
DCalendar(
  selectedDate: selectedDate,
  onDateSelect: (date) => setState(() => selectedDate = date),
)
```

## With Initial Date

```dart
DCalendar(
  selectedDate: DateTime(2024, 6, 15),
  onDateSelect: (date) => handleDateSelect(date),
)
```

## Date Range Constraints

### Minimum Date

```dart
DCalendar(
  selectedDate: selectedDate,
  minDate: DateTime.now(),  // Can't select past dates
  onDateSelect: (date) => handleDateSelect(date),
)
```

### Maximum Date

```dart
DCalendar(
  selectedDate: selectedDate,
  maxDate: DateTime.now().add(Duration(days: 30)),  // Only next 30 days
  onDateSelect: (date) => handleDateSelect(date),
)
```

### Date Range

```dart
DCalendar(
  selectedDate: selectedDate,
  minDate: DateTime(2024, 1, 1),
  maxDate: DateTime(2024, 12, 31),
  onDateSelect: (date) => handleDateSelect(date),
)
```

## First Day of Week

### Monday (Default)

```dart
DCalendar(
  firstDayOfWeek: 1,  // Monday
  selectedDate: selectedDate,
  onDateSelect: (date) => handleDateSelect(date),
)
```

### Sunday

```dart
DCalendar(
  firstDayOfWeek: 0,  // Sunday
  selectedDate: selectedDate,
  onDateSelect: (date) => handleDateSelect(date),
)
```

## In a Form

```dart
class DatePickerForm extends StatefulComponent {
  @override
  State createState() => _DatePickerFormState();
}

class _DatePickerFormState extends State<DatePickerForm> {
  DateTime? birthDate;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DForm(
      children: [
        DFormField(
          label: 'Date of Birth',
          children: [
            DCalendar(
              selectedDate: birthDate,
              maxDate: DateTime.now(),  // Can't be in the future
              onDateSelect: (date) => setState(() => birthDate = date),
            ),
          ],
        ),
        DButton(
          label: 'Submit',
          onClick: () => submit(),
        ),
      ],
    );
  }
}
```

## With Popover

```dart
class DatePickerInput extends StatefulComponent {
  @override
  State createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  DateTime? selectedDate;
  bool showCalendar = false;

  String get formattedDate {
    if (selectedDate == null) return '';
    return '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DPopover(
      open: showCalendar,
      onOpenChange: (open) => setState(() => showCalendar = open),
      trigger: DInput(
        placeholder: 'Select date',
        value: formattedDate,
        readOnly: true,
        trailingIcon: DIcon(name: 'calendar', size: 16),
        onFocus: () => setState(() => showCalendar = true),
      ),
      content: DCalendar(
        selectedDate: selectedDate,
        onDateSelect: (date) {
          setState(() {
            selectedDate = date;
            showCalendar = false;
          });
        },
      ),
    );
  }
}
```

## Booking Calendar

```dart
class BookingCalendar extends StatefulComponent {
  @override
  State createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  DateTime? checkIn;
  DateTime? checkOut;
  bool selectingCheckOut = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DCard(
      body: [
        h3(classes: 'font-semibold mb-4', [
          text(selectingCheckOut ? 'Select Check-out Date' : 'Select Check-in Date'),
        ]),
        DCalendar(
          selectedDate: selectingCheckOut ? checkOut : checkIn,
          minDate: selectingCheckOut ? checkIn : DateTime.now(),
          onDateSelect: (date) {
            setState(() {
              if (selectingCheckOut) {
                checkOut = date;
              } else {
                checkIn = date;
                selectingCheckOut = true;
              }
            });
          },
        ),
        if (checkIn != null && checkOut != null)
          div(classes: 'mt-4 p-3 bg-gray-50 dark:bg-gray-800 rounded-lg', [
            p(classes: 'text-sm', [
              text('Check-in: ${formatDate(checkIn!)}'),
            ]),
            p(classes: 'text-sm', [
              text('Check-out: ${formatDate(checkOut!)}'),
            ]),
            p(classes: 'text-sm font-semibold mt-2', [
              text('${checkOut!.difference(checkIn!).inDays} nights'),
            ]),
          ]),
      ],
    );
  }
}
```

## Appointment Scheduler

```dart
DCard(
  body: [
    div(classes: 'grid md:grid-cols-2 gap-6', [
      // Calendar
      div([
        h3(classes: 'font-semibold mb-4', [text('Select Date')]),
        DCalendar(
          selectedDate: selectedDate,
          minDate: DateTime.now(),
          maxDate: DateTime.now().add(Duration(days: 60)),
          onDateSelect: (date) => setState(() => selectedDate = date),
        ),
      ]),

      // Time slots
      div([
        h3(classes: 'font-semibold mb-4', [text('Select Time')]),
        if (selectedDate != null)
          div(classes: 'grid grid-cols-3 gap-2', [
            for (final time in availableSlots)
              DButton(
                label: time,
                variant: selectedTime == time
                    ? DButtonVariant.solid
                    : DButtonVariant.outline,
                size: DSize.sm,
                onClick: () => setState(() => selectedTime = time),
              ),
          ])
        else
          p(classes: 'text-gray-500', [text('Select a date first')]),
      ]),
    ]),
  ],
)
```

## Event Calendar

```dart
class EventCalendar extends StatefulComponent {
  final List<Event> events;

  EventCalendar({required this.events});

  @override
  State createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  DateTime? selectedDate;

  List<Event> get eventsOnSelectedDate {
    if (selectedDate == null) return [];
    return component.events.where((e) =>
      e.date.year == selectedDate!.year &&
      e.date.month == selectedDate!.month &&
      e.date.day == selectedDate!.day
    ).toList();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'grid md:grid-cols-2 gap-6', [
      DCalendar(
        selectedDate: selectedDate,
        onDateSelect: (date) => setState(() => selectedDate = date),
      ),

      div([
        h3(classes: 'font-semibold mb-4', [
          text(selectedDate != null
              ? 'Events on ${formatDate(selectedDate!)}'
              : 'Select a date'),
        ]),
        if (eventsOnSelectedDate.isEmpty)
          DEmpty(
            title: 'No events',
            description: 'No events scheduled for this date.',
          )
        else
          div(classes: 'space-y-2', [
            for (final event in eventsOnSelectedDate)
              DCard(
                body: [
                  h4(classes: 'font-medium', [text(event.title)]),
                  p(classes: 'text-sm text-gray-500', [text(event.time)]),
                ],
              ),
          ]),
      ]),
    ]);
  }
}
```

## Dark Mode Support

`DCalendar` automatically adapts to dark mode with appropriate backgrounds, borders, text colors, and hover states.

## API Reference

### DCalendar

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `selectedDate` | `DateTime?` | `null` | Currently selected date |
| `onDateSelect` | `ValueChanged<DateTime>?` | `null` | Date selection callback |
| `minDate` | `DateTime?` | `null` | Minimum selectable date |
| `maxDate` | `DateTime?` | `null` | Maximum selectable date |
| `firstDayOfWeek` | `int` | `1` | First day of week (0=Sun, 1=Mon) |
| `classes` | `String?` | `null` | Custom CSS classes |

### Date Highlighting

| State | Appearance |
|-------|------------|
| Selected | Indigo background, white text |
| Today | Light indigo background, indigo text |
| Disabled | Gray text, no hover effect |
| Default | White/dark background, hover effect |
