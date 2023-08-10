void main() async {
  final res1 = await addNums(3, 4);
  final res2 = await addNums(5, 6);

  print("res1: $res1");
  print("res2: $res2");
  print("res1 + res2: ${res1 + res2}");
}

Future<int> addNums(int num1, int num2) async {
  print("계산 시작: ${num1 + num2}");

  //서버 시뮬레이션
  await Future.delayed(Duration(seconds: 3), () {
    print("계산 완료: $num1 + $num2 = ${num1 + num2}");
  });
  print("함수 완료: $num1 + $num2");

  return num1 + num2;
}

// 계산 시작: 7
// 계산 완료: 3 + 4 = 7
// 함수 완료: 3 + 4
// 계산 시작: 11
// 계산 완료: 5 + 6 = 11
// 함수 완료: 5 + 6
// res1: 7
// res2: 11
// res1 + res2: 18

// return으로 int형으로 받고 싶다면 위 예시처럼 할 수 있음
