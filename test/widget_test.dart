import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator_app/main.dart'; // Ensure this path is correct

void main() {
  testWidgets('Calculator app loads successfully', (WidgetTester tester) async {
    // Build the CalculatorApp and trigger a frame.
    await tester.pumpWidget(CalculatorApp());

    // Verify that the UI loads correctly.
    expect(find.text('0'), findsOneWidget); // Adjust based on your CalculatorView's initial state
    expect(find.text('1'), findsNothing);

    // Add further interaction tests based on your CalculatorView.
  });
}
