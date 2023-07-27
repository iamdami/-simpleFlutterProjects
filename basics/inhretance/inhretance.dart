void main() {
  Idol blockB = Idol(name: "blockB", memberCnt: 7);
  blockB.sayName();
  blockB.sayMemberCnt();
  
  print("-"*10);
  
  BoyGroup bts = BoyGroup("bts", 7);
  bts.sayName();
  bts.sayMemberCnt();
  bts.sayMale();
}

class Idol{
  String name;
  int memberCnt;
  
  Idol({
    required this.name,
    required this.memberCnt,
  });
  
  void sayName(){
    print("저희는 ${this.name}입니다.");}
  void sayMemberCnt(){
    print("${this.name}는 ${this.memberCnt}명의 멤버가 있습니다.");}
}

class BoyGroup extends Idol {
  BoyGroup(
    String name,
    int memberCnt,
  ): super(
      name: name,
      memberCnt: memberCnt,);
  void sayMale(){
    print("저희는 남자 아이돌입니다.");
  }
}

// 무조건 부모->자식
// 자식 클래스에서 선언한 것들은 부모 클래스에서는 사용할 수 없음
// 같은 자식 클래스끼리도 속성들을 공유하지 않음
