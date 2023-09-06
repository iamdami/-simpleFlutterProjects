import 'package:hive_flutter/hive_flutter.dart';

part "stat_model.g.dart";

@HiveType(typeId: 2)
enum ItemCode {
  @HiveField(0)
  PM10,
  @HiveField(1)
  PM25,
  @HiveField(2)
  NO2,
  @HiveField(3)
  O3,
  @HiveField(4)
  CO,
  @HiveField(5)
  SO2,
}

@HiveType(typeId: 1)
class StatModel {
  @HiveField(0) //한 번 등록한 숫자는 바꾸면 안됨
  final double seoul;
  @HiveField(1)
  final double gyeonggi;
  @HiveField(2)
  final double incheon;
  @HiveField(3)
  final double daejeon;
  @HiveField(4)
  final double sejong;
  @HiveField(5)
  final double chungnam;
  @HiveField(6)
  final double chungbuk;
  @HiveField(7)
  final double gyeongnam;
  @HiveField(8)
  final double gwangju;
  @HiveField(9)
  final double jeonbuk;
  @HiveField(10)
  final double gyeongbuk;
  @HiveField(11)
  final double daegu;
  @HiveField(12)
  final double ulsan;
  @HiveField(13)
  final double busan;
  @HiveField(14)
  final double jeonnam;
  @HiveField(15)
  final double gangwon;
  @HiveField(16)
  final double jeju;
  @HiveField(17)
  final DateTime dataTime;
  @HiveField(18)
  final ItemCode itemCode;

  StatModel({
    required this.seoul,
    required this.gyeonggi,
    required this.incheon,
    required this.daejeon,
    required this.sejong,
    required this.chungnam,
    required this.chungbuk,
    required this.gyeongnam,
    required this.gwangju,
    required this.jeonbuk,
    required this.gyeongbuk,
    required this.daegu,
    required this.ulsan,
    required this.busan,
    required this.jeonnam,
    required this.gangwon,
    required this.jeju,
    required this.dataTime,
    required this.itemCode,
  });

  // JSON 형태에서부터 데이터 받아오기
  StatModel.fromJson({required Map<String, dynamic> json})
      : seoul = double.parse(json["seoul"] ?? "0"), //null이면 "0"
        gyeonggi = double.parse(json["gyeonggi"] ?? "0"),
        incheon = double.parse(json["incheon"] ?? "0"),
        daejeon = double.parse(json["daejeon"] ?? "0"),
        sejong = double.parse(json["sejong"] ?? "0"),
        chungnam = double.parse(json["chungnam"] ?? "0"),
        chungbuk = double.parse(json["chungbuk"] ?? "0"),
        gyeongnam = double.parse(json["gyeongnam"] ?? "0"),
        gwangju = double.parse(json["gwangju"] ?? "0"),
        jeonbuk = double.parse(json["jeonbuk"] ?? "0"),
        gyeongbuk = double.parse(json["gyeongbuk"] ?? "0"),
        daegu = double.parse(json["daegu"] ?? "0"),
        ulsan = double.parse(json["ulsan"] ?? "0"),
        busan = double.parse(json["busan"] ?? "0"),
        jeonnam = double.parse(json["jeonnam"] ?? "0"),
        gangwon = double.parse(json["gangwon"] ?? "0"),
        jeju = double.parse(json["jeju"] ?? "0"),
        dataTime = DateTime.parse(json["dataTime"]),
        itemCode = parseItemCode(json["itemCode"]);

  static ItemCode parseItemCode(String raw) {
    if (raw == "PM2.5") {
      return ItemCode.PM25;
    }
    return ItemCode.values.firstWhere((element) => element.name == raw);
  }

  double getLevelFromRegion(String region) {
    if (region == "Seoul") {
      return seoul;
    } else if (region == "Gyeonggi") {
      return gyeonggi;
    } else if (region == "Incheon") {
      return incheon;
    } else if (region == "Daejeon") {
      return daejeon;
    } else if (region == "Sejong") {
      return sejong;
    } else if (region == "Chungnam") {
      return chungnam;
    } else if (region == "Chungbuk") {
      return chungbuk;
    } else if (region == "Gyeongnam") {
      return gyeongnam;
    } else if (region == "Gwangju") {
      return gwangju;
    } else if (region == "Jeonbuk") {
      return jeonbuk;
    } else if (region == "Gyeongbuk") {
      return gyeongbuk;
    } else if (region == "Daegu") {
      return daegu;
    } else if (region == "Ulsan") {
      return ulsan;
    } else if (region == "Busan") {
      return busan;
    } else if (region == "Jeonnam") {
      return jeonnam;
    } else if (region == "Gangwon") {
      return gangwon;
    } else if (region == "Jeju") {
      return jeju;
    } else {
      throw Exception("Unknown area");
    }
  }
}
