import 'calc.dart';

void main() {
  var firstNumber = 10.0;
  var secondNumber = 20.0;
  var calc = Calc(firstNumber, secondNumber);
  print('$firstNumber + $secondNumber=' + calc.add().toString());
  print('$firstNumber * $secondNumber=' + calc.multiply().toString());
  print('$firstNumber - $secondNumber=' + calc.substract().toString());
  print('$firstNumber / $secondNumber=' + calc.divide().toString());
  print('$firstNumber ^ $secondNumber=' + calc.expontentiate().toString());
}
