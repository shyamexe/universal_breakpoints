import 'package:flutter/material.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

class AdvancedExamples extends StatelessWidget {
  const AdvancedExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Advanced Examples',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.sH),
            _buildResponsiveValueExample(context),
            SizedBox(height: 24.sH),
            _buildAdaptiveNavigationExample(context),
            SizedBox(height: 24.sH),
            _buildComplexGridExample(context),
            SizedBox(height: 24.sH),
            _buildPaddingCalculatorExample(context),
            SizedBox(height: 24.sH),
            _buildBestPracticesCard(context),
            SizedBox(height: 32.sH),
          ],
        ),
      ),
    );
  }

  Widget _buildBestPracticesCard(BuildContext context) {
    return Card(
      color: Colors.purple.shade50,
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Best Practices',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            _buildPracticeItem(
              context,
              '✓ Always use scaling extensions',
              'Use .sF, .sW, .sH instead of hardcoded pixel values for responsive design.',
            ),
            SizedBox(height: 12.sH),
            _buildPracticeItem(
              context,
              '✓ Check device type first',
              'Use context.isMobile, isTablet, isDesktop for major layout changes.',
            ),
            SizedBox(height: 12.sH),
            _buildPracticeItem(
              context,
              '✓ Use responsiveValue for fine-grained control',
              'Provide different values for mobile, tablet, and desktop breakpoints.',
            ),
            SizedBox(height: 12.sH),
            _buildPracticeItem(
              context,
              '✓ Wrap with ResponsiveWrapper',
              'Always wrap your app with ResponsiveWrapper at the top level for auto-rebuild on resize.',
            ),
            SizedBox(height: 12.sH),
            _buildPracticeItem(
              context,
              '✓ Test on multiple devices',
              'Test your responsive layouts on actual devices or emulators at different screen sizes.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPracticeItem(
    BuildContext context,
    String title,
    String description,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 13.sF,
            fontWeight: FontWeight.bold,
            color: Colors.purple.shade900,
          ),
        ),
        SizedBox(height: 4.sH),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 11.sF,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildResponsiveValueExample(BuildContext context) {
    int columns = context.responsiveValue<int>(
      mobile: 1,
      smallTablet: 2,
      largeTablet: 3,
      desktop: 4,
    );

    double spacing = context.responsiveValue<double>(
      mobile: 8,
      tablet: 12,
      desktop: 16,
    );

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsive Value Helper',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.sH),
            Text(
              'Using responsiveValue<T>() to adapt grid and spacing',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12.sF,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.sH),
            Container(
              padding: EdgeInsets.all(12.0.sW),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blue.shade200),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Columns: $columns',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sF,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Spacing: ${spacing.toStringAsFixed(1)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sF,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.sH),
            GridView.count(
              crossAxisCount: columns,
              mainAxisSpacing: spacing.sH,
              crossAxisSpacing: spacing.sW,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                12,
                (index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade300, Colors.teal.shade600],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(color: Colors.white, fontSize: 16.sF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdaptiveNavigationExample(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adaptive Navigation',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.sH),
            Text(
              'Navigation changes based on device type',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12.sF,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.sH),
            Container(
              padding: EdgeInsets.all(12.0.sW),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  context.isMobile
                      ? SizedBox(
                        height: 48.sH,
                        child: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildNavButton(context, Icons.home, 'Home'),
                                SizedBox(width: 8.sW),
                                _buildNavButton(
                                  context,
                                  Icons.explore,
                                  'Explore',
                                ),
                                SizedBox(width: 8.sW),
                                _buildNavButton(
                                  context,
                                  Icons.favorite,
                                  'Saved',
                                ),
                                SizedBox(width: 8.sW),
                                _buildNavButton(
                                  context,
                                  Icons.person,
                                  'Profile',
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      : context.isTablet
                      ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildNavChip(context, Icons.home, 'Home'),
                            SizedBox(width: 8.sW),
                            _buildNavChip(context, Icons.explore, 'Explore'),
                            SizedBox(width: 8.sW),
                            _buildNavChip(context, Icons.favorite, 'Saved'),
                            SizedBox(width: 8.sW),
                            _buildNavChip(context, Icons.person, 'Profile'),
                          ],
                        ),
                      )
                      : Wrap(
                        spacing: 12.sW,
                        runSpacing: 8.sH,
                        children: [
                          _buildNavChip(context, Icons.home, 'Home'),
                          _buildNavChip(context, Icons.explore, 'Explore'),
                          _buildNavChip(context, Icons.favorite, 'Saved'),
                          _buildNavChip(context, Icons.person, 'Profile'),
                        ],
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20.sF),
        SizedBox(height: 2.sH),
        Text(label, style: TextStyle(fontSize: 10.sF)),
      ],
    );
  }

  Widget _buildNavChip(BuildContext context, IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0.sW, vertical: 8.0.sH),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.sF, color: Colors.white),
          SizedBox(width: 6.sW),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 12.sF,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComplexGridExample(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Complex Grid Layout',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.sH),
            Text(
              'Adaptive grid with different aspect ratios',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12.sF,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.sH),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.responsiveValue<int>(
                  mobile: 2,
                  tablet: 3,
                  desktop: 4,
                ),
                childAspectRatio: context.isMobile ? 1 : 1.2,
                mainAxisSpacing: 12.sH,
                crossAxisSpacing: 12.sW,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (context, index) {
                final colors = [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.orange,
                  Colors.purple,
                  Colors.pink,
                  Colors.cyan,
                  Colors.amber,
                  Colors.indigo,
                  Colors.lime,
                  Colors.deepOrange,
                  Colors.teal,
                ];

                return Container(
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 32.sF, color: Colors.white),
                        SizedBox(height: 8.sH),
                        Text(
                          'Item ${index + 1}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(fontSize: 12.sF, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaddingCalculatorExample(BuildContext context) {
    final config = UniversalBreakpoints();

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dynamic Padding Calculator',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.sH),
            Text(
              'Padding adapts based on screen size',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12.sF,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.sH),
            Container(
              padding: EdgeInsets.all(
                context.isMobile
                    ? 12.0
                    : context.isTablet
                    ? 16.0
                    : 24.0,
              ),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                border: Border.all(color: Colors.teal.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dynamic Padding: ${(context.isMobile
                        ? 12.0
                        : context.isTablet
                        ? 16.0
                        : 24.0).toStringAsFixed(1)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sF,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.sH),
                  Text(
                    'Scale Factor: ${config.widthScaleFactor.toStringAsFixed(4)}',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(fontSize: 12.sF),
                  ),
                  SizedBox(height: 8.sH),
                  Text(
                    'Actual Padding: ${((context.isMobile
                            ? 12.0
                            : context.isTablet
                            ? 16.0
                            : 24.0) * config.widthScaleFactor).toStringAsFixed(2)}px',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(fontSize: 12.sF),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.sH),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(
                context.isMobile
                    ? 12.0.sW
                    : context.isTablet
                    ? 16.0.sW
                    : 24.0.sW,
              ),
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'This container has responsive padding that scales with screen size',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 14.sF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
