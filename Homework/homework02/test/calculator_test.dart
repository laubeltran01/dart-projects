import 'package:test/test.dart';
import 'package:flutterworkshop/CannotDivideByZeroException.dart';
import 'package:flutterworkshop/Calculator.dart';

void main() {
	// Official documentation encourages to omit the type of local variables since they can be easily inferred.
	var calc = Calculator();

	// Here, the variables are declared with their corresponding type since the function is expecting both values to be of type double.
	// If we don't specify the type, the compiler would infer it to be int, which will cause a compile time error.
	double a = 31;
	double b = 25;
	double expectedResult;

	// Test for "add" function
	test('Function <<add>> adds <a> to <b> successfully', () {
		expectedResult = 56;
		expect(calc.add(a, b), expectedResult);
	});

	// Test for "subtract" function
	test('Function <<subtract>> subtract <b> from <a> successfully', () {
		expectedResult = 6;
		expect(calc.subtract(a, b), expectedResult);
	});

	// Test for "multiply" function
	test('Function <<multiply>> multiplies <a> times <b> successfully', () {
		expectedResult = 775;
		expect(calc.multiply(a, b), expectedResult);
	});

	// Test for "divide" function
	test('Function <<divide>> divides <a> by <b> successfully', () {
		expectedResult = 1.24;
		expect(calc.divide(a, b), expectedResult);
	});

	// Test for "divide" function
	test('Function <<divide>> divides <a> by 0 and throws a CannotDivideByZeroException', () {
		// When testing an exception, the first argument of the "expect" function must be an anonymous function
		// that will eventually throw the exception.
		expect(() => calc.divide(a, 0), throwsA(TypeMatcher<CannotDivideByZeroException>()));
	});

	// Test for "exp" function
	test('Function <<exp>> returns <a> to the power of <b> successfully', () {
		a = 2;
		b = 4;
		expectedResult = 16;
		expect(calc.exp(a, b), expectedResult);
	});
}
