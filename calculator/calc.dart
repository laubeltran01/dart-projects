import 'dart:math';

class calculator {
  
  static void add (double a, double b) {
    print (a + b);
  }

  static void substract (double a, double b) {
    print (a - b);
  }

  static void multiply (double a, double b) {
    print (a * b);
  }

  static void divide (double a, double b) {
    if (b == 0) {
      print('Math error (divide by 0)');
    }
    else {
      print (a / b);
    }
    
  }

  static void expontentiate (double a, double b) {
    print (pow(a,b));
  } 
}


void main(){
  
  calculator.add(2, 5);
  calculator.substract(5, 3);
  calculator.multiply(5, 6);
  calculator.divide(12, 4);
  calculator.expontentiate(2, 6);
  
}