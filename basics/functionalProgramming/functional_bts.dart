void main() {
  List<Map<String, String>> ppl = [
    {
      "name": "로제",
      "group": "블랙핑크",
    },
    {
      "name": "지수",
      "group": "블랙핑크",
    },
    {
      "name": "뷔",
      "group": "bts",
    },
    {
      "name": "제이홉",
      "group": "bts",
    },
  ];
//   print(ppl);

  final parsedPpl = ppl
      .map(
        (x) => Person(
          name: x['name']!,
          group: x['group']!,
        ),
      )
      .toList();
//   print(parsedPpl);

  final pickBts = parsedPpl.where(
    (x) => x.group == 'bts',
  );
  print("pickBts: $pickBts");

  final res = ppl
      .map(
        (x) => Person(
          name: x["name"]!,
          group: x["group"]!,
        ),
      )
      .where((x) => x.group == "bts");
  print("res: $res");
}

class Person {
  final String name;
  final String group;

  Person({
    required this.name,
    required this.group,
  });

  @override
  // object의 함수 toString 덮어쓰기
  // Instance of 'Person' 이라고 출력되는 것 수정 위함
  String toString() {
    return "Person(name: $name, group: $group)";
  }
}

// pickBts: (Person(name: 뷔, group: bts), Person(name: 제이홉, group: bts))
// res: (Person(name: 뷔, group: bts), Person(name: 제이홉, group: bts))

// 위 두 결과가 같은 것을 볼 수 있음

// functional programming의 장점은 이처럼 계속 바꿔가며 진행(chaining)할 수 있다는 점
// -> 새로운 형태의 값을 만들어 낼 수 있음
// functional programming은 완전히 새로운 List(값)를 생성해 줌

// 코드가 간결해진다는 장점이 있기에 functional programming 하는 건데, 너무 많이 변경해버리면 협업이나 등등에 문제가 될 수 있음
// -> 정말 필요한 것만 functional programming 해주는 게 좋음
