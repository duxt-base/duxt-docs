/// Duxt configuration
class DuxtConfig {
  static const app = (
    name: 'duxt_docs_new',
    description: 'A Duxt application',
  );

  /// Rendering mode: 'spa', 'ssr', 'static'
  static const String mode = 'spa';

  /// API base URL
  static const String apiBase = '/api';

  /// Development server port
  static const int port = 3000;
}
