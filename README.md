# Universal Breakpoints

A simple, reusable, and platform-independent screen size breakpoints package for Flutter. Provides responsive design utilities for Android, iOS, Web, Windows, macOS, and Linux.

## Features

- 🎯 **Platform Agnostic**: Works seamlessly on all Flutter platforms (Android, iOS, Web, Windows, macOS, Linux)
- 📱 **8 Main Breakpoint Categories**: From ultra-small phones to 4K+ displays
- 🎨 **19 Ultra-Granular Sub-Categories**: Fine-grained control over specific device types
- 📐 **Automatic Scaling**: Built-in scaling factors for fonts, widths, and heights
- 🔄 **Responsive Extensions**: Convenient BuildContext and num extensions
- 🧭 **Orientation Detection**: Portrait/landscape and aspect ratio helpers
- 🎭 **Singleton Pattern**: Single instance for consistent state across your app

## Getting Started

### Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  universal_breakpoints: ^0.0.1
```

Then run:

```bash
flutter pub get
```

### Basic Setup

Initialize the package in your main app widget:

```dart
import 'package:universal_breakpoints/universal_breakpoints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UniversalBreakpoints().init(context);
    return MaterialApp(
      title: 'My App',
      home: const MyHome(),
    );
  }
}
```

## Usage

### 1. Using BuildContext Extensions

The simplest way to use responsive design:

```dart
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive App')),
      body: context.isMobile
          ? const MobileLayout()
          : context.isTablet
              ? const TabletLayout()
              : const DesktopLayout(),
    );
  }
}
```

### 2. Conditional Rendering Based on Device Type

```dart
class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.isDesktop ? 32 : 16),
      child: Column(
        children: [
          if (context.isMobile)
            Text('Mobile View'),
          if (context.isTablet)
            Text('Tablet View'),
          if (context.isDesktop)
            Text('Desktop View'),
        ],
      ),
    );
  }
}
```

### 3. Responsive Values with Fallback

```dart
class GridLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int columns = context.responsiveValue<int>(
      mobile: 1,
      smallTablet: 2,
      largeTablet: 3,
      desktop: 4,
    );

    return GridView.count(
      crossAxisCount: columns,
      children: List.generate(12, (index) => Container()),
    );
  }
}
```

### 4. Responsive Scaling with Extensions

```dart
class ScaledText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Large Title',
          style: TextStyle(fontSize: 32.sF), // Scaled font size
        ),
        Text(
          'Body Text',
          style: TextStyle(fontSize: 16.sF, height: 16.sFh),
        ),
        SizedBox(
          width: 200.sW,  // Scaled width
          height: 100.sH, // Scaled height
          child: Container(),
        ),
      ],
    );
  }
}
```

### 5. Orientation-Specific Layouts

```dart
class OrientationAwareWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.isPortrait
        ? PortraitLayout()
        : LandscapeLayout();
  }
}
```

## Available Properties and Methods

### Screen Size Categories

```dart
// Main categories
context.isXXS   // Extra extra small (< 360px)
context.isXS    // Extra small (360-479px)
context.isSM    // Small (480-767px)
context.isMD    // Medium (768-1023px)
context.isLG    // Large (1024-1279px)
context.isXL    // Extra large (1280-1439px)
context.isXXL   // Extra extra large (1440-1919px)
context.isXXXL  // Ultra large (1920+px)
```

### Device Type Detection

```dart
context.isMobile        // < 768px
context.isTablet        // 768-1279px
context.isDesktop       // 1280+px
context.isLargeScreen   // 1440+px
```

### Ultra-Granular Sub-Categories

```dart
context.isUltraCompact       // < 320px (very small phones)
context.isCompactPhone       // 320-374px
context.isStandardPhone      // 375-413px
context.isLargePhone         // 414-479px
context.isPhablet            // 480-567px
context.isSmallTablet        // 568-667px
context.isStandardTablet     // 668-767px
context.isLargeTablet        // 768-833px
context.isExtraLargeTablet   // 834-1023px
context.isSmallDesktop       // 1024-1279px
context.isStandardDesktop    // 1280-1365px
context.isLargeDesktop       // 1366-1439px
context.isExtraLargeDesktop  // 1440-1535px
context.isWidescreen         // 1536-1679px
context.isFullHD             // 1680-1919px
context.isQHD                // 1920-2559px
context.isUltraWide          // 2560-3439px
context.isUltraHD            // 3440-3839px
context.isSuperUltraWide     // 3840+px
```

### Orientation and Aspect Ratio

```dart
context.isPortrait              // Height > Width
context.isLandscape             // Width > Height
context.isUltraWideAspect       // Aspect ratio > 2.0
context.isStandardAspect        // Aspect ratio 1.3-1.8
context.isTallAspect            // Aspect ratio < 1.3
```

### Scaling Extensions

```dart
// On any num (int or double)
int scaledSize = 16.sF;   // Scaled font size
double scaledW = 100.sW;  // Scaled width
double scaledH = 50.sH;   // Scaled height
double lineH = 14.sFh;    // Calculated line height
```

### Direct Access

```dart
UniversalBreakpoints config = UniversalBreakpoints();

