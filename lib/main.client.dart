/// The entrypoint for the **client** (web browser) environment.
library;

import 'dart:js_interop';

import 'package:jaspr/client.dart';
import 'main.client.options.dart';

@JS('console.log')
external void consoleLog(String message);

void main() {
  consoleLog('[Duxt Docs] Client starting...');

  try {
    consoleLog('[Duxt Docs] Initializing Jaspr...');
    Jaspr.initializeApp(
      options: defaultClientOptions,
    );

    consoleLog('[Duxt Docs] Running ClientApp...');
    runApp(ClientApp());

    consoleLog('[Duxt Docs] Client initialized successfully');
  } catch (e) {
    consoleLog('[Duxt Docs] ERROR: $e');
  }
}
