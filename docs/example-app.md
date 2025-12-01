# Example App

The Universal Breakpoints package includes a comprehensive Flutter web application that demonstrates all features.

## Quick Start

```bash
cd example
flutter run -d web
```

Open your browser and resize the window to see responsive behavior in action.

## Project Structure

```
example/
├── lib/
│   ├── main.dart                    # App initialization
│   ├── pages/
│   │   └── dynamic_grid_demo.dart   # Dynamic grid showcase
│   └── screens/
│       ├── home_screen.dart         # Navigation hub
│       ├── breakpoints_showcase.dart # Breakpoint visualization
│       ├── responsive_layouts.dart  # Layout examples
│       ├── device_detection.dart    # Device detection demo
│       ├── scaling_extensions.dart  # Scaling showcase
│       ├── advanced_examples.dart   # Advanced patterns
│       └── docs_example.dart        # Feature documentation
└── widgets/                         # Custom reusable widgets
```

## Features Demonstrated

### Breakpoints Showcase

Displays:
- Real-time screen metrics (width & height)
- Active breakpoint indicator
- All 8 breakpoint thresholds with color-coded cards
- Current screen type and category

**Learn:**
- How to detect current breakpoint
- All available breakpoint values
- Real-time screen dimension tracking

### Responsive Layouts

Demonstrates:
- **Responsive Grid**: Auto-adjusting columns (mobile: 1, tablet: 2, desktop: 3-4)
- **Device Type Layout**: Mobile stack → tablet split → desktop multi-column
- **Responsive Spacing**: Dynamic padding that scales with screen

**Learn:**
- Building layouts that work on all devices
- Conditional rendering based on device type
- Responsive padding calculations

### Device Detection

Shows:
- Device type detection (Mobile/Tablet/Desktop/Large Screen)
- All 19 sub-category badges with active indicator
- Orientation detection (Portrait/Landscape)
- Aspect ratio information with real-time values

**Learn:**
- Using device type detection helpers
- Accessing sub-categories
- Orientation and aspect ratio checks

### Scaling Extensions

Features:
- Current scaling factors display
- Font size scaling at 6 different base sizes
- Width and height scaling demonstrations
- Line height calculation showcase

**Learn:**
- Using `.sF` (scaled font size)
- Using `.sW` (scaled width)
- Using `.sH` (scaled height)
- Using `.sFh` (calculated line height)

### Advanced Examples

Shows:
- **Responsive Value Helper**: Fine-grained control with `responsiveValue<T>()`
- **Adaptive Navigation**: Mobile buttons → tablet chips → desktop expanded
- **Complex Grid Layout**: Multi-column with adaptive aspect ratios
- **Dynamic Padding Calculator**: Real-time padding calculations

**Learn:**
- Production patterns and best practices
- Building sophisticated responsive UIs
- Handling edge cases

### Dynamic Grid Demo

Interactive page demonstrating:
- Column count adjustment on resize
- Item animations
- Responsive spacing
- Masonry layouts

**Learn:**
- Building dynamic grids
- Animating grid items
- Creating masonry layouts

## Testing the Example

### Test Different Screen Sizes

Use your browser's developer tools to test different screen sizes:

1. **Open Developer Tools**: Press `F12` or `Cmd+Option+I`
2. **Toggle Device Toolbar**: Click the device icon
3. **Select Device**: Choose from predefined devices
4. **Custom Dimensions**: Enter custom width/height

### Recommended Test Sizes

| Device | Width | Height | Category |
|--------|-------|--------|----------|
| Small Phone | 360px | 640px | xxs/xs |
| Standard Phone | 375px | 667px | xs/sm |
| Large Phone | 414px | 896px | sm |
| Phablet | 480px | 720px | sm |
| Tablet | 768px | 1024px | md |
| iPad Pro | 1024px | 1366px | lg |
| Desktop | 1280px | 720px | xl |
| Large Desktop | 1920px | 1080px | xxl |
| 4K Display | 2560px | 1440px | xxxl |

### Test Orientation

1. Open Developer Tools
2. Toggle the device orientation:
   - Portrait: Width < Height
   - Landscape: Width > Height

## Running Tests

```bash
cd example
flutter test
```

## Building for Production

```bash
cd example
flutter build web --release
```

Output will be in `example/build/web/`

## Customizing the Example

You can modify the example app to test your own implementations:

1. **Edit screens** in `lib/screens/`
2. **Add new demo pages** in `lib/pages/`
3. **Create custom widgets** in `lib/widgets/`

## Feedback and Issues

Found a bug or have a feature request? Open an issue on [GitHub](https://github.com/shyamexe/universal_breakpoints/issues)
