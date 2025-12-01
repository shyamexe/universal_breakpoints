# Example App - Universal Breakpoints Showcase

A comprehensive Flutter web application demonstrating all features of the Universal Breakpoints package.

## 🚀 Quick Start

```bash
cd example
flutter run -d web
```

Open your browser and resize the window to see responsive behavior in action.

## Project Structure

```
example/
├── README.md                  # Detailed example app documentation
├── pubspec.yaml              # Example app dependencies
├── lib/
│   ├── main.dart             # App initialization (39 lines)
│   ├── pages/
│   │   └── dynamic_grid_demo.dart        # Dynamic grid showcase (163 lines)
│   └── screens/
│       ├── home_screen.dart              # Navigation hub (108 lines)
│       ├── breakpoints_showcase.dart     # Breakpoint visualization (195 lines)
│       ├── responsive_layouts.dart       # Layout examples (269 lines)
│       ├── device_detection.dart         # Device detection demo (337 lines)
│       ├── scaling_extensions.dart       # Scaling showcase (329 lines)
│       ├── advanced_examples.dart        # Advanced patterns (428 lines)
│       └── docs_example.dart             # Feature documentation (1,099 lines)
└── widgets/                  # Custom reusable widgets
```

**Total: 2,868 lines of fully-documented, production-ready example code**

## ✨ Features Demonstrated

### 1. Breakpoints Showcase Screen (195 lines)

Displays:
- Real-time screen metrics (width & height)
- Active breakpoint indicator
- All 8 breakpoint thresholds with color-coded cards
- Current screen type and category

Learn:
- How to detect current breakpoint
- All available breakpoint values
- Real-time screen dimension tracking

### 2. Responsive Layouts Screen (269 lines)

Demonstrates:
- **Responsive Grid**: Auto-adjusting columns (mobile: 1, tablet: 2, desktop: 3-4)
- **Device Type Layout**: Mobile stack → tablet split → desktop multi-column
- **Responsive Spacing**: Dynamic padding that scales with screen

Learn:
- Building layouts that work on all devices
- Conditional rendering based on device type
- Responsive padding calculations

### 3. Device Detection Screen (337 lines)

Shows:
- Device type detection (Mobile/Tablet/Desktop/Large Screen)
- All 19 sub-category badges with active indicator
- Orientation detection (Portrait/Landscape)
- Aspect ratio information with real-time values

Learn:
- Using device type detection helpers
- Accessing sub-categories
- Orientation and aspect ratio checks

### 4. Scaling Extensions Screen (329 lines)

Features:
- Current scaling factors display
- Font size scaling at 6 different base sizes
- Width and height scaling demonstrations
- Line height calculation (`sFh`) showcase

Learn:
- Using `.sF` (scaled font size)
- Using `.sW` (scaled width)
- Using `.sH` (scaled height)
- Using `.sFh` (calculated line height)

### 5. Advanced Examples Screen (428 lines)

Shows:
- **Responsive Value Helper**: Fine-grained control with `responsiveValue<T>()`
- **Adaptive Navigation**: Mobile buttons → tablet chips → desktop expanded
- **Complex Grid Layout**: Multi-column with adaptive aspect ratios
- **Dynamic Padding Calculator**: Real-time padding calculations

Learn:
- Production patterns and best practices
- Complex responsive logic
- Real-world use cases

### 6. Dynamic Grid Demo (163 lines)

Demonstrates three powerful grid systems:

**Basic Dynamic Grid:**
- Auto-adjusting columns per breakpoint
- Responsive spacing that scales with screen size
- Smooth animations on layout changes
- 11-level breakpoint configuration
- Customizable item aspect ratios

Learn:
- Creating responsive grids without external packages
- Fine-tuning grid columns for each device size
- Dynamic spacing calculations

**Masonry Grid:**
- Pinterest-style masonry layouts
- Flexible item heights
- Responsive column counts
- Natural column-based layout

Learn:
- Building masonry layouts that adapt to screen size
- Flexible item sizing in grids
- Responsive multi-column layouts

**Animated Grid:**
- Multiple animation styles (fadeIn, scaleIn, slideIn, fadeAndScale)
- Smooth entrance animations
- Responsive column adjustments
- Customizable animation duration

Learn:
- Adding animations to grid item entrance
- Different animation style options
- Animation timing customization

### 7. Home Screen Navigation (108 lines)

Features:
- Adaptive navigation for all device types
- Bottom navigation bar on mobile
- Navigation rail on tablet/desktop
- Responsive screen switching

