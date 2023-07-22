void main() {
  Idol blackPink = Idol(
  "블랙핑크",
  ["지수", "제니", "리사", "로제"],);
  
  print(blackPink.groupName);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.intro();
}

class Idol {
  String groupName;
  List<String> members;
  
  Idol(this.groupName, this.members);
  
  void sayHello() {
    print("안녕하세요. ${this.groupName}입니다.");
  }
  void intro() {
    print("저희 멤버는 ${this.members}가 있습니다.");
  }
}

// Idol(String groupName, List<String> members)
//     : this.groupName = groupName,
//       this.members = members;

// 위 부분을 아래와 같이 간단히 수정해도 결과 같게 나옴

//   Idol(this.groupName, this.members);
