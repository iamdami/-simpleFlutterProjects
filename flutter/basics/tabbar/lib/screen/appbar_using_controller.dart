import 'package:flutter/material.dart';
import 'package:tabbar_tutorial/const/tabs.dart';

class AppbarUsingController extends StatefulWidget {
  const AppbarUsingController({super.key});

  @override
  State<AppbarUsingController> createState() => _AppbarUsingControllerState();
}

class _AppbarUsingControllerState extends State<AppbarUsingController>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: TABS.length,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {});
    });
    //tabController 상태 변경될 때마다 addListener()안의 callback 함수 실행
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppbarUsingController"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade200,
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
          controller: tabController,
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
        controller: tabController,
        children: TABS
            .map((e) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      e.icon,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (tabController.index != 0)
                          ElevatedButton(
                            onPressed: () {
                              tabController.animateTo(
                                tabController.index - 1,
                              );
                            },
                            child: Text(
                              "back",
                            ),
                          ),
                        const SizedBox(width: 16.0),
                        if (tabController.index != TABS.length - 1)
                          ElevatedButton(
                            onPressed: () {
                              tabController.animateTo(
                                tabController.index + 1,
                              );
                            },
                            child: Text(
                              "next",
                            ),
                          )
                      ],
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
