# Best Practices

## 1. Choose the Right Abstraction Level

### Use Main Categories for Most Cases
```dart
// ✅ Good
if (context.isMobile) {
  // Mobile layout
} else if (context.isTablet) {
  // Tablet layout
} else {
  // Desktop layout
}
```

### Use Sub-Categories When You Need Precision
```dart
// ✅ Good for specific device handling
if (context.isStandardPhone) {
  // Handle specific phone models
} else if (context.isLargePhone) {
  // Handle larger phones
}
```

### Avoid Over-Using Sub-Categories
```dart
// ❌ Avoid - Too granular
if (context.isCompactPhone && context.isPortrait) {
  // This is too specific
}
```

## 2. Use ResponsiveValue for Complex Mappings

### Good: Centralized Values
```dart
// ✅ Good
final columns = context.responsiveValue<int>(
  mobile: 1,
  tablet: 2,
  desktop: 3,
);

final padding = context.responsiveValue<double>(
  mobile: 8,
  tablet: 16,
  desktop: 24,
);
```

### Avoid: Multiple Conditional Checks
```dart
// ❌ Avoid
late final int columns;
if (context.isMobile) {
  columns = 1;
} else if (context.isTablet) {
  columns = 2;
} else {
  columns = 3;
}
```

## 3. Cache Responsive Values

### Cache in StatefulWidget
```dart
class OptimizedResponsiveWidget extends StatefulWidget {
  @override
  _OptimizedResponsiveWidgetState createState() =>
      _OptimizedResponsiveWidgetState();
}

class _OptimizedResponsiveWidgetState
    extends State<OptimizedResponsiveWidget> {
  late int _columns;
  late double _padding;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _columns = context.responsiveValue<int>(
      mobile: 1,
      tablet: 2,
      desktop: 3,
    );
    _padding = context.responsiveValue<double>(
      mobile: 8,
      tablet: 16,
      desktop: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: _columns,
      children: [...],
    );
  }
}
```

## 4. Use Scaling Extensions Appropriately

### Scale Dimensions Consistently
```dart
// ✅ Good - Use scaling for all text and dimensions
Text(
  'Title',
  style: TextStyle(fontSize: 24.sF),
)

SizedBox(
  width: 300.sW,
  height: 100.sH,
)
```

### Avoid Mixed Scaling
```dart
// ❌ Avoid - Mix of scaled and fixed values
Text(
  'Title',
  style: TextStyle(fontSize: 24.sF),  // Scaled
)

SizedBox(
  width: 300,  // Fixed - inconsistent!
  height: 100.sH,  // Scaled
)
```

## 5. Test Across Multiple Breakpoints

### Use the Example App
```bash
cd example
flutter run -d web
```

Then resize your browser to test different breakpoints:
- **Mobile**: < 768px
- **Tablet**: 768px - 1279px
- **Desktop**: 1280px+

### Manual Testing Checklist
- [ ] Extra Small (< 360px)
- [ ] Small (360-479px)
- [ ] Medium (480-767px)
- [ ] Tablet (768-1023px)
- [ ] Large Desktop (1280+px)
- [ ] Portrait and Landscape orientations

## 6. Handle Orientation Changes Gracefully

### Detect Orientation Changes
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

### Animate Orientation Changes
```dart
class AnimatedOrientationWidget extends StatefulWidget {
  @override
  _AnimatedOrientationWidgetState createState() =>
      _AnimatedOrientationWidgetState();
}

class _AnimatedOrientationWidgetState
    extends State<AnimatedOrientationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: context.isPortrait
          ? PortraitLayout()
          : LandscapeLayout(),
    );
  }
}
```

## 7. Use ResponsiveWrapper for Dynamic Apps

### Perfect for Web and Desktop
```dart
// ✅ Use ResponsiveWrapper for web apps
ResponsiveWrapper(
  config: ResponsiveWrapperConfig(autoInitialize: true),
  child: MaterialApp(
    home: MyHomeScreen(),
  ),
)
```

### Enable Debug Logging During Development
```dart
// ✅ Good for debugging
ResponsiveWrapper(
  config: ResponsiveWrapperConfig(
    autoInitialize: true,
    debugPrint: true,  // See resize events
  ),
  child: MaterialApp(...),
)
```

## 8. Naming Conventions

### Use Semantic Names
```dart
// ✅ Good - Clear intent
final columnCount = context.responsiveValue<int>(
  mobile: 1,
  tablet: 2,
  desktop: 3,
);

final paddingSize = context.responsiveValue<double>(
  mobile: 8,
  tablet: 16,
  desktop: 24,
);
```

### Avoid Ambiguous Names
```dart
// ❌ Avoid - Not clear
final value1 = context.responsiveValue<int>(...);
final value2 = context.responsiveValue<double>(...);
```

## 9. Documentation

### Document Responsive Behavior
```dart
/// Adaptive grid that adjusts columns based on screen size:
/// - Mobile: 1 column
/// - Tablet: 2 columns
/// - Desktop: 3-4 columns
class ResponsiveGrid extends StatelessWidget {
  // ...
}
```

## 10. Performance Tips

### Minimize Rebuilds
- Use `const` constructors when possible
- Avoid calling `context.responsiveValue()` in build methods repeatedly
- Cache calculated values

### Use Efficient Layout Widgets
```dart
// ✅ Good - Efficient layout
GridView.builder(
  itemCount: items.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: columns,
  ),
  itemBuilder: (context, index) => ItemWidget(items[index]),
)
```

### Avoid Expensive Computations
```dart
// ❌ Avoid - Expensive computation on every build
build() {
  final complexValue = expensiveCalculation();
  return ...;
}

// ✅ Good - Calculate once and cache
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final complexValue = expensiveCalculation();
  
  @override
  build() => ...;
}
```
