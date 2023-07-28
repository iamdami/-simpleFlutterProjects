void main() {
  Set bpSet = {
    "로제", "제니", "지수", "리사"
  };
  
  final newSet = bpSet.map((x) => "블랙핑크 $x").toSet();
  print(newSet);
}

// {블랙핑크 로제, 블랙핑크 제니, 블랙핑크 지수, 블랙핑크 리사}
