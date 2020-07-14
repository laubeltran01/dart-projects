import 'dart:math';

class Calculator {
  Calculator();

  num add(int a, int b) {
    return a + b;
  }

  num substract(int a, int b) {
    return a - b;
  }

  num multiply(int a, int b) {
    return a * b;
  }

  num divide(int a, int b) {
    return a / b;
  }

  num exponentiate(int base, int exponent) {
    return pow(base, exponent);
  }
}
