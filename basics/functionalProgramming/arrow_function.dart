void main() {
  List<String> blackPink = ["로제", "제니", "리사", "지수"];
  
  final newBP = blackPink.map((x){
    return "블랙핑크 $x";
  });
  print(blackPink);
  print(newBP.toList());
  
  print("-"*20);
  
  final newBP2 = blackPink.map((x) => "블랙핑크 $x");
  print(newBP2.toList());
}

// final newBP2 = blackPink.map((x) => "블랙핑크 $x");
// arrow function 이용하면 위와 같이 간략히 나타낼 수 있음
