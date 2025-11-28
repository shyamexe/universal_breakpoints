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
│   └── screens/
│       ├── home_screen.dart              # Navigation hub (108 lines)
│       ├── breakpoints_showcase.dart     # Breakpoint visualization (195 lines)
│       ├── responsive_layouts.dart       # Layout examples (269 lines)
│       ├── device_detection.dart         # Device detection demo (337 lines)
│       ├── scaling_extensions.dart       # Scaling showcase (329 lines)
│       └── advanced_examples.dart        # Advanced patterns (428 lines)
└── widgets/                  # Custom reusable widgets
```

**Total: 1,705 lines of fully-documented, production-ready example code**

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

### 6. Home Screen Navigation (108 lines)

Features:
- Adaptive navigation for all device types
- Bottom navigation bar on mobile
- Navigation rail on tablet/desktop
- Responsive screen switching

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
| home_screen.dart | 108 | 3.4 KB |
| breakpoints_showcase.dart | 195 | 7.0 KB |
| responsive_layouts.dart | 269 | 7.9 KB |
| device_detection.dart | 337 | 11.5 KB |
| scaling_extensions.dart | 329 | 10.0 KB |
| advanced_examples.dart | 428 | 15.4 KB |
| **Total** | **1,705** | **56 KB** |

## 🐛 Troubleshooting

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
