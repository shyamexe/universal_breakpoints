import 'package:flutter/material.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

class DeviceDetection extends StatelessWidget {
  const DeviceDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Device Detection',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.sH),
            _buildDetectionCard(context),
            SizedBox(height: 24.sH),
            _buildSubCategoryShowcase(context),
            SizedBox(height: 24.sH),
            _buildOrientationCard(context),
            SizedBox(height: 24.sH),
            _buildUsageGuideCard(context),
            SizedBox(height: 32.sH),
          ],
        ),
      ),
    );
  }

  Widget _buildUsageGuideCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Usage Guide',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            _buildGuideItem(
              context,
              'Basic Device Detection',
              'if (context.isMobile) { /* Show mobile layout */ }\nelse if (context.isTablet) { /* Show tablet layout */ }\nelse { /* Show desktop layout */ }',
            ),
            SizedBox(height: 12.sH),
            _buildGuideItem(
              context,
              'Responsive Values',
              'int columns = context.responsiveValue<int>(\n  mobile: 1,\n  tablet: 2,\n  desktop: 4,\n);',
            ),
            SizedBox(height: 12.sH),
            _buildGuideItem(
              context,
              'Sub-Category Matching',
              'if (context.isCompactPhone) { /* iPhone SE */ }\nelse if (context.isLargePhone) { /* Large phone */ }',
            ),
            SizedBox(height: 12.sH),
            _buildGuideItem(
              context,
              'Orientation Handling',
              'if (context.isPortrait) { /* Vertical layout */ }\nelse { /* Horizontal layout */ }',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideItem(BuildContext context, String title, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 13.sF,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade900,
          ),
        ),
        SizedBox(height: 6.sH),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.0.sW),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            code,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 10.sF,
              color: Colors.grey.shade900,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetectionCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Device Type Detection',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            _buildDetectionItem(
              context,
              'Mobile Device',
              context.isMobile,
              'Width < 768px',
            ),
            _buildDetectionItem(
              context,
              'Tablet Device',
              context.isTablet,
              '768px ≤ Width ≤ 1279px',
            ),
            _buildDetectionItem(
              context,
              'Desktop Device',
              context.isDesktop,
              'Width ≥ 1280px',
            ),
            _buildDetectionItem(
              context,
              'Large Screen',
              context.isLargeScreen,
              'Width ≥ 1440px',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetectionItem(
    BuildContext context,
    String label,
    bool value,
    String description,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.sH),
      child: Container(
        padding: EdgeInsets.all(12.0.sW),
        decoration: BoxDecoration(
          color: value ? Colors.green.shade50 : Colors.grey.shade50,
          border: Border.all(
            color: value ? Colors.green : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: value ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  value ? Icons.check : Icons.close,
                  color: Colors.white,
                  size: 20.sF,
                ),
              ),
            ),
            SizedBox(width: 12.sW),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 14.sF,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sF,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.sW,
                vertical: 6.0.sH,
              ),
              decoration: BoxDecoration(
                color: value ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                value ? 'YES' : 'NO',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 12.sF,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubCategoryShowcase(BuildContext context) {
    final config = UniversalBreakpoints();

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ultra-Granular Sub-Category',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0.sW),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blue.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    config.screenSizeSubCategory.name
                        .replaceAllMapped(
                          RegExp(r'[A-Z]'),
                          (m) => ' ${m.group(0)}',
                        )
                        .trim(),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 20.sF,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  SizedBox(height: 8.sH),
                  Text(
                    'Current device classification',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sF,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.sH),
            Wrap(
              spacing: 8.sW,
              runSpacing: 8.sH,
              children: [
                _buildCategoryBadge(
                  context,
                  'Ultra Compact',
                  context.isUltraCompact,
                ),
                _buildCategoryBadge(
                  context,
                  'Compact Phone',
                  context.isCompactPhone,
                ),
                _buildCategoryBadge(
                  context,
                  'Standard Phone',
                  context.isStandardPhone,
                ),
                _buildCategoryBadge(
                  context,
                  'Large Phone',
                  context.isLargePhone,
                ),
                _buildCategoryBadge(context, 'Phablet', context.isPhablet),
                _buildCategoryBadge(
                  context,
                  'Small Tablet',
                  context.isSmallTablet,
                ),
                _buildCategoryBadge(
                  context,
                  'Standard Tablet',
                  context.isStandardTablet,
                ),
                _buildCategoryBadge(
                  context,
                  'Large Tablet',
                  context.isLargeTablet,
                ),
                _buildCategoryBadge(
                  context,
                  'Extra Large Tablet',
                  context.isExtraLargeTablet,
                ),
                _buildCategoryBadge(
                  context,
                  'Small Desktop',
                  context.isSmallDesktop,
                ),
                _buildCategoryBadge(
                  context,
                  'Standard Desktop',
                  context.isStandardDesktop,
                ),
                _buildCategoryBadge(
                  context,
                  'Large Desktop',
                  context.isLargeDesktop,
                ),
                _buildCategoryBadge(
                  context,
                  'Extra Large Desktop',
                  context.isExtraLargeDesktop,
                ),
                _buildCategoryBadge(
                  context,
                  'Widescreen',
                  context.isWidescreen,
                ),
                _buildCategoryBadge(context, 'Full HD', context.isFullHD),
                _buildCategoryBadge(context, 'QHD', context.isQHD),
                _buildCategoryBadge(context, 'Ultra Wide', context.isUltraWide),
                _buildCategoryBadge(context, 'Ultra HD', context.isUltraHD),
                _buildCategoryBadge(
                  context,
                  'Super Ultra Wide',
                  context.isSuperUltraWide,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBadge(
    BuildContext context,
    String label,
    bool isActive,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0.sW, vertical: 8.0.sH),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? Colors.blue.shade700 : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: 11.sF,
          color: isActive ? Colors.white : Colors.grey.shade700,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildOrientationCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Orientation & Aspect Ratio',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            _buildDetectionItem(
              context,
              'Portrait',
              context.isPortrait,
              'Height > Width',
            ),
            _buildDetectionItem(
              context,
              'Landscape',
              context.isLandscape,
              'Width > Height',
            ),
            _buildDetectionItem(
              context,
              'Ultra Wide Aspect',
              context.isUltraWideAspect,
              'Aspect Ratio > 2.0',
            ),
            _buildDetectionItem(
              context,
              'Standard Aspect',
              context.isStandardAspect,
              'Aspect Ratio 1.3 - 1.8',
            ),
            _buildDetectionItem(
              context,
              'Tall Aspect',
              context.isTallAspect,
              'Aspect Ratio < 1.3',
            ),
            SizedBox(height: 12.sH),
            Container(
              padding: EdgeInsets.all(12.0.sW),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                border: Border.all(color: Colors.orange.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Aspect Ratio: ${context.sizeConfig.aspectRatio.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sF,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
