# Advanced Examples

## Complex Responsive Layout

Build sophisticated layouts that adapt across all breakpoints:

```dart
class ComplexResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.isMobile ? 16.0 : 32.0),
        child: Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: context.isMobile ? 24.sF : 32.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.sH),
            GridView.count(
              crossAxisCount: context.responsiveValue<int>(
                mobile: 1,
                tablet: 2,
                desktop: 3,
              ),
              mainAxisSpacing: 16.sH,
              crossAxisSpacing: 16.sW,
              children: List.generate(9, (index) {
                return Container(
                  width: double.infinity,
                  height: context.isMobile ? 150.sH : 200.sH,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue[100],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Adaptive Navigation

Create navigation that changes based on screen size:

```dart
class AdaptiveNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      );
    } else if (context.isTablet) {
      return Row(
        children: [
          NavigationRail(
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(icon: Icon(Icons.search), label: Text('Search')),
              NavigationRailDestination(icon: Icon(Icons.person), label: Text('Profile')),
            ],
          ),
          Expanded(child: Container()),
        ],
      );
    } else {
      return Row(
        children: [
          SizedBox(
            width: 250.sW,
            child: Column(
              children: [
                ListTile(leading: Icon(Icons.home), title: Text('Home')),
                ListTile(leading: Icon(Icons.search), title: Text('Search')),
                ListTile(leading: Icon(Icons.person), title: Text('Profile')),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      );
    }
  }
}
```

## Responsive Grid with Adaptive Aspect Ratios

Create grids that adapt item aspect ratios based on screen size:

```dart
class ResponsiveGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final childAspectRatio = context.responsiveValue<double>(
      mobile: 0.8,
      tablet: 1.0,
      desktop: 1.2,
    );

    final crossAxisCount = context.responsiveValue<int>(
      mobile: 2,
      tablet: 3,
      desktop: 4,
    );

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: 12.sH,
        crossAxisSpacing: 12.sW,
      ),
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Text(
              'Item ${index + 1}',
              style: TextStyle(fontSize: 16.sF),
            ),
          ),
        );
      },
    );
  }
}
```

## Device-Specific Styling

Apply different styles based on exact device type:

```dart
class DeviceSpecificWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late final Color backgroundColor;
    late final double borderRadius;
    late final double fontSize;

    if (context.isStandardPhone) {
      backgroundColor = Colors.blue[50]!;
      borderRadius = 8;
      fontSize = 14.sF;
    } else if (context.isLargePhone) {
      backgroundColor = Colors.blue[100]!;
      borderRadius = 12;
      fontSize = 16.sF;
    } else if (context.isTablet) {
      backgroundColor = Colors.blue[200]!;
      borderRadius = 16;
      fontSize = 18.sF;
    } else {
      backgroundColor = Colors.blue[300]!;
      borderRadius = 20;
      fontSize = 20.sF;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(16.sW),
      child: Text(
        'Adaptive Content',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
```

## Dynamic Padding Calculator

Calculate padding dynamically based on screen size:

```dart
class DynamicPaddingExample extends StatelessWidget {
  double _getPadding(BuildContext context) {
    if (context.isXXS || context.isXS) return 8.0;
    if (context.isSM) return 12.0;
    if (context.isMD) return 16.0;
    if (context.isLG || context.isXL) return 24.0;
    return 32.0;
  }

  @override
  Widget build(BuildContext context) {
    final padding = _getPadding(context);

    return Padding(
      padding: EdgeInsets.all(padding.sW),
      child: Column(
        children: [
          Text(
            'Responsive Padding',
            style: TextStyle(fontSize: 24.sF),
          ),
          SizedBox(height: padding.sH),
          Text('Current padding: ${padding}px'),
        ],
      ),
    );
  }
}
```

## Orientation-Aware Layouts

Create layouts that adapt to orientation changes:

```dart
class OrientationAwareLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (context.isPortrait) {
      return Column(
        children: [
          Expanded(
            child: Container(color: Colors.blue, width: double.infinity),
          ),
          Expanded(
            child: Container(color: Colors.red, width: double.infinity),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: Container(color: Colors.blue, height: double.infinity),
          ),
          Expanded(
            child: Container(color: Colors.red, height: double.infinity),
          ),
        ],
      );
    }
  }
}
```

## Best Practices

1. **Use ResponsiveWrapper** for apps that need to handle window resizing
2. **Combine helpers** - use multiple utilities together for maximum flexibility
3. **Test on multiple devices** - use the example app to test different breakpoints
4. **Cache computed values** - avoid recalculating responsive values on every build
5. **Use sub-categories sparingly** - prefer main categories for most use cases
