import 'dart:io';
import 'dart:math';

void main() {
  firstExcercise();
  secondExcercise();
}


firstExcercise() {
  print('First Exercise');
  print('Enter your Age:');
  try {
    var age = int.parse(stdin.readLineSync());
    if (age >= 21) {
      print('Citizen');
    } else if (age >= 18 && age <= 20) {
      print('Legal');
    } else {
      print('Minor');
    }
  } catch (_) {
    print('Please enter a valid value.');
    firstExcercise();
  }
}

secondExcercise() {
  print('Second Exercise:');
  Map<int,String> days = {
    0: 'Sunday',
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday'
  };

  var randomgenerator = new Random();
  print(days[randomgenerator.nextInt(6)]);

}