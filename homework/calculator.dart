import 'dart:math';

/// a nice calculator
class Calculator {
  num add(num x, num y) {
    return x + y;
  }

  num subtract(num x, num y) {
    return x - y;
  }

  num multiply(num x, num y) {
    return x * y;
  }

  num divide(num x, num y) {
    return x / y;
  }

  num expontentiate(num x, num exponent) {
    return pow(x, exponent);
  }
}
