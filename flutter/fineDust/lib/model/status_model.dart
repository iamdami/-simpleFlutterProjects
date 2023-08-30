import 'package:flutter/material.dart';

class StatusModel {
  final int level;
  final String label;
  final Color primaryColor;
  final Color lightColor;
  final Color darkColor;
  final Color detailFontColor;
  final String imagePath;
  final String comment;
  final double minFineDust;
  final double minUltraFineDust;
  final double minO3;
  final double minNO2;
  final double minCO;
  final double minSO2;

  StatusModel({
    required this.level,
    required this.label,
    required this.primaryColor,
    required this.lightColor,
    required this.darkColor,
    required this.detailFontColor,
    required this.imagePath,
    required this.comment,
    required this.minFineDust,
    required this.minUltraFineDust,
    required this.minNO2,
    required this.minO3,
    required this.minCO,
    required this.minSO2,
  });
}
