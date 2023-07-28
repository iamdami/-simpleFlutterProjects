void main() {
  Map<String, String> harryPotter = {
    "Harry": "해리",
    "Ron": "론",
    "Hermione": "헤르미온느"
  };

  final res = harryPotter.map(
    (key, value) => MapEntry(
      "Character $key",
      "캐릭터 $value",
    ),
  );

  print(harryPotter);
  print(res);
}

// {Harry: 해리, Ron: 론, Hermione: 헤르미온느}
// {Character Harry: 캐릭터 해리, Character Ron: 캐릭터 론, Character Hermione: 캐릭터 헤르미온느}

// 위 예시처럼은 자주 안씀
