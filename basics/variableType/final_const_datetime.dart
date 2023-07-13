void main() {
  final DateTime now = DateTime.now();
  print(now);
//   const DateTime now = DateTime.now();
//   print(now);
}

// const는 빌드 타임의 값을 알고 있고, final은 빌드 타임의 값을 알고 있지 않음
// 빌드 타임: 우리가 작성한 코드를 이진수로 변환하는 시간 

// const로 DateTime을 하면 빌드 타임 값을 알고 있어야 출력될 수 있는데,
// DateTime은 해당 코드가 실행될 때의 시간이 출력되므로 빌드 타임 값을 알고 실행되는 게 아님
// -> 그러므로 const로 DateTime 하면 오류 발생
// final은 빌드 타임 값을 알고 있지 않아도 선언 가능하기 때문에 사용 가능

 
