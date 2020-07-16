import 'package:test/test.dart';
import '../src/Calculator.dart';

void main() {
  test('The calculator adds two numbers', () {
    var number1 = 2.0;
    var number2 = 2.0;
    var calculator = Calculator(number1, number2);

    expect(calculator.add(), equals(4.0));
  });

  test('The calculator substracts two numbers', () {
    var number1 = 2.0;
    var number2 = 2.0;
    var calculator = Calculator(number1, number2);

    expect(calculator.subtract(), equals(0.0));
  });

  test('The calculator multyplies two numbers', () {
    var number1 = 2.0;
    var number2 = 2.0;
    var calculator = Calculator(number1, number2);

    expect(calculator.multiply(), equals(4.0));
  });

  test('The calculator divides two numbers', () {
    var number1 = 2.0;
    var number2 = 2.0;
    var calculator = Calculator(number1, number2);

    expect(calculator.divide(), equals(1.0));
  });

  test('The calculator expontentiates two numbers', () {
    var number1 = 2.0;
    var number2 = 2.0;
    var calculator = Calculator(number1, number2);

    expect(calculator.expontentiate(), equals(4.0));
  });
}
