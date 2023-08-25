import 'dart:io';
import 'package:calendar_scheduler/model/category_color.dart';
import 'package:calendar_scheduler/model/schedule_with_color.dart';
import 'package:calendar_scheduler/model/schedules.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';

// import는 private 값들은 불러올 수 없음

part 'drift_database.g.dart'; //g: generate(자동으로 생성되도록)
// private 값들도 불러올 수 있음
// 시스템에서는 같은 파일로 인식

@DriftDatabase(
  tables: [
    Schedules,
    CategoryColors,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  //업데이트 쿼리
  Future<Schedule> getScheduleById(int id) =>
      (select(schedules)..where((tbl) => tbl.id.equals(id))).getSingle();

  // 테이블에 데이터 넣기
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);
  // insert하면 자동으로 id값 리턴받을 수 있음
  Future<int> createCategoryColor(CategoryColorsCompanion data) =>
      into(categoryColors).insert(data);
  // select
  // 모든 색깔 가져올 거라 getCategoryColors()
  Future<List<CategoryColor>> getCategoryColors() =>
      select(categoryColors).get();
  // get()을 하면 List로 Future를 받을 수 있고(단발적: 요청시 한 번 받는 것)
  // watch()를 하면 Stream으로 값들이 업데이트 됐을 때 지속적으로 업데이트된 값 받을 수 있음

  // removeSchedule() => delete(schedules).go(); //schedules 테이블에 있는 모든 row 삭제

  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();
  //삭제할 id를 스케줄 테이블의 id와 비교해 같은 id값 있으면 삭제

  Future<int> updateScheduleById(int id, SchedulesCompanion data) =>
      (update(schedules)..where((tbl) => tbl.id.equals(id))).write(data);
  //스케줄스 테이블의 id 칼럼에서 넣어줄 id 값과 같은 row 찾아서 그 row 업데이트

  Stream<List<ScheduleWithColor>> watchSchedules(DateTime date) {
    final query = select(schedules).join([
      innerJoin(categoryColors, categoryColors.id.equalsExp(schedules.colorID))
    ]);
    query.where(schedules.date.equals(date));
    query.orderBy([
      OrderingTerm.asc(schedules.startTime), //시작시간 오름차순으로 일정 정리
    ]);

    return query.watch().map(
          (rows) => rows
              .map(
                (row) => ScheduleWithColor(
                  // 각각의 row를 ScheduleWithColor로!
                  schedule: row.readTable(schedules),
                  categoryColor: row.readTable(categoryColors),
                ),
              )
              .toList(),
        );
  } // 스케줄 테이블에 넣어준 date 칼럼이 현재 가진 date와 같으면 넣어줌

  @override
  int get schemaVersion => 1;
  // db 구조 자체가 바뀔 때(table) 스키마 버전 올려줘야함
  // 1부터 시작
}

// database를 어떤 위치에 저장할지
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    //배정받은 폴더 경로에 db.sqlite 파일 생성해 file 변수에 저장
    return NativeDatabase(file);
  });
}
