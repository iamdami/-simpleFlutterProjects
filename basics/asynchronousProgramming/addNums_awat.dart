void main() async{
  await addNums(3, 4);
  await addNums(5, 6);
}

Future<void> addNums(int num1, int num2) async{
  print("계산 시작: ${num1 + num2}");
  
  //서버 시뮬레이션
  await Future.delayed(Duration(seconds: 3), (){
    print("계산 완료: $num1 + $num2 = ${num1 + num2}");
  });
  print("함수 완료: $num1 + $num2");
}

// 계산 시작: 7
// 계산 완료: 3 + 4 = 7
// 함수 완료: 3 + 4
// 계산 시작: 11
// 계산 완료: 5 + 6 = 11
// 함수 완료: 5 + 6

// 위 예시에서 '계산 시작' 부분도 순서대로 출력되게 하고 싶다면 main 함수에도 async 할 수 있는데,
// await은 Future을 위해(?) 나온 거기 때문에 Future<void> addNums(int num1, int num2) 이렇게 Future로 만들어 줘야하고, main()의 addNums()앞에 await 붙여주면 됨
