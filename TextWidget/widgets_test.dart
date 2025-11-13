import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Text widget displays Hello', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Hello'),
          ),
        ),
      ),
    );

    // Verify the text "Hello" appears once
    expect(find.text('Hello'), findsOneWidget);
  });
}
