import "dart:math";

void main() {
  var c = Calculator();

  //Defining the ^ symbol as power operation
  c.addOperation('^', (x) => (y) => pow(x, y));

  //Trying test case: inventing new operator ((
  c.addOperation('((', (x) => (y) => ((x + 83) * 37) % y);

  print(c.operate('^', 5, 8));
  print(c.operate('((', 6, 8));
}

class Calculator {
  Map<String, Function> funcs;

  Calculator() {
    funcs = {
      '+': (x) => (y) => x + y,
      '-': (x) => (y) => x - y,
      '*': (x) => (y) => x * y,
      '/': (x) => (y) => x / y
    };
  }

  void addOperation(String name, Function operator) {
    funcs.putIfAbsent(name, () => operator);
  }

  double operate(String operator, double x, double y){
    try {
      return funcs[operator](x)(y);
    }catch(e){
      print('Operation not Found');
      return double.nan;
    }
  }
}
