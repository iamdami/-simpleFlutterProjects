// parameter / argment: 매개변수
// positional parameter: 순서가 중요한 매개변수
// optional parameter: 있어도 되고 없어도 되는 매개변수
// named parameter: 이름이 있는 매개변수(순서가 중요하지 않음)
// arrow function: 화살표 함수


// 함수 안 매개변수를 []로 묶어주면 optional parameter가 됨
// ex) addNums(int num1, [int num2, int num3])
// 하지만 여기서 []안 값들에 에러가 남 
// -> 값이 null일 수도 있는데 int로 선언해주면 null이 못들어가기 때문
//     이 때는 int num2 = 20, int num3 = 30 처럼 기본값을 설정해주면 됨
//     ex) addNums(int num1, [int num2 = 20, int num3 = 30])
// 만약 main()의 addNums(10, 20, 30) 이렇게 설정해주면 optional parameter 값도 main()에서 정의해줬으므로 미리 설정한 기본 값은 무시됨
  
void main() {
  addNums(num1: 10, num2: 20);
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

  //named parameter에서도 required 사용하느냐, 안하느냐에 따라 optional parameter를 사용할 수 있음
}
