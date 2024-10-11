import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test_isaac/core/ui/design/atoms/text_field/custom_drop_down_field.dart';

void main() {
  testWidgets('custom drop down field ...', (tester) async {
    final options = ['Option 1', 'Option 2', 'Option 3'];
    String? selectedOption;
    await tester.pumpWidget(ResponsiveApp(
      builder: (context) => ScreenUtilInit(
        designSize: const Size(360, 760),
        rebuildFactor: RebuildFactors.change,
        child: MaterialApp(
            home: Scaffold(
                body: CustomDropdown(
          options: options,
          onSelect: (value) {
            selectedOption = value;
          },
        ))),
      ),
    ));

    expect(find.text('Arquetipo'), findsOneWidget);
    expect(find.text('Option 1'), findsNothing);
    expect(find.text('Option 2'), findsNothing);
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Option 3'), findsOneWidget);
    await tester.tap(find.text('Option 2').last);
    await tester.pumpAndSettle();
    expect(selectedOption, 'Option 2');
  });
}
