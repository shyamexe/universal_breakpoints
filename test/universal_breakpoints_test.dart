import 'package:flutter_test/flutter_test.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';

void main() {
  group('ScreenBreakpoints', () {
    test('breakpoints are defined correctly', () {
      expect(ScreenBreakpoints.xxs, 360.0);
      expect(ScreenBreakpoints.xs, 480.0);
      expect(ScreenBreakpoints.sm, 768.0);
      expect(ScreenBreakpoints.md, 1024.0);
      expect(ScreenBreakpoints.lg, 1280.0);
      expect(ScreenBreakpoints.xl, 1440.0);
      expect(ScreenBreakpoints.xxl, 1920.0);
      expect(ScreenBreakpoints.xxxl, 2560.0);
    });
  });

  group('ScreenSizeCategory', () {
    test('all categories are defined', () {
      expect(ScreenSizeCategory.values.length, 8);
    });

    test('categories in correct order', () {
      expect(ScreenSizeCategory.xxs.index, 0);
      expect(ScreenSizeCategory.xs.index, 1);
      expect(ScreenSizeCategory.sm.index, 2);
      expect(ScreenSizeCategory.md.index, 3);
      expect(ScreenSizeCategory.lg.index, 4);
      expect(ScreenSizeCategory.xl.index, 5);
      expect(ScreenSizeCategory.xxl.index, 6);
      expect(ScreenSizeCategory.xxxl.index, 7);
    });
  });

  group('ScreenSizeSubCategory', () {
    test('all sub categories are defined', () {
      expect(ScreenSizeSubCategory.values.length, 19);
    });
  });

  group('UniversalBreakpoints', () {
    test('singleton instance is created', () {
      final config1 = UniversalBreakpoints();
      final config2 = UniversalBreakpoints();
      expect(identical(config1, config2), true);
    });
  });
}
