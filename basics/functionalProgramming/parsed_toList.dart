void main() {
  String num1 = "12345";
  final parsed = num1.split("").map((x) => "$x.jpg").toList();
  print(parsed);
}
