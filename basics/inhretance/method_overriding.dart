// method: 클래스 내부에 있는 함수
// override: 우선시하다

void main() {
  TimesTwo timesTwo = TimesTwo(2);
  print(timesTwo.calc());
  TimesFour timesFour = TimesFour(2);
  print(timesFour.calc());
}

class TimesTwo{
  final int number;
  
  TimesTwo(
  this.number,);

  // method
  int calc(){
    return number * 2;
  }
}

class TimesFour extends TimesTwo{
  TimesFour(
  int number,) : super(number);
  
  @override
  int calc(){
    return super.number * 4;
  }
}
