import 'package:flutter/material.dart';

class TabInfo {
  final IconData icon;
  final String label;

  TabInfo({
    required this.icon,
    required this.label,
  });
}

final TABS = [
  TabInfo(
    icon: Icons.account_balance_outlined,
    label: "wallet",
  ),
  TabInfo(
    icon: Icons.alarm_add_outlined,
    label: "alarm",
  ),
  TabInfo(
    icon: Icons.keyboard_alt_outlined,
    label: "keyboard",
  ),
  TabInfo(
    icon: Icons.ac_unit_outlined,
    label: "ac",
  ),
  TabInfo(
    icon: Icons.adb_outlined,
    label: "android",
  ),
];
