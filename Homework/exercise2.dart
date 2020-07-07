import "dart:math";

void main() {
  
final rand = Random();
  
  assert (transformer(0) == 'Sunday');
  assert (transformer(1) == 'Monday');
  assert (transformer(2) == 'Tuesday');
  assert (transformer(3) == 'Wednesday');
  assert (transformer(4) == 'Thursday');
  assert (transformer(5) == 'Friday');
  assert (transformer(6) == 'Saturday');
  assert (transformer(7) == 'Not Found');
  
  print('Executed successfully');

  final number = rand.nextInt(7);
  print('The number was $number, corresponding with day ${transformer(n)}')


}


String transformer(int value){
  switch(value){
    case 0: return "Sunday";
    case 1: return "Monday";
    case 2: return "Tuesday";
    case 3: return "Wednesday";
    case 4: return "Thursday";
    case 5: return "Friday";
    case 6: return "Saturday";
    default: return "Not Found";
  }
}

