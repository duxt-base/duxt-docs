---
title: Pricing
description: Components for displaying pricing plans and billing options.
layout: ui-layout
order: 44
---

# Pricing

Duxt UI provides components for building pricing pages with plan cards, feature comparisons, and billing toggles.

## Basic Pricing Plan

```dart
DPricingPlan(
  name: 'Starter',
  description: 'Perfect for individuals and small projects.',
  price: '9',
  currency: '\$',
  period: '/month',
  features: [
    DPricingFeature(text: '5 projects'),
    DPricingFeature(text: '10GB storage'),
    DPricingFeature(text: 'Basic analytics'),
    DPricingFeature(text: 'Email support', included: false),
  ],
  buttonText: 'Get Started',
  onButtonClick: () => selectPlan('starter'),
)
```

## Highlighted Plan

```dart
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
  onButtonClick: () => selectPlan('pro'),
)
```

## With Discount

```dart
DPricingPlan(
  name: 'Enterprise',
  price: '79',
  originalPrice: '99',
  period: '/month',
  badge: 'Save 20%',
  badgeColor: 'bg-green-500 text-white',
  features: [
    DPricingFeature(text: 'Everything in Pro'),
    DPricingFeature(text: 'Unlimited storage'),
    DPricingFeature(text: 'Custom integrations'),
    DPricingFeature(text: '24/7 phone support'),
  ],
  buttonText: 'Contact Sales',
  buttonHref: '/contact',
)
```

## Features

Features can be marked as included or not:

```dart
features: [
  DPricingFeature(text: 'Unlimited users', included: true),
  DPricingFeature(text: 'API access', included: true),
  DPricingFeature(text: 'Custom branding', included: false),
  DPricingFeature(text: 'White-label', included: false),
]
```

Included features show a green checkmark, excluded features show a red X with strikethrough text.

## Disabled Plan

```dart
DPricingPlan(
  name: 'Legacy',
  description: 'This plan is no longer available.',
  price: '49',
  disabled: true,
  features: [...],
  buttonText: 'Unavailable',
)
```

## Pricing Plans Grid

Display multiple plans in a responsive grid:

```dart
DPricingPlans(
  title: 'Choose your plan',
  description: 'Start free and scale as you grow.',
  columns: DPricingPlansColumns.three,
  plans: [
    DPricingPlan(
      name: 'Free',
      price: '0',
      features: [...],
    ),
    DPricingPlan(
      name: 'Pro',
      price: '29',
      highlighted: true,
      badge: 'Popular',
      features: [...],
    ),
    DPricingPlan(
      name: 'Enterprise',
      price: '99',
      features: [...],
    ),
  ],
)
```

## Grid Columns

```dart
DPricingPlans(columns: DPricingPlansColumns.two, plans: [...])
DPricingPlans(columns: DPricingPlansColumns.three, plans: [...])  // Default
DPricingPlans(columns: DPricingPlansColumns.four, plans: [...])
```

## With Billing Toggle

```dart
class PricingPage extends StatefulComponent {
  @override
  State createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  bool isYearly = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DPricingPlans(
      title: 'Simple, transparent pricing',
      description: 'No hidden fees. Cancel anytime.',
      billingToggle: DBillingToggle(
        isYearly: isYearly,
        monthlyLabel: 'Monthly',
        yearlyLabel: 'Yearly',
        yearlySavings: 'Save 20%',
        onChange: (yearly) => setState(() => isYearly = yearly),
      ),
      plans: [
        DPricingPlan(
          name: 'Starter',
          price: isYearly ? '90' : '9',
          period: isYearly ? '/year' : '/month',
          features: [...],
        ),
        DPricingPlan(
          name: 'Pro',
          price: isYearly ? '290' : '29',
          period: isYearly ? '/year' : '/month',
          highlighted: true,
          features: [...],
        ),
      ],
    );
  }
}
```

## Custom Header

```dart
DPricingPlan(
  name: 'Custom',
  price: '0',
  header: div(classes: 'text-center', [
    div(classes: 'w-16 h-16 mx-auto bg-primary-100 rounded-2xl flex items-center justify-center', [
      DIcon(name: 'star', size: 32, classes: 'text-primary-600'),
    ]),
    h3(classes: 'mt-4 text-xl font-bold', [text('Custom Plan')]),
    p(classes: 'mt-2 text-gray-500', [text('Tailored to your needs.')]),
  ]),
  features: [...],
)
```

## Custom Footer

