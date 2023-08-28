import 'package:fine_dust/const/colors.dart';
import 'package:flutter/material.dart';
import 'main_app_bar.dart';

const regions = [
  "Seoul",
  "Gyeonggi",
  "Incheon",
  "Daejeon",
  "Sejong",
  "Chungnam",
  "Chungbuk",
  "Gyeongnam",
  "Gwangju",
  "Jeonbuk",
  "Gyeongbuk",
  "Daegu",
  "Ulsan",
  "Busan",
  "Jeonnam",
  "Gangwon",
  "Jeju",
];

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Local Status",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
          ...regions
              .map(
                (e) => ListTile(
                  tileColor: Colors.white,
                  selectedTileColor: lightColor,
                  selectedColor: Colors.black87,
                  selected: e == "Sejong",
                  onTap: () {},
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Indie",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
