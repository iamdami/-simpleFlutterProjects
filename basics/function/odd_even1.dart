//3개 숫자 더하고 그 값이 짝수인지 홀수인지 알려주는 함수

void main() {
  addNums();
}

addNums(){
  int num1 = 10;
  int num2 = 20;
  int num3 = 30;
  
  int sum = num1 + num2 + num3;
  
  print("num1: $num1");
  print("num2: $num2");
  print("num3: $num3");
  
  if (sum % 2 == 0){
    print("짝수");
  }
  else {
    print("홀수");
  }
}
