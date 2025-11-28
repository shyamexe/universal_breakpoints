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
  UniversalBreakpoints get sizeConfig {
    MediaQuery.of(this);
    return UniversalBreakpoints();
  }

  bool get isXXS {
    MediaQuery.of(this);
    return UniversalBreakpoints().isXXS;
  }

  bool get isXS {
    MediaQuery.of(this);
    return UniversalBreakpoints().isXS;
  }

  bool get isSM {
    MediaQuery.of(this);
    return UniversalBreakpoints().isSM;
  }

  bool get isMD {
    MediaQuery.of(this);
    return UniversalBreakpoints().isMD;
  }

  bool get isLG {
    MediaQuery.of(this);
    return UniversalBreakpoints().isLG;
  }

  bool get isXL {
    MediaQuery.of(this);
    return UniversalBreakpoints().isXL;
  }

  bool get isXXL {
    MediaQuery.of(this);
    return UniversalBreakpoints().isXXL;
  }

  bool get isXXXL {
    MediaQuery.of(this);
    return UniversalBreakpoints().isXXXL;
  }

  bool get isMobile {
    MediaQuery.of(this);
    return UniversalBreakpoints().isMobile;
  }

  bool get isTablet {
    MediaQuery.of(this);
    return UniversalBreakpoints().isTablet;
  }

  bool get isDesktop {
    MediaQuery.of(this);
    return UniversalBreakpoints().isDesktop;
  }

  bool get isLargeScreen {
    MediaQuery.of(this);
    return UniversalBreakpoints().isLargeScreen;
  }

  bool get isPortrait {
    MediaQuery.of(this);
    return UniversalBreakpoints().isPortrait;
  }

  bool get isLandscape {
    MediaQuery.of(this);
    return UniversalBreakpoints().isLandscape;
  }

  bool get isUltraWideAspect {
    MediaQuery.of(this);
    return UniversalBreakpoints().isUltraWideAspect;
  }

  bool get isStandardAspect {
    MediaQuery.of(this);
    return UniversalBreakpoints().isStandardAspect;
  }

  bool get isTallAspect {
    MediaQuery.of(this);
    return UniversalBreakpoints().isTallAspect;
  }

  bool get isUltraCompact {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.ultraCompact;
  }

  bool get isCompactPhone {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.compact;
  }

  bool get isStandardPhone {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.standard;
  }

  bool get isLargePhone {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.large;
  }

  bool get isPhablet {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.extraLarge;
  }

  bool get isSmallTablet {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.smallTablet;
  }

  bool get isStandardTablet {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.standardTablet;
  }

  bool get isLargeTablet {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.largeTablet;
  }

  bool get isExtraLargeTablet {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.extraLargeTablet;
  }

  bool get isSmallDesktop {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.smallDesktop;
  }

  bool get isStandardDesktop {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.standardDesktop;
  }

  bool get isLargeDesktop {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.largeDesktop;
  }

  bool get isExtraLargeDesktop {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.extraLargeDesktop;
  }

  bool get isWidescreen {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.widescreen;
  }

  bool get isFullHD {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.fullHD;
  }

  bool get isQHD {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.qhd;
  }

  bool get isUltraWide {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.ultraWide;
  }

  bool get isUltraHD {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.ultraHD;
  }

  bool get isSuperUltraWide {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory ==
        ScreenSizeSubCategory.superUltraWide;
  }

  /// Returns the current screen type as a string.
  String get screenType {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenType;
  }

  /// Returns the current main screen size category.
  ScreenSizeCategory get screenCategory {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeCategory;
  }

  /// Returns the current ultra-granular screen size sub-category.
  ScreenSizeSubCategory get screenSubCategory {
    MediaQuery.of(this);
    return UniversalBreakpoints().screenSizeSubCategory;
  }

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
