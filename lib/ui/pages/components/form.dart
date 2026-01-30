import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

/// Form component documentation page
class FormPage extends StatelessComponent {
  const FormPage({super.key});

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
            h1([text('Form')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              text('A form component with built-in validation, field management, and submission handling.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('The DForm component provides a complete form solution with DFormField for labeled inputs, validation support, and DFormActions for submit/reset buttons.'),
                ]),
              ], '''DForm(
  children: [
    DFormField(
      label: 'Email',
      name: 'email',
      required: true,
      hint: 'We will never share your email.',
      children: [
        DInput(name: 'email', placeholder: 'Enter your email'),
      ],
    ),
    DFormField(
      label: 'Password',
      name: 'password',
      required: true,
      children: [
        DInput(name: 'password', type: DInputType.password),
      ],
    ),
    DFormActions(children: [
      DButton(label: 'Submit', type: DButtonType.submit),
    ]),
  ],
)'''),
            ]),

            // Form Field
            _section('Form Field', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('DFormField wraps input components with labels, hints, and error messages. Use the required prop to show a required indicator, and hint for helper text.'),
                ]),
              ], '''DFormField(
  label: 'Username',
  name: 'username',
  required: true,
  children: [
    DInput(name: 'username', placeholder: 'Enter username'),
  ],
)

DFormField(
  label: 'Bio',
  name: 'bio',
  hint: 'Tell us about yourself',
  children: [
    DTextarea(name: 'bio', placeholder: 'Your bio...'),
  ],
)'''),
            ]),

            // Form Validation
            _section('Validation', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Add validation rules to form fields. Built-in validators include required, email, minLength, maxLength, min, max, pattern, and custom validators.'),
                ]),
              ], '''DFormField(
  label: 'Email',
  name: 'email',
  required: true,
  rules: [
    DValidators.required(),
    DValidators.email(),
  ],
  children: [
    DInput(name: 'email', placeholder: 'Enter email'),
  ],
)

// Available validators:
DValidators.required()
DValidators.email()
DValidators.minLength(6)
DValidators.maxLength(100)
DValidators.min(0)
DValidators.max(100)
DValidators.pattern(RegExp(r'^[a-z]+\$'))
DValidators.custom((value) => value == 'test', 'Must be test')'''),
            ]),

            // Form Row
            _section('Form Row (Grid Layout)', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Use DFormRow to arrange multiple form fields in a grid layout. Specify the number of columns to control the layout of fields side by side.'),
                ]),
              ], '''DFormRow(columns: 2, children: [
  DFormField(
    label: 'First Name',
    name: 'firstName',
    children: [
      DInput(name: 'firstName', placeholder: 'John'),
    ],
  ),
  DFormField(
    label: 'Last Name',
    name: 'lastName',
    children: [
      DInput(name: 'lastName', placeholder: 'Doe'),
    ],
  ),
])'''),
            ]),

            // Form Section
            _section('Form Section', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('Group related form fields together using DFormSection. Each section can have a title and description to help users understand the purpose of the fields.'),
                ]),
              ], '''DFormSection(
  title: 'Personal Information',
  description: 'Please provide your contact details.',
  children: [
    DFormField(
      label: 'Full Name',
      name: 'fullName',
      children: [
        DInput(name: 'fullName'),
      ],
    ),
  ],
)'''),
            ]),

            // Form Actions
            _section('Form Actions', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('DFormActions provides a container for form buttons with flexible alignment options. Use it to add submit, reset, and cancel buttons.'),
                ]),
              ], '''DFormActions(
  alignment: MainAxisAlignment.spaceBetween,
  children: [
    DButton(label: 'Cancel', variant: DButtonVariant.ghost),
    div(classes: 'flex gap-2', [
      DButton(label: 'Reset', variant: DButtonVariant.outline, type: DButtonType.reset),
      DButton(label: 'Submit', type: DButtonType.submit),
    ]),
  ],
)'''),
            ]),

            // Complete Form Example
            _section('Complete Example', [
              _preview([
                div(classes: 'text-zinc-300 p-4', [
                  text('A complete form combining sections, rows, fields, and actions. Use onSubmit to handle form data and onValidate for custom validation logic.'),
                ]),
              ], '''DForm(
  onSubmit: (data) => print(data),
  onValidate: (data) => DFormValidationResult(
    isValid: data['email']?.isNotEmpty ?? false,
    errors: {},
  ),
  children: [
    DFormSection(
      title: 'Account Details',
      children: [
        DFormRow(columns: 2, children: [
          DFormField(label: 'First Name', name: 'firstName', required: true, children: [DInput(...)]),
          DFormField(label: 'Last Name', name: 'lastName', required: true, children: [DInput(...)]),
        ]),
        DFormField(label: 'Email', name: 'email', required: true, children: [DInput(...)]),
      ],
    ),
    DFormActions(children: [
      DButton(label: 'Cancel', variant: DButtonVariant.ghost),
      DButton(label: 'Create Account', type: DButtonType.submit),
    ]),
  ],
)'''),
            ]),

            // API Reference - DForm
            h2([text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('DForm')]),
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
                  _apiRow('children', 'List<Component>', 'required', 'Form field components'),
                  _apiRow('id', 'String?', 'null', 'Form ID attribute'),
                  _apiRow('name', 'String?', 'null', 'Form name attribute'),
                  _apiRow('disabled', 'bool', 'false', 'Disable all form fields'),
                  _apiRow('validateOnSubmit', 'bool', 'true', 'Validate on form submission'),
                  _apiRow('validateOnBlur', 'bool', 'false', 'Validate fields on blur'),
                  _apiRow('validateOnChange', 'bool', 'false', 'Validate fields on change'),
                  _apiRow('onValidate', 'FormValidateCallback?', 'null', 'Validation callback'),
                  _apiRow('onSubmit', 'FormSubmitCallback?', 'null', 'Submit callback with form data'),
                  _apiRow('onReset', 'VoidCallback?', 'null', 'Reset callback'),
                ]),
              ]),
            ]),

            // API Reference - DFormField
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [text('DFormField')]),
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
                  _apiRow('children', 'List<Component>', 'required', 'Input component(s)'),
                  _apiRow('name', 'String?', 'null', 'Field name for form data'),
                  _apiRow('label', 'String?', 'null', 'Field label text'),
                  _apiRow('hint', 'String?', 'null', 'Helper text below field'),
                  _apiRow('error', 'String?', 'null', 'Error message to display'),
                  _apiRow('required', 'bool', 'false', 'Show required indicator'),
                  _apiRow('disabled', 'bool', 'false', 'Disable the field'),
                  _apiRow('size', 'DFormFieldSize', 'md', 'Label and hint text size'),
                  _apiRow('rules', 'List<DValidationRule>', '[]', 'Validation rules'),
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
