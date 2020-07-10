import '../lib/Calculator.dart';
import '../lib/CannotDivideByZeroException.dart';

void main(List<String> arguments) {
	// Official documentation encourages to omit the type of local variables since they can be easily inferred.
	var calc = Calculator();

	// Here, the variables are declared with their corresponding type since the calculator functions are expecting both values to be of type double.
	// If we don't specify the type, the compiler would infer it to be int, which will cause a compile time error.
	double a = 31;
	double b = 25;

	// Add
	print('Adding $a to $b');
	print(calc.add(a, b));

	// Subtract
	print('Subtracting $b from $a');
	print(calc.subtract(a, b));

	// Multiplication
	print('Multiplying $a times $b');
	print(calc.multiply(a, b));

	// Division
	print('Dividing $a by $b');
	print(calc.divide(a, b));

	print('Dividing $a by 0');
	try {
		print(calc.divide(a, 0));
	} on CannotDivideByZeroException catch(exception) {
		print(exception.message);
	}

	// Exponential
	// Here, the variables a and b are being reassigned through the expressions inside the brackets.
	print('Raising ${a = 2} to the power of ${b = 4}');
	print(calc.exp(a, b));
}