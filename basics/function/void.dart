// return type

void main() {
  int res1 = addNums(num1: 10, num2: 20);
  int res2 = addNums(num1: 20, num2: 30, num3: 40);
  print("result1: $res1");
  print("result2: $res2");
  print("sum: ${res1 + res2}");
}

addNums({
  required int num1,
  required int num2,
  int num3 = 30,
}){
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
  return sum;
}
