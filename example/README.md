# Universal Breakpoints Example App

A comprehensive Flutter web application showcasing all features and use cases of the **Universal Breakpoints** package.

## 📱 Overview

This example app is a responsive web showcase demonstrating:

- **Breakpoint Detection** - Current screen metrics and active breakpoint
- **Device Detection** - Device type detection (mobile/tablet/desktop)
- **Responsive Layouts** - Adaptive layouts for different screen sizes
- **Scaling Extensions** - Font size, width, height, and line height scaling
- **Advanced Patterns** - Complex real-world use cases and patterns

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>= 3.7.2)
- Modern web browser (Chrome, Firefox, Safari, Edge)

### Running the App

1. Navigate to the example directory:

```bash
cd example
```

2. Run the app on web:

```bash
flutter run -d web
```

Or with release optimizations:

```bash
flutter run -d web --release
```

3. Open your browser to the URL shown (typically `http://localhost:5173`)

## ✨ Features Showcase

### 1. Breakpoints Screen

**Shows:**
- Current screen dimensions (width & height)
- Active breakpoint threshold
- Visual indicator of current screen category
- All 8 breakpoint thresholds with color-coded cards
- Current screen type string

### 2. Responsive Layouts Screen

**Demonstrates:**
- **Responsive Grid** - Auto-adjusting columns (1 mobile, 2 tablet, 3-4 desktop)
- **Device Type Layout** - Different UI for mobile (stack), tablet (split), desktop (multi-column)
- **Responsive Spacing** - Padding and margins that scale with screen

### 3. Device Detection Screen

**Shows:**
- Device type detection (Mobile/Tablet/Desktop/Large Screen)
- All 19 ultra-granular sub-categories with active indicator
- Orientation detection (Portrait/Landscape)
- Aspect ratio information with real-time values

### 4. Scaling Extensions Screen

**Demonstrates:**
- Current scaling factors (text, width, height)
- Font size scaling at 6 different base sizes
- Width and height scaling examples
- Line height calculation (`sFh`) for optimal readability

### 5. Advanced Examples Screen

**Shows:**
- **Responsive Value Helper** - Fine-grained control with `responsiveValue<T>()`
- **Adaptive Navigation** - Mobile buttons → tablet chips → desktop expanded
- **Complex Grid Layout** - Multi-column grid with adaptive aspect ratios
- **Dynamic Padding Calculator** - Real-time padding calculations

## 📐 Responsive Behavior

The entire app is fully responsive:

- **Mobile** (< 768px) - Single column, bottom navigation
- **Tablet** (768-1279px) - Navigation rail + main content
- **Desktop** (1280+px) - Expanded navigation rail + main content

Try resizing your browser window or viewing on different devices to see the UI adapt in real-time.

## 📁 Code Structure

```
lib/
├── main.dart                 # App initialization
└── screens/
    ├── home_screen.dart              # Navigation hub
    ├── breakpoints_showcase.dart     # Breakpoint visualization
    ├── responsive_layouts.dart       # Layout examples
    ├── device_detection.dart         # Device detection demo
    ├── scaling_extensions.dart       # Scaling demo
    └── advanced_examples.dart        # Advanced patterns
```

## 📚 Key Implementation Patterns

### 1. Initialization

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

### 2. BuildContext Extensions

```dart
if (context.isMobile) {
  return MobileLayout();
} else if (context.isTablet) {
  return TabletLayout();
} else {
  return DesktopLayout();
}
```

### 3. Responsive Values

```dart
int columns = context.responsiveValue<int>(
  mobile: 1,
  tablet: 2,
  desktop: 4,
);
```

### 4. Scaling Extensions

```dart
Text(
  'Scaled Text',
  style: TextStyle(fontSize: 16.sF),
)

Container(
  width: 100.sW,
  height: 50.sH,
)
```

## 🏗️ Web Deployment

Build for web deployment:

```bash
flutter build web --release
```

Output: `build/web/`

Deploy to any static hosting service:
- **Netlify** - Drag and drop `build/web`
- **Vercel** - Connect GitHub repository
- **GitHub Pages** - Deploy to `docs` folder
- **Firebase Hosting** - `firebase deploy`
- **AWS S3** - Upload to S3 bucket

## 📱 Testing Responsive Behavior

### Using Chrome DevTools

1. Press **F12** to open DevTools
2. Click device toggle (**Ctrl+Shift+M**)
3. Select device presets:
   - iPhone SE (375px)
   - iPhone 12 Pro (390px)
   - iPad (768px)
   - iPad Pro (1024px)
   - Desktop (1280px+)

### Manual Testing

- Resize the browser window at different widths
- View on physical devices
- Test orientation changes

## ⚡ Performance Tips

The example app uses:
- Efficient widget rebuilding with `SingleChildScrollView`
- Optimized grid layouts with `GridView.count`
- Proper use of extensions to avoid redundant calculations

## 🐛 Troubleshooting

### App doesn't build

Ensure you have the latest Flutter:

```bash
flutter upgrade
```

### Scaling looks wrong

Make sure `UniversalBreakpoints().init(context)` is called in a widget that has access to `MediaQuery`.

### Extensions not working

Import the package correctly:

```dart
import 'package:universal_breakpoints/universal_breakpoints.dart';
```

## 📖 Further Reading

- [Main package README](../README.md) - Complete API documentation
- [Package source code](../lib/) - Implementation details
- [pub.dev](https://pub.dev/packages/universal_breakpoints) - Version information

## 🤝 Contributing

Found an issue? Feel free to open an issue or submit a pull request!

## 📄 License

This example is part of the Universal Breakpoints package, licensed under the MIT License.
