import 'dart:math';
import 'CannotDivideByZeroException.dart';

class Calculator {

	double add(double a, double b) => a + b;
	
	double subtract(double a, double b) => a - b;
	
	double multiply(double a, double b) => a * b;
	
	double divide(double a, double b) {
		if (b == 0) {
			throw CannotDivideByZeroException();
		}
		return a / b;
	}
	
	double exp(double a, double b) => pow(a, b);

}