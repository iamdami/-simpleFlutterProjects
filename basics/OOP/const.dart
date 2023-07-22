// const 선언 유무
void main() {
  Idol blackPink = const Idol(
  "블랙핑크",
  ["지수", "제니", "리사", "로제"],);
 
  Idol blackPink2 = const Idol(
  "블랙핑크",
  ["지수", "제니", "리사", "로제"],);

// 이런 식으로 const로 선언하면 같은 인스턴스가 됨
// const 선언 안하면 다른 인스턴스로 구분 됨
