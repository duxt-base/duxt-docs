---
title: Components
description: Complete component reference
layout: html-layout
order: 3
---

# Component Reference

All components share common parameters plus element-specific ones.

## Common Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `className` | `String?` | CSS class names |
| `style` | `String?` | Inline CSS styles |
| `id` | `String?` | Element ID |
| `child` | `Component?` | Single child component |
| `children` | `List<Component>?` | Multiple children |
| `attributes` | `Map<String, String>?` | Custom HTML attributes |
| `events` | `Map<String, EventCallback>?` | Event handlers |
| `key` | `Key?` | Reconciliation key |

---

## Content Elements

### Div
Generic container element.

```dart
Div(
  className: 'container',
  child: Text('Content'),
)
```

### P
Paragraph element.

```dart
P(child: Text('This is a paragraph.'))
```

### Ul / Ol / Li
List elements.

```dart
Ul(
  className: 'list-disc',
  children: [
    Li(child: Text('Item 1')),
    Li(child: Text('Item 2')),
  ],
)

Ol(
  className: 'list-decimal',
  children: [
    Li(child: Text('First')),
    Li(child: Text('Second')),
  ],
)
```

### Dl / Dt / Dd
Description list elements.

```dart
Dl(children: [
  Dt(child: Text('Term')),
  Dd(child: Text('Definition')),
])
```

### Blockquote
Block quotation.

```dart
Blockquote(
  className: 'border-l-4 pl-4 italic',
  child: Text('A wise quote...'),
)
```

### Pre
Preformatted text.

```dart
Pre(child: Code(child: Text('const x = 1;')))
```

### Hr
Horizontal rule (no children).

```dart
Hr(className: 'my-4 border-gray-300')
```

---

## Text Elements

### A
Anchor/link element.

| Parameter | Type | Description |
|-----------|------|-------------|
| `href` | `String` | **Required.** Link destination |
| `target` | `String?` | Link target (`_blank`, etc.) |
| `download` | `String?` | Download filename |

```dart
A(
  href: 'https://duxt.dev',
  target: '_blank',
  child: Text('Visit Duxt'),
)
```

### Span
Inline container.

```dart
Span(className: 'text-red-500', child: Text('Highlighted'))
```

### Strong / B
Bold text.

```dart
Strong(child: Text('Important'))
B(child: Text('Bold'))
```

### Em / I
Italic/emphasized text.

```dart
Em(child: Text('Emphasized'))
I(child: Text('Italic'))
```

### U / S
Underline and strikethrough.

```dart
U(child: Text('Underlined'))
S(child: Text('Strikethrough'))
```

### Small
Smaller text.

```dart
Small(child: Text('Fine print'))
```

### Code
Inline code.

```dart
Code(className: 'bg-gray-100 px-1 rounded', child: Text('const'))
```

### Br / Wbr
Line break and word break opportunity (no children).

```dart
P(children: [
  Text('Line one'),
  Br(),
  Text('Line two'),
])
```

---

## Heading Elements

### H1 - H6
Heading levels 1-6.

```dart
H1(child: Text('Main Title'))
H2(child: Text('Section'))
H3(child: Text('Subsection'))
H4(child: Text('Sub-subsection'))
H5(child: Text('Minor heading'))
H6(child: Text('Smallest heading'))
```

---

## Form Elements

### Form
Form container.

| Parameter | Type | Description |
|-----------|------|-------------|
| `action` | `String?` | Form submission URL |
| `method` | `FormMethod?` | GET or POST |
| `encType` | `FormEncType?` | Encoding type |
| `noValidate` | `bool` | Disable validation |
| `target` | `Target?` | Submission target |

```dart
Form(
  method: FormMethod.post,
  action: '/api/submit',
  children: [...],
)
```

### Input
Input field.

| Parameter | Type | Description |
|-----------|------|-------------|
| `type` | `String?` | Input type (text, email, password, etc.) |
| `name` | `String?` | Field name |
| `value` | `String?` | Current value |
| `placeholder` | `String?` | Placeholder text |
| `disabled` | `bool` | Disable input |
| `checked` | `bool?` | Checkbox/radio state |
| `onInput` | `ValueChanged<String>?` | Input handler |
| `onChange` | `ValueChanged<String>?` | Change handler |

