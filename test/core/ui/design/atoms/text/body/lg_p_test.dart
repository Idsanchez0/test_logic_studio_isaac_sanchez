import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test_isaac/core/ui/design/atoms/text/body/lg_p.dart';

void main() {
  testWidgets('lg p ...', (tester) async {
    await tester.pumpWidget(ResponsiveApp(
      builder: (context) => const ScreenUtilInit(
        designSize: Size(360, 760),
        rebuildFactor: RebuildFactors.change,
        child: MaterialApp(
            home: Scaffold(
                body: LgP(
          title: 'test',
          color: Colors.white,
          align: TextAlign.center,
          fontWeight: FontWeight.w100,
        ))),
      ),
    ));
    expect(find.text('test'), findsOneWidget);
  });
}
