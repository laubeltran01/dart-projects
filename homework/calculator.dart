import 'dart:math';

class Calculator{
  double add(double number1, double number2) => number1 + number2;
  double substract(double number1, double number2) => number1 - number2;
  double multiply(double number1, double number2) => number1 * number2;
  double divide(double number1, double number2) {
    if (number2 == 0.0)
      print("No zero division allowed");
    else
      return number1 / number2;
  }
  double expontentiate(double base, double exponent) => pow(base, exponent);
}

void main() {
  var calculator = Calculator();
  print(calculator.add(2.0, 5.0));
  print(calculator.add(6.0, 66.0));
  print(calculator.substract(5.0, 3.0));
  print(calculator.substract(2.0, 5.0));
  print(calculator.multiply(5.0, 6.0));
  print(calculator.multiply(200.0, 32.0));
  print(calculator.divide(12.0, 4.0));
  calculator.divide(2.0,0.0);
  print(calculator.expontentiate(2.0,5.0));
  print(calculator.expontentiate(2.0,10.0));
}
