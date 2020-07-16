import '../src/Calculator.dart';

void main() {
  double number1 = 5.1;
  double number2 = 3.0;

  var calculator = Calculator(number1, number2);
  var add = calculator.add();
  var subtract = calculator.subtract();
  var multiply = calculator.multiply();
  var divide = calculator.divide();
  var expontentiate = calculator.expontentiate();

  print(add);
  print(subtract);
  print(multiply);
  print(divide);
  print(expontentiate);
}
