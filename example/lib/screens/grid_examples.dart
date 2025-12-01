import 'package:flutter/material.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

class GridExamples extends StatefulWidget {
  const GridExamples({super.key});

  @override
  State<GridExamples> createState() => _GridExamplesState();
}

class _GridExamplesState extends State<GridExamples> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: _selectedTabIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Grid Systems'),
          bottom: TabBar(
            onTap: (index) => setState(() => _selectedTabIndex = index),
            tabs: const [
              Tab(text: 'Basic Grid'),
              Tab(text: 'Masonry Grid'),
              Tab(text: 'Animated Grid'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBasicGridScreen(),
            _buildMasonryGridScreen(),
            _buildAnimatedGridScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicGridScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _SectionHeader(title: 'Basic Dynamic Grid'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _InfoCard(
              title: 'DynamicGrid',
              description:
                  'Responsive grid with auto-adjusting columns based on screen size',
              features: const [
                'Auto-adjusting columns',
                'Responsive spacing',
                'Smooth animations',
                'Customizable aspect ratio',
              ],
            ),
          ),
          _DemoBasicGrid(),
          _CodeExampleCard(
            title: 'Code Example',
            code: '''DynamicGrid(
  items: List.generate(12, (index) => index),
  itemBuilder: (context, item, index) {
    return GridItem(item: item);
  },
  columnConfig: GridColumnConfig(
    compact: 1,
    standard: 2,
    largePhone: 2,
    largeTablet: 3,
    smallDesktop: 4,
    largeDesktop: 5,
  ),
  spacingConfig: GridSpacingConfig(
    compactSpacing: 8,
    standardSpacing: 12,
    largeTabletSpacing: 16,
    smallDesktopSpacing: 20,
  ),
  padding: const EdgeInsets.all(16),
)''',
          ),
        ],
      ),
    );
  }

  Widget _buildMasonryGridScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _SectionHeader(title: 'Masonry Dynamic Grid'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _InfoCard(
              title: 'MasonryDynamicGrid',
              description:
                  'Pinterest-style masonry layouts with flexible item heights',
              features: const [
                'Natural column-based layout',
                'Flexible item heights',
                'Responsive columns',
                'Perfect for galleries',
              ],
            ),
          ),
          _DemoMasonryGrid(),
          _CodeExampleCard(
            title: 'Code Example',
            code: '''MasonryDynamicGrid(
  items: List.generate(20, (index) => index),
  itemBuilder: (context, item, index) {
    return MasonryItem(item: item);
  },
  columnConfig: GridColumnConfig(
    compact: 2,
    standard: 2,
    largeTablet: 3,
    smallDesktop: 4,
  ),
  spacingConfig: GridSpacingConfig(
    defaultSpacing: 12,
  ),
  padding: const EdgeInsets.all(16),
)''',
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedGridScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _SectionHeader(title: 'Animated Dynamic Grid'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _InfoCard(
              title: 'AnimatedDynamicGrid',
              description: 'Grid items with smooth entrance animations',
              features: const [
                'Multiple animation styles',
                'Smooth entrance effects',
                'Responsive columns',
                'Customizable duration',
              ],
            ),
          ),
          _AnimationStylesInfo(),
          _DemoAnimatedGrid(),
          _CodeExampleCard(
            title: 'Code Example',
            code: '''AnimatedDynamicGrid(
  items: List.generate(15, (index) => index),
  itemBuilder: (context, item, index) {
    return AnimatedItem(item: item);
  },
  columnConfig: GridColumnConfig(
    compact: 1,
    standard: 2,
    largeTablet: 2,
    smallDesktop: 3,
  ),
  itemStyle: AnimatedGridItemStyle.fadeAndScale,
  animationDuration: Duration(milliseconds: 500),
  padding: const EdgeInsets.all(16),
)''',
          ),
        ],
      ),
    );
  }
}

class _DemoBasicGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Live Demo', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          SizedBox(
            height: 400,
            child: DynamicGrid(
              items: List.generate(12, (index) => index),
              itemBuilder: (context, item, index) {
                return _GridItemCard(index: index, label: 'Item ${item + 1}');
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
              itemAspectRatio: 1.0,
              enableAnimations: true,
              padding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoMasonryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final gridHeight = screenWidth < 480 ? 600 : 500;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Live Demo', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          SizedBox(
            height: gridHeight.toDouble(),
            child: MasonryDynamicGrid(
              items: List.generate(12, (index) => index),
              itemBuilder: (context, item, index) {
                return _MasonryItemCard(
                  index: index,
                  label: 'Masonry ${item + 1}',
                  height: (index % 3 + 1) * 60.0,
                );
              },
              columnConfig: GridColumnConfig(
                ultraCompact: 1,
                compact: 2,
                standard: 2,
                largePhone: 2,
                smallTablet: 2,
                largeTablet: 3,
                smallDesktop: 4,
              ),
              spacingConfig: GridSpacingConfig(
                ultraCompactSpacing: 8,
                compactSpacing: 8,
                standardSpacing: 12,
                largePhoneSpacing: 12,
                smallTabletSpacing: 12,
                largeTabletSpacing: 12,
                smallDesktopSpacing: 12,
                largeDesktopSpacing: 12,
              ),
              padding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoAnimatedGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final gridHeight = screenWidth < 480 ? 500 : 400;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Live Demo (fadeAndScale)',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: gridHeight.toDouble(),
            child: AnimatedDynamicGrid(
              items: List.generate(15, (index) => index),
              itemBuilder: (context, item, index) {
                return _GridItemCard(
                  index: index,
                  label: 'Animated ${item + 1}',
                );
              },
              columnConfig: GridColumnConfig(
                ultraCompact: 1,
                compact: 1,
                standard: 2,
                largePhone: 2,
                smallTablet: 2,
                largeTablet: 2,
                smallDesktop: 3,
              ),
              itemStyle: AnimatedGridItemStyle.fadeAndScale,
              animationDuration: const Duration(milliseconds: 500),
              itemAspectRatio: 1.0,
              padding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimationStylesInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final styles = [
      ('fadeIn', 'Fade in smoothly'),
      ('scaleIn', 'Scale up animation'),
      ('slideInFromLeft', 'Slide from left'),
      ('slideInFromTop', 'Slide from top'),
      ('fadeAndScale', 'Combined fade and scale'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Animation Styles',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...styles.map(
                (style) => Tooltip(
                  message: style.$2,
                  child: Chip(label: Text(style.$1)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _GridItemCard extends StatelessWidget {
  final int index;
  final String label;

  const _GridItemCard({required this.index, required this.label});

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
                fontSize: 28.sF,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sF, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _MasonryItemCard extends StatelessWidget {
  final int index;
  final String label;
  final double height;

  const _MasonryItemCard({
    required this.index,
    required this.label,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.pink,
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
                fontSize: 20.sF,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.sF, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> features;

  const _InfoCard({
    required this.title,
    required this.description,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 16),
            Text('Features:', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            ...features.map(
              (feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Text(feature),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CodeExampleCard extends StatelessWidget {
  final String title;
  final String code;

  const _CodeExampleCard({required this.title, required this.code});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[700]!),
                ),
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    code,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 11,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
