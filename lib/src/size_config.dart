import 'package:flutter/material.dart';
import 'enums.dart';
import 'breakpoints.dart';

/// A singleton class that manages responsive screen sizing and scaling.
///
/// [UniversalBreakpoints] provides a complete solution for handling responsive
/// design across all Flutter platforms (iOS, Android, Web, Windows, macOS, Linux).
///
/// ## Features:
/// - Automatic screen size detection and categorization
/// - Responsive scaling for fonts, widths, and heights
/// - Orientation and aspect ratio detection
/// - Fine-grained device type classification
/// - Platform-agnostic breakpoints
///
/// ## Usage:
/// ```dart
/// // Initialize in your main app
/// void main() {
///   runApp(const MyApp());
/// }
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     UniversalBreakpoints().init(context);
///     return MaterialApp(
///       home: MyHome(),
///     );
///   }
/// }
///
/// // Use in widgets with extensions
/// class MyHome extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Container(
///       child: context.isMobile
///           ? MobileLayout()
///           : context.isDesktop
///               ? DesktopLayout()
///               : TabletLayout(),
///     );
///   }
/// }
/// ```
class UniversalBreakpoints {
  static final UniversalBreakpoints _instance =
      UniversalBreakpoints._internal();

  /// Get the singleton instance of [UniversalBreakpoints].
  factory UniversalBreakpoints() => _instance;

  UniversalBreakpoints._internal();

  /// Current device screen width in logical pixels
  late double screenWidth;

  /// Current device screen height in logical pixels
  late double screenHeight;

  /// Scaling factor for text size based on screen width
  late double textScaleFactor;

  /// Scaling factor for width values based on screen width
  late double widthScaleFactor;

  /// Scaling factor for height values based on screen height
  late double heightScaleFactor;

  /// Screen type string (e.g., 'mobile', 'tablet', 'desktop')
  late String screenType;

  /// Main category of the current screen size
  late ScreenSizeCategory screenSizeCategory;

  /// Ultra-granular sub-category of the current screen size
  late ScreenSizeSubCategory screenSizeSubCategory;

  /// Initializes screen configuration based on current device metrics.
  ///
  /// Must be called once in your main app widget, typically in the
  /// build method of your root widget or in main().
  ///
  /// Example:
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   UniversalBreakpoints().init(context);
  ///   // Rest of your build
  /// }
  /// ```
  void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width > 3840 ? 3840 : mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    screenType = _getScreenType(screenWidth);
    screenSizeCategory = _getScreenSizeCategory(screenWidth);
    screenSizeSubCategory = _getScreenSizeSubCategory(screenWidth);

    double baseWidth = _getBaseWidth(screenSizeCategory);

