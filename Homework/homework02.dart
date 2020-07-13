import 'dart:math';
import "package:test/test.dart";

void main() {
  final calculator = Calculator();
  calculator.calculatorTests();
}

class Calculator {
  /// Sums two given double numbers and returns the answer.
  double add(double firstNumber, double secondNumber) {
    return firstNumber + secondNumber;
  }

  /// Decreases the [subtrahend] from the [minuend] and returns the difference.
  double substract(double minuend, double subtrahend) {
    return minuend - subtrahend;
  }

  /// Multiplies [multiplicant] by [multiplier] and returns the product.
  double multiply(double multiplicant, double multiplier) {
    return multiplicant * multiplier;
  }

  /// Divides [dividend] by [divisor] and returns quotient.

  double divide(double dividend, double divisor) {
    return dividend / divisor;
  }

  ///Repeats the multiplication of [base] the [exponent] number of times.
  double exponentiate(double base, double exponent) {
    return pow(base, exponent);
  }

  calculatorTests() {
    group('Calculator_tests', () {
      test('test_adition', () {
        var expected = 18.5;
        var actual = add(10, 8.5);

        expect(actual, expected);
        // Asset
      });
      test('test_substraction', () {
        var expected = 5;
        var actual = substract(10, 5);

        expect(actual, expected);
        // Assert
      });
      test('test_multiplication', () {
        var expected = 20;
        var actual = multiply(5, 4);

        expect(actual, expected);
        // Assert
      });
      test('test_exponentiation', () {
        var expected = 3125;
        var actual = exponentiate(5, 5);

        expect(actual, expected);
        // Assert
      });
    });
  }
}