config.screenWidth            // Current screen width
config.screenHeight           // Current screen height
config.textScaleFactor        // Font scaling factor
config.widthScaleFactor       // Width scaling factor
config.heightScaleFactor      // Height scaling factor
config.screenType             // Type as string
config.screenSizeCategory     // Main category
config.screenSizeSubCategory  // Sub-category

// Scaling methods
config.scaledFontSize(16)    // Returns scaled font size
config.scaledWidth(100)      // Returns scaled width
config.scaledHeight(50)      // Returns scaled height
```

## Breakpoint Values

| Category | Breakpoint | Range | Description |
|----------|-----------|-------|-------------|
| xxs | 360px | 0-359px | Extra extra small phones |
| xs | 480px | 360-479px | Extra small phones |
| sm | 768px | 480-767px | Small devices (large phones) |
| md | 1024px | 768-1023px | Medium (tablets) |
| lg | 1280px | 1024-1279px | Large tablets/small desktops |
| xl | 1440px | 1280-1439px | Extra large desktops |
| xxl | 1920px | 1440-1919px | Extra extra large desktops |
| xxxl | 2560px | 1920+px | Ultra large (4K+) |

## Advanced Examples

### Complex Responsive Layout

```dart
class ComplexResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.isMobile ? 16.0 : 32.0),
        child: Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: context.isMobile ? 24.sF : 32.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.sH),
            GridView.count(
              crossAxisCount: context.responsiveValue<int>(
                mobile: 1,
                tablet: 2,
                desktop: 3,
              ),
              mainAxisSpacing: 16.sH,
              crossAxisSpacing: 16.sW,
              children: List.generate(9, (index) {
                return Container(
                  width: double.infinity,
                  height: context.isMobile ? 150.sH : 200.sH,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue[100],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Adaptive Navigation

```dart
class AdaptiveNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      );
    } else if (context.isTablet) {
      return Row(
        children: [
          NavigationRail(destinations: [...]),
          Expanded(child: Content()),
        ],
      );
    } else {
      return Row(
        children: [
          SideNavigation(),
          Expanded(child: Content()),
        ],
      );
    }
  }
}
```

## Backwards Compatibility

For code using the old `SizeConfig` name, a typedef is provided:

```dart
typedef SizeConfig = UniversalBreakpoints;

// Both work identically
SizeConfig().init(context);
UniversalBreakpoints().init(context);
```

## Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

## License

This package is licensed under the MIT License - see the LICENSE file for details.

## Additional Information

- **Minimal Dependencies**: Only depends on Flutter
- **Zero Configuration**: Works out of the box
- **Fully Documented**: Complete API documentation
- **Production Ready**: Used in multiple production applications

For more information, visit [pub.dev](https://pub.dev/packages/universal_breakpoints)
