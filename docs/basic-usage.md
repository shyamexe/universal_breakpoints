# Basic Usage

## BuildContext Extensions

Check the current device type using BuildContext extensions:

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

### Available Device Type Properties

```dart
context.isMobile      // < 768px
context.isTablet      // 768-1279px
context.isDesktop     // 1280+px
context.isLargeScreen // 1440+px
```

## Conditional Rendering

Render different widgets based on screen size:

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

## Responsive Values

Use the `responsiveValue<T>()` helper to set different values per breakpoint:

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

## Scaling Extensions

Apply automatic scaling to fonts, widths, and heights:

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

### Scaling Modifiers

| Modifier | Purpose | Example |
|----------|---------|---------|
| `.sF` | Scaled font size | `16.sF` |
| `.sW` | Scaled width | `100.sW` |
| `.sH` | Scaled height | `50.sH` |
| `.sFh` | Calculated line height | `14.sFh` |

## Orientation Detection

Detect and respond to device orientation:

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

### Available Orientation Properties

```dart
context.isPortrait         // Height > Width
context.isLandscape        // Width > Height
context.isUltraWideAspect  // Aspect ratio > 2.0
context.isStandardAspect   // Aspect ratio 1.3-1.8
context.isTallAspect       // Aspect ratio < 1.3
```

## Screen Size Categories

Check specific screen size categories:

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
