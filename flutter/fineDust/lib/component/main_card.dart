import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final Color bgColor;
  final Widget child;
  const MainCard({
    required this.bgColor,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      color: bgColor,
      child: child,
    );
  }
}