### 8. Documentation Examples Screen (1,099 lines)

Comprehensive feature documentation with 5 tabs:
- **Breakpoints Tab**: All 8 main breakpoints + 19 sub-categories with visual indicators
- **Device Types Tab**: Mobile, Tablet, Desktop, Large Screen detection
- **Orientation Tab**: Portrait/Landscape and aspect ratio detection
- **Scaling Tab**: Interactive scaling factor demonstrations
- **Responsive Tab**: Advanced responsive value methods

Learn:
- Interactive exploration of all features
- Copy-paste ready code examples
- Real-time feature demonstrations

## 📚 Key Implementation Patterns

### Pattern 1: BuildContext Extensions

```dart
if (context.isMobile) {
  return MobileLayout();
} else if (context.isTablet) {
  return TabletLayout();
} else {
  return DesktopLayout();
}
```

### Pattern 2: Responsive Values

```dart
int columns = context.responsiveValue<int>(
  mobile: 1,
  tablet: 2,
  desktop: 4,
);

GridView.count(
  crossAxisCount: columns,
  children: [...],
)
```

### Pattern 3: Scaling Extensions

```dart
Text(
  'Responsive Text',
  style: TextStyle(
    fontSize: 16.sF,
    height: 16.sFh,
  ),
)

SizedBox(
  width: 100.sW,
  height: 50.sH,
)
```

