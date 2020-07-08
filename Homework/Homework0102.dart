import 'dart:math';

void main() {

 var dayOfWeek = {
    0: 'Monday',
    1: 'Tuesday', 
    2: 'Wednesday',
    3: 'Thursday',
    4: 'Friday',
    5: 'Saturday',
    6: 'Sunday'
  };
	
  Random rnd = new Random();
  int selectedDay = rnd.nextInt(7);
  
  print(dayOfWeek[selectedDay]);
}