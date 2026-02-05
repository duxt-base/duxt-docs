import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:duxt/content.dart';

// Generated routes
import '.generated/routes.dart' as generated;

// Shared
import 'shared/components/ui_preview.dart';
import 'shared/layouts/docs_layout.dart';

/// Main application with routing
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    // Get generated routes with content config
    final routes = generated.generatedRoutes(
      config: DuxtPageConfig(
        layouts: [
          DuxtLayout(),
          OrmLayout(),
          SignalsLayout(),
          CliLayout(),
          HtmlLayout(),
          LandingLayout(),
        ],
        components: [
          Callout(),
          CodeBlock(),
          Image(zoom: true),
          DuxtUiComponents(),
          UiPreview(),
          UiPreviewCard(),
        ],
        theme: ContentTheme(
          primary: ThemeColor(ThemeColors.cyan.$500, dark: ThemeColors.cyan.$400),
          background: ThemeColor(ThemeColors.slate.$50, dark: ThemeColors.zinc.$950),
        ),
      ),
    );

    // Wrap all routes with Document
    final wrappedRoutes = routes.map((route) => Route(
      path: route.path,
      builder: (context, state) => _doc(
        Builder(builder: (ctx) => route.builder!(ctx, state)),
      ),
    )).toList();

    return Router(routes: wrappedRoutes);
  }
}

/// Wrap page with Document including stylesheets
Component _doc(Component child) {
  return Document(
    lang: 'en',
    head: [
      RawText('<meta name="viewport" content="width=device-width, initial-scale=1.0">'),
      link(href: 'https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&family=Nunito:wght@300;400;500;600;700&display=swap', rel: 'stylesheet'),
      link(href: '/styles.css', rel: 'stylesheet'),
      script(src: 'https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js'),
    ],
    body: child,
  );
}
