// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:duxt_ui/src/components/form/slider.dart' as _slider;
import 'package:jaspr_content/components/_internal/code_block_copy_button.dart'
    as _code_block_copy_button;
import 'package:jaspr_content/components/_internal/zoomable_image.dart'
    as _zoomable_image;
import 'package:jaspr_content/components/callout.dart' as _callout;
import 'package:jaspr_content/components/code_block.dart' as _code_block;
import 'package:jaspr_content/components/image.dart' as _image;
import 'package:jaspr_content/components/theme_toggle.dart' as _theme_toggle;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _slider.DSlider: ClientTarget<_slider.DSlider>(
      'duxt_ui:slider',
      params: __sliderDSlider,
    ),
    _code_block_copy_button.CodeBlockCopyButton:
        ClientTarget<_code_block_copy_button.CodeBlockCopyButton>(
          'jaspr_content:code_block_copy_button',
        ),
    _zoomable_image.ZoomableImage: ClientTarget<_zoomable_image.ZoomableImage>(
      'jaspr_content:zoomable_image',
      params: __zoomable_imageZoomableImage,
    ),
    _theme_toggle.ThemeToggle: ClientTarget<_theme_toggle.ThemeToggle>(
      'jaspr_content:theme_toggle',
    ),
  },
  styles: () => [
    ..._zoomable_image.ZoomableImage.styles,
    ..._callout.Callout.styles,
    ..._code_block.CodeBlock.styles,
    ..._image.Image.styles,
    ..._theme_toggle.ThemeToggleState.styles,
  ],
);

Map<String, Object?> __sliderDSlider(_slider.DSlider c) => {
  'label': c.label,
  'value': c.value,
  'min': c.min,
  'max': c.max,
  'step': c.step,
  'name': c.name,
  'size': c.size,
  'color': c.color,
  'disabled': c.disabled,
  'showValue': c.showValue,
  'hint': c.hint,
};
Map<String, Object?> __zoomable_imageZoomableImage(
  _zoomable_image.ZoomableImage c,
) => {'src': c.src, 'alt': c.alt, 'caption': c.caption};
