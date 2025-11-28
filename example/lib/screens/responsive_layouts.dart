import 'package:flutter/material.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

class ResponsiveLayouts extends StatelessWidget {
  const ResponsiveLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsive Layouts',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 24.sF,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 24.sH),
            _buildSection(
              context,
              'Responsive Grid',
              'Automatically adjusts columns based on screen size',
              _buildResponsiveGrid(context),
            ),
            SizedBox(height: 24.sH),
            _buildSection(
              context,
              'Device Type Layout',
              'Different layouts for mobile, tablet, and desktop',
              _buildDeviceTypeLayout(context),
            ),
            SizedBox(height: 24.sH),
            _buildSection(
              context,
              'Responsive Spacing',
              'Padding and margins that adapt to screen size',
              _buildResponsiveSpacing(context),
            ),
            SizedBox(height: 24.sH),
            _buildSection(
              context,
              'Practical Examples',
              'Real-world usage patterns for responsive design',
              _buildPracticalExamples(context),
            ),
            SizedBox(height: 32.sH),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String description,
    Widget content,
  ) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18.sF,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 4.sH),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12.sF,
                    color: Colors.grey[600],
                  ),
            ),
            SizedBox(height: 16.sH),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveGrid(BuildContext context) {
    int columns = context.responsiveValue<int>(
      mobile: 1,
      tablet: 2,
      smallDesktop: 3,
      largeDesktop: 4,
    );

    return GridView.count(
      crossAxisCount: columns,
      mainAxisSpacing: 12.sH,
      crossAxisSpacing: 12.sW,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        12,
        (index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade300,
                Colors.blue.shade600,
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Item ${index + 1}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 14.sF,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceTypeLayout(BuildContext context) {
    return context.isMobile
        ? _buildMobileLayout(context)
        : context.isTablet
            ? _buildTabletLayout(context)
            : _buildDesktopLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildPlaceholder(context, 'Header', Colors.orange),
        SizedBox(height: 12.sH),
        _buildPlaceholder(context, 'Content 1', Colors.blue),
        SizedBox(height: 12.sH),
        _buildPlaceholder(context, 'Content 2', Colors.green),
        SizedBox(height: 12.sH),
        _buildPlaceholder(context, 'Sidebar', Colors.purple),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      children: [
        _buildPlaceholder(context, 'Header', Colors.orange),
        SizedBox(height: 12.sH),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildPlaceholder(context, 'Content 1', Colors.blue),
                  SizedBox(height: 12.sH),
                  _buildPlaceholder(context, 'Content 2', Colors.green),
                ],
              ),
            ),
            SizedBox(width: 12.sW),
            Expanded(
              child: _buildPlaceholder(context, 'Sidebar', Colors.purple),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildPlaceholder(context, 'Header', Colors.orange),
              SizedBox(height: 12.sH),
              _buildPlaceholder(context, 'Content 1', Colors.blue),
            ],
          ),
        ),
        SizedBox(width: 12.sW),
        Expanded(
          child: Column(
            children: [
              _buildPlaceholder(context, 'Content 2', Colors.green),
              SizedBox(height: 12.sH),
              _buildPlaceholder(context, 'Sidebar', Colors.purple),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResponsiveSpacing(BuildContext context) {
    final padding = context.isMobile ? 12.0 : context.isTablet ? 16.0 : 24.0;

    return Container(
      padding: EdgeInsets.all(padding.sW),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Padding: ${padding.toStringAsFixed(1)} * sW = ${(padding * context.sizeConfig.widthScaleFactor).toStringAsFixed(1)} px',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12.sF,
                ),
          ),
          SizedBox(height: 12.sH),
          Text(
            'Device Type: ${context.isMobile ? 'Mobile' : context.isTablet ? 'Tablet' : 'Desktop'}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sF,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 12.sH),
          Container(
            width: double.infinity,
            height: 60.sH,
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Responsive Content Area',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 14.sF,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context, String text, Color color) {
    return Container(
      width: double.infinity,
      height: 80.sH,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontSize: 16.sF,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _buildPracticalExamples(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPracticalCard(
          context,
          '📱 Example 1: Product Card',
          [
            'Mobile: Single column, image on top',
            'Tablet: 2-column layout with side-by-side arrangement',
            'Desktop: 3-4 columns with hover effects',
            '',
            'Use: context.responsiveValue<int>(mobile: 1, tablet: 2, desktop: 4)',
          ],
        ),
        SizedBox(height: 12.sH),
        _buildPracticalCard(
          context,
          '📊 Example 2: Dashboard Layout',
          [
            'Mobile: Stacked widgets, single column',
            'Tablet: 2 columns for charts and stats',
            'Desktop: 3-4 columns with sidebar navigation',
            '',
            'Use: if (context.isDesktop) showSidebar() else showBottomNav()',
          ],
        ),
        SizedBox(height: 12.sH),
        _buildPracticalCard(
          context,
          '🎨 Example 3: Typography',
          [
            'Mobile: 14sp base, 24sp headings',
            'Tablet: 16sp base, 28sp headings',
            'Desktop: 18sp base, 32sp headings',
            '',
            'Use: Text(style: TextStyle(fontSize: 16.sF))',
          ],
        ),
        SizedBox(height: 12.sH),
        _buildPracticalCard(
          context,
          '🔲 Example 4: Padding & Margins',
          [
            'Mobile: 12-16dp padding',
            'Tablet: 16-24dp padding',
            'Desktop: 24-32dp padding',
            '',
            'Use: Padding(padding: EdgeInsets.all(16.0.sW))',
          ],
        ),
      ],
    );
  }

  Widget _buildPracticalCard(
    BuildContext context,
    String title,
    List<String> points,
  ) {
    return Container(
      padding: EdgeInsets.all(12.0.sW),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
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
          SizedBox(height: 8.sH),
          ...points.map((point) {
            if (point.isEmpty) {
              return SizedBox(height: 4.sH);
            }
            return Padding(
              padding: EdgeInsets.only(bottom: 4.0.sH),
              child: Text(
                point,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 11.sF,
                      color: Colors.grey.shade700,
                    ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
