import 'package:flutter/material.dart';
import 'size_config.dart';
import 'enums.dart';

/// Extension on [num] for convenient responsive scaling.
///
/// Provides shorthand methods for scaling numeric values based on screen size.
/// These extensions work with both [int] and [double] values.
///
/// Example:
/// ```dart
/// Text(
///   'Hello',
///   style: TextStyle(fontSize: 16.sF), // Scaled font size
/// )
/// Container(
///   width: 100.sW,   // Scaled width
///   height: 50.sH,   // Scaled height
///   child: SizedBox(),
/// )
/// ```
extension SizeConfigExtension on num {
  /// Returns a scaled font size based on screen width.
  ///
  /// Shorthand for: `UniversalBreakpoints().scaledFontSize(this.toDouble())`
  double get sF => UniversalBreakpoints().scaledFontSize(toDouble());

  /// Returns a scaled width value based on screen width.
  ///
  /// Shorthand for: `UniversalBreakpoints().scaledWidth(this.toDouble())`
  double get sW => UniversalBreakpoints().scaledWidth(toDouble());

  /// Returns a scaled height value based on screen height.
  ///
  /// Shorthand for: `UniversalBreakpoints().scaledHeight(this.toDouble())`
  double get sH => UniversalBreakpoints().scaledHeight(toDouble());

  /// Returns a calculated line height multiplier based on scaled font size.
  ///
  /// Provides optimal line heights for text at various font sizes.
  /// Uses the following rules:
  /// - >= 72px: 1.1
  /// - >= 64px: 1.15
  /// - >= 48px: 1.2
  /// - >= 36px: 1.25
  /// - >= 30px: 1.22
  /// - >= 24px: 1.266
  /// - >= 20px: 1.333
  /// - >= 18px: 1.4
  /// - >= 16px: 1.455
  /// - >= 14px: 1.5
  /// - >= 12px: 1.4
  /// - >= 10px: 1.3
  /// - < 10px: 1.5
  double get sFh {
    final scaledFontSize = sF;

    if (scaledFontSize >= 72) return 1.1;
    if (scaledFontSize >= 64) return 1.15;
    if (scaledFontSize >= 48) return 1.2;
    if (scaledFontSize >= 36) return 1.25;
    if (scaledFontSize >= 30) return 1.22;
    if (scaledFontSize >= 24) return 1.266;
    if (scaledFontSize >= 20) return 1.333;
    if (scaledFontSize >= 18) return 1.4;
    if (scaledFontSize >= 16) return 1.455;
    if (scaledFontSize >= 14) return 1.5;
    if (scaledFontSize >= 12) return 1.4;
    if (scaledFontSize >= 10) return 1.3;

    return 1.5;
  }
}

/// Extension on [BuildContext] for convenient responsive design.
///
/// Provides easy access to screen size checks and responsive values
/// directly from BuildContext in your widget build methods.
///
/// Example:
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return context.isMobile
///       ? MobileLayout()
///       : context.isDesktop
///           ? DesktopLayout()
///           : TabletLayout();
/// }
/// ```
extension ResponsiveExtensions on BuildContext {
  /// Returns the singleton instance of [UniversalBreakpoints].
  UniversalBreakpoints get sizeConfig => UniversalBreakpoints();

  bool get isXXS => UniversalBreakpoints().isXXS;
  bool get isXS => UniversalBreakpoints().isXS;
  bool get isSM => UniversalBreakpoints().isSM;
  bool get isMD => UniversalBreakpoints().isMD;
  bool get isLG => UniversalBreakpoints().isLG;
  bool get isXL => UniversalBreakpoints().isXL;
  bool get isXXL => UniversalBreakpoints().isXXL;
  bool get isXXXL => UniversalBreakpoints().isXXXL;

  bool get isMobile => UniversalBreakpoints().isMobile;
  bool get isTablet => UniversalBreakpoints().isTablet;
  bool get isDesktop => UniversalBreakpoints().isDesktop;
  bool get isLargeScreen => UniversalBreakpoints().isLargeScreen;

  bool get isPortrait => UniversalBreakpoints().isPortrait;
  bool get isLandscape => UniversalBreakpoints().isLandscape;

