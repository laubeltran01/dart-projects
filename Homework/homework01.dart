import 'dart:math';

void main() {
  
  //Exercise 1
  int age = 26;
  
  if (age >= 21)
    print("Citizen");
  else if (age <= 20 && age >= 18)
    print("Legal");
  else if (age < 18)
    print("Minor");
  
  //exercise 2
  var weekDays = {
    0: 'Sunday',
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday'
  };
  
  print(weekDays[new Random().nextInt(6)]);
}