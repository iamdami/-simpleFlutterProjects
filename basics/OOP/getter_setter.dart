void main() {
  Idol blackPink = Idol(
  "블랙핑크",
  ["지수", "제니", "리사", "로제"],);
  
//   print(blackPink.firstMember);
  
  blackPink.firstMember = "dami";
  print(blackPink.firstMember);
  print(blackPink.members);
}

class Idol {
  String groupName;
  List<String> members;
  
  Idol(this.groupName, this.members);
  }
  
  //getter
  String get firstMember{
    return this.members[0];
  }
  //setter
  set firstMember(String name){
    this.members[0] = name;
  }
}

// blackPink.firstMember = "dami"; 해주면 
// [dami, 제니, 리사, 로제] 처럼 this.members[0] 값이 바뀜

// getter 사용하는 이유: 함수와 기능적인 차이는 없지만, getter는 데이터를 간단히 가공할 때 사용
// 함수는 로직이 많이 들어가는 형태에서 많이 사용
// 뉘앙스가 조금 다름

// private
// 함수, 변수 어디든 이름 앞에 _만 붙여주면 됨
// -> 외부에서 파일을 불러와도 쓸 수가 없음
//      같은 파일에서만 쓸 수 있음
