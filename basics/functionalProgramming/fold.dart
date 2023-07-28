void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  final res = numbers.fold<int>(0, (prev, next) {
    print("-" * 20);
    print("prev: $prev");
    print("next: $next");
    print("total: ${prev + next}");
    return prev + next;
  });

  print(res);
}

// reduce와 fold는 비슷한 기능을 수행하지만 fold는 list의 멤버 타입과 다른 타입도 사용 가능

// --------------------
// prev: 0
// next: 1
// total: 1
// --------------------
// prev: 1
// next: 2
// total: 3
// --------------------
// prev: 3
// next: 3
// total: 6
// --------------------
// prev: 6
// next: 4
// total: 10
// --------------------
// prev: 10
// next: 5
// total: 15
// 15

// fold는 지정해 준 0이  가장 첫 prev로 들어가고 list의 next(위 예제에서는 1)이 들어감
// 이후는 reduce와 같게 동작
