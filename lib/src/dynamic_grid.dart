import 'package:flutter/material.dart';
import 'extensions.dart';

/// A responsive grid widget that automatically adjusts columns, spacing, and item sizing
/// based on the current screen size and breakpoints.
///
/// Features:
/// - Auto-adjusting column count based on screen size
/// - Responsive spacing and gaps
/// - Smooth animated transitions between grid layouts
/// - Flexible item sizing strategies
/// - Aspect ratio control for grid items
///
/// Example:
/// ```dart
/// DynamicGrid(
///   items: List.generate(12, (index) => index),
///   itemBuilder: (context, item, index) {
///     return Card(
///       child: Center(child: Text('Item $index')),
///     );
///   },
/// )
/// ```
class DynamicGrid extends StatefulWidget {
  /// The list of items to display in the grid
  final List<dynamic> items;

  /// Builder function for creating grid items
  final Widget Function(BuildContext context, dynamic item, int index)
  itemBuilder;

  /// Custom column configuration for different breakpoints
  /// If not provided, uses default breakpoint-based columns
  final GridColumnConfig? columnConfig;

  /// Custom spacing configuration for different breakpoints
  /// If not provided, uses default responsive spacing
  final GridSpacingConfig? spacingConfig;

  /// Aspect ratio for grid items (width / height)
  /// Default is 1.0 (square items)
  final double itemAspectRatio;

  /// Whether to animate layout changes
  /// Default is true
  final bool enableAnimations;

  /// Animation duration for layout changes
  /// Default is 300ms
  final Duration animationDuration;

  /// Curve for animation
  /// Default is Curves.easeInOut
  final Curve animationCurve;

  /// Whether to use SliverGrid for custom scroll behavior
  /// Default is false
  final bool useSliverGrid;

  /// Scroll physics for the grid
  /// Only used when useSliverGrid is false
  final ScrollPhysics? scrollPhysics;

  /// Padding around the grid
  final EdgeInsetsGeometry padding;

  /// Main axis spacing between items
  /// Overrides spacingConfig if provided
  final double? mainAxisSpacing;

  /// Cross axis spacing between items
  /// Overrides spacingConfig if provided
  final double? crossAxisSpacing;

  const DynamicGrid({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.columnConfig,
    this.spacingConfig,
    this.itemAspectRatio = 1.0,
    this.enableAnimations = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.useSliverGrid = false,
    this.scrollPhysics,
    this.padding = const EdgeInsets.all(16),
    this.mainAxisSpacing,
    this.crossAxisSpacing,
  });

  @override
  State<DynamicGrid> createState() => _DynamicGridState();
}

