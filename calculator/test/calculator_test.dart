import 'package:calculator/calculator.dart';

import 'package:test/test.dart';

void main() {
  final calculator = Calculator();

  test('Check addition funtion', () {
    var actual = calculator.add(15, 20);
    expect(actual, 35);
  });
  test('Check substraction funtion', () {
    var actual = calculator.subtract(15, 20);
    expect(actual, -5);
  });
  test('Check multiplication funtion', () {
    var actual = calculator.multiply(8, 6);
    expect(actual, 48);
  });
  test('Check division funtion', () {
    var actual = calculator.divide(80, 10);
    expect(actual, 8);
  });
  test('Check power funtion', () {
    var actual = calculator.power(3, 3);
    expect(actual, 27);
  });
}
