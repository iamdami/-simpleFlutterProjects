void main() {
  // dynamic
  dynamic name1 = "cute";
  var name2 = "pet";
  print(name1.runtimeType); // String
  print(name2.runtimeType); // String
  
  name1 = 20;
  print(name1.runtimeType); // int
//   name2 = 20;
//   print(name2.runtimeType);
}

// dynamic type은 어떤 형의 변수도 선언 가능하고 추후 수정시 다른 변수형으로도 변환 가능
// 하지만 var은 처음 선언한 변수 형으로만 수정 가능
