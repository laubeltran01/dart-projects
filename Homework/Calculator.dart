/**
 * Calculator Application
 */
void main() {
  // Make an instance
  Calculator calculator = new Calculator();
  // Test the operations
  print(calculator.add(2, 5) == 7);
  print(calculator.subtract(5, 3) == 2);
  print(calculator.multiply(5, 6) == 30);
  print(calculator.divide(12, 4) == 3);
  print(calculator.expontentiate(2, 6) == 64);
}

class Calculator {
  /// Do the sum operation between two values as addends
  double add(double firstValue, double secondValue) => (firstValue + secondValue);
  /// Do the subtract operation between two values,
  /// starting first value as minuend and second value as subtrahend
  double subtract(double firstValue, double secondValue) => (firstValue - secondValue);
  /// Do the multiply operation between two values as factors
  double multiply(double firstValue, double secondValue) => (firstValue * secondValue);
  /// Do the divide operation between two values
  /// starting first value as dividen and second value as divider
  double divide(int firstValue, int secondValue) => (firstValue / secondValue);
  /// Do the expontentiate operation between two values
  /// starting first value as base and second value as exponential
  double expontentiate(int firstValue, int secondValue){
    int total = firstValue;
    // if the second value is negative the flag positive is enable
    bool positive = secondValue >= 0;
    secondValue = secondValue >= 0 ? secondValue : secondValue * -1;
    for(int i = 1; i < secondValue; i++){
        total *= firstValue;
    }
    // if the second value is negative, the total divide the number 1
    if(positive){
      return secondValue != 0 ? total.toDouble() : 0;
    }
    else{
      return (1 / total);
    }
  }
}