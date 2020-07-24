import 'dart:math';

const days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

main() {
  int random = new Random().nextInt(days.length);
  String day = days[random];
  print("The random number is $random, so it's $day");
}
