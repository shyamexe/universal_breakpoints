# Universal Breakpoints

> A simple, reusable, and platform-independent screen size breakpoints package for Flutter

<div align="center">
  <img src="https://github.com/user-attachments/assets/b898d7d6-d2f3-43a0-980b-46851a66a98e" alt="Universal Breakpoints" width="120" height="120">
</div>

## ✨ Features

- **Platform Agnostic**: Works seamlessly on all Flutter platforms
- **8 Main Breakpoint Categories**: From ultra-small phones to 4K+ displays
- **19 Ultra-Granular Sub-Categories**: Fine-grained control over specific device types
- **Automatic Scaling**: Built-in scaling factors for fonts, widths, and heights
- **Responsive Extensions**: Convenient BuildContext and num extensions
- **Orientation Detection**: Portrait/landscape and aspect ratio helpers
- **Singleton Pattern**: Single instance for consistent state across your app
- **Dynamic Grid System**: Responsive grid widgets
- **Zero External Dependencies**: All grid features use only Flutter's built-in widgets

## 🚀 Quick Start

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

## 📖 Documentation

- [Getting Started](/getting-started.md) - Installation and setup
- [Basic Usage](/basic-usage.md) - BuildContext extensions and responsive values
- [API Reference](/api-reference.md) - Complete API documentation
- [Advanced Examples](/advanced-examples.md) - Production-ready patterns
- [Grid System](/grid-system.md) - Responsive grid and masonry layouts

## 🎨 Demo

Check out the **[Live Demo](https://shyamexe.github.io/universal_breakpoints/)** to see Universal Breakpoints in action!

## 📄 License

MIT License - See [LICENSE](https://github.com/shyamexe/universal_breakpoints/blob/main/LICENSE) file for details
