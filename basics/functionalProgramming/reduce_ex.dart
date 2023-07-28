void main() {
  List<String> words = [
    "안녕하세요 ", "저는 ", "다미입니다.",
  ];
  
  final sentence = words.reduce((prev, next) => prev + next);
  print(sentence);
}

// 안녕하세요 저는 다미입니다.
// 이런 식으로 쓸 수 있음

// reduce는 reduce를 실행하는 list의 멤버 타입과 같은 타입을 리턴해줘야지만 사용 가능

 
