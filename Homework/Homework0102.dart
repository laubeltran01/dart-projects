import 'dart:math';

void main() {
  Random rnd = new Random();
  int dayOfWeek = rnd.nextInt(6);
  
  switch(dayOfWeek){
    case 0:
      print('Sunday');
      break;
    case 1:
      print('Monday');
      break;  
    case 2:
      print('Tuesday');
      break;
    case 3:
      print('Wednesday');
      break;
    case 4:
      print('Thursday');
      break; 
    case 5:
      print('Friday');
      break;
    case 6:
      print('Saturday');
      break;
  }
}