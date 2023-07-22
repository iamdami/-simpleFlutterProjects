처음 선언한 값을 마음대로 바꿀 수 없게 하기 위해 final 키워드 넣음
대부분의 경우 class의 변수를 final로 선언하는 습관을 들여 예상치 못한 버그 줄이기!

class Idol {
  final String groupName;
  final List<String> members;
  
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
