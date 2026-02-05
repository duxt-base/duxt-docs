---
title: Examples
description: Real-world duxt_html patterns
layout: html-layout
order: 4
---

# Examples

## Complete Page Layout

```
import 'package:duxt_html/duxt_html.dart';

Component buildPage() {
  return Div(
    className: 'min-h-screen bg-gray-50',
    children: [
      // Navigation
      Header(
        className: 'bg-white shadow-sm sticky top-0 z-50',
        child: Div(
          className: 'max-w-7xl mx-auto px-4 py-4',
          child: Nav(
            className: 'flex items-center justify-between',
            children: [
              A(
                href: '/',
                className: 'text-xl font-bold text-gray-900',
                child: Text('MyApp'),
              ),
              Div(
                className: 'flex items-center gap-6',
                children: [
                  A(href: '/features', className: 'text-gray-600 hover:text-gray-900', child: Text('Features')),
                  A(href: '/pricing', className: 'text-gray-600 hover:text-gray-900', child: Text('Pricing')),
                  A(href: '/docs', className: 'text-gray-600 hover:text-gray-900', child: Text('Docs')),
                  Button(
                    className: 'bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700',
                    child: Text('Get Started'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Hero Section
      Main(
        child: Section(
          className: 'py-20 px-4',
          child: Div(
            className: 'max-w-4xl mx-auto text-center',
            children: [
              H1(
                className: 'text-5xl font-bold text-gray-900 mb-6',
                child: Text('Build Better Web Apps'),
              ),
              P(
                className: 'text-xl text-gray-600 mb-8',
                child: Text('Create stunning web applications with Flutter-style components.'),
              ),
              Div(
                className: 'flex justify-center gap-4',
                children: [
                  Button(
                    className: 'bg-blue-600 text-white px-6 py-3 rounded-lg font-medium hover:bg-blue-700',
                    child: Text('Start Building'),
                  ),
                  A(
                    href: '/docs',
                    className: 'border border-gray-300 text-gray-700 px-6 py-3 rounded-lg font-medium hover:bg-gray-50',
                    child: Text('Documentation'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Footer
      Footer(
        className: 'bg-gray-900 text-white py-12',
        child: Div(
          className: 'max-w-7xl mx-auto px-4',
          child: Div(
            className: 'grid md:grid-cols-4 gap-8',
            children: [
              Div(children: [
                H3(className: 'font-bold mb-4', child: Text('Product')),
                Ul(className: 'space-y-2', children: [
                  Li(child: A(href: '#', className: 'text-gray-400 hover:text-white', child: Text('Features'))),
                  Li(child: A(href: '#', className: 'text-gray-400 hover:text-white', child: Text('Pricing'))),
                ]),
              ]),
              Div(children: [
                H3(className: 'font-bold mb-4', child: Text('Resources')),
                Ul(className: 'space-y-2', children: [
                  Li(child: A(href: '#', className: 'text-gray-400 hover:text-white', child: Text('Documentation'))),
                  Li(child: A(href: '#', className: 'text-gray-400 hover:text-white', child: Text('Tutorials'))),
                ]),
              ]),
            ],
          ),
        ),
      ),
    ],
  );
}
```

## Contact Form

```
class ContactForm extends StatefulComponent {
  @override
  State createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String _name = '';
  String _email = '';
  String _message = '';

  @override
  Component build(BuildContext context) {
    return Form(
      method: FormMethod.post,
      className: 'max-w-md mx-auto p-6 bg-white rounded-lg shadow',
      children: [
        H2(
          className: 'text-2xl font-bold mb-6',
          child: Text('Contact Us'),
        ),

        // Name Field
        Div(
          className: 'mb-4',
          children: [
            Label(
              htmlFor: 'name',
              className: 'block text-sm font-medium text-gray-700 mb-1',
              child: Text('Name'),
            ),
            Input(
              type: 'text',
              name: 'name',
              id: 'name',
              value: _name,
              onInput: (v) => setState(() => _name = v),
              className: 'w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent',
              placeholder: 'John Doe',
            ),
          ],
        ),

        // Email Field
        Div(
          className: 'mb-4',
          children: [
            Label(
              htmlFor: 'email',
              className: 'block text-sm font-medium text-gray-700 mb-1',
              child: Text('Email'),
            ),
            Input(
              type: 'email',
              name: 'email',
              id: 'email',
              value: _email,
              onInput: (v) => setState(() => _email = v),
              className: 'w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent',
              placeholder: 'john@example.com',
            ),
          ],
        ),

        // Message Field
        Div(
          className: 'mb-6',
          children: [
            Label(
              htmlFor: 'message',
              className: 'block text-sm font-medium text-gray-700 mb-1',
              child: Text('Message'),
            ),
            Textarea(
              name: 'message',
              id: 'message',
              rows: 4,
              className: 'w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent',
              placeholder: 'How can we help?',
              onInput: (v) => setState(() => _message = v),
            ),
          ],
        ),

        // Submit Button
        Button(
          type: 'submit',
          className: 'w-full bg-blue-600 text-white py-2 px-4 rounded-lg font-medium hover:bg-blue-700 transition-colors',
          child: Text('Send Message'),
        ),
      ],
    );
  }
}
```

## Data Table

