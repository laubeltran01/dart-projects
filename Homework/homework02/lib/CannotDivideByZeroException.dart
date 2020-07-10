class CannotDivideByZeroException implements Exception {

	// Declaring this field as immutable and private as it should not be accessed directly from the outside.
	final String _errorMessage = 'The denominator cannot be zero';

	String get message => _errorMessage;
	
}