```dart
Input(
  type: 'email',
  name: 'email',
  placeholder: 'Enter email',
  onInput: (value) => print(value),
)

Input(
  type: 'checkbox',
  name: 'agree',
  checked: true,
)
```

### Button
Button element.

| Parameter | Type | Description |
|-----------|------|-------------|
| `type` | `String?` | button, submit, reset |
| `disabled` | `bool` | Disable button |
| `autofocus` | `bool` | Auto focus |
| `onClick` | `VoidCallback?` | Click handler |

```dart
Button(
  type: 'submit',
  onClick: () => handleSubmit(),
  child: Text('Submit'),
)
```

### Select / Option / Optgroup
Dropdown select.

```dart
Select(
  name: 'country',
  onChange: (values) => print(values),
  children: [
    Optgroup(
      label: 'North America',
      children: [
        Option(value: 'us', child: Text('United States')),
        Option(value: 'ca', child: Text('Canada')),
      ],
    ),
    Optgroup(
      label: 'Europe',
      children: [
        Option(value: 'uk', child: Text('United Kingdom')),
        Option(value: 'de', child: Text('Germany')),
      ],
    ),
  ],
)
```

### Textarea
Multi-line text input.

| Parameter | Type | Description |
|-----------|------|-------------|
| `rows` | `int?` | Number of rows |
| `cols` | `int?` | Number of columns |
| `placeholder` | `String?` | Placeholder |
| `readonly` | `bool` | Read-only |
| `required` | `bool` | Required field |

```dart
Textarea(
  name: 'message',
  rows: 4,
  placeholder: 'Enter message...',
)
```

### Label
Form label.

| Parameter | Type | Description |
|-----------|------|-------------|
| `htmlFor` | `String?` | ID of associated input |

```dart
Label(
  htmlFor: 'email',
  child: Text('Email Address'),
)
```

### Fieldset / Legend
Field grouping.

```dart
Fieldset(
  children: [
    Legend(child: Text('Personal Info')),
    Input(type: 'text', name: 'name'),
    Input(type: 'email', name: 'email'),
  ],
)
```

### Progress / Meter
Progress and meter elements.

```dart
Progress(value: 0.7, max: 1)
Meter(value: 0.6, min: 0, max: 1, low: 0.3, high: 0.8)
```

---

## Table Elements

### Table / Thead / Tbody / Tfoot / Tr / Th / Td

```dart
Table(
  className: 'w-full',
  children: [
    Caption(child: Text('Data Table')),
    Thead(child: Tr(children: [
      Th(child: Text('Name')),
      Th(child: Text('Email')),
    ])),
    Tbody(children: [
      Tr(children: [
        Td(child: Text('Alice')),
        Td(child: Text('alice@example.com')),
      ]),
    ]),
    Tfoot(child: Tr(children: [
      Td(colspan: 2, child: Text('Total: 1')),
    ])),
  ],
)
```

### Col / Colgroup
Column styling.

```dart
Colgroup(children: [
  Col(className: 'bg-gray-100'),
  Col(),
  Col(className: 'bg-gray-100'),
])
```

---

## Media Elements

### Img
Image element (no children).

| Parameter | Type | Description |
|-----------|------|-------------|
| `src` | `String` | **Required.** Image source |
| `alt` | `String?` | Alt text |
| `width` | `int?` | Width in pixels |
| `height` | `int?` | Height in pixels |
| `loading` | `MediaLoading?` | lazy or eager |

```dart
Img(
  src: '/images/photo.jpg',
  alt: 'A photo',
  width: 400,
  height: 300,
  loading: MediaLoading.lazy,
)
```

### Video / Audio
Media players.

| Parameter | Type | Description |
|-----------|------|-------------|
| `src` | `String?` | Media source |
| `controls` | `bool` | Show controls |
| `autoplay` | `bool` | Auto play |
| `loop` | `bool` | Loop playback |
| `muted` | `bool` | Muted |

