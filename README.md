# Universal Breakpoints
<!-- <img width="200" height="200" alt="ChatGPT Image Nov 28, 2025, 10_32_17 PM" src="https://github.com/user-attachments/assets/b898d7d6-d2f3-43a0-980b-46851a66a98e" /> -->

<div align="center">
  <img src="example/assets/icon.png" alt="Universal Breakpoints" width="120" height="120">
</div>

A simple, reusable, and platform-independent screen size breakpoints package for Flutter. Provides responsive design utilities for Android, iOS, Web, Windows, macOS, and Linux.

## ✨ Features

- **Platform Agnostic**: Works seamlessly on all Flutter platforms (Android, iOS, Web, Windows, macOS, Linux)
- **8 Main Breakpoint Categories**: From ultra-small phones to 4K+ displays
- **19 Ultra-Granular Sub-Categories**: Fine-grained control over specific device types
- **Automatic Scaling**: Built-in scaling factors for fonts, widths, and heights
- **Responsive Extensions**: Convenient BuildContext and num extensions
- **Orientation Detection**: Portrait/landscape and aspect ratio helpers
- **Singleton Pattern**: Single instance for consistent state across your app

## 🎨 Demo

Check out the **[Live Demo](https://shyamexe.github.io/universal_breakpoints/)** to see Universal Breakpoints in action!

## 🚀 Getting Started

### Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  universal_breakpoints: ^1.0.0
```

Then run:

```bash
flutter pub get
```

### Basic Setup

Initialize in your main app widget:

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

### Using ResponsiveWrapper for Dynamic Updates

The **ResponsiveWrapper** widget automatically handles screen size changes and rebuilds your UI dynamically when the device is resized or rotated. This is especially useful for web applications and desktop apps where users can resize the window.

Instead of manually initializing `UniversalBreakpoints` in each widget, wrap your app with `ResponsiveWrapper`:

```dart
import 'package:universal_breakpoints/universal_breakpoints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      config: ResponsiveWrapperConfig(
        autoInitialize: true,
        debugPrint: false,  // Set to true for resize debug logs
      ),
      child: MaterialApp(
        title: 'My App',
        home: const MyHome(),
      ),
    );
  }
}
```

**How it works:**
- Automatically initializes `UniversalBreakpoints` on each rebuild
- Listens to Flutter's `MediaQuery` system for screen size changes
- Triggers widget rebuilds whenever the screen is resized or orientation changes
- All descendant widgets automatically get responsive properties updated
- Optional debug logging to monitor resize events

**Example with debug enabled:**

```dart
ResponsiveWrapper(
  config: ResponsiveWrapperConfig(
    autoInitialize: true,
    debugPrint: true,  // Logs resize events to console
  ),
  child: MyApp(),
)
```

## 💻 Usage

### 1. BuildContext Extensions

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

### 2. Conditional Rendering

```dart
class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.isDesktop ? 32 : 16),
      child: Column(
        children: [
          if (context.isMobile) Text('Mobile View'),
          if (context.isTablet) Text('Tablet View'),
          if (context.isDesktop) Text('Desktop View'),
        ],
      ),
    );
  }
}
```

### 3. Responsive Values

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

### 4. Scaling Extensions

```dart
class ScaledText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Large Title',
          style: TextStyle(fontSize: 32.sF),
        ),
        Text(
          'Body Text',
          style: TextStyle(fontSize: 16.sF, height: 16.sFh),
        ),
        SizedBox(
          width: 200.sW,
          height: 100.sH,
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

## 📖 API Reference

### Screen Size Categories

```dart
context.isXXS    // Extra extra small (< 360px)
context.isXS     // Extra small (360-479px)
context.isSM     // Small (480-767px)
context.isMD     // Medium (768-1023px)
context.isLG     // Large (1024-1279px)
context.isXL     // Extra large (1280-1439px)
context.isXXL    // Extra extra large (1440-1919px)
context.isXXXL   // Ultra large (1920+px)
```

### Device Type Detection

```dart
context.isMobile      // < 768px
context.isTablet      // 768-1279px
context.isDesktop     // 1280+px
context.isLargeScreen // 1440+px
```

### Ultra-Granular Sub-Categories

```dart
context.isUltraCompact       // < 320px
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

### Orientation & Aspect Ratio

```dart
context.isPortrait         // Height > Width
context.isLandscape        // Width > Height
context.isUltraWideAspect  // Aspect ratio > 2.0
context.isStandardAspect   // Aspect ratio 1.3-1.8
context.isTallAspect       // Aspect ratio < 1.3
```

### Scaling Extensions

```dart
16.sF   // Scaled font size
100.sW  // Scaled width
50.sH   // Scaled height
14.sFh  // Calculated line height
```

### Direct Access

```dart
final config = UniversalBreakpoints();

config.screenWidth          // Current screen width
config.screenHeight         // Current screen height
config.textScaleFactor      // Font scaling factor
config.widthScaleFactor     // Width scaling factor
config.heightScaleFactor    // Height scaling factor
config.screenType           // Type as string
config.screenSizeCategory   // Main category
config.screenSizeSubCategory // Sub-category

config.scaledFontSize(16)   // Scale font size
config.scaledWidth(100)     // Scale width
config.scaledHeight(50)     // Scale height
```

## 📏 Breakpoint Values

| Category | Breakpoint | Range | Purpose |
|----------|-----------|-------|---------|
| **xxs** | 360px | 0-359px | Extra small phones |
| **xs** | 480px | 360-479px | Small phones |
| **sm** | 768px | 480-767px | Large phones |
| **md** | 1024px | 768-1023px | Tablets |
| **lg** | 1280px | 1024-1279px | Large tablets/desktops |
| **xl** | 1440px | 1280-1439px | Desktop |
| **xxl** | 1920px | 1440-1919px | Large desktop |
| **xxxl** | 2560px | 1920+px | 4K+ displays |

## 🎯 Advanced Examples

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

## ↩️ Backwards Compatibility

For code using the old `SizeConfig` name:

```dart
typedef SizeConfig = UniversalBreakpoints;

SizeConfig().init(context);       // Still works
UniversalBreakpoints().init(context); // New name
```

## ✅ Platform Support

- **Android**
- **iOS**
- **Web** (Chrome, Firefox, Safari, Edge)
- **Windows**
- **macOS**
- **Linux**

## 📦 Package Info

- **Minimal Dependencies**: Only depends on Flutter
- **Zero Configuration**: Works out of the box
- **Production Ready**: Used in multiple production applications
- **Fully Documented**: Complete API documentation

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

## 📄 License

MIT License - See LICENSE file for details.

---

For more information, visit [pub.dev](https://pub.dev/packages/universal_breakpoints)
