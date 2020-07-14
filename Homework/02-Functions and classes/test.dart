import 'Calculator.dart';

main() {
  //Setup
  var calculator = Calculator();
  num a = 12, b = 4;

  //Add
  assert(calculator.add(a, b) == a + b, '$a+$b should be equal to ${a + b}');
  //Substract
  assert(
      calculator.substract(a, b) == a - b, '$a-$b should be equal to ${a - b}');
  //Multiply
  assert(
      calculator.multiply(a, b) == a * b, '$a*$b should be equal to ${a * b}');
  //Divide
  assert(calculator.divide(a, b) == a / b, '$a/$b should be equal to ${a / b}');
  assert(calculator.divide(12, 4) == 3, '12/4 should be equal to 3');
  assert(calculator.divide(12, 5) == 2.4, '12/5 should be equal to 2.4');
  assert(calculator.divide(0, 5) == 0, '0/5 should be equal to 0');
  assert(calculator.divide(5, 0) == double.infinity,
      '5/0 should be equal to infinity');
  //Exponentiate
  assert(calculator.exponentiate(2, 6) == 64, '2^6 should be equal to 64');
}
