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
