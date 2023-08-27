import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/color.dart';

class _SliverFixedHeaderDeligate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDeligate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  //최대 높이
  double get maxExtent => maxHeight;

  @override
  //최소 높이
  double get minExtent => minHeight;

  @override
  //covariant: 상속된 클래스도 사용 가능
  //oldDelegate: 빌드되는 시점보다 이전 Delegate

  // 세 가지 중 하나라도 바뀌었을 때 shouldRebuild 실행
  bool shouldRebuild(_SliverFixedHeaderDeligate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

class CustomScrollViewScreen extends StatefulWidget {
  const CustomScrollViewScreen({super.key});

  @override
  State<CustomScrollViewScreen> createState() => _CustomScrollViewScreenState();
}

class _CustomScrollViewScreenState extends State<CustomScrollViewScreen> {
  final List<int> nums = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: renderCustomScrollView(),
    );
  }

  Widget renderCustomScrollView() {
    return CustomScrollView(
      slivers: [
        renderSliverAppBar(),
        renderHeader(),
        renderBuilderSliverList(),
      ],
    );
  }

  SliverPersistentHeader renderHeader(){
    return SliverPersistentHeader(
      delegate: _SliverFixedHeaderDeligate(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              "_SliverFixedHeaderDeligate",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        minHeight: 70,
        maxHeight: 130,
      ),
    );
  }

  SliverAppBar renderSliverAppBar() {
    return SliverAppBar(
      floating: true,
      //true: 밑으로 스크롤하다가 위로 하면 앱바 잠깐 보임
      pinned: false,
      //true: 앱바 완전 고정
      snap: true,
      //true: 자석처럼 조금만 올리거나 내려도 이동
      //false: 중간에 이동 멈춤 가능
      //floating: true에만 사용 가능
      stretch: true,
      //true: 앱바 사이즈 늘이기 가능
      expandedHeight: 150.0,
      //앱바 크기 늘어나는 최대 사이즈
      collapsedHeight: 100.0,
      //최소 사이즈
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "asset/img/image1.png",
          fit: BoxFit.cover,
        ),
        title: Text(
          "flexibleSpace",
        ),
      ),
      backgroundColor: Colors.black,
      title: Text(
        "CustomScrollViewScreen",
      ),
    );
  }

  // ListView 기본 생성자와 유사
  SliverList renderChildSliverList() {
    return SliverList(
      //신기하게도 스크롤하면 앱바가 사라짐..?
      delegate: SliverChildListDelegate(
        //SliverChildListDelegate: 모든 위젯들 다 그리는 기본형 리스트뷰 형태 구현
        nums
            .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e))
            .toList(),
      ),
    );
  }

  //ListView.builder 생성자와 유사
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
    );
  }

  //GridView.count와 유사
  SliverGrid renderChildListSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        nums
            .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e))
            .toList(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  //GridView.builder와 유사
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
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
