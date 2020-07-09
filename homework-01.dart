
import 'dart:math';

void main() {
  exerciseOne();
  exerciseTwo();
}

// First exercise
void exerciseOne() {
  var age = Random().nextInt(70);
  var category;

  if (age >= 21) {
    category = 'Citizen';
  } else if (age < 18) {
    category = 'Minor';
  } else {
    category = 'Legal ';
  }

  print('Age: $age -> $category');
}

// Second exercise
void exerciseTwo() {
  var days = {
    0: 'Monday',
    1: 'Tuesday',
    2: 'Wednesday',
    3: 'Thursday',
    4: 'Friday',
    5: 'Saturday',
    6: 'Sunday'
  };
  var num = Random().nextInt(7);
  print('Number: $num - Day: ${days[num]}');
}




