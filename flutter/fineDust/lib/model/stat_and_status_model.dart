import 'package:fine_dust/model/stat_model.dart';
import 'package:fine_dust/model/status_model.dart';

class StatAndStatusModel {
  // Fine Dust 등
  final ItemCode itemCode;
  final StatusModel status;
  final StatModel stat;

  StatAndStatusModel({
    required this.itemCode,
    required this.status,
    required this.stat,
  });
}
