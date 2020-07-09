void main(List<String> arguments) {
  var age = 17;
  var message = '';
  if (age >= 21) {
    message = 'Citizen';
  } else if (age >= 18 && age <= 20) {
    message = 'Legal Age';
  } else if (age < 18) {
    message = 'minor';
  }
  print(message);
}
