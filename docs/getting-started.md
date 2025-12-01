# Getting Started

## Installation

### Add to pubspec.yaml

```yaml
dependencies:
  universal_breakpoints: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Basic Setup

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

## Using ResponsiveWrapper

For dynamic updates when the screen is resized or rotated:

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
        debugPrint: false,
      ),
      child: MaterialApp(
        title: 'My App',
        home: const MyHome(),
      ),
    );
  }
}
```

### How ResponsiveWrapper Works

- Automatically initializes `UniversalBreakpoints` on each rebuild
- Listens to Flutter's `MediaQuery` system for screen size changes
- Triggers widget rebuilds whenever the screen is resized or orientation changes
- All descendant widgets automatically get responsive properties updated
- Optional debug logging to monitor resize events

### Enable Debug Logging

```dart
ResponsiveWrapper(
  config: ResponsiveWrapperConfig(
    autoInitialize: true,
    debugPrint: true,  // Logs resize events to console
  ),
  child: MyApp(),
)
```

## Next Steps

- [Basic Usage](/basic-usage.md) - Learn how to use the package
- [API Reference](/api-reference.md) - Explore all available APIs
