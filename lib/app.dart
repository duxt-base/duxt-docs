import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/index.dart' as home;
import 'pages/getting-started/index.dart' as getting_started;
import 'pages/getting-started/quick-start.dart' as quick_start;
import 'pages/components/index.dart' as components;
import 'pages/components/button.dart' as button;
import 'pages/components/input.dart' as input;
import 'pages/components/card.dart' as card;
import 'pages/duxt-ui/index.dart' as duxt_ui;
import 'pages/duxt-ui/installation.dart' as installation;
import 'pages/duxt-ui/theming.dart' as theming;
import 'pages/duxt-ui/components.dart' as all_components;
import 'pages/api/index.dart' as api;

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Router(routes: [
      Route(path: '/', title: 'Duxt - Flutter Web UI Framework', builder: (context, state) => const home.IndexPage()),
      Route(path: '/getting-started', title: 'Getting Started - Duxt', builder: (context, state) => const getting_started.GettingStartedPage()),
      Route(path: '/getting-started/quick-start', title: 'Quick Start - Duxt', builder: (context, state) => const quick_start.QuickStartPage()),
      Route(path: '/components', title: 'Components - Duxt', builder: (context, state) => const components.ComponentsPage()),
      Route(path: '/components/button', title: 'Button - Duxt', builder: (context, state) => const button.ButtonPage()),
      Route(path: '/components/input', title: 'Input - Duxt', builder: (context, state) => const input.InputPage()),
      Route(path: '/components/card', title: 'Card - Duxt', builder: (context, state) => const card.CardPage()),
      Route(path: '/duxt-ui', title: 'Duxt UI - Duxt', builder: (context, state) => const duxt_ui.DuxtUIPage()),
      Route(path: '/duxt-ui/installation', title: 'Installation - Duxt UI', builder: (context, state) => const installation.InstallationPage()),
      Route(path: '/duxt-ui/theming', title: 'Theming - Duxt UI', builder: (context, state) => const theming.ThemingPage()),
      Route(path: '/duxt-ui/components', title: 'All Components - Duxt UI', builder: (context, state) => const all_components.AllComponentsPage()),
      Route(path: '/api', title: 'API Reference - Duxt', builder: (context, state) => const api.APIPage()),
    ]);
  }
}