```dart
DPricingPlan(
  name: 'Pro',
  price: '29',
  features: [...],
  footer: p(classes: 'text-xs text-gray-500 text-center', [
    text('14-day free trial. No credit card required.'),
  ]),
)
```

## Complete Example

```dart
class PricingSection extends StatefulComponent {
  @override
  State createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
  bool isYearly = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DContainer(
      padded: true,
      children: [
        DPricingPlans(
          title: 'Pricing for teams of all sizes',
          description: 'Choose an affordable plan that works for you.',
          billingToggle: DBillingToggle(
            isYearly: isYearly,
            yearlySavings: 'Save 20%',
            onChange: (yearly) => setState(() => isYearly = yearly),
          ),
          plans: [
            DPricingPlan(
              name: 'Hobby',
              description: 'For side projects and learning.',
              price: isYearly ? '0' : '0',
              period: '/month',
              features: [
                DPricingFeature(text: '3 projects'),
                DPricingFeature(text: '1GB storage'),
                DPricingFeature(text: 'Community support'),
                DPricingFeature(text: 'API access', included: false),
              ],
              buttonText: 'Start Free',
              onButtonClick: () => signUp('hobby'),
            ),
            DPricingPlan(
              name: 'Pro',
              description: 'For professionals and small teams.',
              price: isYearly ? '190' : '19',
              period: isYearly ? '/year' : '/month',
              highlighted: true,
              badge: 'Most Popular',
              features: [
                DPricingFeature(text: 'Unlimited projects'),
                DPricingFeature(text: '50GB storage'),
                DPricingFeature(text: 'Priority support'),
                DPricingFeature(text: 'API access'),
              ],
              buttonText: 'Start Trial',
              onButtonClick: () => signUp('pro'),
            ),
            DPricingPlan(
              name: 'Enterprise',
              description: 'For large organizations.',
              price: isYearly ? '490' : '49',
              period: isYearly ? '/year' : '/month',
              features: [
                DPricingFeature(text: 'Everything in Pro'),
                DPricingFeature(text: 'Unlimited storage'),
                DPricingFeature(text: 'Dedicated support'),
                DPricingFeature(text: 'Custom contracts'),
              ],
              buttonText: 'Contact Sales',
              buttonHref: '/contact',
            ),
          ],
        ),
      ],
    );
  }
}
```

## Dark Mode Support

All pricing components automatically adapt to dark mode with appropriate backgrounds, borders, and text colors.

## API Reference

### DPricingPlan

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `name` | `String` | required | Plan name |
| `description` | `String?` | `null` | Plan description |
| `price` | `String` | required | Price amount |
| `currency` | `String` | `'\$'` | Currency symbol |
| `period` | `String?` | `null` | Billing period |
| `originalPrice` | `String?` | `null` | Original price for discounts |
| `badge` | `String?` | `null` | Badge text |
| `badgeColor` | `String?` | `null` | Badge color classes |
| `features` | `List<DPricingFeature>` | required | Feature list |
| `buttonText` | `String` | `'Get started'` | CTA button text |
| `buttonVariant` | `String?` | `null` | Button variant |
| `onButtonClick` | `VoidCallback?` | `null` | Button click handler |
| `buttonHref` | `String?` | `null` | Button link URL |
| `highlighted` | `bool` | `false` | Highlight the plan |
| `disabled` | `bool` | `false` | Disable the plan |
| `header` | `Component?` | `null` | Custom header content |
| `footer` | `Component?` | `null` | Custom footer content |

### DPricingFeature

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `text` | `String` | required | Feature text |
| `included` | `bool` | `true` | Whether feature is included |
| `tooltip` | `String?` | `null` | Tooltip text |

### DPricingPlans

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `plans` | `List<DPricingPlan>` | required | List of plans |
| `columns` | `DPricingPlansColumns` | `three` | Grid columns |
| `gap` | `String` | `'gap-8'` | Gap between plans |
| `title` | `String?` | `null` | Section title |
| `description` | `String?` | `null` | Section description |
| `centerWhenFewer` | `bool` | `true` | Center when fewer plans |
| `billingToggle` | `Component?` | `null` | Billing toggle component |

### DBillingToggle

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `isYearly` | `bool` | required | Current selection |
| `monthlyLabel` | `String` | `'Monthly'` | Monthly option label |
| `yearlyLabel` | `String` | `'Yearly'` | Yearly option label |
| `yearlySavings` | `String?` | `null` | Savings badge text |
| `onChange` | `ValueChanged<bool>?` | `null` | Change callback |
