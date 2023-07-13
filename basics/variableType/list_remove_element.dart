void main() {
  // List
  List<String> chacha = ["eye", "nose", "ear"];
  print(chacha);
  
  // index
  chacha.add("mouse");
  print(chacha);
  chacha.remove("nose");
  print(chacha);
}

// remove() 이용해 List 원소 삭제 가능
// chacha List =  ["eye", "nose", "ear", "mouse"] 에서 위 예시처럼 remove() 이용 후 출력하면, ["eye", "ear", "mouse"] 출력
