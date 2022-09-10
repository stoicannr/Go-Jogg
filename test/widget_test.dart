import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_flutter/screens/starter_app.dart';

void main() {
  group('A Group of widget tests', () {

    testWidgets('GIVEN <state> WHEN <action> EXPECT <result>', (WidgetTester tester) async {
      //ASSEMBLE
      await tester.pumpWidget(const ProviderScope(child: StarterApp(),));
      await tester.pumpAndSettle();

      final button = find.byType(OutlinedButton);
      final buttonWidget = button.evaluate().single.widget as OutlinedButton;
      final textWidget = buttonWidget.child! as Text;

      //ACT
      await tester.tap(button);
      await tester.pump();

      //ASSERT
      expect(textWidget.data, "Testing purpose");
    });

  });
}