import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class PricingPage extends StatelessComponent {
  const PricingPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Pricing')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('Components for displaying pricing plans and billing options.')]),

            _section('Basic Pricing Plan', [
              ComponentPreviewCard(preview: [
                DPricingPlan(
                  name: 'Starter',
                  description: 'Perfect for individuals.',
                  price: '9',
                  currency: '\$',
                  period: '/month',
                  features: [
                    DPricingFeature(text: '5 projects'),
                    DPricingFeature(text: '10GB storage'),
                    DPricingFeature(text: 'Basic analytics'),
                  ],
                  buttonText: 'Get Started',
                ),
              ], code: '''DPricingPlan(
  name: 'Starter',
  description: 'Perfect for individuals.',
  price: '9',
  currency: '\$',
  period: '/month',
  features: [
    DPricingFeature(text: '5 projects'),
    DPricingFeature(text: '10GB storage'),
    DPricingFeature(text: 'Basic analytics'),
  ],
  buttonText: 'Get Started',
)'''),
            ]),

            _section('Highlighted Plan', [
              ComponentPreviewCard(preview: [
                DPricingPlan(
                  name: 'Pro',
                  description: 'Best for growing businesses.',
                  price: '29',
                  period: '/month',
                  highlighted: true,
                  badge: 'Most Popular',
                  features: [
                    DPricingFeature(text: 'Unlimited projects'),
                    DPricingFeature(text: '100GB storage'),
                    DPricingFeature(text: 'Advanced analytics'),
                    DPricingFeature(text: 'Priority support'),
                  ],
                  buttonText: 'Start Free Trial',
                ),
              ], code: '''DPricingPlan(
  name: 'Pro',
  description: 'Best for growing businesses.',
  price: '29',
  period: '/month',
  highlighted: true,
  badge: 'Most Popular',
  features: [
    DPricingFeature(text: 'Unlimited projects'),
    DPricingFeature(text: '100GB storage'),
    DPricingFeature(text: 'Advanced analytics'),
    DPricingFeature(text: 'Priority support'),
  ],
  buttonText: 'Start Free Trial',
)'''),
            ]),

            _section('With Discount', [
              ComponentPreviewCard(preview: [
                DPricingPlan(
                  name: 'Enterprise',
                  price: '79',
                  originalPrice: '99',
                  period: '/month',
                  badge: 'Save 20%',
                  features: [
                    DPricingFeature(text: 'Everything in Pro'),
                    DPricingFeature(text: 'Unlimited storage'),
                    DPricingFeature(text: 'Custom integrations'),
                    DPricingFeature(text: '24/7 phone support'),
                  ],
                  buttonText: 'Contact Sales',
                ),
              ], code: '''DPricingPlan(
  name: 'Enterprise',
  price: '79',
  originalPrice: '99',
  period: '/month',
  badge: 'Save 20%',
  features: [
    DPricingFeature(text: 'Everything in Pro'),
    DPricingFeature(text: 'Unlimited storage'),
    DPricingFeature(text: 'Custom integrations'),
    DPricingFeature(text: '24/7 phone support'),
  ],
  buttonText: 'Contact Sales',
)'''),
            ]),

            _section('Features (Included/Excluded)', [
              ComponentPreviewCard(preview: [
                DPricingPlan(
                  name: 'Basic',
                  price: '19',
                  period: '/month',
                  features: [
                    DPricingFeature(text: 'Unlimited users', included: true),
                    DPricingFeature(text: 'API access', included: true),
                    DPricingFeature(text: 'Custom branding', included: false),
                    DPricingFeature(text: 'White-label', included: false),
                  ],
                  buttonText: 'Get Started',
                ),
              ], code: '''features: [
  DPricingFeature(text: 'Unlimited users', included: true),
  DPricingFeature(text: 'API access', included: true),
  DPricingFeature(text: 'Custom branding', included: false),
  DPricingFeature(text: 'White-label', included: false),
]'''),
            ]),

            _section('Pricing Plans Grid', [
              ComponentPreviewCard(preview: [
                DPricingPlans(
                  columns: DPricingPlansColumns.three,
                  plans: [
                    DPricingPlan(
                      name: 'Free',
                      price: '0',
                      period: '/month',
                      features: [
                        DPricingFeature(text: '1 project'),
                        DPricingFeature(text: '1GB storage'),
                      ],
                      buttonText: 'Get Started',
                    ),
                    DPricingPlan(
                      name: 'Pro',
                      price: '29',
                      period: '/month',
                      highlighted: true,
                      badge: 'Popular',
                      features: [
                        DPricingFeature(text: '10 projects'),
                        DPricingFeature(text: '50GB storage'),
                      ],
                      buttonText: 'Start Trial',
                    ),
                    DPricingPlan(
                      name: 'Enterprise',
                      price: '99',
                      period: '/month',
                      features: [
                        DPricingFeature(text: 'Unlimited'),
                        DPricingFeature(text: 'Unlimited'),
                      ],
                      buttonText: 'Contact',
                    ),
                  ],
                ),
              ], code: '''DPricingPlans(
  columns: DPricingPlansColumns.three,
  plans: [
    DPricingPlan(name: 'Free', price: '0', ...),
    DPricingPlan(name: 'Pro', price: '29', highlighted: true, ...),
    DPricingPlan(name: 'Enterprise', price: '99', ...),
  ],
)'''),
            ]),

            // API Reference
            h2([Component.text('API Reference')]),
            h3([Component.text('DPricingPlan')]),
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
                  _apiRow('name', 'String', 'required', 'Plan name'),
                  _apiRow('description', 'String?', 'null', 'Plan description'),
                  _apiRow('price', 'String', 'required', 'Price amount'),
                  _apiRow('currency', 'String', '\$', 'Currency symbol'),
                  _apiRow('period', 'String?', 'null', 'Billing period'),
                  _apiRow('originalPrice', 'String?', 'null', 'Original price for discounts'),
                  _apiRow('badge', 'String?', 'null', 'Badge text'),
                  _apiRow('features', 'List<DPricingFeature>', 'required', 'Feature list'),
                  _apiRow('buttonText', 'String', 'Get started', 'CTA button text'),
                  _apiRow('highlighted', 'bool', 'false', 'Highlight the plan'),
                  _apiRow('disabled', 'bool', 'false', 'Disable the plan'),
                ]),
              ]),
            ]),

            h3([Component.text('DPricingFeature')]),
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
                  _apiRow('text', 'String', 'required', 'Feature text'),
                  _apiRow('included', 'bool', 'true', 'Whether feature is included'),
                  _apiRow('tooltip', 'String?', 'null', 'Tooltip text'),
                ]),
              ]),
            ]),

            h3([Component.text('DPricingPlans')]),
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
                  _apiRow('plans', 'List<DPricingPlan>', 'required', 'List of plans'),
                  _apiRow('columns', 'DPricingPlansColumns', 'three', 'Grid columns'),
                  _apiRow('title', 'String?', 'null', 'Section title'),
                  _apiRow('description', 'String?', 'null', 'Section description'),
                  _apiRow('billingToggle', 'Component?', 'null', 'Billing toggle component'),
                ]),
              ]),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [Component.text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [Component.text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [Component.text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [Component.text(desc)]),
    ]);
  }
}
