void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  final res = numbers.reduce((prev, next) {
    print("-" * 20);
    print("prev: $prev");
    print("next: $next");
    print("total: ${prev + next}");
    return prev + next;
  });

  print(res);
}

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

// prev에는 이전까지의 total값이, next에는 list의 다음 값이 들어가 계산됨
