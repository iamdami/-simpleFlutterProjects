// 함수와 바디 사이에 'async'를 꼭 넣어줘야 사용 가능

void main() {
  addNums(3, 4);
  addNums(5, 6);
}

void addNums(int num1, int num2) async{
  print("계산 시작: ${num1 + num2}");
  
  //서버 시뮬레이션
  await Future.delayed(Duration(seconds: 3), (){
    print("계산 완료: $num1 + $num2 = ${num1 + num2}");
  });
  print("함수 완료: $num1 + $num2");
}

// 계산 시작: 7
// 계산 시작: 11
// 계산 완료: 3 + 4 = 7
// 함수 완료: 3 + 4
// 계산 완료: 5 + 6 = 11
// 함수 완료: 5 + 6

// await는 현재 코드가 끝나기 전엔 다음 코드 실행하지 못하게 함
// 하지만 현재 코드가 끝나길 기다리는 동안 실행할 수 있는 코드를 실행(계산)
