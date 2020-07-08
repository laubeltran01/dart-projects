
import 'dart:math';
​
/**
 * @title: Excercise 2
 * @description: Select a random number up to 7, depending on the selected
 * number is printed on the console the day of the week to which corresponds.
 */
void main() {
  try{
    /// Gets a random instance
    final _random = new Random();
    /// Creates a days of week list
    const daysOfWeek = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    /**
     * Generates a positive random integer uniformly distributed on the range
     * from [min], inclusive, to [max], exclusive.
     */
    int next(int min, int max) => min + _random.nextInt(max - min);
    /// Get a random number between 0 and 6
    int weekDay = next(0,6);
    // Validate if is a valid value
    if(weekDay <= 6){
      print(daysOfWeek[weekDay]);
    }
    else{
      throw 'Not a valid day';
    }
  }
  catch(error){
    print(error);
  }
​
}
​