### Pattern 4: Initialization

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          UniversalBreakpoints().init(context);
          return const HomeScreen();
        },
      ),
    );
  }
}
```

### Pattern 5: Dynamic Grid - Basic Usage

```dart
DynamicGrid(
  items: products,
  itemBuilder: (context, product, index) {
    return ProductCard(product: product);
  },
  columnConfig: GridColumnConfig(
    ultraCompact: 1,
    compact: 1,
    standard: 2,
    largePhone: 2,
    smallTablet: 2,
    largeTablet: 3,
    smallDesktop: 4,
    largeDesktop: 5,
  ),
  spacingConfig: GridSpacingConfig(
    ultraCompactSpacing: 8,
    compactSpacing: 8,
    standardSpacing: 12,
    largePhoneSpacing: 12,
    smallTabletSpacing: 16,
    largeTabletSpacing: 16,
    smallDesktopSpacing: 20,
    largeDesktopSpacing: 24,
  ),
  itemAspectRatio: 0.75,
  padding: const EdgeInsets.all(16),
  enableAnimations: true,
)
```

### Pattern 6: Masonry Grid

```dart
MasonryDynamicGrid(
  items: images,
  itemBuilder: (context, image, index) {
    return Image.network(image.url);
  },
  columnConfig: GridColumnConfig(
    compact: 2,
    largeTablet: 3,
    smallDesktop: 4,
  ),
  spacingConfig: GridSpacingConfig(defaultSpacing: 12),
  padding: const EdgeInsets.all(16),
)
```

### Pattern 7: Animated Grid with Custom Styles

```dart
AnimatedDynamicGrid(
  items: items,
  itemBuilder: (context, item, index) {
    return ItemCard(item: item);
  },
  columnConfig: GridColumnConfig(
    compact: 1,
    largeTablet: 2,
    smallDesktop: 3,
  ),
  itemStyle: AnimatedGridItemStyle.fadeAndScale,
  animationDuration: const Duration(milliseconds: 500),
  itemAspectRatio: 1.0,
  padding: const EdgeInsets.all(16),
)
```

## 🔲 Dynamic Grid Configuration Options

### GridColumnConfig
Configure columns for each of the 11+ breakpoint levels:

```dart
GridColumnConfig(
  ultraCompact: 1,        // < 320px
  compact: 1,             // 320 - 374px
  standard: 2,            // 375 - 413px
  largePhone: 2,          // 414 - 479px
  phablet: 2,             // 480 - 567px
  smallTablet: 3,         // 568 - 667px
  standardTablet: 3,      // 668 - 767px
  largeTablet: 3,         // 768 - 833px
  extraLargeTablet: 4,    // 834 - 1023px
  smallDesktop: 4,        // 1024 - 1279px
  standardDesktop: 5,     // 1280 - 1365px
  largeDesktop: 6,        // 1366+px
  defaultColumns: 2,
)
```

### GridSpacingConfig
Configure spacing for responsive layouts:

```dart
GridSpacingConfig(
  ultraCompactSpacing: 4,
  compactSpacing: 8,
  standardSpacing: 12,
  largePhoneSpacing: 12,
  phabletSpacing: 12,
  smallTabletSpacing: 16,
  standardTabletSpacing: 16,
  largeTabletSpacing: 16,
  extraLargeTabletSpacing: 20,
  smallDesktopSpacing: 20,
  standardDesktopSpacing: 24,
  largeDesktopSpacing: 32,
  defaultSpacing: 12.0,
)
```

### AnimatedGridItemStyle
Choose from multiple animation styles:

```dart
enum AnimatedGridItemStyle {
  fadeIn,        // Fade in smoothly
  scaleIn,       // Scale up animation
  slideInFromLeft,  // Slide from left
  slideInFromTop,   // Slide from top
  fadeAndScale,  // Combined fade and scale
}
```

### DynamicGrid Properties
```dart
DynamicGrid(
  items: [],                              // Required: List of items
  itemBuilder: (context, item, i) {},     // Required: Widget builder
  columnConfig: GridColumnConfig(...),    // Optional: Custom columns
  spacingConfig: GridSpacingConfig(...),  // Optional: Custom spacing
  itemAspectRatio: 1.0,                  // Default: square items
  enableAnimations: true,                 // Default: true
  animationDuration: Duration(...),       // Default: 300ms
  animationCurve: Curves.easeInOut,      // Default: easeInOut
  useSliverGrid: false,                  // Default: false
  scrollPhysics: BouncingScrollPhysics(), // Default physics
  padding: EdgeInsets.all(16),           // Default padding
  mainAxisSpacing: 12,                   // Optional override
  crossAxisSpacing: 12,                  // Optional override
)
```

## 📱 Testing on Different Devices

### Chrome DevTools Device Emulation

1. Press **F12** to open DevTools
2. Click device toggle (**Ctrl+Shift+M**)
3. Select presets:
   - **iPhone SE** (375px) - Small mobile
   - **iPhone 12 Pro** (390px) - Standard mobile
   - **iPad** (768px) - Tablet
   - **iPad Pro** (1024px) - Large tablet
   - **Desktop** (1280px+) - Desktop

### Manual Testing

- Resize browser window from 300px to 2560px
- Test on real devices (phone, tablet, desktop)
- Test orientation changes

### Live Testing Tips

- Watch the breakpoint indicator change colors as you resize
- See navigation adapt from mobile to desktop
- Observe padding and spacing scale in real-time
- Notice grid columns adjust automatically

## ✅ Code Quality

All example code includes:
- Comprehensive documentation
- Clean, readable formatting
- Best practice patterns
- Reusable widget patterns
- Real-world use cases

## 📐 Responsive Behavior

The entire example app is fully responsive:

| Screen Size | Layout |
|------------|--------|
| < 768px | Mobile - Single column, bottom navigation |
| 768-1279px | Tablet - Navigation rail + content |
| 1280+px | Desktop - Expanded navigation rail + content |

## 🏗️ Building for Deployment

### Web Build

```bash
flutter build web --release
```

Output directory: `build/web/`

### Deploy to Hosting

- **Netlify**: Drag and drop `build/web` folder
- **Vercel**: Connect GitHub repository
- **Firebase**: `firebase deploy`
- **GitHub Pages**: Deploy `build/web` to `docs` folder
- **AWS S3**: Upload to S3 bucket

## 📖 Learning Resources

1. View the example in action
2. Resize the browser window to test responsiveness
3. Review `lib/screens/*.dart` source code
4. Check `/README.md` for API documentation

## 📊 File Sizes

| File | Lines | Size |
|------|-------|------|
| main.dart | 39 | 1.2 KB |
| pages/dynamic_grid_demo.dart | 163 | 5.4 KB |
| screens/home_screen.dart | 108 | 3.4 KB |
| screens/breakpoints_showcase.dart | 195 | 7.0 KB |
| screens/responsive_layouts.dart | 269 | 7.9 KB |
| screens/device_detection.dart | 337 | 11.5 KB |
| screens/scaling_extensions.dart | 329 | 10.0 KB |
| screens/advanced_examples.dart | 428 | 15.4 KB |
| screens/docs_example.dart | 1,099 | 38.8 KB |
| **Total** | **2,968** | **100.6 KB** |

## 🌟 Real-World Grid Examples

### E-Commerce Product Grid

```dart
class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return DynamicGrid(
      items: products,
      itemBuilder: (context, product, index) {
        return ProductCard(product: product);
      },
      columnConfig: GridColumnConfig(
        compact: 1,
        standard: 2,
        phablet: 2,
        smallTablet: 2,
        largeTablet: 3,
        smallDesktop: 4,
        largeDesktop: 5,
      ),
      spacingConfig: GridSpacingConfig(
        compactSpacing: 8,
        standardSpacing: 12,
        smallTabletSpacing: 12,
        largeTabletSpacing: 16,
        smallDesktopSpacing: 20,
        largeDesktopSpacing: 24,
      ),
      itemAspectRatio: 0.75,
      padding: const EdgeInsets.all(16),
    );
  }
}
```

### Image Gallery with Masonry Layout

```dart
class ImageGallery extends StatelessWidget {
  final List<String> imageUrls;

  const ImageGallery({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return MasonryDynamicGrid(
      items: imageUrls,
      itemBuilder: (context, imageUrl, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        );
      },
      columnConfig: GridColumnConfig(
        standard: 2,
        largeTablet: 3,
        smallDesktop: 4,
        largeDesktop: 5,
      ),
      spacingConfig: GridSpacingConfig(
        standardSpacing: 12,
        largeTabletSpacing: 16,
        smallDesktopSpacing: 20,
      ),
      padding: const EdgeInsets.all(16),
    );
  }
}
```

### Animated Feature Showcase

```dart
class FeatureShowcase extends StatelessWidget {
  final List<Feature> features;

  const FeatureShowcase({required this.features});

  @override
  Widget build(BuildContext context) {
    return AnimatedDynamicGrid(
      items: features,
      itemBuilder: (context, feature, index) {
        return FeatureCard(feature: feature);
      },
      columnConfig: GridColumnConfig(
        compact: 1,
        largePhone: 2,
        largeTablet: 2,
        smallDesktop: 3,
        largeDesktop: 4,
      ),
      itemStyle: AnimatedGridItemStyle.fadeAndScale,
      animationDuration: const Duration(milliseconds: 400),
      itemAspectRatio: 1.2,
      padding: const EdgeInsets.all(16),
    );
  }
}
```

### Dashboard Widget Grid

```dart
class DashboardGrid extends StatelessWidget {
  final List<DashboardWidget> widgets;

  const DashboardGrid({required this.widgets});

  @override
  Widget build(BuildContext context) {
    return DynamicGrid(
      items: widgets,
      itemBuilder: (context, widget, index) {
        return DashboardCard(widget: widget);
      },
      columnConfig: GridColumnConfig(
        compact: 1,
        standard: 2,
        smallTablet: 2,
        largeTablet: 3,
        smallDesktop: 4,
        standardDesktop: 5,
        largeDesktop: 6,
      ),
      spacingConfig: GridSpacingConfig(
        compactSpacing: 12,
        standardSpacing: 16,
        largeTabletSpacing: 20,
        smallDesktopSpacing: 24,
        largeDesktopSpacing: 32,
      ),
      itemAspectRatio: 1.1,
      padding: const EdgeInsets.all(20),
      enableAnimations: true,
    );
  }
}
```

## 🐛 Troubleshooting

### Grid Issues

**Grid columns not adjusting when screen resizes:**
- Ensure `GridColumnConfig` values are set for the breakpoints you're targeting
- Use context extensions (e.g., `context.isLargeDesktop`) to verify current breakpoint
- Check that widget is inside a BuildContext with MediaQuery

**Items overlapping or layout breaks:**
- Verify `itemAspectRatio` is appropriate for your content
- Check `spacingConfig` values aren't too large
- Reduce number of columns in your `GridColumnConfig`

**Animations not smooth:**
- Reduce animation duration for better performance
- Check device performance capabilities
- Use `enableAnimations: false` if performance is critical
- Profile with DevTools to identify bottlenecks

**Grid items too small/large:**
- Adjust `itemAspectRatio` parameter
- Modify padding in `GridColumnConfig`
- Reduce number of columns for larger items

### General Issues

**App won't run:**

```bash
flutter clean
flutter pub get
flutter run -d web
```

**Scaling looks wrong:**

Check that `UniversalBreakpoints().init(context)` is called in a widget that has access to `MediaQuery`.

**Can't see changes:**

Make sure hot reload is enabled:

```bash
flutter run -d web --verbose
```

## 🚀 Next Steps

1. Run the example app
2. Explore all 5 showcase screens
3. Resize your browser to test responsiveness
4. Review the source code in `lib/screens/`
5. Check the main package README for API documentation
6. Integrate Universal Breakpoints into your own app

## 🤝 Support

- [example/README.md](README.md) - Detailed documentation
- [../README.md](../README.md) - Package API reference
- GitHub Issues - Report bugs
- GitHub Discussions - Ask questions

---

**Happy responsive designing!**
