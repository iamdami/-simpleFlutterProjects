// class: 설계서 만드는 것
// instance: class 통해서 실제로 결과물 만들어 내는 것

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
  
  Idol(String groupName, List<String> members)
    : this.groupName = groupName,
      this.members = members;
  
  void sayHello() {
    print("안녕하세요. ${this.groupName}입니다.");
  }
  void intro() {
    print("저희 멤버는 ${this.members}가 있습니다.");
  }
}

// 공통된 부분을 설계서에 작성해두고, 변동되는 부분을 생성자의 매개변수로 주면 재사용 가능
