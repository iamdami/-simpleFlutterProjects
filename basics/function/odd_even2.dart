void main() {
  addNums(10, 20, 30);
}

addNums(int num1, int num2, int num3){
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

// 매개변수 이용
