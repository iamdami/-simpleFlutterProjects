import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final Color bgColor;

  const CardTitle({
    required this.title,
    required this.bgColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor,
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
            fontWeight: FontWeight.w300,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
