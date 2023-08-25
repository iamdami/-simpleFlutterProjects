import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

const DEFAULT_COLORS = [
  "FE93AB",//빨
  "FFE586",//노
  "95CAAB",//초
  "95CBE9",//파
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //flutter가 준비됐는지 확인
  await initializeDateFormatting(); //intl 패키지의 함수 실행 위함

  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);
  //GetIt 클래스 사용해 어디에서든 database 가져올 수 있음

  // db안에 색깔 가져오기(없으면 looping하며 데이터 넣어주기)
  final colors = await database.getCategoryColors();
  if(colors.isEmpty){
    for(String hexCode in DEFAULT_COLORS){
      await database.createCategoryColor(
        CategoryColorsCompanion(
          hexCode: Value(hexCode),
        ),
      );
    }
  }

  print("------get colors------");
  print(await database.getCategoryColors());

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "PermanentMarker",
      ),
      home: HomeScreen(),
    ),
  );
}
