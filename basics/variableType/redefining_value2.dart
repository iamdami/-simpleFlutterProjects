void main() {
  double? num1 = 3.0;
  print(num1);
  
  num1 = null;
  print(num1);
  
  num1 ??= 4.0;
  print(num1);
}
// num1 ??= 4.0; 에서 ??=은 변수에 null이 들어있다면 null값을 오른쪽에 넣어준 값으로 바꾸라는 뜻
// null이 아닐 때는 오른쪽 값으로 바꾸지 않음
