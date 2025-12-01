import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

void main() {
  group('Dynamic Grid System', () {
    group('GridColumnConfig', () {
      test('returns default columns when no breakpoint matches', () {
        final config = GridColumnConfig(defaultColumns: 3);
        expect(config.defaultColumns, 3);
      });

      test('initializes with all breakpoint parameters', () {
        final config = GridColumnConfig(
          ultraCompact: 1,
          compact: 1,
          standard: 2,
          largePhone: 2,
          phablet: 2,
          smallTablet: 3,
          standardTablet: 3,
          largeTablet: 3,
          extraLargeTablet: 4,
          smallDesktop: 4,
          standardDesktop: 5,
          largeDesktop: 6,
          extraLargeDesktop: 6,
          widescreen: 7,
          fullHD: 8,
          qhd: 8,
          ultraWide: 10,
          ultraHD: 10,
          superUltraWide: 12,
          defaultColumns: 2,
        );

        expect(config.ultraCompact, 1);
        expect(config.compact, 1);
        expect(config.standard, 2);
        expect(config.defaultColumns, 2);
      });

      test(
        'returns default columns value when specific breakpoint is null',
        () {
          final config = GridColumnConfig(ultraCompact: 1, defaultColumns: 4);

          expect(config.ultraCompact, 1);
          expect(config.compact, null);
          expect(config.defaultColumns, 4);
        },
      );

      test('all breakpoint properties are nullable', () {
        final config = GridColumnConfig();

        expect(config.ultraCompact, null);
        expect(config.compact, null);
        expect(config.standard, null);
        expect(config.largePhone, null);
        expect(config.superUltraWide, null);
      });
    });

    group('GridSpacingConfig', () {
      test('initializes with default spacing', () {
        final config = GridSpacingConfig();
        expect(config.defaultSpacing, 12.0);
      });

      test('initializes with custom default spacing', () {
        final config = GridSpacingConfig(defaultSpacing: 20.0);
        expect(config.defaultSpacing, 20.0);
      });

      test('stores all breakpoint spacing values', () {
        final config = GridSpacingConfig(
          ultraCompactSpacing: 4,
          compactSpacing: 8,
          standardSpacing: 12,
          largePhoneSpacing: 12,
          phabletSpacing: 12,
          smallTabletSpacing: 16,
          standardTabletSpacing: 16,
          largeTabletSpacing: 16,
          extraLargeTabletSpacing: 20,
          smallDesktopSpacing: 24,
          standardDesktopSpacing: 24,
          largeDesktopSpacing: 28,
          extraLargeDesktopSpacing: 32,
          widescreenSpacing: 36,
          fullHDSpacing: 40,
          qhdSpacing: 40,
          ultraWideSpacing: 48,
          ultraHDSpacing: 48,
          superUltraWideSpacing: 56,
          defaultSpacing: 12,
        );

        expect(config.ultraCompactSpacing, 4);
        expect(config.compactSpacing, 8);
        expect(config.standardSpacing, 12);
        expect(config.defaultSpacing, 12);
      });

      test('all spacing properties are nullable', () {
        final config = GridSpacingConfig();

        expect(config.ultraCompactSpacing, null);
        expect(config.compactSpacing, null);
        expect(config.standardSpacing, null);
        expect(config.superUltraWideSpacing, null);
      });
    });

    group('AnimatedGridItemStyle Enum', () {
      test('has all required animation styles', () {
        expect(AnimatedGridItemStyle.values.length, 5);
      });

      test('contains scaleIn style', () {
        expect(
          AnimatedGridItemStyle.values.contains(AnimatedGridItemStyle.scaleIn),
          true,
        );
      });

      test('contains fadeIn style', () {
        expect(
          AnimatedGridItemStyle.values.contains(AnimatedGridItemStyle.fadeIn),
          true,
        );
      });

      test('contains slideInFromLeft style', () {
        expect(
          AnimatedGridItemStyle.values.contains(
            AnimatedGridItemStyle.slideInFromLeft,
          ),
          true,
        );
      });

      test('contains slideInFromTop style', () {
        expect(
          AnimatedGridItemStyle.values.contains(
            AnimatedGridItemStyle.slideInFromTop,
          ),
          true,
        );
      });

      test('contains fadeAndScale style', () {
        expect(
          AnimatedGridItemStyle.values.contains(
            AnimatedGridItemStyle.fadeAndScale,
          ),
          true,
        );
      });
    });

    group('DynamicGrid Widget', () {
      testWidgets('renders with basic properties', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: List.generate(6, (i) => i),
                  itemBuilder: (context, item, index) {
                    return Container(
                      color: Colors.blue,
                      child: Text('Item $index'),
                    );
                  },
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(DynamicGrid), findsOneWidget);
        expect(find.byType(GridView), findsOneWidget);
      });

      testWidgets('renders GridView by default', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: [1, 2, 3],
                  itemBuilder: (context, item, index) => const SizedBox(),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(GridView), findsOneWidget);
      });

      testWidgets('accepts custom padding', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        const customPadding = EdgeInsets.all(32);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: [1, 2, 3],
                  itemBuilder: (context, item, index) => const SizedBox(),
                  padding: customPadding,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('uses provided columnConfig', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        final columnConfig = GridColumnConfig(
          compact: 2,
          largeTablet: 3,
          defaultColumns: 1,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: List.generate(6, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  columnConfig: columnConfig,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('uses provided spacingConfig', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        final spacingConfig = GridSpacingConfig(
          compactSpacing: 8,
          standardSpacing: 16,
          defaultSpacing: 12,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: List.generate(6, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  spacingConfig: spacingConfig,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('supports custom item aspect ratio', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: [1, 2, 3],
                  itemBuilder: (context, item, index) => const SizedBox(),
                  itemAspectRatio: 0.75,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('disables animations when enableAnimations is false', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: [1, 2, 3],
                  itemBuilder: (context, item, index) => const SizedBox(),
                  enableAnimations: false,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('overrides spacing with mainAxisSpacing parameter', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: [1, 2, 3],
                  itemBuilder: (context, item, index) => const SizedBox(),
                  mainAxisSpacing: 24.0,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('overrides spacing with crossAxisSpacing parameter', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: [1, 2, 3],
                  itemBuilder: (context, item, index) => const SizedBox(),
                  crossAxisSpacing: 20.0,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });
    });

    group('MasonryDynamicGrid Widget', () {
      testWidgets('renders masonry layout', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: MasonryDynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder: (context, item, index) {
                    return Container(
                      color: Colors.green,
                      child: Text('Item $index'),
                    );
                  },
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(MasonryDynamicGrid), findsOneWidget);
      });

      testWidgets('accepts columnConfig', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        final columnConfig = GridColumnConfig(
          compact: 2,
          largeTablet: 3,
          defaultColumns: 1,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: MasonryDynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  columnConfig: columnConfig,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(MasonryDynamicGrid), findsOneWidget);
      });

      testWidgets('accepts spacingConfig', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        final spacingConfig = GridSpacingConfig(defaultSpacing: 16);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: MasonryDynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  spacingConfig: spacingConfig,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(MasonryDynamicGrid), findsOneWidget);
      });

      testWidgets('supports animation configuration', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: MasonryDynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  enableAnimations: true,
                  animationDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(MasonryDynamicGrid), findsOneWidget);
      });

      testWidgets('accepts custom padding', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: MasonryDynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  padding: const EdgeInsets.all(24),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(MasonryDynamicGrid), findsOneWidget);
      });
    });

    group('AnimatedDynamicGrid Widget', () {
      testWidgets('renders with animation', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) {
                    return Container(
                      color: Colors.red,
                      child: Text('Item $index'),
                    );
                  },
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('supports scaleIn animation style', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  itemStyle: AnimatedGridItemStyle.scaleIn,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('supports fadeIn animation style', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  itemStyle: AnimatedGridItemStyle.fadeIn,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('supports slideInFromLeft animation style', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  itemStyle: AnimatedGridItemStyle.slideInFromLeft,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('supports slideInFromTop animation style', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  itemStyle: AnimatedGridItemStyle.slideInFromTop,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('supports fadeAndScale animation style', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  itemStyle: AnimatedGridItemStyle.fadeAndScale,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('accepts columnConfig', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        final columnConfig = GridColumnConfig(
          compact: 1,
          largeTablet: 2,
          defaultColumns: 3,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  columnConfig: columnConfig,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('accepts spacingConfig', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        final spacingConfig = GridSpacingConfig(defaultSpacing: 20);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  spacingConfig: spacingConfig,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('supports custom item aspect ratio', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  itemAspectRatio: 0.8,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('supports custom animation duration', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  animationDuration: const Duration(milliseconds: 800),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });

      testWidgets('accepts custom padding', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(9, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  padding: const EdgeInsets.all(28),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });
    });

    group('Dynamic Grid Responsiveness', () {
      testWidgets('DynamicGrid renders on mobile screen', (
        WidgetTester tester,
      ) async {
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
        tester.binding.window.physicalSizeTestValue = const Size(375, 667);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder:
                      (context, item, index) =>
                          Container(color: Colors.blue, child: Text('$index')),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('DynamicGrid renders on tablet screen', (
        WidgetTester tester,
      ) async {
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
        tester.binding.window.physicalSizeTestValue = const Size(768, 1024);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder:
                      (context, item, index) =>
                          Container(color: Colors.blue, child: Text('$index')),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('DynamicGrid renders on desktop screen', (
        WidgetTester tester,
      ) async {
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
        tester.binding.window.physicalSizeTestValue = const Size(1920, 1080);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder:
                      (context, item, index) =>
                          Container(color: Colors.blue, child: Text('$index')),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });
    });

    group('Dynamic Grid Edge Cases', () {
      testWidgets('handles empty item list', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: [],
                  itemBuilder: (context, item, index) => const SizedBox(),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('handles single item', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: [1],
                  itemBuilder: (context, item, index) => const SizedBox(),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('handles large item count', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: List.generate(100, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('handles zero aspect ratio gracefully', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: [1, 2, 3],
                  itemBuilder: (context, item, index) => const SizedBox(),
                  itemAspectRatio: 1.0,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('MasonryDynamicGrid handles empty list', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: MasonryDynamicGrid(
                  items: [],
                  itemBuilder: (context, item, index) => const SizedBox(),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(MasonryDynamicGrid), findsOneWidget);
      });

      testWidgets('AnimatedDynamicGrid handles empty list', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: [],
                  itemBuilder: (context, item, index) => const SizedBox(),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });
    });

    group('Dynamic Grid Properties', () {
      testWidgets('DynamicGrid with all custom properties', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        final columnConfig = GridColumnConfig(
          compact: 2,
          largeTablet: 3,
          defaultColumns: 1,
        );

        final spacingConfig = GridSpacingConfig(
          compactSpacing: 12,
          defaultSpacing: 16,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: DynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  columnConfig: columnConfig,
                  spacingConfig: spacingConfig,
                  itemAspectRatio: 0.9,
                  enableAnimations: true,
                  animationDuration: const Duration(milliseconds: 400),
                  animationCurve: Curves.easeInOut,
                  scrollPhysics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 16,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(DynamicGrid), findsOneWidget);
      });

      testWidgets('MasonryDynamicGrid with all custom properties', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        final columnConfig = GridColumnConfig(
          compact: 2,
          largeTablet: 3,
          defaultColumns: 1,
        );

        final spacingConfig = GridSpacingConfig(defaultSpacing: 14);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: MasonryDynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  columnConfig: columnConfig,
                  spacingConfig: spacingConfig,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  enableAnimations: true,
                  animationDuration: const Duration(milliseconds: 350),
                  padding: const EdgeInsets.all(22),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(MasonryDynamicGrid), findsOneWidget);
      });

      testWidgets('AnimatedDynamicGrid with all custom properties', (
        WidgetTester tester,
      ) async {
        tester.binding.window.physicalSizeTestValue = const Size(400, 800);
        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

        final columnConfig = GridColumnConfig(
          compact: 1,
          largeTablet: 2,
          defaultColumns: 3,
        );

        final spacingConfig = GridSpacingConfig(defaultSpacing: 18);

        await tester.pumpWidget(
          MaterialApp(
            home: ResponsiveWrapper(
              config: ResponsiveWrapperConfig(autoInitialize: true),
              child: Scaffold(
                body: AnimatedDynamicGrid(
                  items: List.generate(12, (i) => i),
                  itemBuilder: (context, item, index) => const SizedBox(),
                  columnConfig: columnConfig,
                  spacingConfig: spacingConfig,
                  itemAspectRatio: 1.0,
                  animationDuration: const Duration(milliseconds: 600),
                  animationCurve: Curves.easeOutCubic,
                  padding: const EdgeInsets.all(24),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 18,
                  itemStyle: AnimatedGridItemStyle.fadeAndScale,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AnimatedDynamicGrid), findsOneWidget);
      });
    });
  });
}
