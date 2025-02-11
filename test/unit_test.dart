import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/Utils/helpers.dart';

void main() {
  group('Test - Sum of Numbers', () {
    dynamic getSumResult(String input) {
      dynamic sum = 0;
      try {
        sum = Helpers().add(input);
      } catch (e) {
        sum = e.toString();
      }
      return sum;
    }

    test('Test - Empty String', () {
      expect(getSumResult(''), 0);
    });
  });
}
