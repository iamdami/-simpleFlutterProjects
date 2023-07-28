void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  final res = numbers.reduce((prev, next) => prev + next);
  print(res);
}

// 이렇게 arrow 이용해도 똑같은 결과 값(15) 나옴
