import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //flutter가 준비됐는지 확인
  await initializeDateFormatting(); //intl 패키지의 함수 실행 위함

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
