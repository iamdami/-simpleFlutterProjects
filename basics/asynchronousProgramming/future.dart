// Future
// 미래에 받아올 값

// 2개의 파라미터
// delayed(parameter1, parameter2);
// parameter1: 지연할 기간(얼마나 지연할 건지) Duration
// parameter2: 지연 시간이 지난 후 실행할 함수

// void main() {
//   Future<String> name = Future.value('냥');
//   Future<int> number = Future.value(12);
//   Future<bool> isTrue = Future.value(true);
//   }
// 위와 같이 지정한 타입으로 받아올 수 있음

void main() {
  print("함수 시작");

  Future.delayed(Duration(seconds: 3), () {
    print("Delay 끝");
  });
}

// 함수 시작
// Delay 끝

// 지정해 준 시간(3초) 후에 'Delay 끝' 출력
