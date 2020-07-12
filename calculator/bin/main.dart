import 'package:calculator/calculator.dart';
import 'dart:math';

void main(List<String> arguments) {
  var randomGenerator = Random();
  var number1 = randomGenerator.nextInt(100);
  var number2 = randomGenerator.nextInt(10);
  var calculator = Calculator();

  print('Add: ${calculator.add(number1, number2)}');
  print('Subtract: ${calculator.subtract(number1, number2)}');
  print('Multiply: ${calculator.multiply(number1, number2)}');
  print('Divide: ${calculator.divide(number1, number2)}');
  print('Power: ${calculator.power(number1, number2)}');
}
