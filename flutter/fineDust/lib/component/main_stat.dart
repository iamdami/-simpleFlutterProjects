import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  final String category;
  final String imgPath;
  final String level;
  final String stat;
  final double width;

  const MainStat(
      {required this.category,
      required this.imgPath,
      required this.level,
      required this.stat,
      required this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      fontSize: 16.0,
      fontFamily: "Indie",
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    );

    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category,
            style: ts,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Image.asset(
            imgPath,
            width: 40.0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            level,
            style: ts,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            stat,
            style: ts,
          ),
        ],
      ),
    );
  }
}
