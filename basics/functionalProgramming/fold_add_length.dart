void main() {
  List<String> words = [
    "안녕 ", "나는 ", "다미!",
  ];
  
  final sentence = words.fold<String>("", (prev, next) => prev + next);
  print(sentence);
  
  final cnt = words.fold<int>(0, (prev, next) => prev + next.length);
  print(cnt);
}

// 안녕 나는 다미!
// 9

// fold 사용하면 reduce에서는 못했던 length값 더해주기도 가능
// (reduce 예시에서는 String으로 받은 값과 리턴 값 타입이 같아야(String) 했지만, fold 에서는 String으로 받았어도 리턴 값을 <int> 이런 식으로 제너릭 이용해 해주면 가능
