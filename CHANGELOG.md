# Changelog

All notable changes to the Universal Breakpoints package will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - Initial Release

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
