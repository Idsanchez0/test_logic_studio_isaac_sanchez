import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test_isaac/core/ui/design/atoms/text_field/custom_search_field.dart';

void main() {
  testWidgets('custom search field ...', (tester) async {
    final TextEditingController controller = TextEditingController();
    await tester.pumpWidget(ResponsiveApp(
      builder: (context) => ScreenUtilInit(
        designSize: const Size(360, 760),
        rebuildFactor: RebuildFactors.change,
        child: MaterialApp(
            home: Scaffold(
                body: CustomSearchField(
          controller: controller,
          inputType: TextInputType.text,
          enable: true,
          hintText: 'Buscar',
        ))),
      ),
    ));
    expect(find.text('Buscar'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Hello');
    expect(controller.text, 'Hello');
  });

  testWidgets('CustomSearchField is disabled when enable is false',
      (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            home: Scaffold(
              body: CustomSearchField(
                controller: controller,
                inputType: TextInputType.text,
                enable: false,
                hintText: 'Buscar',
              ),
            ),
          );
        },
      ),
    );
    final TextField textField = tester.widget(find.byType(TextField));
    expect(textField.enabled, isFalse);
  });
}
