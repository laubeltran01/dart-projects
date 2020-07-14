import 'dart:math';

class Calc {
  double firstNumber;
  double secondNumber;

  Calc(double firstNumber, double secondNumber) {
    this.firstNumber = firstNumber;
    this.secondNumber = secondNumber;
  }

  double add() {
    return firstNumber + secondNumber;
  }

  double substract() {
    return firstNumber - secondNumber;
  }

  double multiply() {
    return firstNumber + secondNumber;
  }

  double divide() {
    return firstNumber / secondNumber;
  }

  double expontentiate() {
    return pow(firstNumber, secondNumber);
  }
}
