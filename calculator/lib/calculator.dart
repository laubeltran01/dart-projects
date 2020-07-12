import 'dart:math';

class Calculator {
  //The function returns the addition of 2 parameters
  int add(int number1, int number2) => number1 + number2;

  //The function returns the subtraction of 2 parameters. param1-param2
  int subtract(int number1, int number2) => number1 - number2;

  //The function returns the multiplication of 2 parameters.
  int multiply(int number1, int number2) => number1 * number2;

  //The function returns the division of param 1 between param 2.
  double divide(int number1, int number2) => number1 / number2;

  //The function returns the result of param 1 raise to the power of  param 2.
  int power(int number1, int number2) => pow(number1, number2);
}
