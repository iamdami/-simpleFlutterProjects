import 'package:fine_dust/const/status_level.dart';
import 'package:fine_dust/model/stat_model.dart';
import 'package:fine_dust/model/status_model.dart';

class DataUtils {
  // 앱바 시간
  static String getTimeFromDataTime({required DateTime dateTime}) {
    return "${getTimeFormat(dateTime.day)} / ${getTimeFormat(dateTime.month)} / ${dateTime.year} / ${getTimeFormat(dateTime.hour)} : ${getTimeFormat(dateTime.minute)}";
  }

  static String getTimeFormat(int num) {
    return num.toString().padLeft(2, "0");
  }

  static String getUnitFromItemCode({
    required ItemCode itemCode,
  }) {
    switch (itemCode) {
      case ItemCode.PM10:
        return "㎍/㎥";
      case ItemCode.PM25:
        return "㎍/㎥";
      default:
        return "ppm";
    }
  }

  static String getItemCodeString({
    required ItemCode itemCode,
}){
    switch (itemCode) {
      case ItemCode.PM10:
        return "Fine Dust";
      case ItemCode.PM25:
        return "Ultrafine Dust";
      case ItemCode.NO2:
        return "Nitrogen Dioxide";
      case ItemCode.O3:
        return "ozone";
      case ItemCode.CO:
        return "Carbon Monoxide";
      case ItemCode.SO2:
        return "Sulfur Dioxide";
    }
  }

  static StatusModel getCrntStatusFromItemCodeAndValue({
    required double value,
    required ItemCode itemCode,
  }) {
    return statusLevel.where((status) {
      if (itemCode == ItemCode.PM10) {
        return status.minFineDust < value;
      } else if (itemCode == ItemCode.PM25) {
        return status.minUltraFineDust < value;
      } else if (itemCode == ItemCode.CO) {
        return status.minCO < value;
      } else if (itemCode == ItemCode.O3) {
        return status.minO3 < value;
      } else if (itemCode == ItemCode.NO2) {
        return status.minNO2 < value;
      } else if (itemCode == ItemCode.SO2) {
        return status.minSO2 < value;
      }else{
        throw Exception("Unknown Code");
      }
    }).last;
  }
}
