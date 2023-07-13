// nullable: null이 될 수 있다
// non-nullable: null이 될 수 없다
// null: 아무 값도 들어있지 않다

void main() {
  // null
  String name1 = "cute";
//   name1 = null -> X
  String? name2 = "pet";
  name2 = null;
  print(name2);
}

// 어떤 type이든 type 옆에 ?만 붙여주면 null 값 넣을 수 있음
// nul이 들어있는 type에 ! 붙이면 현재 이 값은 null이 아니라는 것을 뜻함
