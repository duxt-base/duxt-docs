import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';

import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

/// Stepper component documentation page
class StepperPage extends StatelessComponent {
  const StepperPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
        h1([Component.text('Stepper')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [
              Component.text('A multi-step progress indicator for wizards and multi-page forms.'),
            ]),

            // Basic Usage
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                DStepper(
                  currentStep: 1,
                  steps: [
                    DStepItem(title: 'Account'),
                    DStepItem(title: 'Profile'),
                    DStepItem(title: 'Settings'),
                    DStepItem(title: 'Complete'),
                  ],
                ),
              ], code: '''DStepper(
  currentStep: 1,
  steps: [
    DStepItem(title: 'Account'),
    DStepItem(title: 'Profile'),
    DStepItem(title: 'Settings'),
    DStepItem(title: 'Complete'),
  ],
)'''),
            ]),

            // Horizontal (Default)
            _section('Horizontal (Default)', [
              ComponentPreviewCard(preview: [
                DStepper(
                  orientation: DStepperOrientation.horizontal,
                  currentStep: 2,
                  steps: [
                    DStepItem(title: 'Cart'),
                    DStepItem(title: 'Shipping'),
                    DStepItem(title: 'Payment'),
                    DStepItem(title: 'Confirm'),
                  ],
                ),
              ], code: '''DStepper(
  orientation: DStepperOrientation.horizontal,
  currentStep: 2,
  steps: [
    DStepItem(title: 'Cart'),
    DStepItem(title: 'Shipping'),
    DStepItem(title: 'Payment'),
    DStepItem(title: 'Confirm'),
  ],
)'''),
            ]),

            // Vertical
            _section('Vertical', [
              ComponentPreviewCard(preview: [
                DStepper(
                  orientation: DStepperOrientation.vertical,
                  currentStep: 1,
                  steps: [
                    DStepItem(title: 'Create Account', description: 'Enter your email and password'),
                    DStepItem(title: 'Verify Email', description: 'Check your inbox for verification link'),
                    DStepItem(title: 'Complete Profile', description: 'Add your personal information'),
                    DStepItem(title: 'Get Started', description: 'Start using the platform'),
                  ],
                ),
              ], code: '''DStepper(
  orientation: DStepperOrientation.vertical,
  currentStep: 1,
  steps: [
    DStepItem(title: 'Create Account', description: 'Enter your email and password'),
    DStepItem(title: 'Verify Email', description: 'Check your inbox for verification link'),
    DStepItem(title: 'Complete Profile', description: 'Add your personal information'),
    DStepItem(title: 'Get Started', description: 'Start using the platform'),
  ],
)'''),
            ]),

            // With Descriptions
            _section('With Descriptions', [
              ComponentPreviewCard(preview: [
                DStepper(
                  currentStep: 0,
                  steps: [
                    DStepItem(title: 'Personal Info', description: 'Name, email, phone'),
                    DStepItem(title: 'Address', description: 'Shipping and billing'),
                    DStepItem(title: 'Payment', description: 'Credit card or PayPal'),
                    DStepItem(title: 'Review', description: 'Confirm your order'),
                  ],
                ),
              ], code: '''DStepper(
  currentStep: 0,
  steps: [
    DStepItem(
      title: 'Personal Info',
      description: 'Name, email, phone',
    ),
    DStepItem(
      title: 'Address',
      description: 'Shipping and billing',
    ),
    DStepItem(
      title: 'Payment',
      description: 'Credit card or PayPal',
    ),
    DStepItem(
      title: 'Review',
      description: 'Confirm your order',
    ),
  ],
)'''),
            ]),

            // With Custom Icons
            _section('With Custom Icons', [
              ComponentPreviewCard(preview: [
                DStepper(
                  currentStep: 1,
                  steps: [
                    DStepItem(
                      title: 'Cart',
                      icon: DIcon(name: DIconNames.box, size: DIconSize.sm),
                    ),
                    DStepItem(
                      title: 'Shipping',
                      icon: DIcon(name: DIconNames.arrowRight, size: DIconSize.sm),
                    ),
                    DStepItem(
                      title: 'Payment',
                      icon: DIcon(name: DIconNames.check, size: DIconSize.sm),
                    ),
                    DStepItem(
                      title: 'Done',
                      icon: DIcon(name: DIconNames.package, size: DIconSize.sm),
                    ),
                  ],
                ),
              ], code: '''DStepper(
  currentStep: 1,
  steps: [
    DStepItem(
      title: 'Cart',
      icon: DIcon(name: DIconNames.shoppingCart, size: DIconSize.sm),
    ),
    DStepItem(
      title: 'Shipping',
      icon: DIcon(name: DIconNames.truck, size: DIconSize.sm),
    ),
    DStepItem(
      title: 'Payment',
      icon: DIcon(name: DIconNames.creditCard, size: DIconSize.sm),
    ),
    DStepItem(
      title: 'Done',
      icon: DIcon(name: DIconNames.package, size: DIconSize.sm),
    ),
  ],
)'''),
            ]),

            // Step States
            _section('Step States', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('Steps have three states: Upcoming (gray, numbered), Current (indigo, numbered), and Completed (green, checkmark).'),
              ]),
              ComponentPreviewCard(preview: [
                DStepper(
                  currentStep: 2,
                  steps: [
                    DStepItem(title: 'Step 1'),
                    DStepItem(title: 'Step 2'),
                    DStepItem(title: 'Step 3'),
                    DStepItem(title: 'Step 4'),
                  ],
                ),
              ], code: '''DStepper(
  currentStep: 2,  // Steps 0 and 1 are completed, step 2 is current
  steps: [
    DStepItem(title: 'Step 1'),  // Completed (green check)
    DStepItem(title: 'Step 2'),  // Completed (green check)
    DStepItem(title: 'Step 3'),  // Current (indigo)
    DStepItem(title: 'Step 4'),  // Upcoming (gray)
  ],
)'''),
            ]),

            // Clickable Steps
            _section('Clickable Steps', [
              p(classes: 'text-zinc-400 mb-4', [
                Component.text('Allow users to navigate by clicking on steps.'),
              ]),
              ComponentPreviewCard(preview: [
                DStepper(
                  currentStep: 1,
                  clickable: true,
                  steps: [
                    DStepItem(title: 'Details'),
                    DStepItem(title: 'Options'),
                    DStepItem(title: 'Review'),
                  ],
                ),
              ], code: '''DStepper(
  currentStep: currentStep,
  clickable: true,
  onStepClick: (index) {
    // Only allow clicking on completed or current steps
    if (index <= currentStep) {
      setState(() => currentStep = index);
    }
  },
  steps: [
    DStepItem(title: 'Details'),
    DStepItem(title: 'Options'),
    DStepItem(title: 'Review'),
  ],
)'''),
            ]),

            // Registration Flow Example
            _section('Registration Flow Example', [
              ComponentPreviewCard(preview: [
                DStepper(
                  orientation: DStepperOrientation.vertical,
                  currentStep: 1,
                  steps: [
                    DStepItem(
                      title: 'Create Account',
                      description: 'Set up your login credentials',
                      icon: DIcon(name: DIconNames.user, size: DIconSize.sm),
                    ),
                    DStepItem(
                      title: 'Verify Email',
                      description: 'Confirm your email address',
                      icon: DIcon(name: DIconNames.mail, size: DIconSize.sm),
                    ),
                    DStepItem(
                      title: 'Choose Plan',
                      description: 'Select your subscription',
                      icon: DIcon(name: DIconNames.check, size: DIconSize.sm),
                    ),
                    DStepItem(
                      title: 'Complete Setup',
                      description: 'Configure your workspace',
                      icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
                    ),
                  ],
                ),
              ], code: '''DStepper(
  orientation: DStepperOrientation.vertical,
  currentStep: registrationStep,
  steps: [
    DStepItem(
      title: 'Create Account',
      description: 'Set up your login credentials',
      icon: DIcon(name: DIconNames.userPlus, size: DIconSize.sm),
    ),
    DStepItem(
      title: 'Verify Email',
      description: 'Confirm your email address',
      icon: DIcon(name: DIconNames.mail, size: DIconSize.sm),
    ),
    DStepItem(
      title: 'Choose Plan',
      description: 'Select your subscription',
      icon: DIcon(name: DIconNames.creditCard, size: DIconSize.sm),
    ),
    DStepItem(
      title: 'Complete Setup',
      description: 'Configure your workspace',
      icon: DIcon(name: DIconNames.settings, size: DIconSize.sm),
    ),
  ],
)'''),
            ]),

            // API Reference - DStepper
            h2([Component.text('API Reference')]),
            h3([Component.text('DStepper')]),
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
                  _apiRow('steps', 'List<DStepItem>', 'required', 'Step items'),
                  _apiRow('currentStep', 'int', '0', 'Active step index (0-based)'),
                  _apiRow('orientation', 'DStepperOrientation', 'horizontal', 'Layout orientation'),
                  _apiRow('clickable', 'bool', 'false', 'Allow clicking steps'),
                  _apiRow('onStepClick', 'ValueChanged<int>?', 'null', 'Step click callback'),
                  _apiRow('classes', 'String?', 'null', 'Custom CSS classes'),
                ]),
              ]),
            ]),

            // API Reference - DStepItem
            h3(classes: 'mt-8', [Component.text('DStepItem')]),
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
                  _apiRow('title', 'String', 'required', 'Step title'),
                  _apiRow('description', 'String?', 'null', 'Step description'),
                  _apiRow('icon', 'Component?', 'null', 'Custom icon'),
                ]),
              ]),
            ]),

            // API Reference - DStepperOrientation
            h3(classes: 'mt-8', [Component.text('DStepperOrientation')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Value')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  tr(classes: 'border-b border-zinc-800/50', [
                    td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text('horizontal')]),
                    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Horizontal layout')]),
                  ]),
                  tr(classes: 'border-b border-zinc-800/50', [
                    td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text('vertical')]),
                    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Vertical layout')]),
                  ]),
                ]),
              ]),
            ]),

            // API Reference - DStepStatus
            h3(classes: 'mt-8', [Component.text('DStepStatus')]),
            div(classes: 'not-prose overflow-x-auto', [
              table(classes: 'w-full text-sm', [
                thead(classes: 'border-b border-zinc-800', [
                  tr([
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Value')]),
                    th(classes: 'text-left py-3 px-4 text-zinc-400', [Component.text('Description')]),
                  ]),
                ]),
                tbody([
                  tr(classes: 'border-b border-zinc-800/50', [
                    td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text('upcoming')]),
                    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Future step (gray)')]),
                  ]),
                  tr(classes: 'border-b border-zinc-800/50', [
                    td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text('current')]),
                    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Active step (indigo)')]),
                  ]),
                  tr(classes: 'border-b border-zinc-800/50', [
                    td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text('completed')]),
                    td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text('Past step (green check)')]),
                  ]),
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
