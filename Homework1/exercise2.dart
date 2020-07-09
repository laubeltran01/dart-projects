import 'dart:math';

void main() {

  var random = new Random();
  
  var number = random.nextInt(7);
  
  switch(number) { 
      case 0: {  print("Sunday"); } 
      break; 
     
      case 1: {  print("Monday"); } 
      break; 
     
      case 2: {  print("Tuesday"); } 
      break; 
     
      case 3: {  print("Wednesday"); } 
      break; 
     
      case 4: {  print("Thursday"); } 
      break;  
       
      case 5: {  print("Friday"); } 
      break;  
       
      case 6: {  print("Saturday"); } 
      break;  
       
      default: { print("Invalid day"); } 
      break; 
   } 
}
