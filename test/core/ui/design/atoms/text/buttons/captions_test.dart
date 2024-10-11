import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test_isaac/core/ui/design/atoms/text/buttons/captions.dart';

void main() {
  testWidgets('captions ...', (tester) async {
    await tester.pumpWidget(ResponsiveApp(
      builder: (context) => const ScreenUtilInit(
        designSize: Size(360, 760),
        rebuildFactor: RebuildFactors.change,
        child: MaterialApp(
            home: Scaffold(
                body: Captions(
          title: 'test',
          color: Colors.white,
          align: TextAlign.center,
        ))),
      ),
    ));
    expect(find.text('test'), findsOneWidget);
  });
}
