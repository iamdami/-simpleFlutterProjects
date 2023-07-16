void main() {
  int total = 0;
  while (total < 10){
    total += 1;
    if (total == 5){
    break;
    }
  }
  print(total);
}

// break는 loop를 통째로 종료하지만 continue는 현재 실행하고 있는 loop만 취소하고 다음 i값(위 예시에는 없음)으로 넘어감

 
