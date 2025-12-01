import 'package:flutter/material.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

class DynamicGridDemo extends StatefulWidget {
  const DynamicGridDemo({super.key});

  @override
  State<DynamicGridDemo> createState() => _DynamicGridDemoState();
}

class _DynamicGridDemoState extends State<DynamicGridDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Grid Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Basic Grid'),
              Tab(text: 'Masonry Grid'),
              Tab(text: 'Animated Grid'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBasicGridDemo(),
            _buildMasonryGridDemo(),
            _buildAnimatedGridDemo(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicGridDemo() {
    return DynamicGrid(
      items: List.generate(12, (index) => index),
      itemBuilder: (context, item, index) {
        return GridItem(index: index, title: 'Item ${item + 1}');
      },
      columnConfig: GridColumnConfig(
        ultraCompact: 1,
        compact: 1,
        standard: 2,
        largePhone: 2,
        smallTablet: 2,
        largeTablet: 3,
        smallDesktop: 4,
        largeDesktop: 5,
      ),
      spacingConfig: GridSpacingConfig(
        ultraCompactSpacing: 8,
        compactSpacing: 8,
        standardSpacing: 12,
        largePhoneSpacing: 12,
        smallTabletSpacing: 16,
        largeTabletSpacing: 16,
        smallDesktopSpacing: 20,
        largeDesktopSpacing: 24,
      ),
      enableAnimations: true,
      padding: const EdgeInsets.all(16),
    );
  }

  Widget _buildMasonryGridDemo() {
    return MasonryDynamicGrid(
      items: List.generate(20, (index) => index),
      itemBuilder: (context, item, index) {
        return GridItem(index: index, title: 'Masonry ${item + 1}');
      },
      columnConfig: GridColumnConfig(
        compact: 2,
        largeTablet: 3,
        smallDesktop: 4,
      ),
      spacingConfig: GridSpacingConfig(defaultSpacing: 12),
      padding: const EdgeInsets.all(16),
    );
  }

  Widget _buildAnimatedGridDemo() {
    return AnimatedDynamicGrid(
      items: List.generate(15, (index) => index),
      itemBuilder: (context, item, index) {
        return GridItem(index: index, title: 'Animated ${item + 1}');
      },
      columnConfig: GridColumnConfig(
        compact: 1,
        largeTablet: 2,
        smallDesktop: 3,
      ),
      itemAspectRatio: 1.0,
      itemStyle: AnimatedGridItemStyle.fadeAndScale,
      animationDuration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(16),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;
  final String title;

  const GridItem({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.teal,
      Colors.indigo,
      Colors.amber,
      Colors.cyan,
      Colors.lime,
      Colors.deepOrange,
    ];

    final color = colors[index % colors.length];

    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withValues(alpha: 0.8), color],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 32.sF,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.sH),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sF, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
