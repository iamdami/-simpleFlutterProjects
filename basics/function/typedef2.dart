// 함수는 {}안에 수행할 내용을 넣지만 typedef는 그렇지 않음
// typedef는 함수를 변수처럼 사용할 수 있게 해 줌

void main() {
  Operation operation = add;
  int res1 = operation(10, 20, 30);
//   print(res1);
  operation = subtract;
  int res2 = operation(10, 20, 30);
//   print(res2);
  
  int res3 = calc(30, 40, 50, add);
  print(res3);
  int res4 = calc(30, 40, 50, subtract);
  print(res4);
}

// signature
typedef Operation = int Function(int num1, int num2, int num3);
int add(int num1, int num2, int num3) => num1 + num2 + num3;
int subtract(int num1, int num2, int num3) => num1 - num2 - num3;

// 아래와 같이 많이 사용
int calc(int num1, int num2, int num3, Operation operation){
  return operation(num1, num2, num3);
}
