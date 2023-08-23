import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/color.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> nums = List.generate(
    100,
    (index) => index,
  );
  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "SingleChildScrollViewScreen",
      body: renderPerformance(),
    );
  }

  //1. 기본 렌더링법
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainer(
                color: e,
              ),
            )
            .toList(),
      ),
    );
  }

  //2. 화면 넘어가지 않아도 스크롤되게 하기
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.purple.shade200),
        ],
      ),
    );
  }

  //3. 화면 위젯이 잘리지 않도록 하기
  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.indigo.shade200),
        ],
      ),
    );
  }

  //3. 여러가지 Physics
  Widget renderPhysics() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      // physics: AlwaysScrollableScrollPhysics(), //스크롤 됨
      // physics: NeverScrollableScrollPhysics(), //스크롤 안됨
      // physics: ClampingScrollPhysics(), // Android 스타일
      // physics: BouncingScrollPhysics(), //iOS 스타일
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.redAccent.shade100),
        ],
      ),
    );
  }

  //4. SingleChildScrollView 퍼포먼스
  Widget renderPerformance() {
    return SingleChildScrollView(
      child: Column(
        children: nums
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if (index != null) {
      print(index);
    }
    return Container(
      height: 150,
      color: color,
    );
  }
}