class _DynamicGridState extends State<DynamicGrid>
    with TickerProviderStateMixin {
  late int _currentColumns;
  late double _currentMainAxisSpacing;
  late double _currentCrossAxisSpacing;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateGridConfig();
  }

  void _updateGridConfig() {
    _currentColumns = _calculateColumns();
    _currentMainAxisSpacing = _calculateMainAxisSpacing();
    _currentCrossAxisSpacing = _calculateCrossAxisSpacing();
  }

  int _calculateColumns() {
    if (widget.columnConfig != null) {
      return widget.columnConfig!.getColumnsForContext(context);
    }

    return context.responsiveValue<int>(
      smallMobile: 1,
      mobile: 1,
      largeMobile: 2,
      smallTablet: 2,
      tablet: 3,
      largeTablet: 3,
      smallDesktop: 4,
      desktop: 5,
      largeDesktop: 6,
      ultraWide: 8,
    );
  }

  double _calculateMainAxisSpacing() {
    if (widget.mainAxisSpacing != null) return widget.mainAxisSpacing!;

    if (widget.spacingConfig != null) {
      return widget.spacingConfig!.getMainAxisSpacingForContext(context);
    }

    return context.responsiveValue<double>(
      smallMobile: 8,
      mobile: 12,
      largeMobile: 12,
      smallTablet: 12,
      tablet: 16,
      largeTablet: 16,
      smallDesktop: 20,
      desktop: 24,
      largeDesktop: 32,
      ultraWide: 40,
    );
  }

  double _calculateCrossAxisSpacing() {
    if (widget.crossAxisSpacing != null) return widget.crossAxisSpacing!;

    if (widget.spacingConfig != null) {
      return widget.spacingConfig!.getCrossAxisSpacingForContext(context);
    }

    return context.responsiveValue<double>(
      smallMobile: 8,
      mobile: 12,
      largeMobile: 12,
      smallTablet: 12,
      tablet: 16,
      largeTablet: 16,
      smallDesktop: 20,
      desktop: 24,
      largeDesktop: 32,
      ultraWide: 40,
    );
  }

  Widget _buildGrid() {
    if (widget.useSliverGrid) {
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _currentColumns,
          mainAxisSpacing: _currentMainAxisSpacing,
          crossAxisSpacing: _currentCrossAxisSpacing,
          childAspectRatio: widget.itemAspectRatio,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return widget.itemBuilder(context, widget.items[index], index);
        }, childCount: widget.items.length),
      );
    }

    return GridView.builder(
      padding: widget.padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _currentColumns,
        mainAxisSpacing: _currentMainAxisSpacing,
        crossAxisSpacing: _currentCrossAxisSpacing,
        childAspectRatio: widget.itemAspectRatio,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return widget.itemBuilder(context, widget.items[index], index);
      },
      physics: widget.scrollPhysics ?? const BouncingScrollPhysics(),
    );
  }

  Widget _buildAnimatedGrid() {
    return AnimatedContainer(
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      child: _buildGrid(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.enableAnimations ? _buildAnimatedGrid() : _buildGrid();
  }
}

/// Configuration for grid column counts at different breakpoints
class GridColumnConfig {
  final int? ultraCompact;
  final int? compact;
  final int? standard;
  final int? largePhone;
  final int? phablet;
  final int? smallTablet;
  final int? standardTablet;
  final int? largeTablet;
  final int? extraLargeTablet;
  final int? smallDesktop;
  final int? standardDesktop;
  final int? largeDesktop;
  final int? extraLargeDesktop;
  final int? widescreen;
  final int? fullHD;
  final int? qhd;
  final int? ultraWide;
  final int? ultraHD;
  final int? superUltraWide;

  final int defaultColumns;

  GridColumnConfig({
    this.ultraCompact,
    this.compact,
    this.standard,
    this.largePhone,
    this.phablet,
    this.smallTablet,
    this.standardTablet,
    this.largeTablet,
    this.extraLargeTablet,
    this.smallDesktop,
    this.standardDesktop,
    this.largeDesktop,
    this.extraLargeDesktop,
    this.widescreen,
    this.fullHD,
    this.qhd,
    this.ultraWide,
    this.ultraHD,
    this.superUltraWide,
    this.defaultColumns = 2,
  });

  int getColumnsForContext(BuildContext context) {
    if (context.isUltraCompact && ultraCompact != null) {
      return ultraCompact!;
    }
    if (context.isCompactPhone && compact != null) {
      return compact!;
    }
    if (context.isStandardPhone && standard != null) {
      return standard!;
    }
    if (context.isLargePhone && largePhone != null) {
      return largePhone!;
    }
    if (context.isPhablet && phablet != null) {
      return phablet!;
    }
    if (context.isSmallTablet && smallTablet != null) {
      return smallTablet!;
    }
    if (context.isStandardTablet && standardTablet != null) {
      return standardTablet!;
    }
    if (context.isLargeTablet && largeTablet != null) {
      return largeTablet!;
    }
    if (context.isExtraLargeTablet && extraLargeTablet != null) {
      return extraLargeTablet!;
    }
    if (context.isSmallDesktop && smallDesktop != null) {
      return smallDesktop!;
    }
    if (context.isStandardDesktop && standardDesktop != null) {
      return standardDesktop!;
    }
    if (context.isLargeDesktop && largeDesktop != null) {
      return largeDesktop!;
    }
    if (context.isExtraLargeDesktop && extraLargeDesktop != null) {
      return extraLargeDesktop!;
    }
    if (context.isWidescreen && widescreen != null) {
      return widescreen!;
    }
    if (context.isFullHD && fullHD != null) {
      return fullHD!;
    }
    if (context.isQHD && qhd != null) {
      return qhd!;
    }
    if (context.isUltraWide && ultraWide != null) {
      return ultraWide!;
    }
    if (context.isUltraHD && ultraHD != null) {
      return ultraHD!;
    }
    if (context.isSuperUltraWide && superUltraWide != null) {
      return superUltraWide!;
    }

    return defaultColumns;
  }
}

/// Configuration for grid spacing at different breakpoints
class GridSpacingConfig {
  final double? ultraCompactSpacing;
  final double? compactSpacing;
  final double? standardSpacing;
  final double? largePhoneSpacing;
  final double? phabletSpacing;
  final double? smallTabletSpacing;
  final double? standardTabletSpacing;
  final double? largeTabletSpacing;
  final double? extraLargeTabletSpacing;
  final double? smallDesktopSpacing;
  final double? standardDesktopSpacing;
  final double? largeDesktopSpacing;
  final double? extraLargeDesktopSpacing;
  final double? widescreenSpacing;
  final double? fullHDSpacing;
  final double? qhdSpacing;
  final double? ultraWideSpacing;
  final double? ultraHDSpacing;
  final double? superUltraWideSpacing;

  final double defaultSpacing;

  GridSpacingConfig({
    this.ultraCompactSpacing,
    this.compactSpacing,
    this.standardSpacing,
    this.largePhoneSpacing,
    this.phabletSpacing,
    this.smallTabletSpacing,
    this.standardTabletSpacing,
    this.largeTabletSpacing,
    this.extraLargeTabletSpacing,
    this.smallDesktopSpacing,
    this.standardDesktopSpacing,
    this.largeDesktopSpacing,
    this.extraLargeDesktopSpacing,
    this.widescreenSpacing,
    this.fullHDSpacing,
    this.qhdSpacing,
    this.ultraWideSpacing,
    this.ultraHDSpacing,
    this.superUltraWideSpacing,
    this.defaultSpacing = 12.0,
  });

  double getMainAxisSpacingForContext(BuildContext context) {
    if (context.isUltraCompact && ultraCompactSpacing != null) {
      return ultraCompactSpacing!;
    }
    if (context.isCompactPhone && compactSpacing != null) {
      return compactSpacing!;
    }
    if (context.isStandardPhone && standardSpacing != null) {
      return standardSpacing!;
    }
    if (context.isLargePhone && largePhoneSpacing != null) {
      return largePhoneSpacing!;
    }
    if (context.isPhablet && phabletSpacing != null) {
      return phabletSpacing!;
    }
    if (context.isSmallTablet && smallTabletSpacing != null) {
      return smallTabletSpacing!;
    }
    if (context.isStandardTablet && standardTabletSpacing != null) {
      return standardTabletSpacing!;
    }
    if (context.isLargeTablet && largeTabletSpacing != null) {
      return largeTabletSpacing!;
    }
    if (context.isExtraLargeTablet && extraLargeTabletSpacing != null) {
      return extraLargeTabletSpacing!;
    }
    if (context.isSmallDesktop && smallDesktopSpacing != null) {
      return smallDesktopSpacing!;
    }
    if (context.isStandardDesktop && standardDesktopSpacing != null) {
      return standardDesktopSpacing!;
    }
    if (context.isLargeDesktop && largeDesktopSpacing != null) {
      return largeDesktopSpacing!;
    }
    if (context.isExtraLargeDesktop && extraLargeDesktopSpacing != null) {
      return extraLargeDesktopSpacing!;
    }
    if (context.isWidescreen && widescreenSpacing != null) {
      return widescreenSpacing!;
    }
    if (context.isFullHD && fullHDSpacing != null) {
      return fullHDSpacing!;
    }
    if (context.isQHD && qhdSpacing != null) {
      return qhdSpacing!;
    }
    if (context.isUltraWide && ultraWideSpacing != null) {
      return ultraWideSpacing!;
    }
    if (context.isUltraHD && ultraHDSpacing != null) {
      return ultraHDSpacing!;
    }
    if (context.isSuperUltraWide && superUltraWideSpacing != null) {
      return superUltraWideSpacing!;
    }

    return defaultSpacing;
  }

  double getCrossAxisSpacingForContext(BuildContext context) {
    return getMainAxisSpacingForContext(context);
  }
}

/// A masonry-style responsive grid widget with items of varying sizes
///
/// Allows items to have different widths in the grid using a custom layout algorithm.
///
/// Example:
/// ```dart
/// MasonryDynamicGrid(
///   items: List.generate(20, (i) => i),
///   columnConfig: GridColumnConfig(
///     mobile: 2,
///     tablet: 3,
///     desktop: 4,
///   ),
///   itemBuilder: (context, item, index) {
///     return Card(child: Center(child: Text('$item')));
///   },
/// )
/// ```
class MasonryDynamicGrid extends StatefulWidget {
  final List<dynamic> items;
  final Widget Function(BuildContext context, dynamic item, int index)
  itemBuilder;
  final GridColumnConfig? columnConfig;
  final GridSpacingConfig? spacingConfig;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final bool enableAnimations;
  final Duration animationDuration;
  final EdgeInsetsGeometry padding;

  const MasonryDynamicGrid({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.columnConfig,
    this.spacingConfig,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.enableAnimations = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.padding = const EdgeInsets.all(16),
  });

  @override
  State<MasonryDynamicGrid> createState() => _MasonryDynamicGridState();
}

class _MasonryDynamicGridState extends State<MasonryDynamicGrid> {
  late int _currentColumns;
  late double _currentMainAxisSpacing;
  late double _currentCrossAxisSpacing;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateGridConfig();
  }

  void _updateGridConfig() {
    _currentColumns = _calculateColumns();
    _currentMainAxisSpacing = _calculateMainAxisSpacing();
    _currentCrossAxisSpacing = _calculateCrossAxisSpacing();
  }

  int _calculateColumns() {
    if (widget.columnConfig != null) {
      return widget.columnConfig!.getColumnsForContext(context);
    }

    return context.responsiveValue<int>(mobile: 2, tablet: 3, desktop: 4);
  }

  double _calculateMainAxisSpacing() {
    return widget.mainAxisSpacing ??
        (widget.spacingConfig?.getMainAxisSpacingForContext(context) ??
            (context.isMobile ? 12 : 16));
  }

  double _calculateCrossAxisSpacing() {
    return widget.crossAxisSpacing ??
        (widget.spacingConfig?.getCrossAxisSpacingForContext(context) ??
            (context.isMobile ? 12 : 16));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.animationDuration,
      child: Padding(
        padding: widget.padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 0, maxHeight: double.infinity),
          child: _MasonryLayout(
            columns: _currentColumns,
            mainAxisSpacing: _currentMainAxisSpacing,
            crossAxisSpacing: _currentCrossAxisSpacing,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return widget.itemBuilder(context, widget.items[index], index);
            },
          ),
        ),
      ),
    );
  }
}

