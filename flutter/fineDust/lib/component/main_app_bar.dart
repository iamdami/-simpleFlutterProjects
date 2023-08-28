import 'package:flutter/material.dart';
import '../const/colors.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.black87,
      fontSize: 35.0,
    );

    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: 460,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight), //appbar 공간만큼 띄워줌
            child: Column(
              children: [
                Text(
                  "Seoul",
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DateTime.now().toString(),
                  style: ts.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  "asset/img/mediocre.png",
                  width: MediaQuery.of(context).size.width / 2.8,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Normal",
                  style: ts.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  "Not bad!",
                  style: ts.copyWith(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
