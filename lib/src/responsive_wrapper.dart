import 'package:flutter/material.dart';
import 'size_config.dart';

/// Configuration for responsive wrapper behavior
class ResponsiveWrapperConfig {
  /// Whether to initialize UniversalBreakpoints on each build
  final bool autoInitialize;

  /// Debug logging for resize events
  final bool debugPrint;

  const ResponsiveWrapperConfig({
    this.autoInitialize = true,
    this.debugPrint = false,
  });
}

/// A wrapper widget that automatically rebuilds when screen size changes.
///
/// This StatelessWidget initializes [UniversalBreakpoints] on each build.
/// When the screen resizes, Flutter's MediaQuery system automatically triggers
/// a rebuild of this widget and all descendants that depend on MediaQuery.
///
/// Example:
/// ```dart
/// ResponsiveWrapper(
///   config: ResponsiveWrapperConfig(
///     autoInitialize: true,
///     debugPrint: true,
///   ),
///   child: MaterialApp(
///     home: MyApp(),
///   ),
/// )
/// ```
class ResponsiveWrapper extends StatelessWidget {
  /// The child widget to wrap
  final Widget child;

  /// Configuration for responsive behavior
  final ResponsiveWrapperConfig config;

  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.config = const ResponsiveWrapperConfig(),
  });

  @override
  Widget build(BuildContext context) {
    if (config.autoInitialize) {
      UniversalBreakpoints().init(context);
      if (config.debugPrint) {
        final size = MediaQuery.of(context).size;
        final orientation = MediaQuery.of(context).orientation;
        debugPrint(
          '[ResponsiveWrapper] Build - Size: ${size.width.toStringAsFixed(0)}'
          'x${size.height.toStringAsFixed(0)}, '
          'Orientation: $orientation',
        );
      }
    }

    return child;
  }
}
