// generic: type을 외부에서 받을 때 사용

void main() {
  Lecture<String> lecture1 = Lecture("123", "Lecture1");
  lecture1.printIdType();
  Lecture<int> lecture2 = Lecture(123, "Lecture2");
  lecture2.printIdType();
}

class Lecture<T>{
  final T id;
  final String name;
  
  Lecture(this.id, this.name);
  
  void printIdType(){
    print(id.runtimeType);
  }
}
