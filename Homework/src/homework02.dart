import 'dart:math';

//Class Calculator that defined 4 operations: Add, Substract, Multiply, Divide and Exponentiate
class Calculator {
  //Method add receives 2 integer params. Return paramA+paramB
  int add(int a, int b) {
    return a + b;
  }

  //Method substracts receives 2 integer params. Return paramA-paramB
  int substract(int a, int b) {
    return a - b;
  }

  //Method multiply receives 2 integer params. Return paramA*paramB
  int multiply(int a, int b) {
    return a * b;
  }

  //Method divide receives 2 integer params. Return paramA/paramB
  int divide(int a, int b) {
    int result = 0;
    try {
      result = a ~/ b;
    } catch (error) {
      print(error.toString());
    }
    return result;
  }

  //Method exponentiate receives 2 integer params. Return paramA^paramB
  int exponentiate(int a, int b) {
    return pow(a, b);
  }
}

void main() {
  //Calculator instantiated
  Calculator calc = new Calculator();
  //Random created to generate 2 integers
  Random rnd = new Random();
  int a = rnd.nextInt(50);
  int b = rnd.nextInt(50);
  //Calculator Add
  print("ADD ($a,$b):" + calc.add(a, b).toString());
  //Calculator Substract
  print("SUBSTRACT ($a,$b): " + calc.substract(a, b).toString());
  //Calculator Multiply
  print("MULTIPLY ($a,$b): " + calc.multiply(a, b).toString());
  //Calculator Divide
  print("DIVIDE ($a,$b): " + calc.divide(a, b).toString());
  //Calculator Exponentiate
  print("EXPONENTIATE ($a,$b): " + calc.exponentiate(a, b).toString());
}
