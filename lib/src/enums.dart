/// Main screen size categories for responsive design.
///
/// These categories provide a broad classification of screen sizes:
/// - **xxs**: 0-359px - Extra extra small devices
/// - **xs**: 360-479px - Extra small devices
/// - **sm**: 480-767px - Small devices
/// - **md**: 768-1023px - Medium devices (tablets)
/// - **lg**: 1024-1279px - Large devices
/// - **xl**: 1280-1439px - Extra large devices (desktops)
/// - **xxl**: 1440-1919px - Extra extra large devices
/// - **xxxl**: 1920+px - Ultra large devices
enum ScreenSizeCategory {
  /// Extra extra small screens (< 360px)
  xxs,

  /// Extra small screens (360-479px)
  xs,

  /// Small screens (480-767px)
  sm,

  /// Medium screens (768-1023px)
  md,

  /// Large screens (1024-1279px)
  lg,

  /// Extra large screens (1280-1439px)
  xl,

  /// Extra extra large screens (1440-1919px)
  xxl,

  /// Ultra large screens (1920+px)
  xxxl,
}

/// Ultra-granular screen size sub-categories for precise control.
///
/// These sub-categories provide fine-grained control over specific device types
/// and their exact screen sizes for highly optimized responsive designs.
enum ScreenSizeSubCategory {
  /// Very small phones (< 320px)
  ultraCompact,

  /// Compact phones (320-374px)
  compact,

  /// Standard phones (375-413px)
  standard,

  /// Large phones (414-479px)
  large,

  /// Phablets (480-567px)
  extraLarge,

  /// Small tablets (568-667px)
  smallTablet,

  /// Standard tablets (668-767px)
  standardTablet,

  /// Large tablets (768-833px)
  largeTablet,

  /// Extra large tablets (834-1023px)
  extraLargeTablet,

  /// Small desktops (1024-1279px)
  smallDesktop,

  /// Standard desktops (1280-1365px)
  standardDesktop,

  /// Large desktops (1366-1439px)
  largeDesktop,

  /// Extra large desktops (1440-1535px)
  extraLargeDesktop,

  /// Widescreen displays (1536-1679px)
  widescreen,

  /// Full HD displays (1680-1919px)
  fullHD,

  /// QHD/2K displays (1920-2559px)
  qhd,

  /// Ultra wide displays (2560-3439px)
  ultraWide,

  /// 4K Ultra HD displays (3440-3839px)
  ultraHD,

  /// 5K+ displays (3840+px)
  superUltraWide,
}
