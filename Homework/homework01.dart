import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  getPopulationType();
  getWeekDay();
  getWeekDayV2();
}

// Exercise #1
getPopulationType() {
  print('Please type your age:');

  // stdin.readLineSync() is not supported by DartPad, this was made in IntelliJ
  var age = int.parse(stdin.readLineSync());

  if (age < 18) {
    print('Minor');
  } else if (age >= 18 && age <= 20) {
    print('Legal');
  } else {
    print('Citizen');
  }
}

// Exercise #2 v1
getWeekDay() {
  var weekDay = Random().nextInt(7);

  switch (weekDay) {
    case 0:
      print('Monday');
      break;
    case 1:
      print('Tuesday');
      break;
    case 2:
      print('Wednesday');
      break;
    case 3:
      print('Thursday');
      break;
    case 4:
      print('Friday');
      break;
    case 5:
      print('Saturday');
      break;
    case 6:
      print('Sunday');
      break;
  }
}

// Exercise #2 v2
getWeekDayV2() {
  final week = const {
    0: 'Monday',
    1: 'Tuesday',
    2: 'Wednesday',
    3: 'Thursday',
    4: 'Friday',
    5: 'Saturday',
    6: 'Sunday'
  };

  var weekDay = Random().nextInt(7);
  print(week[weekDay]);
}
