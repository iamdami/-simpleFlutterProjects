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