    textScaleFactor = screenWidth / (baseWidth * 1.5);
    widthScaleFactor = screenWidth / (baseWidth * 1.5);
    heightScaleFactor = screenHeight / (baseWidth * 1.5);
  }

  String _getScreenType(double width) {
    if (width < ScreenBreakpoints.xxs) return 'xxs';
    if (width < ScreenBreakpoints.xs) return 'xs';
    if (width < ScreenBreakpoints.sm) return 'sm';
    if (width < ScreenBreakpoints.md) return 'md';
    if (width < ScreenBreakpoints.lg) return 'lg';
    if (width < ScreenBreakpoints.xl) return 'xl';
    if (width < ScreenBreakpoints.xxl) return 'xxl';
    if (width < ScreenBreakpoints.xxxl) return 'xxxl';
    return 'ultra';
  }

  ScreenSizeCategory _getScreenSizeCategory(double width) {
    if (width < ScreenBreakpoints.xs) return ScreenSizeCategory.xxs;
    if (width < ScreenBreakpoints.sm) return ScreenSizeCategory.xs;
    if (width < ScreenBreakpoints.md) return ScreenSizeCategory.sm;
    if (width < ScreenBreakpoints.lg) return ScreenSizeCategory.md;
    if (width < ScreenBreakpoints.xl) return ScreenSizeCategory.lg;
    if (width < ScreenBreakpoints.xxl) return ScreenSizeCategory.xl;
    if (width < ScreenBreakpoints.xxxl) return ScreenSizeCategory.xxl;
    return ScreenSizeCategory.xxxl;
  }

  ScreenSizeSubCategory _getScreenSizeSubCategory(double width) {
    if (width < 320) return ScreenSizeSubCategory.ultraCompact;
    if (width < 375) return ScreenSizeSubCategory.compact;
    if (width < 414) return ScreenSizeSubCategory.standard;
    if (width < 480) return ScreenSizeSubCategory.large;
    if (width < 568) return ScreenSizeSubCategory.extraLarge;
    if (width < 667) return ScreenSizeSubCategory.smallTablet;
    if (width < 768) return ScreenSizeSubCategory.standardTablet;
    if (width < 834) return ScreenSizeSubCategory.largeTablet;
    if (width < 1024) return ScreenSizeSubCategory.extraLargeTablet;
    if (width < 1280) return ScreenSizeSubCategory.smallDesktop;
    if (width < 1366) return ScreenSizeSubCategory.standardDesktop;
    if (width < 1440) return ScreenSizeSubCategory.largeDesktop;
    if (width < 1536) return ScreenSizeSubCategory.extraLargeDesktop;
    if (width < 1680) return ScreenSizeSubCategory.widescreen;
    if (width < 1920) return ScreenSizeSubCategory.fullHD;
    if (width < 2560) return ScreenSizeSubCategory.qhd;
    if (width < 3440) return ScreenSizeSubCategory.ultraWide;
    if (width < 3840) return ScreenSizeSubCategory.ultraHD;
    return ScreenSizeSubCategory.superUltraWide;
  }

  double _getBaseWidth(ScreenSizeCategory category) {
    switch (category) {
      case ScreenSizeCategory.xxs:
        return 320.0;
      case ScreenSizeCategory.xs:
        return 375.0;
      case ScreenSizeCategory.sm:
        return 480.0;
      case ScreenSizeCategory.md:
        return 768.0;
      case ScreenSizeCategory.lg:
        return 1024.0;
      case ScreenSizeCategory.xl:
        return 1280.0;
      case ScreenSizeCategory.xxl:
        return 1440.0;
      case ScreenSizeCategory.xxxl:
        return 1920.0;
    }
  }

  /// Scales a font size based on the current screen width.
  ///
  /// Applies [textScaleFactor] to the given [fontSize].
  ///
  /// Example:
  /// ```dart
  /// double scaledSize = UniversalBreakpoints().scaledFontSize(16);
  /// ```
  double scaledFontSize(double fontSize) {
    return fontSize * textScaleFactor;
  }

  /// Scales a width value based on the current screen width.
  ///
  /// Applies [widthScaleFactor] to the given [width].
  ///
  /// Example:
  /// ```dart
  /// double scaledWidth = UniversalBreakpoints().scaledWidth(100);
  /// ```
  double scaledWidth(double width) {
    return width * widthScaleFactor;
  }

  /// Scales a height value based on the current screen height.
  ///
  /// Applies [heightScaleFactor] to the given [height].
  ///
  /// Example:
  /// ```dart
  /// double scaledHeight = UniversalBreakpoints().scaledHeight(200);
  /// ```
  double scaledHeight(double height) {
    return height * heightScaleFactor;
  }

  /// Returns true if the screen is extra extra small (< 360px)
  bool get isXXS => screenSizeCategory == ScreenSizeCategory.xxs;

  /// Returns true if the screen is extra small (360-479px)
  bool get isXS => screenSizeCategory == ScreenSizeCategory.xs;

  /// Returns true if the screen is small (480-767px)
  bool get isSM => screenSizeCategory == ScreenSizeCategory.sm;

  /// Returns true if the screen is medium (768-1023px)
  bool get isMD => screenSizeCategory == ScreenSizeCategory.md;

  /// Returns true if the screen is large (1024-1279px)
  bool get isLG => screenSizeCategory == ScreenSizeCategory.lg;

  /// Returns true if the screen is extra large (1280-1439px)
  bool get isXL => screenSizeCategory == ScreenSizeCategory.xl;

  /// Returns true if the screen is extra extra large (1440-1919px)
  bool get isXXL => screenSizeCategory == ScreenSizeCategory.xxl;

  /// Returns true if the screen is ultra large (1920+px)
  bool get isXXXL => screenSizeCategory == ScreenSizeCategory.xxxl;

  /// Returns true if the device is a mobile device (< 768px width)
  bool get isMobile => screenSizeCategory.index <= ScreenSizeCategory.sm.index;

  /// Returns true if the device is a tablet (768-1279px width)
  bool get isTablet =>
      screenSizeCategory == ScreenSizeCategory.md ||
      screenSizeCategory == ScreenSizeCategory.lg;

  /// Returns true if the device is a desktop (1280+px width)
  bool get isDesktop =>
      screenSizeCategory.index >= ScreenSizeCategory.xl.index;

  /// Returns true if the device is a large screen (1440+px width)
  bool get isLargeScreen =>
      screenSizeCategory.index >= ScreenSizeCategory.xxl.index;

  /// Returns true if the device is in portrait orientation
  bool get isPortrait => screenHeight > screenWidth;

  /// Returns true if the device is in landscape orientation
  bool get isLandscape => screenWidth > screenHeight;

  /// Returns the aspect ratio of the screen (width / height)
  double get aspectRatio => screenWidth / screenHeight;

  /// Returns true if the screen has an ultra-wide aspect ratio (> 2.0)
  bool get isUltraWideAspect => aspectRatio > 2.0;

  /// Returns true if the screen has a standard aspect ratio (1.3-1.8)
  bool get isStandardAspect => aspectRatio >= 1.3 && aspectRatio <= 1.8;

  /// Returns true if the screen has a tall aspect ratio (< 1.3)
  bool get isTallAspect => aspectRatio < 1.3;
}

typedef SizeConfig = UniversalBreakpoints;
