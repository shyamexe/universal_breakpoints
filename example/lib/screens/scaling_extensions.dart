import 'package:flutter/material.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

class ScalingExtensions extends StatelessWidget {
  const ScalingExtensions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scaling Extensions',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.sH),
            _buildScalingFactorCard(context),
            SizedBox(height: 24.sH),
            _buildFontScalingDemo(context),
            SizedBox(height: 24.sH),
            _buildDimensionScalingDemo(context),
            SizedBox(height: 24.sH),
            _buildLineHeightDemo(context),
            SizedBox(height: 24.sH),
            _buildScalingGuideCard(context),
            SizedBox(height: 32.sH),
          ],
        ),
      ),
    );
  }

  Widget _buildScalingGuideCard(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scaling Extensions Guide',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            _buildScalingGuideItem(
              context,
              '.sF - Scaled Font Size',
              'Use for text scaling: Text(style: TextStyle(fontSize: 16.sF))\nAutomatically scales based on screen width and device pixel ratio.',
            ),
            SizedBox(height: 12.sH),
            _buildScalingGuideItem(
              context,
              '.sW - Scaled Width',
              'Use for horizontal dimensions: Container(width: 100.sW)\nScales proportionally based on screen width.',
            ),
            SizedBox(height: 12.sH),
            _buildScalingGuideItem(
              context,
              '.sH - Scaled Height',
              'Use for vertical dimensions: SizedBox(height: 50.sH)\nScales proportionally based on screen height.',
            ),
            SizedBox(height: 12.sH),
            _buildScalingGuideItem(
              context,
              '.sFh - Line Height Multiplier',
              'Use for text line height: TextStyle(height: 16.sFh)\nAutomatically calculates optimal line height for font size.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScalingGuideItem(
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
            color: Colors.orange.shade900,
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

  Widget _buildScalingFactorCard(BuildContext context) {
    final config = UniversalBreakpoints();

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Scaling Factors',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            _buildFactorRow(
              context,
              'Text Scale Factor',
              config.textScaleFactor,
            ),
            _buildFactorRow(
              context,
              'Width Scale Factor',
              config.widthScaleFactor,
            ),
            _buildFactorRow(
              context,
              'Height Scale Factor',
              config.heightScaleFactor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFactorRow(BuildContext context, String label, double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0.sH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 14.sF),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0.sW,
              vertical: 6.0.sH,
            ),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border.all(color: Colors.blue.shade200),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              value.toStringAsFixed(4),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 12.sF,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFontScalingDemo(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Font Size Scaling (sF)',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            _buildScaledTextExample(context, 12, 'Small'),
            SizedBox(height: 12.sH),
            _buildScaledTextExample(context, 16, 'Body'),
            SizedBox(height: 12.sH),
            _buildScaledTextExample(context, 20, 'Subtitle'),
            SizedBox(height: 12.sH),
            _buildScaledTextExample(context, 24, 'Title'),
            SizedBox(height: 12.sH),
            _buildScaledTextExample(context, 32, 'Large'),
            SizedBox(height: 12.sH),
            _buildScaledTextExample(context, 48, 'Extra Large'),
          ],
        ),
      ),
    );
  }

  Widget _buildScaledTextExample(
    BuildContext context,
    double baseSize,
    String label,
  ) {
    final scaled = baseSize.sF;
    return Container(
      padding: EdgeInsets.all(12.0.sW),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sF,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '$baseSize px base → ${scaled.toStringAsFixed(2)} px scaled',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sF,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.sW),
          Text('Text', style: TextStyle(fontSize: baseSize.sF)),
        ],
      ),
    );
  }

  Widget _buildDimensionScalingDemo(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Width & Height Scaling (sW, sH)',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            _buildScaledBox(context, 'Small', 100, 50),
            SizedBox(height: 12.sH),
            _buildScaledBox(context, 'Medium', 150, 75),
            SizedBox(height: 12.sH),
            _buildScaledBox(context, 'Large', 200, 100),
          ],
        ),
      ),
    );
  }

  Widget _buildScaledBox(
    BuildContext context,
    String label,
    double width,
    double height,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12.sF,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 6.sH),
        Container(
          width: width.sW,
          height: height.sH,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade300, Colors.purple.shade600],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              '${width.toStringAsFixed(0)} × ${height.toStringAsFixed(0)}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 10.sF,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLineHeightDemo(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Line Height Calculation (sFh)',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.sF,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sH),
            _buildLineHeightExample(context, 14),
            SizedBox(height: 16.sH),
            _buildLineHeightExample(context, 18),
            SizedBox(height: 16.sH),
            _buildLineHeightExample(context, 24),
            SizedBox(height: 16.sH),
            _buildLineHeightExample(context, 32),
          ],
        ),
      ),
    );
  }

  Widget _buildLineHeightExample(BuildContext context, double fontSize) {
    final height = fontSize.sFh;

    return Container(
      padding: EdgeInsets.all(12.0.sW),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        border: Border.all(color: Colors.amber.shade200),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Font size: ${fontSize.sF.toStringAsFixed(2)}px, Line height: ${height.toStringAsFixed(3)}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 11.sF,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8.sH),
          Container(
            padding: EdgeInsets.all(8.0.sW),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.amber.shade300, width: 0.5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt.',
              style: TextStyle(fontSize: fontSize.sF, height: height),
            ),
          ),
        ],
      ),
    );
  }
}
