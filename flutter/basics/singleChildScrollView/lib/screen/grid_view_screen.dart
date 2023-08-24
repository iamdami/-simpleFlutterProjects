import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/color.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  List<int> nums = List.generate(100, (index) => index);
  GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "GridViewScreen",
      body: renderGridViewBuilderSliverGridDelegateWithMaxCrossAxisExtent(),
    );
  }

  // 1. 한번에 다 그림
  Widget renderGridViewCount() {
    return GridView.count(
      crossAxisCount: 2, //가로로 몇 개 배치할 건지
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 30.0,
      children: nums
          .map(
            (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e),
          )
          .toList(),
    );
  }

  // 2. 보이는 것만 그림
  Widget renderGridViewBuilderSliverGridDelegateWithFixedCrossAxisCount() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //가로 몇 개 최대로 넣을지
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 30.0,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }

  // 3. 최대 사이즈
  Widget renderGridViewBuilderSliverGridDelegateWithMaxCrossAxisExtent() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
      // 각 위젯이 최대 얼만큼 차지하면 되는지
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
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
