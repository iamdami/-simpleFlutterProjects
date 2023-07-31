// map은 자유도가 너무 높음
// -> key에 오타가 있거나 등등 해도 강제할 수 없음

// 프론트엔드 작업 시 어떤 데이터를 다루게 되어도 꼭 구조화해서 다루게 됨
// class를 미리 정의해두면 이 데이터 타입이 어떻게 되고 구조가 어떻게 되는지에 대해 믿을 수 있는 상태가 됨

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
  print(ppl);

  final parsedPpl = ppl.map(
    (x) => Person(
      name: x['name']!,
      group: x['group']!,
    ),
  ).toList();
  print(parsedPpl);
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
  String toString(){
    return "Person(name: $name, group: $group)";
  }
}

// [{name: 로제, group: 블랙핑크}, {name: 지수, group: 블랙핑크}, {name: 뷔, group: bts}, {name: 제이홉, group: bts}]
// [Person(name: 로제, group: 블랙핑크), Person(name: 지수, group: 블랙핑크), Person(name: 뷔, group: bts), Person(name: 제이홉, group: bts)]
