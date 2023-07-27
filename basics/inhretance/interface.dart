// interface: 어떤 특수한 구조를 강제

void main() {
  BoyGroup bts = BoyGroup("bts");
  GirlGroup apink = GirlGroup("apink");
  
  bts.sayName();
  apink.sayName();
}

//interface
class IdolInterface{
  String name;
  IdolInterface(this.name);
  void sayName(){}
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
