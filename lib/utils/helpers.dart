class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() => message;
}

class Helpers {
  int add(String input) {
    int sum = 0;
    input = input.replaceAll('\n', ',');
    bool hasUppercase = input.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = input.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        input.contains(RegExp(r'[!@#$%^&*().?":{}|<>]'));
    if (hasUppercase || hasLowercase || hasSpecialCharacters) {
      return throw CustomException(
          "Please provide proper format to add numbers like 1,2 (or) 1\n2, 3");
    }
    if (input.trim().isEmpty) {
      return 0;
    } else {
      final List<String> numbers = input.split(',');
      bool hasNegativeNumber = false;
      String negativeNumbers = '';
      for (int i = 0; i < numbers.length; i++) {
        final int val = int.tryParse(numbers[i]) ?? 0;
        if (val < 0) {
          hasNegativeNumber = true;
          negativeNumbers += negativeNumbers.isNotEmpty ? ',$val' : '$val';
        } else if (!hasNegativeNumber) {
          sum = sum + (int.tryParse(numbers[i]) ?? 0);
        }
      }
      if (hasNegativeNumber) {
        return throw CustomException(
            "negative numbers not allowed : $negativeNumbers");
      }
    }
    return sum;
  }
}
