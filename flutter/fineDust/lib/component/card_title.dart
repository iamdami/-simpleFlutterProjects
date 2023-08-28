import 'package:flutter/material.dart';
import '../const/colors.dart';

class CardTitle extends StatelessWidget {
  final String title;
  const CardTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              16.0,
            ),
            topRight: Radius.circular(
              16.0,
            ),
          )),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: "Indie",
            fontWeight: FontWeight.w700,
            fontSize: 19.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
