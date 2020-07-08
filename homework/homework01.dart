import 'dart:math';

void main() {
  // Age manager interaction
  var ages = [16,17,18,19,20,21,22,23,24,25,26,27,15,14,13,12,11,10];
  ages.forEach((age) => ageManager(age));
  // Random interaction
  randomDay();
  randomDay();
}

void ageManager(int age){
  if(age >= 18 && age <= 20)
    print("Legal age");
  else if (age >= 21)
    print("Citizen");
  else
    print("Minor");
}

void randomDay(){
  var days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  var randomNumber = new Random();
  print(days[randomNumber.nextInt(7)]);
}