
/**
 * @title: Excercise 1
 * @description: Validates the input age and log shows if you are citizen
 * or legal age, or minor according the value
 */
void main() {
  try{
    /// Set the current age
    const int currentAge = 14;

    print('Your age is ${currentAge}');
    switch(true){
      /// If the current age is under 18, set Minor
      case (currentAge < 18):
        print('Minor');
      break;
      /// If the current age is over or equal to 18
      /// and under or equal to 20, set Legal age
      case (currentAge >= 18 && currentAge <= 20):
        print('Legal age');
      break;
      /// If the current age is over 20, set Citizen
      case (currentAge > 20):
        print('Citizen');
      break;
      /// If the age is not valid show an error

      default:
        throw 'Invalid age';
    }
  }
  catch(error){
    print(error);
  }

}
