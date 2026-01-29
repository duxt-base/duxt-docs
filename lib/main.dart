import 'package:jaspr/server.dart';
import 'app.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  runApp(const App());
}
