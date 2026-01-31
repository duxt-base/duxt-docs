// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:duxt_ui/src/components/form/slider.dart' deferred as _slider;
import 'package:jaspr_content/components/_internal/code_block_copy_button.dart'
    deferred as _code_block_copy_button;
import 'package:jaspr_content/components/_internal/zoomable_image.dart'
    deferred as _zoomable_image;
import 'package:jaspr_content/components/theme_toggle.dart'
    deferred as _theme_toggle;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'duxt_ui:slider': ClientLoader(
      (p) => _slider.DSlider(
        label: p['label'] as String?,
        value: p['value'] as double,
        min: p['min'] as double,
        max: p['max'] as double,
        step: p['step'] as double,
        name: p['name'] as String?,
        size: p['size'] as String,
        color: p['color'] as String,
        disabled: p['disabled'] as bool,
        showValue: p['showValue'] as bool,
        hint: p['hint'] as String?,
      ),
      loader: _slider.loadLibrary,
    ),
    'jaspr_content:code_block_copy_button': ClientLoader(
      (p) => _code_block_copy_button.CodeBlockCopyButton(),
      loader: _code_block_copy_button.loadLibrary,
    ),
    'jaspr_content:zoomable_image': ClientLoader(
      (p) => _zoomable_image.ZoomableImage(
        src: p['src'] as String,
        alt: p['alt'] as String?,
        caption: p['caption'] as String?,
      ),
      loader: _zoomable_image.loadLibrary,
    ),
    'jaspr_content:theme_toggle': ClientLoader(
      (p) => _theme_toggle.ThemeToggle(),
      loader: _theme_toggle.loadLibrary,
    ),
  },
);
