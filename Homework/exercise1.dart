void main() {
  
  assert (getPersonType(28) == 'citizen');
  assert (getPersonType(21) == 'citizen');
  assert (getPersonType(20) == 'Legal age');
  assert (getPersonType(18) == 'Legal age');
  assert (getPersonType(17) == 'minor');
  
  print('Executed successfully');
}


String getPersonType(int age){
  if (age >= 21){
    return "citizen";
  }else if (age >= 18){
    return "Legal age";
  }else{
    return "minor";
  }
}
