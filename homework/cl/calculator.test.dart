import 'package:test/test.dart';

import 'calculator.dart';

void main() {
  group('Calculator', () {
    Calculator cal;
    setUp(() {
      cal = new Calculator();
    });

    test('add', () {
      expect(cal.add(2, 3), 5);
    });

    test('subtract', () {
      expect(cal.subtract(5, 3), 2);
      expect(cal.subtract(3, 5), -2);
    });

    test('multiply', () {
      expect(cal.multiply(5, 6), 30);
    });

    test('divide', () {
      expect(cal.divide(12, 4), 3);
      expect(cal.divide(12, 5), 2.4);
      expect(cal.divide(12, 0), double.infinity);
      expect(cal.divide(0, 5), 0);
    });

    test('expontentiate', () {
      expect(cal.expontentiate(2, 6), 64);
    });

  });
}
