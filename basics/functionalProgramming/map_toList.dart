void main() {
  List<String> blackPink = ["로제", "제니", "리사", "지수", "제니"];
  
  Map bpMap = blackPink.asMap();
  print(bpMap.keys);
  print(bpMap.values);
  
  print("-"*20);
  
  print(bpMap.keys.toList());
  print(bpMap.values.toList());
}

// (0, 1, 2, 3, 4)
// (로제, 제니, 리사, 지수, 제니)
// --------------------
// [0, 1, 2, 3, 4]
// [로제, 제니, 리사, 지수, 제니]
// List로 변환하기 유용하지만 자주 사용하진 않는다고 함
