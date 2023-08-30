enum ItemCode {
  PM10,
  PM25,
  NO2,
  O3,
  CO,
  SO2,
}

class StatModel {
  final double seoul;
  final double gyeonggi;
  final double incheon;
  final double daejeon;
  final double sejong;
  final double chungnam;
  final double chungbuk;
  final double gyeongnam;
  final double gwangju;
  final double jeonbuk;
  final double gyeongbuk;
  final double daegu;
  final double ulsan;
  final double busan;
  final double jeonnam;
  final double gangwon;
  final double jeju;
  final DateTime dataTime;
  final ItemCode itemCode;

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
