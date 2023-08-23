import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/color.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> nums = List.generate(100, (index) => index);
  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "ListViewScreen",
      body: renderSeparatorBuilder(),
    );
  }

  //1. 모두 한 번에 그림
  Widget renderDefault() {
    return ListView(
      children: nums
          .map(
            (e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ),
          )
          .toList(),
    );
  }

  //2. 보이는 것만 그림
  Widget renderBuilder() {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        });
  }

  //3. 2.에 추가로 중간에 추가한 위젯 넣을 수 있음
  Widget renderSeparatorBuilder() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
      // 배너 넣는데 유용하게 사용 가능
      separatorBuilder: (context, index) {
        index += 1;
        if (index % 5 == 0) {
          return renderContainer(
            color: Colors.black,
            index: index,
            height: 100,
          );
        }
        return Container();
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
