void main() {
  Map<String, String> harryPotter = {
    "Harry": "해리",
    "Ron": "론",
    "Hermione": "헤르미온느"
  };

  final keys = harryPotter.keys.map((x) => "Character $x").toList();
  print(keys);
}

// [Character Harry, Character Ron, Character Hermione]

// 이렇게 많이 씀
// value 값도 당연히 가능
