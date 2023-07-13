void main() {
  // String
  String name1 = "cute";
  String name2 = "cat";
  print(name1 + name2);
  print(name1 + " " + name2); // cute cat
  print("${name1} ${name2}"); // cute cat
  print("$name1 $name2"); // cute cat
}

// string 값끼리 + 해 문자 붙일 수 있음

// -, /, *는 안됨

// print("${name1} ${name2}"); 이렇게 써도 됨

// print("$name1 $name2"); 이렇게 {} 생략해줘도 똑같은 결과 나옴
