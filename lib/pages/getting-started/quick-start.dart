import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../../shared/layouts/docs_layout.dart';
import '../../shared/components/toc.dart';
import '../../shared/components/code_block.dart';

/// Quick Start page
class QuickStartPage extends StatelessComponent {
  const QuickStartPage({super.key});

  @override
  Component build(BuildContext context) {
    return DocsLayout(
      title: 'Quick Start',
      description: 'Build your first page with Duxt UI in 5 minutes.',
      currentPath: '/getting-started/quick-start',
      tocItems: const [
        TocItem(label: 'Create a Project', anchor: 'create-project'),
        TocItem(label: 'Add Components', anchor: 'add-components'),
        TocItem(label: 'Build a Form', anchor: 'build-form'),
        TocItem(label: 'Run Your App', anchor: 'run-app'),
      ],
      children: [
        // Create Project
        h2(id: 'create-project', [text('Create a Project')]),
        p([text('Start by creating a new Jaspr project:')]),
        CodeBlock(
          code: '''# Create a new Jaspr project
jaspr create my_duxt_app

# Navigate to the project
cd my_duxt_app

# Add Duxt UI dependency
# Edit pubspec.yaml to add duxt_ui (see Installation)

# Get dependencies
dart pub get''',
          language: 'bash',
        ),

        // Add Components
        h2(id: 'add-components', [text('Add Components')]),
        p([text('Let\'s create a simple page with a card and some buttons:')]),
        CodeBlock(
          code: '''import 'package:jaspr/jaspr.dart';
import 'package:duxt_ui/duxt_ui.dart';

class HomePage extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen bg-gray-950 p-8', [
      div(classes: 'max-w-md mx-auto', [
        // Card component
        UCard(
          header: [
            h2(classes: 'text-xl font-semibold', [text('Welcome to Duxt')]),
          ],
          children: [
            p(classes: 'text-gray-400 mb-4', [
              text('This is your first Duxt UI component!'),
            ]),
            // Button group
            div(classes: 'flex gap-2', [
              UButton(
                label: 'Primary',
                variant: UButtonVariant.solid,
                color: UColor.primary,
              ),
              UButton(
                label: 'Secondary',
                variant: UButtonVariant.outline,
                color: UColor.gray,
              ),
            ]),
          ],
        ),
      ]),
    ]);
  }
}''',
          language: 'dart',
          filename: 'lib/pages/home.dart',
        ),

        // Build a Form
        h2(id: 'build-form', [text('Build a Form')]),
        p([text('Duxt UI includes form components. Here\'s a login form example:')]),
        CodeBlock(
          code: '''class LoginForm extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return UCard(
      header: [
        h2(classes: 'text-xl font-semibold', [text('Login')]),
        p(classes: 'text-sm text-gray-400', [
          text('Enter your credentials to continue'),
        ]),
      ],
      children: [
        div(classes: 'space-y-4', [
          // Email input
          UInput(
            label: 'Email',
            placeholder: 'Enter your email',
            type: 'email',
          ),
          // Password input
          UInput(
            label: 'Password',
            placeholder: 'Enter your password',
            type: 'password',
          ),
          // Submit button
          UButton(
            label: 'Sign In',
            variant: UButtonVariant.solid,
            color: UColor.primary,
            block: true,
          ),
        ]),
      ],
      footer: [
        p(classes: 'text-sm text-gray-400 text-center', [
          text('Don\\'t have an account? '),
          a(href: '/signup', classes: 'text-primary-400 hover:underline', [
            text('Sign up'),
          ]),
        ]),
      ],
    );
  }
}''',
          language: 'dart',
          filename: 'lib/components/login_form.dart',
        ),

        // Run App
        h2(id: 'run-app', [text('Run Your App')]),
        p([text('Start the development server:')]),
        CodeBlock(
          code: 'jaspr serve',
          language: 'bash',
        ),
        p([text('Open '), a(href: 'http://localhost:8080', [text('http://localhost:8080')]), text(' in your browser to see your app!')]),

        Callout(
          type: 'info',
          title: 'Hot Reload',
          children: [
            p([text('Jaspr supports hot reload during development. Changes to your Dart files will automatically refresh the browser.')]),
          ],
        ),

        // What's Next
        h2(id: 'whats-next', [text('What\'s Next?')]),
        p([text('Now that you have Duxt UI running, explore more:')]),
        ul([
          li([a(href: '/components/button', [text('Button')]), text(' - Learn about button variants and states')]),
          li([a(href: '/components/input', [text('Input')]), text(' - Form inputs and validation')]),
          li([a(href: '/components/card', [text('Card')]), text(' - Card layouts and sections')]),
          li([a(href: '/duxt-ui/theming', [text('Theming')]), text(' - Customize colors and styles')]),
        ]),
      ],
    );
  }
}
