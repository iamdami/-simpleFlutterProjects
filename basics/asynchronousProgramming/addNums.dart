void main() {
  addNums(3, 4);
  addNums(5, 6);
  addNums(7, 8);
}

void addNums(int num1, int num2){
  print("계산 시작: ${num1 + num2}");
  
  //서버 시뮬레이션
  Future.delayed(Duration(seconds: 3), (){
    print("계산 완료: $num1 + $num2 = ${num1 + num2}");
  });
  print("함수 완료");
}

// 계산 시작: 7
// 함수 완료
// 계산 시작: 11
// 함수 완료
// 계산 시작: 15
// 함수 완료
// 계산 완료: 3 + 4 = 7
// 계산 완료: 5 + 6 = 11
// 계산 완료: 7 + 8 = 15

// 서버가 있다고 가정하고 딜레이줬는데 계산 끝나길 기다리지 않고 다음 계산으로 넘어감
