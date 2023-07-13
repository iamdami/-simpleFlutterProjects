//Var의 문자형 유추
void main() {
  // String
  String name1 = "cute";
  print(name1.runtimeType);
  
  // var string
  var name2 = "cat";
  var name3 = 20;
  print(name2.runtimeType);
  print(name3.runtimeType);
}

//실제로 var이라는 type은 존재하지 않는 것
//그럼 var로 다 선언해주면 되지 않냐?
//-> 추후 코드가 길어지면 어떤 형의 변수인지 단번에 구분하기 힘들 수 있음
//알아보기 쉽게 String, int 등 그 변수에 적절한 type으로 지정 선언해주되, 어려운 경우에만 var 써주기

 
