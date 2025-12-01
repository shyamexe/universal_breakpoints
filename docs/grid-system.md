# Grid System

The Universal Breakpoints package includes a responsive grid system for building adaptive layouts.

## Dynamic Grid

Create responsive grids that automatically adjust the number of columns based on screen size.

```dart
import 'package:universal_breakpoints/universal_breakpoints.dart';

class ResponsiveGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: context.responsiveValue<int>(
        mobile: 1,
        smallTablet: 2,
        largeTablet: 3,
        desktop: 4,
      ),
      children: List.generate(12, (index) {
        return Card(
          child: Center(
            child: Text('Item ${index + 1}'),
          ),
        );
      }),
    );
  }
}
```

## Masonry Layout

Create Pinterest-style masonry grids with varied item sizes:

```dart
class MasonryGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final columns = context.responsiveValue<int>(
      mobile: 1,
      tablet: 2,
      desktop: 3,
    );

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: context.isMobile ? 1.0 : 0.8,
      ),
      itemBuilder: (context, index) {
        final isLarge = index % 5 == 0;
        return Container(
          color: Colors.blue[100 * ((index % 9) + 1)],
          child: Center(
            child: Text('Item ${index + 1}'),
          ),
        );
      },
    );
  }
}
```

## Animated Grid

Add entrance animations to grid items:

```dart
class AnimatedGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.responsiveValue<int>(
          mobile: 2,
          tablet: 3,
          desktop: 4,
        ),
      ),
      itemBuilder: (context, index) {
        return AnimatedItem(
          delay: Duration(milliseconds: index * 50),
          child: Card(
            child: Center(
              child: Text('Item ${index + 1}'),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedItem extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const AnimatedItem({
    required this.child,
    required this.delay,
  });

  @override
  _AnimatedItemState createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.2),
          end: Offset.zero,
        ).animate(_animation),
        child: widget.child,
      ),
    );
  }
}
```

## Staggered Grid

Create grids where items have different sizes:

```dart
class StaggeredGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.responsiveValue<int>(
          mobile: 2,
          tablet: 3,
          desktop: 4,
        ),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final isLarge = index == 0 || index == 5 || index == 10;
        return GridTile(
          child: Container(
            color: Colors.blue[100 * ((index % 9) + 1)],
            child: Center(
              child: Text(
                isLarge ? 'Large\n${index + 1}' : '${index + 1}',
                style: TextStyle(fontSize: isLarge ? 20.sF : 14.sF),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
```

## Responsive Spacing

Apply responsive spacing to grid items:

```dart
class ResponsiveSpacingGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spacing = context.responsiveValue<double>(
      mobile: 8,
      tablet: 12,
      desktop: 16,
    );

    final columns = context.responsiveValue<int>(
      mobile: 1,
      tablet: 2,
      desktop: 3,
    );

    return GridView.count(
      crossAxisCount: columns,
      mainAxisSpacing: spacing.sW,
      crossAxisSpacing: spacing.sW,
      children: List.generate(12, (index) {
        return Card(
          child: Center(
            child: Text('Item ${index + 1}'),
          ),
        );
      }),
    );
  }
}
```

## Best Practices for Grids

1. **Use responsiveValue** for column count
2. **Apply scaling** to spacing and dimensions
3. **Test on multiple devices** using the example app
4. **Consider aspect ratios** for different screen sizes
5. **Add animations** for better user experience
6. **Use GridView.builder** for large lists (better performance)
7. **Cache calculated values** to avoid recalculation on rebuild
