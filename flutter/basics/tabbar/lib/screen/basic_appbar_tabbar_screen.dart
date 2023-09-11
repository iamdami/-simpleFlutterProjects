import 'package:flutter/material.dart';
import 'package:tabbar_tutorial/const/tabs.dart';

class BasicAppbarTapbarScreen extends StatelessWidget {
  const BasicAppbarTapbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length, //tab의 전체 길이
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green.shade200,
          title: Text("basic appbar screen"),
          bottom: TabBar(
            indicatorColor: Colors.amber.shade200,
            indicatorWeight: 5.0,
            indicatorSize: TabBarIndicatorSize.tab, //label은 글자 크기만큼
            // isScrollable: true,//탭바 스크롤 가능하게
            labelColor: Colors.indigo.shade600,
            unselectedLabelColor: Colors.indigo.shade300,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w300,
            ),
            tabs: TABS
                .map(
                  (e) => Tab(
                    icon: Icon(e.icon),
                    child: Text(e.label),
                  ),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          // physics: NeverScrollableScrollPhysics(), //좌우 스크롤링 제한
          children: TABS
              .map(
                (e) => Center(
                  child: Icon(
                    e.icon,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
