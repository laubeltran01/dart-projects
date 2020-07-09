
void main() {
  final calculator = new Calculator();
  print(calculator.add(2, 5));
  print(calculator.substract(5, 3));
  print(calculator.multiply(5, 6));
  print(calculator.divide(12, 4));
  print(calculator.expontentiate(2, 6));
}

class Calculator {

  // Functions
  num add(num a, num b) {
    return a + b;
  }

  num substract(num a, num b) {
    return a - b;
  }

  num multiply(num a, num b) {
    return a * b;
  }

  num divide(num a, num b) {
    return a / b;
  }

  num expontentiate(num a, num b) {
    if(b < 0) {
      throw Exception("exponent cannot be less than 0");
    }
    var count = 1;
    for (int i in range(b)) {
      count *= a;
    }
    return count;
  }
}

// aux range function for pretty for loops
range(int stop, {int start: 0, int step: 1}){
  return start < stop == step > 0
      ? List<int>.generate(((start-stop)/step).abs().ceil(), (int i) => start + (i * step))
      : [];
}