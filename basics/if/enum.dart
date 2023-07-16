enum Status{
  approved, //승인
  pending, //대기
  rejected, //거절
}

void main() {
  Status status  = Status.pending;
  
  if(status == Status.approved){
    print("승인");
  }
  else if(status == Status.pending){
    print("대기");
  }
  else{
    print("거절");
  }
}

// enum type은 한정된 상수값 집합을 나타내기 위해 사용
// 직관적인 코드 작성에 유용
// 열거형의 명칭은 첫 문자를 대문자로 쓰는 게 관례