```
Component buildUserTable(List<User> users) {
  return Div(
    className: 'overflow-x-auto',
    child: Table(
      className: 'min-w-full divide-y divide-gray-200',
      children: [
        Thead(
          className: 'bg-gray-50',
          child: Tr(children: [
            Th(className: 'px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider', child: Text('Name')),
            Th(className: 'px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider', child: Text('Email')),
            Th(className: 'px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider', child: Text('Role')),
            Th(className: 'px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider', child: Text('Actions')),
          ]),
        ),
        Tbody(
          className: 'bg-white divide-y divide-gray-200',
          children: users.map((user) => Tr(
            className: 'hover:bg-gray-50',
            children: [
              Td(
                className: 'px-6 py-4 whitespace-nowrap',
                child: Div(
                  className: 'flex items-center',
                  children: [
                    Img(
                      src: user.avatar,
                      alt: user.name,
                      className: 'h-10 w-10 rounded-full',
                    ),
                    Div(
                      className: 'ml-4',
                      children: [
                        Div(className: 'text-sm font-medium text-gray-900', child: Text(user.name)),
                      ],
                    ),
                  ],
                ),
              ),
              Td(className: 'px-6 py-4 whitespace-nowrap text-sm text-gray-500', child: Text(user.email)),
              Td(
                className: 'px-6 py-4 whitespace-nowrap',
                child: Span(
                  className: 'px-2 py-1 text-xs font-semibold rounded-full ${user.role == "Admin" ? "bg-green-100 text-green-800" : "bg-gray-100 text-gray-800"}',
                  child: Text(user.role),
                ),
              ),
              Td(
                className: 'px-6 py-4 whitespace-nowrap text-sm',
                child: Div(
                  className: 'flex gap-2',
                  children: [
                    Button(
                      className: 'text-blue-600 hover:text-blue-900',
                      onClick: () => editUser(user),
                      child: Text('Edit'),
                    ),
                    Button(
                      className: 'text-red-600 hover:text-red-900',
                      onClick: () => deleteUser(user),
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ),
            ],
          )).toList(),
        ),
      ],
    ),
  );
}
```

## Card Grid

```
Component buildCardGrid(List<Product> products) {
  return Div(
    className: 'grid md:grid-cols-2 lg:grid-cols-3 gap-6',
    children: products.map((product) => Article(
      className: 'bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow',
      children: [
        Img(
          src: product.image,
          alt: product.name,
          className: 'w-full h-48 object-cover',
        ),
        Div(
          className: 'p-4',
          children: [
            H3(
              className: 'text-lg font-semibold text-gray-900 mb-2',
              child: Text(product.name),
            ),
            P(
              className: 'text-gray-600 text-sm mb-4',
              child: Text(product.description),
            ),
            Div(
              className: 'flex items-center justify-between',
              children: [
                Span(
                  className: 'text-xl font-bold text-blue-600',
                  child: Text('\$${product.price}'),
                ),
                Button(
                  className: 'bg-blue-600 text-white px-4 py-2 rounded-lg text-sm hover:bg-blue-700',
                  onClick: () => addToCart(product),
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ],
    )).toList(),
  );
}
```

## Modal Dialog

```
class ConfirmDialog extends StatelessComponent {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final bool isOpen;

  const ConfirmDialog({
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
    required this.isOpen,
  });

  @override
  Component build(BuildContext context) {
    if (!isOpen) return Fragment([]);

    return Div(
      className: 'fixed inset-0 z-50 overflow-y-auto',
      children: [
        // Backdrop
        Div(
          className: 'fixed inset-0 bg-black bg-opacity-50 transition-opacity',
          events: {'click': (_) => onCancel()},
        ),
        // Modal
        Div(
          className: 'flex min-h-full items-center justify-center p-4',
          child: Dialog(
            open: true,
            className: 'relative bg-white rounded-lg shadow-xl max-w-md w-full p-6',
            children: [
              H3(
                className: 'text-lg font-semibold text-gray-900 mb-2',
                child: Text(title),
              ),
              P(
                className: 'text-gray-600 mb-6',
                child: Text(message),
              ),
              Div(
                className: 'flex justify-end gap-3',
                children: [
                  Button(
                    onClick: onCancel,
                    className: 'px-4 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50',
                    child: Text('Cancel'),
                  ),
                  Button(
                    onClick: onConfirm,
                    className: 'px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700',
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
```

## SVG Icon Component

```
Component buildIcon(String name, {double size = 24, Color? color}) {
  final icons = {
    'home': 'M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z',
    'user': 'M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z',
    'settings': 'M19.14 12.94c.04-.31.06-.63.06-.94 0-.31-.02-.63-.06-.94l2.03-1.58c.18-.14.23-.41.12-.61l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.04.31-.06.63-.06.94s.02.63.06.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.01-1.58zM12 15.6c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z',
  };

  return Svg(
    viewBox: '0 0 24 24',
    width: size.px,
    height: size.px,
    children: [
      Path(
        d: icons[name] ?? '',
        fill: color ?? Color.hex(0x000000),
      ),
    ],
  );
}

// Usage
buildIcon('home', size: 32, color: Color.hex(0x3B82F6))
```

## Accordion

```
class Accordion extends StatefulComponent {
  final List<({String title, String content})> items;

  const Accordion({required this.items});

  @override
  State createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  int? _openIndex;

  @override
  Component build(BuildContext context) {
    return Div(
      className: 'border border-gray-200 rounded-lg divide-y',
      children: component.items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isOpen = _openIndex == index;

        return Details(
          open: isOpen,
          className: 'group',
          children: [
            Summary(
              className: 'flex items-center justify-between px-4 py-3 cursor-pointer hover:bg-gray-50',
              events: {
                'click': (e) {
                  e.preventDefault();
                  setState(() => _openIndex = isOpen ? null : index);
                },
              },
              children: [
                Span(className: 'font-medium', child: Text(item.title)),
                Span(
                  className: 'transform transition-transform ${isOpen ? "rotate-180" : ""}',
                  child: Text('▼'),
                ),
              ],
            ),
            Div(
              className: 'px-4 py-3 text-gray-600',
              child: Text(item.content),
            ),
          ],
        );
      }).toList(),
    );
  }
}
```
