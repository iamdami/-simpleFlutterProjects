void main() {
  BoyGroup bts = BoyGroup("bts");
  GirlGroup apink = GirlGroup("apink");
  
  bts.sayName();
  apink.sayName();
}

// interface
// abstract가 있으면 얘는 interface 만들 때 선언하지 말라는 뜻
abstract class IdolInterface{
  String name;
  IdolInterface(this.name);
  void sayName();
}

class BoyGroup implements IdolInterface{
  String name;
  BoyGroup(this.name);
  void sayName(){
    print("제 이름은 ${name}입니다.");
  }
}

class GirlGroup implements IdolInterface{
  String name;
  GirlGroup(this.name);
  void sayName(){
    print("제 이름은 ${name}입니다.");
  }
}
