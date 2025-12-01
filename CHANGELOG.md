# Changelog

All notable changes to the Universal Breakpoints package will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.2] - Bug Fixes & Layout Improvements

### Fixed
- **BottomNavigationBar**: Fixed unbounded width constraint error in home screen navigation by replacing `SingleChildScrollView` + `ConstrainedBox` with `SizedBox`
- **AnimatedDynamicGrid**: Fixed layout issues on smaller devices by adding responsive height calculation and complete column configurations for all breakpoints (ultraCompact through smallDesktop)
- **MasonryDynamicGrid**: Fixed column overflow and layout issues by:
  - Using `ClipRect` to gracefully handle content overflow
  - Adding responsive height calculation for different screen sizes
  - Implementing complete column and spacing configurations for all breakpoints
  - Optimizing demo items to fit within height constraints

### Improved
- Better responsive behavior for grid systems on mobile devices
- More consistent layout handling across different screen sizes
- Enhanced grid performance on smaller devices

## [1.1.0] - Dynamic Grid System

### Added

**Dynamic Grid Widgets:**
- `DynamicGrid`: Responsive grid with auto-adjusting columns and spacing based on breakpoints
- `MasonryDynamicGrid`: Pinterest-style masonry layouts with flexible item heights
- `AnimatedDynamicGrid`: Grid items with smooth entrance animations (fadeIn, scaleIn, slideIn, fadeAndScale)

**Grid Configuration:**
- `GridColumnConfig`: Fine-tune column counts for each device size (11 breakpoint levels)
- `GridSpacingConfig`: Customize spacing at different breakpoints
- `AnimatedGridItemStyle`: Multiple animation styles for grid item entrance effects

**Features:**
- Fully responsive across all device sizes (mobile, tablet, desktop)
- Zero external dependencies (uses only Flutter built-in widgets)
- Smooth animations on layout changes
- Customizable item aspect ratio
- SliverGrid support for custom scroll behavior
- Flexible padding and spacing options

**Example Updates:**
- Enhanced example app with grid demonstrations
- Fixed BottomNavigationBar layout for mobile devices

**Documentation:**
- Added comprehensive Dynamic Grid System section in README.md (180+ lines)
- Multiple real-world usage examples
- Configuration guide for columns and spacing

**Testing:**
- Added `dynamic_grid_test.dart` with comprehensive test coverage

### Fixed
- BottomNavigationBar layout issue when using SingleChildScrollView in example app

## [1.0.1] - Initial Release

### Added

**Core Features:**
- 8 main breakpoint categories (xxs, xs, sm, md, lg, xl, xxl, xxxl)
- 19 ultra-granular sub-categories for precise device detection
- Automatic scaling system for responsive designs

**Extensions:**
- BuildContext extensions for device type detection (`isMobile`, `isTablet`, `isDesktop`, etc.)
- BuildContext extensions for screen size categories (`isXXS`, `isXS`, `isSM`, etc.)
- BuildContext extensions for orientation detection (`isPortrait`, `isLandscape`)
- BuildContext extensions for aspect ratio detection (`isTallAspect`, `isStandardAspect`, `isUltraWideAspect`)
- Num extensions for automatic scaling (`.sF`, `.sW`, `.sH`, `.sFh`)

**Singleton Pattern:**
- UniversalBreakpoints singleton class for global access
- Centralized initialization with BuildContext

**Responsive Helpers:**
- `responsiveValue<T>()` method for fine-grained responsive control
- Support for null coalescing and default values

**Direct API Access:**
- `screenWidth` and `screenHeight` properties
- Scaling factors: `textScaleFactor`, `widthScaleFactor`, `heightScaleFactor`
- Screen type information: `screenType`, `screenSizeCategory`, `screenSizeSubCategory`
- Scaling methods: `scaledFontSize()`, `scaledWidth()`, `scaledHeight()`

**Platform Support:**
- Android
- iOS
- Web (Chrome, Firefox, Safari, Edge)
- Windows
- macOS
- Linux

**Backwards Compatibility:**
- Typedef `SizeConfig` provided for code using the old name

**Example Application:**
- Comprehensive showcase app with 6 screens (1,705 lines of code)
- Breakpoints visualization
- Responsive layouts demonstrations
- Device detection showcase
- Scaling extensions examples
- Advanced real-world patterns

**Documentation:**
- Complete API documentation in README.md
- Package structure overview in PACKAGE_STRUCTURE.md
- Example app documentation in EXAMPLE_APP.md and example/README.md
- Inline code documentation and comments
- Best practice patterns and use cases

**Testing:**
- Unit tests for core functionality

**Quality Assurance:**
- Zero lint issues (flutter analyze)
- Production-ready code
- Minimal dependencies (Flutter only)
- Zero configuration required

---

## Unreleased

### Planned Features

- Custom breakpoint configuration
- Theme-aware scaling options
- Performance optimizations
- Additional device detection helpers
- TypeScript/JavaScript web support

---

For more information, visit [pub.dev](https://pub.dev/packages/universal_breakpoints)
