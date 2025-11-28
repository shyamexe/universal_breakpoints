import 'package:flutter/material.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

class BreakpointsShowcase extends StatelessWidget {
  const BreakpointsShowcase({super.key});

  Color _getCategoryColor(ScreenSizeCategory category) {
    const colors = {
      ScreenSizeCategory.xxs: Colors.red,
      ScreenSizeCategory.xs: Colors.orange,
      ScreenSizeCategory.sm: Colors.yellow,
      ScreenSizeCategory.md: Colors.green,
      ScreenSizeCategory.lg: Colors.blue,
      ScreenSizeCategory.xl: Colors.indigo,
      ScreenSizeCategory.xxl: Colors.purple,
      ScreenSizeCategory.xxxl: Colors.pink,
    };
    return colors[category] ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    // final breakpoints = ScreenBreakpoints;
    final config = UniversalBreakpoints();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Screen Breakpoints',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0.sW),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Screen Metrics',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18.sF,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.sH),
                    _buildInfoRow(
                      context,
                      'Screen Width',
                      '${config.screenWidth.toStringAsFixed(2)} px',
                    ),
                    _buildInfoRow(
                      context,
                      'Screen Height',
                      '${config.screenHeight.toStringAsFixed(2)} px',
                    ),
                    _buildInfoRow(
                      context,
                      'Aspect Ratio',
                      config.aspectRatio.toStringAsFixed(2),
                    ),
                    _buildInfoRow(
                      context,
                      'Text Scale Factor',
                      '${config.textScaleFactor.toStringAsFixed(3)}x',
                    ),
                    _buildInfoRow(
                      context,
                      'Width Scale Factor',
                      '${config.widthScaleFactor.toStringAsFixed(3)}x',
                    ),
                    Divider(height: 16.sH),
                    _buildInfoRow(context, 'Screen Type', config.screenType),
                    _buildInfoRow(
                      context,
                      'Category',
                      config.screenSizeCategory.name.toUpperCase(),
                    ),
                    _buildInfoRow(
                      context,
                      'Sub-Category',
                      config.screenSizeSubCategory.name,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.sH),
            Text(
              'Breakpoint Thresholds',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.sH),
            GridView.count(
              crossAxisCount: context.responsiveValue<int>(
                mobile: 1,
                tablet: 2,
                desktop: 4,
              ),
              mainAxisSpacing: 12.sH,
              crossAxisSpacing: 12.sW,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildBreakpointCard(
                  context,
                  'XXS',
                  ScreenBreakpoints.xxs,
                  ScreenSizeCategory.xxs,
                ),
                _buildBreakpointCard(
                  context,
                  'XS',
                  ScreenBreakpoints.xs,
                  ScreenSizeCategory.xs,
                ),
                _buildBreakpointCard(
                  context,
                  'SM',
                  ScreenBreakpoints.sm,
                  ScreenSizeCategory.sm,
                ),
                _buildBreakpointCard(
                  context,
                  'MD',
                  ScreenBreakpoints.md,
                  ScreenSizeCategory.md,
                ),
                _buildBreakpointCard(
                  context,
                  'LG',
                  ScreenBreakpoints.lg,
                  ScreenSizeCategory.lg,
                ),
                _buildBreakpointCard(
                  context,
                  'XL',
                  ScreenBreakpoints.xl,
                  ScreenSizeCategory.xl,
                ),
                _buildBreakpointCard(
                  context,
                  'XXL',
                  ScreenBreakpoints.xxl,
                  ScreenSizeCategory.xxl,
                ),
                _buildBreakpointCard(
                  context,
                  'XXXL',
                  ScreenBreakpoints.xxxl,
                  ScreenSizeCategory.xxxl,
                ),
              ],
            ),
            SizedBox(height: 24.sH),
            Text(
              'Current Category Indicator',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.sH),
            Container(
              width: double.infinity,
              height: 100.sH,
              decoration: BoxDecoration(
                color: _getCategoryColor(config.screenSizeCategory),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  config.screenSizeCategory.name.toUpperCase(),
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 32.sF,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.sH),
            Text(
              'How to Use Breakpoints',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.sH),
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: EdgeInsets.all(16.0.sW),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUsageExample(
                      context,
                      '1. Check Device Type',
                      'Use context.isMobile, context.isTablet, context.isDesktop\nto build adaptive layouts for different device types.',
                    ),
                    SizedBox(height: 12.sH),
                    _buildUsageExample(
                      context,
                      '2. Conditional Rendering',
                      'Show/hide widgets based on screen size:\nif (context.isDesktop) showSidebar() else hideIt()',
                    ),
                    SizedBox(height: 12.sH),
                    _buildUsageExample(
                      context,
                      '3. Responsive Values',
                      'Use responsiveValue<T>() to set different values:\nint columns = context.responsiveValue(mobile: 1, tablet: 2, desktop: 4)',
                    ),
                    SizedBox(height: 12.sH),
                    _buildUsageExample(
                      context,
                      '4. Scale Dimensions',
                      'Scale sizes proportionally: 16.sF for font, 20.sW for width, 10.sH for height',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.sH),
          ],
        ),
      ),
    );
  }

  Widget _buildUsageExample(
    BuildContext context,
    String title,
    String description,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 14.sF,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade900,
          ),
        ),
        SizedBox(height: 4.sH),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12.sF,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.sH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 14.sF),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 14.sF,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakpointCard(
    BuildContext context,
    String name,
    double value,
    ScreenSizeCategory category,
  ) {
    final isActive = UniversalBreakpoints().screenSizeCategory == category;
    return Card(
      elevation: isActive ? 8 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: _getCategoryColor(category),
          width: isActive ? 3 : 1,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _getCategoryColor(
            category,
          ).withValues(alpha: isActive ? 0.2 : 0.05),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18.sF,
                  fontWeight: FontWeight.bold,
                  color: _getCategoryColor(category),
                ),
              ),
              SizedBox(height: 4.sH),
              Text(
                '${value.toStringAsFixed(0)} px',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 12.sF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
