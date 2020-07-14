import 'package:test/test.dart';
import 'exercise3.dart';
import "dart:math";

void main() {
  final calculator = Calculator();

  group('Calculator', () {
    test('Basic operations', () {

      expect(calculator.operate('+', 3, 4), 7);
      expect(calculator.operate('+', 0, 951), 951);
      expect(calculator.operate('-', 3, 4), -1);
      expect(calculator.operate('-', 78, 4), 74);
      expect(calculator.operate('*', 3, 4), 12);
      expect(calculator.operate('*', 365420, 0), 0);
      expect(calculator.operate('/', 3, 4), 0.75);
      expect(calculator.operate('/', 3, 0), double.infinity);
    });

    test('Extended operations', () {

      calculator.addOperation('^', (x)=>(y)=>pow(x, y));

      var largeNum = 2046526777500669368329342638102622164679041.0;
      expect(calculator.operate('^', 21, 32), largeNum);
      expect(calculator.operate('^', 0, 951), 0);
      expect(calculator.operate('^', 951, 1), 951);
    });

    test('Unkown operation', () {

      identical(calculator.operate('((', 21, 32), double.nan);
    });
  });
}
