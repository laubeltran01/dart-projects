import 'dart:io';
import 'dart:math';

void main() {
  age();
  randomDay();
}

void age () {
  print("What's your age?");
  final String ageStr = stdin.readLineSync();
  final int ageInt = int.parse(ageStr);
  String category;

  if(ageInt <= 18) {
    category = "Minor";
  } else if(ageInt >= 18 && ageInt < 21) {
    category = "Legal";
  } else {
    category = "Citizen";
  }

  print(category);
}

void randomDay() {
  final List<String> daysOfTheWeek = ["monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"];
  final rnd = new Random();
  final int r = rnd.nextInt(7);
  final String day = daysOfTheWeek[r];
  print("Random day of the week: $day");
}