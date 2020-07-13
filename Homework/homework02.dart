import 'dart:math';
import 'package:test/test.dart';

void main() {
  print(Calculator.add(1.5, 2));

  group('Calculator', () {
    test('When executing  4 + 3, the result is 7', () {
      expect(Calculator.add(4, 3), 7);
    });

    test('When executing  4 - 3, the result is 1', () {
      expect(Calculator.substract(4, 3), 1);
    });

    test('When executing  4 * 3, the result is 12', () {
      expect(Calculator.multiply(4, 3), 12);
    });

    test('When executing  4 / 2, the result is 2', () {
      expect(Calculator.divide(4, 2), 2);
    });

    test('When executing  4^3, the result is 64', () {
      expect(Calculator.exponentiate(4, 3), 64);
    });
  });
}

class Calculator {
  //Return the sum of num1 and num2
  static double add(double num1, double num2) {
    return num1 + num2;
  }

  //Return the substraction of num1 - num2
  static double substract(double num1, double num2) {
    return num1 - num2;
  }

  //Return the multiply result for provided numbers
  static double multiply(double num1, double num2) {
    return num1 * num2;
  }

  //Return the division of num1 / num2
  static double divide(double num1, double num2) {
    return num1 / num2;
  }

  //Return the value of num exponentiated to power
  static double exponentiate(double num, double power) {
    return pow(num, power);
  }
}
