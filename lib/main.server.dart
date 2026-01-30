/// The entrypoint for the **server** environment.
library;

import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  print('[Duxt Docs Server] Starting...');

  Jaspr.initializeApp(
    options: defaultServerOptions,
  );
  print('[Duxt Docs Server] Jaspr initialized');

  runApp(const App());
  print('[Duxt Docs Server] App running');
}
