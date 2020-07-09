import 'dart:math';

void main() {
  
  print('Excercise 1 (Age):\n');

  List <int> ages = [28,21,20,18,17];
  String status;

  ages.forEach((age){
    if (age >= 21) {
      status = 'citizen';
    } else if (age < 18) {
      status = 'minor';
    } else {
      status = 'Legal age';
    }
    print('Your age is $age and your status is $status');
  });

  print('\n');

  print('Excercise 2 (Random day of the week):\n');
  
  int randomDay = new Random().nextInt(7);
  String day;

  switch (randomDay) {
    case 0:
      day = 'Monday';
      break;
    case 1:
      day = 'Tuesday';
      break;
    case 2:
      day = 'Wednesday';
      break;
    case 3:
      day = 'Thursday';
      break;
    case 4:
      day = 'Friday';
      break;
    case 5:
      day = 'Saturday';
      break;
    case 6:
      day = 'Sunday';
      break;
  }

  print('$randomDay - $day');
}