/// Internal widget for masonry layout
class _MasonryLayout extends StatelessWidget {
  final int columns;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const _MasonryLayout({
    required this.columns,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final columnWidgets = List<List<Widget>>.generate(columns, (index) => []);

    for (int i = 0; i < itemCount; i++) {
      columnWidgets[i % columns].add(
        Padding(
          padding: EdgeInsets.only(bottom: mainAxisSpacing),
          child: itemBuilder(context, i),
        ),
      );
    }

    final columnList = List.generate(columns, (columnIndex) {
      return Padding(
        padding: EdgeInsets.only(
          right: columnIndex < columns - 1 ? crossAxisSpacing : 0,
        ),
        child: ClipRect(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columnWidgets[columnIndex],
          ),
        ),
      );
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: columnList,
      ),
    );
  }
}

/// A responsive grid with custom item wrapper and animations
///
/// Provides built-in item animations and scaling effects.
///
/// Example:
/// ```dart
/// AnimatedDynamicGrid(
///   items: List.generate(12, (i) => i),
///   itemBuilder: (context, item, index) {
///     return Container(color: Colors.blue);
///   },
/// )
/// ```
class AnimatedDynamicGrid extends StatefulWidget {
  final List<dynamic> items;
  final Widget Function(BuildContext context, dynamic item, int index)
  itemBuilder;
  final GridColumnConfig? columnConfig;
  final GridSpacingConfig? spacingConfig;
  final double itemAspectRatio;
  final Duration animationDuration;
  final Curve animationCurve;
  final EdgeInsetsGeometry padding;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final AnimatedGridItemStyle itemStyle;

