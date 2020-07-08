import 'dart:io';


void main() {

  print ("Enter your age : ");
  //Reads a string value for age
  var iAge = stdin.readLineSync();
  
  //Turns input into a number  
  int age = int.parse(iAge);
    
  if (age < 18){
    print ('minor');
  }
  else if (age >= 18 && age < 21) {
    print ('Legal age');
  }
  else {
    print ('citizen');
  }
  
}
