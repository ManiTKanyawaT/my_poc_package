import 'package:flutter_test/flutter_test.dart';
import 'package:my_poc_package/my_poc_package.dart';

void main() {
  test('Greets the user correctly', () {
    final greeter = AwesomeGreeter();
    expect(greeter.greet('Alice'), 'Hello, Alice! Welcome to My Awesome Package!');
  });
}
