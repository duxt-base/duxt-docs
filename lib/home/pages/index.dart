import 'package:jaspr/jaspr.dart';

import '../../shared/components/app_scaffold.dart';
import '../../shared/components/landing_hero.dart';
import '../../shared/components/landing_features.dart';
import '../../shared/components/landing_ecosystem.dart';
import '../../shared/components/landing_code.dart';
import '../../shared/components/landing_footer.dart';

/// Home page (landing) for duxt.dev
class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      // No sidebar, full width for landing page
      contentClass: '',
      fullWidth: true,
      body: Component.fragment([
        const LandingHero(),
        const LandingFeatures(),
        const LandingEcosystem(),
        const LandingCode(),
        const LandingFooter(),
      ]),
    );
  }
}
