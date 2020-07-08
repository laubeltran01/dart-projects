import 'dart:io';
import 'dart:math';

main() {
  stdout.writeln('********Age*************');
    var rngAge = new Random();
    for (var i = 0; i < 10; i++) {
      mapAge(rngAge.nextInt(50));
    }    
    stdout.writeln('********End Age*************');

    stdout.writeln('********Random Number*************');
    var rng = new Random();
    for (var i = 0; i < 10; i++) {
      validateNumber(rng.nextInt(7));
    }
    stdout.writeln('********End Random Number*************');

}

void mapAge(int age)
{
  stdout.write("$age - ");
  if(age >= 21){
        stdout.writeln('citizen');  
  }else if(age >=18 && age <= 20){
    stdout.writeln('Legal age');  
  }else {
    stdout.writeln('minor');  
  }   
}

void validateNumber(int number){
  stdout.write("$number - ");
  switch (number){
    case 1: 
      stdout.writeln('Monday');
      break;
      case 2: 
      stdout.writeln('Tuesday');
      break;
      case 3: 
      stdout.writeln('Wednesday');
      break;
      case 4: 
      stdout.writeln('Thursday');
      break;
      case 5: 
      stdout.writeln('Friday');
      break;
      case 6: 
      stdout.writeln('Saturday');
      break;
      case 0: 
      stdout.writeln('Sunday');
      break;
      default:
        break;
  }
}