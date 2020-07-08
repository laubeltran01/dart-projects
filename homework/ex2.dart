import 'dart:math';

void main (){

  var dayOfWeek = {
    0: 'Monday',
    1: 'Tuesday', 
    2: 'Wednesday',
    3: 'Thursday',
    4: 'Friday',
    5: 'Saturday',
    6: 'Sunday'
    };

    var randomNumber = Random();

    //Selects a random number between 0 and 6
    int chosenNumber = randomNumber.nextInt(7);

    print(chosenNumber);
    print(dayOfWeek[chosenNumber]);

}