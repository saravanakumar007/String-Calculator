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

    test('Test - Format is correct or not', () {
      expect(getSumResult('saran&2@kumar'),
          "Please provide proper format to add numbers like 1,2 (or) 1\n2, 3");
    });

    test('Test with Single Number', () {
      expect(getSumResult('1'), 1);
    });

    test('Test with Two Numbers', () {
      expect(getSumResult('1,2'), 3);
    });

    test('Test with multiple numbers', () {
      expect(getSumResult('1,2,3,4,5'), 15);
    });

    test('Test with Multi Line ', () {
      expect(getSumResult('1\n2'), 3);
    });

    test('Test - combination of multiline with comma separation', () {
      expect(getSumResult('1\n2,3\n4'), 10);
    });

    test('Test - Single Negative Number', () {
      expect(getSumResult('-1'), 'negative numbers not allowed : -1');
    });
  });
}
