import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_poc_package/my_poc_package.dart';

void main() {
  testWidgets('MyPocForm validates input correctly',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyPocForm(
            labelText: 'Enter Text',
            controller: controller,
          ),
        ),
      ),
    );

    // Verify that the TextFormField exists
    expect(find.byType(TextFormField), findsOneWidget);

    // Step 1: Enter invalid input (numbers)
    await tester.enterText(find.byType(TextFormField), '123'); // Invalid input
    await tester.tap(find.byType(ElevatedButton)); // Press Submit button
    await tester.pumpAndSettle(); // Wait for SnackBar to appear

    // Step 2: Verify that the error message ("Only alphabetic characters are allowed") is shown
    expect(find.text('Only alphabetic characters are allowed'), findsOneWidget);

    // Step 3: Now enter valid input (alphabetic characters)
    await tester.enterText(find.byType(TextFormField), 'Hello'); // Valid input
    await tester.tap(find.byType(ElevatedButton)); // Press Submit button
    await tester.pumpAndSettle(); // Wait for SnackBar to appear

    expect(find.byType(SnackBar), findsOneWidget); // Verify that SnackBar is shown

    // Step 4: Ensure that no error message ("Only alphabetic characters are allowed") is shown after valid input
    expect(find.text('Only alphabetic characters are allowed'), findsNothing);
  });
}