```dart
Video(
  src: '/video.mp4',
  controls: true,
  width: 640,
  height: 360,
)

Audio(
  src: '/audio.mp3',
  controls: true,
)
```

### Source
Media source for video/audio.

```dart
Video(
  controls: true,
  children: [
    Source(src: '/video.webm', type: 'video/webm'),
    Source(src: '/video.mp4', type: 'video/mp4'),
  ],
)
```

### Iframe
Embedded frame.

| Parameter | Type | Description |
|-----------|------|-------------|
| `src` | `String` | **Required.** Frame source |
| `allow` | `String?` | Feature policy |
| `sandbox` | `String?` | Sandbox restrictions |

```dart
Iframe(
  src: 'https://www.youtube.com/embed/xyz',
  width: 560,
  height: 315,
  allow: 'accelerometer; autoplay; encrypted-media',
)
```

### Figure / Figcaption
Figure with caption.

```dart
Figure(children: [
  Img(src: '/photo.jpg', alt: 'Photo'),
  Figcaption(child: Text('Photo caption')),
])
```

---

## Semantic Elements

### Header / Footer / Nav / Main / Article / Aside / Section
Semantic layout elements.

```dart
Header(child: Nav(children: [/* links */]))
Main(child: Article(children: [/* content */]))
Aside(child: Section(children: [/* sidebar */]))
Footer(child: Text('© 2024'))
```

### Details / Summary
Disclosure widget.

| Parameter | Type | Description |
|-----------|------|-------------|
| `open` | `bool` | Initially open |

```dart
Details(
  open: true,
  children: [
    Summary(child: Text('Click to expand')),
    P(child: Text('Hidden content')),
  ],
)
```

### Dialog
Dialog/modal element.

| Parameter | Type | Description |
|-----------|------|-------------|
| `open` | `bool` | Dialog visible |

```dart
Dialog(
  open: isOpen,
  children: [
    H2(child: Text('Dialog Title')),
    P(child: Text('Dialog content')),
    Button(onClick: close, child: Text('Close')),
  ],
)
```

---

## SVG Elements

### Svg
SVG container.

| Parameter | Type | Description |
|-----------|------|-------------|
| `viewBox` | `String?` | SVG viewBox |
| `width` | `Unit?` | Width (use .px extension) |
| `height` | `Unit?` | Height (use .px extension) |

```dart
Svg(
  viewBox: '0 0 100 100',
  width: 100.px,
  height: 100.px,
  children: [/* shapes */],
)
```

### Rect / Circle / Ellipse / Line / Path / Polygon / Polyline
SVG shapes.

```dart
// Rectangle
Rect(x: '10', y: '10', width: '80', height: '40', fill: Color.hex(0x3B82F6), rx: '4')

// Circle
Circle(cx: '50', cy: '50', r: '30', fill: Color.hex(0x10B981))

// Ellipse
Ellipse(cx: '50', cy: '50', rx: '40', ry: '25', fill: Color.hex(0xF59E0B))

// Line
Line(x1: '10', y1: '10', x2: '90', y2: '90', stroke: Color.hex(0xEF4444), strokeWidth: '2')

// Path
Path(d: 'M10 10 L90 90 L10 90 Z', fill: Color.hex(0x8B5CF6))

// Polygon
Polygon(points: '50,10 90,90 10,90', fill: Color.hex(0xEC4899))

// Polyline
Polyline(points: '10,80 30,20 50,60 70,30 90,70', stroke: Color.hex(0x06B6D4), fill: Color.transparent)
```

---

## Helper Functions

### Text
Create text content.

```dart
Text('Hello, World!')
Text('With key', key: Key('text-1'))
```

### Raw
Insert raw HTML.

```dart
Raw('<strong>Bold</strong> text')
```

### Fragment
Group components without a wrapper element.

```dart
Fragment([
  H1(child: Text('Title')),
  P(child: Text('Paragraph')),
])
```
