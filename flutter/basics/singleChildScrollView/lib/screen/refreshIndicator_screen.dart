import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/color.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class RefreshIndicatorScreen extends StatelessWidget {
  final List<int> nums = List.generate(100, (index) => index);
  RefreshIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "RefreshIndicatorScreen",
      body: renderRefreshIndicator(),
    );
  }

  RefreshIndicator renderRefreshIndicator(){
    return RefreshIndicator(
      onRefresh: () async {
        //서버 요청
        await Future.delayed(
          Duration(seconds: 3),
        );
      },
      child: ListView(
        children: nums
            .map((e) => renderContainer(
            color: rainbowColors[e % rainbowColors.length], index: e))
            .toList(),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      key: Key(index.toString()),
      height: height ?? 150,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