  const AnimatedDynamicGrid({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.columnConfig,
    this.spacingConfig,
    this.itemAspectRatio = 1.0,
    this.animationDuration = const Duration(milliseconds: 400),
    this.animationCurve = Curves.easeOutCubic,
    this.padding = const EdgeInsets.all(16),
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.itemStyle = AnimatedGridItemStyle.scaleIn,
  });

  @override
  State<AnimatedDynamicGrid> createState() => _AnimatedDynamicGridState();
}

class _AnimatedDynamicGridState extends State<AnimatedDynamicGrid>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late int _currentColumns;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _controllers = List.generate(
      widget.items.length,
      (index) =>
          AnimationController(duration: widget.animationDuration, vsync: this),
    );

    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 50), () {
        if (mounted) {
          _controllers[i].forward();
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentColumns = _calculateColumns();
  }

  int _calculateColumns() {
    if (widget.columnConfig != null) {
      return widget.columnConfig!.getColumnsForContext(context);
    }

    return context.responsiveValue<int>(mobile: 1, tablet: 2, desktop: 3);
  }

  double _calculateMainAxisSpacing() {
    if (widget.mainAxisSpacing != null) return widget.mainAxisSpacing!;

    if (widget.spacingConfig != null) {
      return widget.spacingConfig!.getMainAxisSpacingForContext(context);
    }

    return context.responsiveValue<double>(mobile: 12, tablet: 16, desktop: 24);
  }

  double _calculateCrossAxisSpacing() {
    if (widget.crossAxisSpacing != null) return widget.crossAxisSpacing!;

    if (widget.spacingConfig != null) {
      return widget.spacingConfig!.getCrossAxisSpacingForContext(context);
    }

    return context.responsiveValue<double>(mobile: 12, tablet: 16, desktop: 24);
  }

  Widget _buildAnimatedItem(int index) {
    final animation = _controllers[index];

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return _getAnimatedWidget(
          index: index,
          animation: animation,
          child: widget.itemBuilder(context, widget.items[index], index),
        );
      },
    );
  }

  Widget _getAnimatedWidget({
    required int index,
    required Animation<double> animation,
    required Widget child,
  }) {
    switch (widget.itemStyle) {
      case AnimatedGridItemStyle.scaleIn:
        return ScaleTransition(scale: animation, child: child);

      case AnimatedGridItemStyle.fadeIn:
        return FadeTransition(opacity: animation, child: child);

      case AnimatedGridItemStyle.slideInFromLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );

      case AnimatedGridItemStyle.slideInFromTop:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );

      case AnimatedGridItemStyle.fadeAndScale:
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: widget.padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _currentColumns,
        mainAxisSpacing: _calculateMainAxisSpacing(),
        crossAxisSpacing: _calculateCrossAxisSpacing(),
        childAspectRatio: widget.itemAspectRatio,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) => _buildAnimatedItem(index),
    );
  }
}

/// Animation style options for animated grid items
enum AnimatedGridItemStyle {
  scaleIn,
  fadeIn,
  slideInFromLeft,
  slideInFromTop,
  fadeAndScale,
}
