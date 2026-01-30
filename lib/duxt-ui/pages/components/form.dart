import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Form component documentation page
class FormPage extends StatelessComponent {
  const FormPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Form')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('A form component with built-in validation, field management, and submission handling.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('The DForm component provides a complete form solution with DFormField for labeled inputs, validation support, and DFormActions for submit/reset buttons.'),
                ]),
              ], code: '''DForm(
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
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('DFormField wraps input components with labels, hints, and error messages. Use the required prop to show a required indicator, and hint for helper text.'),
                ]),
              ], code: '''DFormField(
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
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Add validation rules to form fields. Built-in validators include required, email, minLength, maxLength, min, max, pattern, and custom validators.'),
                ]),
              ], code: '''DFormField(
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
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Use DFormRow to arrange multiple form fields in a grid layout. Specify the number of columns to control the layout of fields side by side.'),
                ]),
              ], code: '''DFormRow(columns: 2, children: [
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
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('Group related form fields together using DFormSection. Each section can have a title and description to help users understand the purpose of the fields.'),
                ]),
              ], code: '''DFormSection(
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
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('DFormActions provides a container for form buttons with flexible alignment options. Use it to add submit, reset, and cancel buttons.'),
                ]),
              ], code: '''DFormActions(
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
              ComponentPreviewCard(preview: [
                div(classes: 'text-zinc-300 p-4', [
                  Component.text('A complete form combining sections, rows, fields, and actions. Use onSubmit to handle form data and onValidate for custom validation logic.'),
                ]),
              ], code: '''DForm(
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
            h2([Component.text('API Reference')]),
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [Component.text('DForm')]),
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
            h3(classes: 'text-lg font-semibold text-white mt-6 mb-3', [Component.text('DFormField')]),
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
