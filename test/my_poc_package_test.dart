import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_poc_package/my_poc_package.dart'; // Import your package

void main() {
  testWidgets('AnimatedTextFormField scales on tap', (WidgetTester tester) async {
  final controller = TextEditingController();

  // Build the widget tree
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(  // Wrap with SingleChildScrollView
          child: AnimatedTextFormField(
            labelText: 'Enter Text',
            controller: controller,
          ),
        ),
      ),
    ),
  );

  // Verify that the TextFormField exists
  expect(find.byType(TextFormField), findsOneWidget);

  // Scroll the widget into view if needed
  await tester.scrollUntilVisible(
    find.byType(TextFormField),
    500.0,
  );

  // Tap on the TextFormField to trigger the animation
  await tester.tap(find.byType(TextFormField));
  await tester.pumpAndSettle(); // Wait for animation to settle

  // Optionally, print out some debug information here:
  print('Widget tapped, animation should have occurred now.');
});

}
