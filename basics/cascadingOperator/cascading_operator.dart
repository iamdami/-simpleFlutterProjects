void main() {
  List<int> even = [2, 4, 6, 8];
  List<int> odd = [1, 3, 5, 7];
  
  print([...even, ...odd]);
  print([even]);
  print([...even]);
  print(even == [...even]);
}

// 사용시 완전히 새로운 List에 값 넣는 것
// Dart엔 짱 신기한 연산자가 있군녀,,,,
