import 'package:flutter/material.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

class DocsExample extends StatefulWidget {
  const DocsExample({super.key});

  @override
  State<DocsExample> createState() => _DocsExampleState();
}

class _DocsExampleState extends State<DocsExample> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: _selectedTabIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Universal Breakpoints - Features'),
          bottom: TabBar(
            onTap: (index) => setState(() => _selectedTabIndex = index),
            tabs: const [
              Tab(text: 'Breakpoints'),
              Tab(text: 'Device Types'),
              Tab(text: 'Orientation'),
              Tab(text: 'Scaling'),
              Tab(text: 'Responsive'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBreakpointsTab(),
            _buildDeviceTypesTab(),
            _buildOrientationTab(),
            _buildScalingTab(),
            _buildResponsiveTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakpointsTab() {
    final config = UniversalBreakpoints();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: 'Screen Size Breakpoints'),
          _InfoBox(
            label: 'Current Width',
            value: '${config.screenWidth.toStringAsFixed(0)}px',
          ),
          _InfoBox(
            label: 'Current Category',
            value: config.screenType.toUpperCase(),
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'All Breakpoint Categories'),
          ..._buildBreakpointList(),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Sub-Categories'),
          _buildSubCategoryInfo(),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Usage Example'),
          _CodeBlock(
            code: '''// Check screen size
if (UniversalBreakpoints().isMobile) {
  // Mobile layout
} else if (UniversalBreakpoints().isTablet) {
  // Tablet layout
} else {
  // Desktop layout
}

// Or use context extensions
if (context.isMobile) {
  return MobileLayout();
}''',
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBreakpointList() {
    final config = UniversalBreakpoints();
    final breakpoints = [
      ('XXS', 'Extra Extra Small', '< 360px', config.isXXS),
      ('XS', 'Extra Small', '360 - 479px', config.isXS),
      ('SM', 'Small', '480 - 767px', config.isSM),
      ('MD', 'Medium', '768 - 1023px', config.isMD),
      ('LG', 'Large', '1024 - 1279px', config.isLG),
      ('XL', 'Extra Large', '1280 - 1439px', config.isXL),
      ('XXL', 'Extra Extra Large', '1440 - 1919px', config.isXXL),
      ('XXXL', 'Ultra Large', '1920+px', config.isXXXL),
    ];

    return breakpoints.map((bp) {
      return _BreakpointCard(
        label: bp.$1,
        description: bp.$2,
        range: bp.$3,
        isActive: bp.$4,
      );
    }).toList();
  }

  Widget _buildSubCategoryInfo() {
    final config = UniversalBreakpoints();
    final subCategory = config.screenSizeSubCategory;

    final categories = [
      (
        'Ultra Compact',
        '< 320px',
        subCategory == ScreenSizeSubCategory.ultraCompact,
      ),
      ('Compact', '320 - 374px', subCategory == ScreenSizeSubCategory.compact),
      (
        'Standard Phone',
        '375 - 413px',
        subCategory == ScreenSizeSubCategory.standard,
      ),
      (
        'Large Phone',
        '414 - 479px',
        subCategory == ScreenSizeSubCategory.large,
      ),
      (
        'Phablet',
        '480 - 567px',
        subCategory == ScreenSizeSubCategory.extraLarge,
      ),
      (
        'Small Tablet',
        '568 - 667px',
        subCategory == ScreenSizeSubCategory.smallTablet,
      ),
      (
        'Standard Tablet',
        '668 - 767px',
        subCategory == ScreenSizeSubCategory.standardTablet,
      ),
      (
        'Large Tablet',
        '768 - 833px',
        subCategory == ScreenSizeSubCategory.largeTablet,
      ),
      (
        'Extra Large Tablet',
        '834 - 1023px',
        subCategory == ScreenSizeSubCategory.extraLargeTablet,
      ),
      (
        'Small Desktop',
        '1024 - 1279px',
        subCategory == ScreenSizeSubCategory.smallDesktop,
      ),
      (
        'Standard Desktop',
        '1280 - 1365px',
        subCategory == ScreenSizeSubCategory.standardDesktop,
      ),
      (
        'Large Desktop',
        '1366 - 1439px',
        subCategory == ScreenSizeSubCategory.largeDesktop,
      ),
      (
        'Extra Large Desktop',
        '1440 - 1535px',
        subCategory == ScreenSizeSubCategory.extraLargeDesktop,
      ),
      (
        'Widescreen',
        '1536 - 1679px',
        subCategory == ScreenSizeSubCategory.widescreen,
      ),
      ('Full HD', '1680 - 1919px', subCategory == ScreenSizeSubCategory.fullHD),
      ('QHD', '1920 - 2559px', subCategory == ScreenSizeSubCategory.qhd),
      (
        'Ultra Wide',
        '2560 - 3439px',
        subCategory == ScreenSizeSubCategory.ultraWide,
      ),
      (
        'Ultra HD (4K)',
        '3440 - 3839px',
        subCategory == ScreenSizeSubCategory.ultraHD,
      ),
      (
        'Super Ultra Wide (5K+)',
        '3840+px',
        subCategory == ScreenSizeSubCategory.superUltraWide,
      ),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          categories
              .map(
                (cat) => _SubCategoryChip(
                  label: cat.$1,
                  range: cat.$2,
                  isActive: cat.$3,
                ),
              )
              .toList(),
    );
  }

  Widget _buildDeviceTypesTab() {
    final config = UniversalBreakpoints();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: 'Device Type Detection'),
          _DeviceTypeCard(
            icon: Icons.smartphone,
            label: 'Mobile',
            isActive: config.isMobile,
            description: 'Width < 768px',
          ),
          _DeviceTypeCard(
            icon: Icons.tablet,
            label: 'Tablet',
            isActive: config.isTablet,
            description: 'Width 768 - 1279px',
          ),
          _DeviceTypeCard(
            icon: Icons.desktop_mac,
            label: 'Desktop',
            isActive: config.isDesktop,
            description: 'Width ≥ 1280px',
          ),
          _DeviceTypeCard(
            icon: Icons.fullscreen,
            label: 'Large Screen',
            isActive: config.isLargeScreen,
            description: 'Width ≥ 1440px',
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Code Examples'),
          _CodeBlock(
            code: '''// Using singleton
if (UniversalBreakpoints().isMobile) {
  print('Mobile Device');
}

// Using context extension (recommended)
if (context.isMobile) {
  return MobileWidget();
} else if (context.isTablet) {
  return TabletWidget();
} else if (context.isDesktop) {
  return DesktopWidget();
}

// Quick access
bool isDesktop = context.isDesktop;
bool isLargeScreen = context.isLargeScreen;''',
          ),
        ],
      ),
    );
  }

  Widget _buildOrientationTab() {
    final config = UniversalBreakpoints();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: 'Orientation Detection'),
          _InfoBox(
            label: 'Current Orientation',
            value: config.isPortrait ? 'Portrait' : 'Landscape',
          ),
          _InfoBox(
            label: 'Screen Aspect Ratio',
            value: config.aspectRatio.toStringAsFixed(2),
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Aspect Ratio Types'),
          _AspectRatioCard(
            label: 'Portrait / Tall',
            description: 'Aspect ratio < 1.3',
            isActive: config.isTallAspect,
          ),
          _AspectRatioCard(
            label: 'Standard',
            description: 'Aspect ratio 1.3 - 1.8',
            isActive: config.isStandardAspect,
          ),
          _AspectRatioCard(
            label: 'Ultra Wide',
            description: 'Aspect ratio > 2.0',
            isActive: config.isUltraWideAspect,
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Code Examples'),
          _CodeBlock(
            code: '''// Portrait/Landscape check
if (context.isPortrait) {
  // Portrait layout
  return Column(children: [...]);
} else {
  // Landscape layout
  return Row(children: [...]);
}

// Aspect ratio checks
if (context.isTallAspect) {
  // Tall screen handling
}

if (context.isUltraWideAspect) {
  // Ultra wide display handling
}''',
          ),
        ],
      ),
    );
  }

  Widget _buildScalingTab() {
    final config = UniversalBreakpoints();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: 'Scaling Factors'),
          _ScaleFactorCard(
            label: 'Text Scale Factor',
            value: config.textScaleFactor.toStringAsFixed(3),
            description: 'Applied to font sizes',
          ),
          _ScaleFactorCard(
            label: 'Width Scale Factor',
            value: config.widthScaleFactor.toStringAsFixed(3),
            description: 'Applied to widths',
          ),
          _ScaleFactorCard(
            label: 'Height Scale Factor',
            value: config.heightScaleFactor.toStringAsFixed(3),
            description: 'Applied to heights',
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Extension Methods'),
          _CodeBlock(
            code: '''// Scaled font size
Text(
  'Hello World',
  style: TextStyle(
    fontSize: 16.sF,
  ),
)

// Scaled width
Container(width: 100.sW)

// Scaled height
Container(height: 50.sH)

// Optimal line height
Text(
  'Multi-line text',
  style: TextStyle(
    fontSize: 14.sF,
    height: 14.sFh,
  ),
)''',
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Interactive Example'),
          _ScalingExampleCard(),
        ],
      ),
    );
  }

  Widget _buildResponsiveTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: 'Responsive Value Method'),
          _CodeBlock(
            code: '''// Basic usage
int columns = context.responsiveValue<int>(
  mobile: 1,
  tablet: 2,
  desktop: 4,
);

// With specific breakpoints
double fontSize = context.responsiveValue<double>(
  smallMobile: 12,
  mobile: 14,
  tablet: 16,
  desktop: 20,
);

// With fallback
var padding = context.responsiveValue<double>(
  mobile: 8,
  desktop: 24,
  // Falls back to desktop if tablet not specified
);''',
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Available Breakpoints'),
          const _ResponsiveValueTable(),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Complete Example'),
          _CodeBlock(
            code: '''class ResponsiveGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.responsiveValue<int>(
          mobile: 1,
          smallTablet: 2,
          largeTablet: 3,
          desktop: 4,
        ),
        mainAxisSpacing: context.responsiveValue<double>(
          mobile: 8,
          desktop: 16,
        ),
        crossAxisSpacing: context.responsiveValue<double>(
          mobile: 8,
          desktop: 16,
        ),
      ),
      itemBuilder: (context, index) => Card(
        child: Text(
          'Item \$index',
          style: TextStyle(
            fontSize: context.responsiveValue<double>(
              mobile: 14,
              tablet: 16,
              desktop: 18,
            ),
          ),
        ),
      ),
    );
  }
}''',
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: 'Responsive Widget Layout'),
          _CodeBlock(
            code: '''class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return MobileLayout();
    }
    if (context.isTablet) {
      return TabletLayout();
    }
    return DesktopLayout();
  }
}

// Or with responsiveValue for fine-grained control
class FlexibleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: context.responsiveValue<int>(
            mobile: 12,
            tablet: 4,
            desktop: 3,
          ),
          child: Sidebar(),
        ),
        Expanded(
          flex: context.responsiveValue<int>(
            mobile: 12,
            tablet: 8,
            desktop: 9,
          ),
          child: Content(),
        ),
      ],
    );
  }
}''',
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String label;
  final String value;

  const _InfoBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _BreakpointCard extends StatelessWidget {
  final String label;
  final String description;
  final String range;
  final bool isActive;

  const _BreakpointCard({
    required this.label,
    required this.description,
    required this.range,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:
            isActive
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:
              isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outlineVariant,
          width: isActive ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color:
                        isActive
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        isActive
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Text(
            range,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color:
                  isActive
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubCategoryChip extends StatelessWidget {
  final String label;
  final String range;
  final bool isActive;

  const _SubCategoryChip({
    required this.label,
    required this.range,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color:
            isActive
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:
              isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color:
                  isActive
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            range,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color:
                  isActive
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _DeviceTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final String description;

  const _DeviceTypeCard({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            isActive
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:
              isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outlineVariant,
          width: isActive ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color:
                isActive
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color:
                        isActive
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        isActive
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (isActive)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 16,
              ),
            ),
        ],
      ),
    );
  }
}

class _AspectRatioCard extends StatelessWidget {
  final String label;
  final String description;
  final bool isActive;

  const _AspectRatioCard({
    required this.label,
    required this.description,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            isActive
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:
              isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outlineVariant,
          width: isActive ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color:
                  isActive
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color:
                  isActive
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScaleFactorCard extends StatelessWidget {
  final String label;
  final String value;
  final String description;

  const _ScaleFactorCard({
    required this.label,
    required this.value,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  final String code;

  const _CodeBlock({required this.code});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          code,
          style: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 11,
            color: isDark ? Colors.grey[100] : Colors.grey[900],
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

class _ScalingExampleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final baseFontSize = 16.0;
    final baseWidth = 100.0;
    final baseHeight = 50.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Base Values → Scaled Values',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          _ScalingRow(
            label: 'Font Size',
            base: baseFontSize,
            scaled: baseFontSize.sF,
          ),
          _ScalingRow(label: 'Width', base: baseWidth, scaled: baseWidth.sW),
          _ScalingRow(label: 'Height', base: baseHeight, scaled: baseHeight.sH),
        ],
      ),
    );
  }
}

class _ScalingRow extends StatelessWidget {
  final String label;
  final double base;
  final double scaled;

  const _ScalingRow({
    required this.label,
    required this.base,
    required this.scaled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            '${base.toStringAsFixed(0)}px → ${scaled.toStringAsFixed(1)}px',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ResponsiveValueTable extends StatelessWidget {
  const _ResponsiveValueTable();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        children: [
          _buildTableRow(context, [
            'Breakpoint',
            'Width Range',
            'Method',
          ], isHeader: true),
          _buildTableRow(context, ['Small Mobile', '< 320px', 'smallMobile']),
          _buildTableRow(context, [
            'Large Mobile',
            '414 - 479px',
            'largeMobile',
          ]),
          _buildTableRow(context, [
            'Small Tablet',
            '568 - 667px',
            'smallTablet',
          ]),
          _buildTableRow(context, [
            'Large Tablet',
            '768 - 1023px',
            'largeTablet',
          ]),
          _buildTableRow(context, [
            'Small Desktop',
            '1024 - 1279px',
            'smallDesktop',
          ]),
          _buildTableRow(context, ['Large Desktop', '1366+px', 'largeDesktop']),
          _buildTableRow(context, ['Ultra Wide', '2560+px', 'ultraWide']),
          _buildTableRow(context, ['Mobile (fallback)', 'Any', 'mobile']),
          _buildTableRow(context, ['Tablet (fallback)', 'Any', 'tablet']),
          _buildTableRow(context, ['Desktop (fallback)', 'Any', 'desktop']),
        ],
      ),
    );
  }

  TableRow _buildTableRow(
    BuildContext context,
    List<String> cells, {
    bool isHeader = false,
  }) {
    return TableRow(
      decoration:
          isHeader
              ? BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              )
              : null,
      children:
          cells
              .map(
                (cell) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    cell,
                    style:
                        isHeader
                            ? Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                            )
                            : Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
