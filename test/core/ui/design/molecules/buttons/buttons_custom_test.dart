import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_isaac/core/ui/design/molecules/buttons/buttons_custom.dart';

void main() {
  testWidgets('buttons custom ...', (tester) async {
    const dynamic buttonText = 'Click Me';
    const Color buttonColor = Colors.blue;
    const Color borderColor = Colors.red;
    const Color textColor = Colors.white;
    const double borderRadius = 20.0;
    const double height = 15.0;

    await tester.pumpWidget(ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return const MaterialApp(
          home: Scaffold(
            body: ButtonsCustom(
              color: buttonColor,
              border: borderColor,
              colorText: textColor,
              text: buttonText,
              radius: borderRadius,
              height: height,
            ),
          ),
        );
      },
    ));
    expect(find.text(buttonText), findsOneWidget);
  });
}
