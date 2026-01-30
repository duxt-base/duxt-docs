import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class PricingPage extends StatelessComponent {
  const PricingPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Pricing')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('Components for displaying pricing plans and billing options.')]),

            _section('Basic Pricing Plan', [
              _preview([
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
              ], '''DPricingPlan(
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
              _preview([
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
              ], '''DPricingPlan(
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
              _preview([
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
              ], '''DPricingPlan(
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
              _preview([
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
              ], '''features: [
  DPricingFeature(text: 'Unlimited users', included: true),
  DPricingFeature(text: 'API access', included: true),
  DPricingFeature(text: 'Custom branding', included: false),
  DPricingFeature(text: 'White-label', included: false),
]'''),
            ]),

            _section('Pricing Plans Grid', [
              _preview([
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
              ], '''DPricingPlans(
  columns: DPricingPlansColumns.three,
  plans: [
    DPricingPlan(name: 'Free', price: '0', ...),
    DPricingPlan(name: 'Pro', price: '29', highlighted: true, ...),
    DPricingPlan(name: 'Enterprise', price: '99', ...),
  ],
)'''),
            ]),

            // API Reference
            h2([text('API Reference')]),
            h3([text('DPricingPlan')]),
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

            h3([text('DPricingFeature')]),
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
                  _apiRow('text', 'String', 'required', 'Feature text'),
                  _apiRow('included', 'bool', 'true', 'Whether feature is included'),
                  _apiRow('tooltip', 'String?', 'null', 'Tooltip text'),
                ]),
              ]),
            ]),

            h3([text('DPricingPlans')]),
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
                  _apiRow('plans', 'List<DPricingPlan>', 'required', 'List of plans'),
                  _apiRow('columns', 'DPricingPlansColumns', 'three', 'Grid columns'),
                  _apiRow('title', 'String?', 'null', 'Section title'),
                  _apiRow('description', 'String?', 'null', 'Section description'),
                  _apiRow('billingToggle', 'Component?', 'null', 'Billing toggle component'),
                ]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]), ...children]);

  Component _preview(List<Component> components, String codeExample) => div(classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden', [
    div(classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]', styles: Styles(raw: {'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)', 'background-size': '24px 24px'}), components),
    div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [
      div(classes: 'flex items-center px-4 py-2 border-b border-zinc-200 dark:border-zinc-800', [span(classes: 'text-xs text-zinc-500', [text('dart')])]),
      div(classes: 'p-4 overflow-x-auto', [pre(classes: 'text-sm', [code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)])])]),
    ]),
  ]);

  Component _apiRow(String prop, String type, String defaultVal, String desc) {
    return tr(classes: 'border-b border-zinc-800/50', [
      td(classes: 'py-3 px-4 font-mono text-cyan-400', [text(prop)]),
      td(classes: 'py-3 px-4 font-mono text-purple-400', [text(type)]),
      td(classes: 'py-3 px-4 font-mono text-zinc-500', [text(defaultVal)]),
      td(classes: 'py-3 px-4 text-zinc-700 dark:text-zinc-300', [text(desc)]),
    ]);
  }
}
