import 'package:drift/drift.dart';

// Schedules Table
class Schedules extends Table {
  IntColumn get id => integer().autoIncrement()(); //id 칼럼 선언 -> primary key
  //autoIncrement: 자동으로 숫자 늘려줌(중복 안되도록)
  TextColumn get content => text()(); //내용
  DateTimeColumn get date => dateTime()(); //일정 날짜
  IntColumn get startTime => integer()(); //시작 시간
  IntColumn get endTime => integer()(); //마치는 시간
  IntColumn get colorID => integer()(); //카테고리 컬러테이블 id

  //clientDefault: 플러터 프레임워크에서 기본값으로 지정할 값
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now(),
      )(); //생성 날짜
}