  bool get isUltraWideAspect => UniversalBreakpoints().isUltraWideAspect;
  bool get isStandardAspect => UniversalBreakpoints().isStandardAspect;
  bool get isTallAspect => UniversalBreakpoints().isTallAspect;

  bool get isUltraCompact =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.ultraCompact;
  bool get isCompactPhone =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.compact;
  bool get isStandardPhone =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.standard;
  bool get isLargePhone =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.large;
  bool get isPhablet =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.extraLarge;
  bool get isSmallTablet =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.smallTablet;
  bool get isStandardTablet =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.standardTablet;
  bool get isLargeTablet =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.largeTablet;
  bool get isExtraLargeTablet => UniversalBreakpoints().screenSizeSubCategory ==
      ScreenSizeSubCategory.extraLargeTablet;
  bool get isSmallDesktop =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.smallDesktop;
  bool get isStandardDesktop => UniversalBreakpoints().screenSizeSubCategory ==
      ScreenSizeSubCategory.standardDesktop;
  bool get isLargeDesktop =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.largeDesktop;
  bool get isExtraLargeDesktop => UniversalBreakpoints().screenSizeSubCategory ==
      ScreenSizeSubCategory.extraLargeDesktop;
  bool get isWidescreen =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.widescreen;
  bool get isFullHD =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.fullHD;
  bool get isQHD =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.qhd;
  bool get isUltraWide =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.ultraWide;
  bool get isUltraHD =>
      UniversalBreakpoints().screenSizeSubCategory == ScreenSizeSubCategory.ultraHD;
  bool get isSuperUltraWide => UniversalBreakpoints().screenSizeSubCategory ==
      ScreenSizeSubCategory.superUltraWide;

  /// Returns the current screen type as a string.
  String get screenType => UniversalBreakpoints().screenType;

  /// Returns the current main screen size category.
  ScreenSizeCategory get screenCategory => UniversalBreakpoints().screenSizeCategory;

  /// Returns the current ultra-granular screen size sub-category.
  ScreenSizeSubCategory get screenSubCategory =>
      UniversalBreakpoints().screenSizeSubCategory;

  /// Returns a responsive value based on the current screen size.
  ///
  /// Provides fine-grained control over values at different breakpoints.
  /// Falls back to broader categories if specific sizes are not provided.
  ///
  /// Parameters (from most specific to most general):
  /// - `smallMobile`: < 320px
  /// - `largeMobile`: 414-479px
  /// - `smallTablet`: 568-667px
  /// - `largeTablet`: 768-1023px
  /// - `smallDesktop`: 1024-1279px
  /// - `largeDesktop`: 1366-1439px
  /// - `ultraWide`: 2560+px
  /// - `mobile`: Generic mobile (required)
  /// - `tablet`: Generic tablet (fallback)
  /// - `desktop`: Generic desktop (fallback)
  ///
  /// Example:
  /// ```dart
  /// int columns = context.responsiveValue<int>(
  ///   mobile: 1,
  ///   tablet: 2,
  ///   desktop: 4,
  /// );
  /// ```
  T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
    T? smallMobile,
    T? largeMobile,
    T? smallTablet,
    T? largeTablet,
    T? smallDesktop,
    T? largeDesktop,
    T? ultraWide,
  }) {
    if (isUltraCompact && smallMobile != null) return smallMobile;
    if (isCompactPhone && smallMobile != null) return smallMobile;
    if (isLargePhone && largeMobile != null) return largeMobile;
    if (isPhablet && largeMobile != null) return largeMobile;
    if (isSmallTablet && smallTablet != null) return smallTablet;
    if (isLargeTablet && largeTablet != null) return largeTablet;
    if (isSmallDesktop && smallDesktop != null) return smallDesktop;
    if (isLargeDesktop && largeDesktop != null) return largeDesktop;
    if (isUltraWide && ultraWide != null) return ultraWide;

    if (isMobile) return mobile;
    if (isTablet) return tablet ?? desktop ?? mobile;
    return desktop ?? tablet ?? mobile;
  }
}
