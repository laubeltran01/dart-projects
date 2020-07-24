main(List<String> arguments) {
  try {
    int age = int.parse(arguments[0]);
    String status = getStatus(age);
    print('Your age is $age, so you are a $status');
  } on FormatException {
    print('Please type a correct number');
  } catch (e) {
    print('Something really unknown: $e');
  }
}

/// returns your legal status for a given [age]
String getStatus(int age) {
  if (age < 18) {
    return "minor";
  } else if (age >= 18 && age < 21) {
    return "Legal age";
  } else {
    return "citizen";
  }
}
