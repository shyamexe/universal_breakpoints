# ResponsiveWrapper

The **ResponsiveWrapper** widget automatically handles screen size changes and rebuilds your UI dynamically when the device is resized or rotated. This is especially useful for web applications and desktop apps where users can resize the window.

## Overview

Instead of manually initializing `UniversalBreakpoints` in each widget, wrap your app with `ResponsiveWrapper` to get automatic updates on screen changes.

## Basic Usage

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

## Configuration Options

### ResponsiveWrapperConfig

```dart
ResponsiveWrapperConfig(
  autoInitialize: true,   // Auto-initialize on rebuild
  debugPrint: false,      // Log resize events to console
)
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `autoInitialize` | bool | true | Automatically initialize UniversalBreakpoints on each rebuild |
| `debugPrint` | bool | false | Enable debug logging for resize events |

## How It Works

1. **Automatic Initialization**: Initializes `UniversalBreakpoints` on each rebuild
2. **MediaQuery Listening**: Listens to Flutter's `MediaQuery` system for screen size changes
3. **Dynamic Rebuilding**: Triggers widget rebuilds whenever the screen is resized or orientation changes
4. **Cascading Updates**: All descendant widgets automatically get responsive properties updated
5. **Optional Logging**: Optionally logs all resize events for debugging

## Debugging Resize Events

Enable debug logging to monitor resize events:

```dart
ResponsiveWrapper(
  config: ResponsiveWrapperConfig(
    autoInitialize: true,
    debugPrint: true,  // Logs resize events to console
  ),
  child: MyApp(),
)
```

Console output example:
```
[ResponsiveWrapper] Screen resized: 1920x1080
[ResponsiveWrapper] Category: lg
[ResponsiveWrapper] Device: Desktop
```

## Example: Web App with Dynamic Resizing

```dart
class ResponsiveWebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      config: ResponsiveWrapperConfig(
        autoInitialize: true,
        debugPrint: false,
      ),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Responsive Web App')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Screen Width: ${context.screenWidth}'),
                Text('Screen Height: ${context.screenHeight}'),
                Text('Device: ${context.isMobile ? 'Mobile' : context.isTablet ? 'Tablet' : 'Desktop'}'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Resize your window to see updates'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Comparison: Manual vs ResponsiveWrapper

### Manual Initialization
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UniversalBreakpoints().init(context);
    // Won't update on window resize
    return MaterialApp(...);
  }
}
```

### Using ResponsiveWrapper
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      config: ResponsiveWrapperConfig(autoInitialize: true),
      child: MaterialApp(...),
    );
  }
}
```

## Benefits

- ✅ Automatic initialization and updates
- ✅ Handles window resize and rotation gracefully
- ✅ Perfect for web and desktop applications
- ✅ Optional debug logging
- ✅ Simpler code compared to manual initialization
- ✅ No need to call `init()` manually in each widget

## When to Use

- **Web Applications**: Detect when users resize their browser window
- **Desktop Applications**: Handle window resizing events
- **Responsive Design**: Build truly responsive UIs that adapt dynamically
- **Development**: Use debug logging to understand breakpoint changes

## When to Use Manual Initialization

- **Mobile-only apps**: Fixed screen size doesn't require dynamic updates
- **Simple layouts**: When you don't expect screen size changes
- **Performance**: Manual control over when breakpoints are calculated
