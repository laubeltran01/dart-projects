void main() {
  int age = 17;
  
  if(age > 21) {
    print('Citizen');
  } else if (age >= 18 && age <= 20){
    print('Legal');
  }
  else{
    print('Minor');
  }
}