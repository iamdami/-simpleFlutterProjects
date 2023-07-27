// 이런 식으로 <T, X> 등 계속 넣어 사용 가능

void main() {
  Lecture<String, String> lecture1 = Lecture("123", "Lecture1");
  lecture1.printIdType();
  Lecture<int, String> lecture2 = Lecture(123, "Lecture2");
  lecture2.printIdType();
}

class Lecture<T, X>{
  final T id;
  final X name;
  
  Lecture(this.id, this.name);
  
  void printIdType(){
    print(id.runtimeType);
  }
}
