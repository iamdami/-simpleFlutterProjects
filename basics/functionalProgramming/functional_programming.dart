void main() {
  List<String> blackPink = ["로제", "제니", "리사", "지수", "제니"];
  
  print(blackPink);
  print(blackPink.asMap());
  print(blackPink.toSet());
}

// List를 map으로 해주면 {0: 로제, 1: 제니, 2: 리사, 3: 지수, 4: 제니}
// set으로 해주면 {로제, 제니, 리사, 지수} 
// 제니가 중복으로 2개 있었는데 set은 중복 제거된 것 볼 수 있음
