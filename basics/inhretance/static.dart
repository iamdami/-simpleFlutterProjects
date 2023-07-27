// static은 instance에 귀속되지 않고 class에 귀속됨

void main() {
  Employee dami = Employee("다미");
  Employee chacha = Employee("차차");
  Employee zico = Employee("지코");
  dami.printNameAndBuilding();
  chacha.printNameAndBuilding();
  zico.printNameAndBuilding();
  
  print("-"*20);
  
  Employee.building = "Dami Tower";
  dami.printNameAndBuilding();
  chacha.printNameAndBuilding();
  zico.printNameAndBuilding();
}

class Employee{
  static String? building; // 직원이 일하고 있는 건물
  String name; // 직원 이름
  
  Employee(
  this.name,);
  
  void printNameAndBuilding(){
    print("제 이름은 ${this.name}입니다. ${Employee.building}에서 일하고 있습니다.");
  }
}
