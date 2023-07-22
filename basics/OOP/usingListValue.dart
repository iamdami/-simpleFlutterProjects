void main() {
  Idol blackPink = Idol(
  "블랙핑크",
  ["지수", "제니", "리사", "로제"],);
  print(blackPink.groupName);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.intro();
  
  Idol bts = Idol.fromList(
  [
    "bts",
    ["RM", "뷔", "정국", "슈가", "지민", "제이홉", "진"],
  ]);
  print(bts.groupName);
  print(bts.members);
  bts.sayHello();
  bts.intro();
}

class Idol {
  String groupName;
  List<String> members;
  
  Idol(this.groupName, this.members);
  
  Idol.fromList(List values)
    : this.groupName = values[0],
      this.members = values[1];
  
  void sayHello() {
    print("안녕하세요. ${this.groupName}입니다.");
  }
  void intro() {
    print("저희 멤버는 ${this.members}가 있습니다.");
  }
}

// class 선언할 때는 construct 통해 외부에서 받을 수도 있고, named construct 통해서 매개변수로 받을 수도 있음
