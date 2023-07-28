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
  
  final bp = ppl.where((x) => x["group"] == "블랙핑크").toList();
  final bts = ppl.where((x) => x["group"] == "bts").toList();
  
  print(bp);
  print(bts);
}

// [{name: 로제, group: 블랙핑크}, {name: 지수, group: 블랙핑크}, {name: 뷔, group: bts}, {name: 제이홉, group: bts}]
// [{name: 로제, group: 블랙핑크}, {name: 지수, group: 블랙핑크}]
// [{name: 뷔, group: bts}, {name: 제이홉, group: bts}]

 
