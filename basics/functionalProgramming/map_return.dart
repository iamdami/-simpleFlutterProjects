void main() {
  List<String> blackPink = ["로제", "제니", "리사", "지수"];
  
  final newBP = blackPink.map((x){
    return "블랙핑크 $x";
  });
  
  print(blackPink);
  print(newBP);
}

// [로제, 제니, 리사, 지수]
// (블랙핑크 로제, 블랙핑크 제니, 블랙핑크 리사, 블랙핑크 지수)

// x 앞에 '블랙핑크'가 붙어 출력
// map 함수 이용해 새로운 newBP List를 만들어줬기에 원래 blackPink List는 바뀌지 않음

 
