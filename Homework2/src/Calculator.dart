import 'dart:math';

class Calculator {
  double number1;
  double number2;

  Calculator(this.number1, this.number2) {
    // Initialization code goes here.
  }

  double add() {
    return number1 + number2;
  }

  double subtract() {
    return number1 - number2;
  }

  double multiply() {
    return number1 * number2;
  }

  double divide() {
    return number1 / number2;
  }

  double expontentiate() {
    return pow(number1, number2);
  }
}
