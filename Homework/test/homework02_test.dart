import '../homework02.dart';
import 'package:test/test.dart';

void main() {
  Calculator calc = new Calculator();
  test("Test to check Add method", () {
    // Arrange
    var expected = 30;

    // Act
    var actual = calc.add(10, 20);

    // Asset
    expect(actual, expected);
  });
  test("Test to check Substract method", () {
    // Arrange
    var expected = 5;

    // Act
    var actual = calc.substract(20, 15);

    // Asset
    expect(actual, expected);
  });
  test("Test to check Multiply method", () {
    // Arrange
    var expected = 30;

    // Act
    var actual = calc.multiply(3, 10);

    // Asset
    expect(actual, expected);
  });
  test("Test to check Divide method", () {
    // Arrange
    var expected = 2;

    // Act
    var actual = calc.divide(20, 0);

    // Asset
    expect(actual, expected);
  });
  test("Test to check Exponentiate method", () {
    // Arrange
    var expected = 64;

    // Act
    var actual = calc.exponentiate(2, 6);

    // Asset
    expect(actual, expected);
  });
}
