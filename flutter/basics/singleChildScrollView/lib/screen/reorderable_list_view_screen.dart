import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/color.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({super.key});

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> nums = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "ReorderableListViewScreen",
      body: renderReorderableListViewBuilder(),
    );
  }

  // 1. renderReorderableListView
  Widget renderReorderableListView() {
    return ReorderableListView(
      //화면에서 순서 바꿔주는 역할. 데이터에서는 순서 바뀌지 않음
      // -> 데이터에서 순서 바꾸는 건 onReorder 사용해 할 수 있음
      children: nums
          .map(
            (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e),
          )
          .toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(
          () {
            //oldIndex와 newIndex 모두 이동되기 전에 산정!
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = nums.removeAt(oldIndex);
            nums.insert(newIndex, item);
          },
        );
      },
    );
  }

  // 2. renderReorderableListViewBuilder
  Widget renderReorderableListViewBuilder() {
    return ReorderableListView.builder(
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[nums[index] % rainbowColors.length],
            index: nums[index]);
      },
      itemCount: nums.length,
      onReorder: (int oldIndex, int newIndex) {
        setState(
          () {
            //oldIndex와 newIndex 모두 이동되기 전에 산정!
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = nums.removeAt(oldIndex);
            nums.insert(newIndex, item);
          },
        );
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
