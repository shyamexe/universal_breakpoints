/// Defines standard screen width breakpoints for responsive design.
///
/// These breakpoints are used to determine the current [ScreenSizeCategory]
/// and provide consistent responsive behavior across all platforms.
///
/// The breakpoints follow a mobile-first approach:
/// - **xxs**: 360px - Extra extra small (very small phones)
/// - **xs**: 480px - Extra small (small phones)
/// - **sm**: 768px - Small (tablets)
/// - **md**: 1024px - Medium (larger tablets)
/// - **lg**: 1280px - Large (small desktops)
/// - **xl**: 1440px - Extra large (medium desktops)
/// - **xxl**: 1920px - Extra extra large (large desktops)
/// - **xxxl**: 2560px - Ultra large (4K and beyond)
class ScreenBreakpoints {
  ScreenBreakpoints._();

  /// Breakpoint for extra extra small screens (360px)
  static const double xxs = 360.0;

  /// Breakpoint for extra small screens (480px)
  static const double xs = 480.0;

  /// Breakpoint for small screens (768px)
  static const double sm = 768.0;

  /// Breakpoint for medium screens (1024px)
  static const double md = 1024.0;

  /// Breakpoint for large screens (1280px)
  static const double lg = 1280.0;

  /// Breakpoint for extra large screens (1440px)
  static const double xl = 1440.0;

  /// Breakpoint for extra extra large screens (1920px)
  static const double xxl = 1920.0;

  /// Breakpoint for ultra large screens (2560px)
  static const double xxxl = 2560.0;
}
