import 'dart:io';

void main() {
  print ("Please enter your age: ");
  var strAge = stdin.readLineSync();
  
  int age = int.parse(strAge);
  
  if(age > 21) {
    print('Citizen');
  } else if (age >= 18 && age <= 20){
    print('Legal');
  }
  else{
    print('Minor');
  }
}