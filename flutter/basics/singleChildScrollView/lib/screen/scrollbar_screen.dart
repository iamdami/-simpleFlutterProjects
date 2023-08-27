import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/color.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ScrollBarScreen extends StatelessWidget {
  final List<int> nums = List.generate(100, (index) => index);
  ScrollBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "ScrollBarScreen",
      body: renderScrollbar(),
    );
  }

  Scrollbar renderScrollbar() {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: nums
              .map((e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length], index: e))
              .toList(),
        ),
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
