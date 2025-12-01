# API Reference

## Screen Size Categories

The package provides 8 main breakpoint categories:

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

## Device Type Detection

Check general device categories:

```dart
context.isMobile      // < 768px
context.isTablet      // 768-1279px
context.isDesktop     // 1280+px
context.isLargeScreen // 1440+px
```

## Ultra-Granular Sub-Categories

The package includes 19 ultra-specific sub-categories for fine-grained control:

### Phone Categories
```dart
context.isUltraCompact       // < 320px
context.isCompactPhone       // 320-374px
context.isStandardPhone      // 375-413px
context.isLargePhone         // 414-479px
```

### Phablet & Tablet Categories
```dart
context.isPhablet            // 480-567px
context.isSmallTablet        // 568-667px
context.isStandardTablet     // 668-767px
context.isLargeTablet        // 768-833px
context.isExtraLargeTablet   // 834-1023px
```

### Desktop Categories
```dart
context.isSmallDesktop       // 1024-1279px
context.isStandardDesktop    // 1280-1365px
context.isLargeDesktop       // 1366-1439px
context.isExtraLargeDesktop  // 1440-1535px
```

### Large Display Categories
```dart
context.isWidescreen         // 1536-1679px
context.isFullHD             // 1680-1919px
context.isQHD                // 1920-2559px
context.isUltraWide          // 2560-3439px
context.isUltraHD            // 3440-3839px
context.isSuperUltraWide     // 3840+px
```

## Orientation & Aspect Ratio

```dart
context.isPortrait         // Height > Width
context.isLandscape        // Width > Height
context.isUltraWideAspect  // Aspect ratio > 2.0
context.isStandardAspect   // Aspect ratio 1.3-1.8
context.isTallAspect       // Aspect ratio < 1.3
```

## Scaling Extensions

Apply automatic scaling to dimensions:

```dart
16.sF   // Scaled font size
100.sW  // Scaled width
50.sH   // Scaled height
14.sFh  // Calculated line height
```

## Direct Access to Config

Access the UniversalBreakpoints singleton for direct configuration queries:

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

## Breakpoint Values

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

## ResponsiveValue Helper

The `responsiveValue<T>()` method provides a convenient way to define different values for different breakpoints:

```dart
final paddingSize = context.responsiveValue<double>(
  mobile: 8.0,
  smallTablet: 12.0,
  largeTablet: 16.0,
  desktop: 24.0,
);

final itemCount = context.responsiveValue<int>(
  mobile: 1,
  tablet: 2,
  desktop: 3,
);

final fontSize = context.responsiveValue<double>(
  mobile: 14.0,
  tablet: 16.0,
  desktop: 18.0,
);
```

## ResponsiveWrapper Configuration

When using `ResponsiveWrapper`, you can configure its behavior:

```dart
ResponsiveWrapper(
  config: ResponsiveWrapperConfig(
    autoInitialize: true,   // Auto-initialize on rebuild
    debugPrint: false,      // Log resize events
  ),
  child: MyApp(),
)
```
