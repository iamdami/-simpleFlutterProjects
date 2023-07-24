import 'package:flutter/material.dart';

class NumRow extends StatelessWidget {
  final int number;

  const NumRow({required this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toInt()
          .toString()
          .split("")
          .map(
            (e) => Image.asset(
              "asset/img/$e.png",
              width: 50.0,
              height: 70.0,
            ),
          )
          .toList(),
    );
  }
}
