import 'package:flutter/material.dart';
import 'package:tabbar_tutorial/const/tabs.dart';

class BtmNaviBarScreen extends StatefulWidget {
  const BtmNaviBarScreen({super.key});

  @override
  State<BtmNaviBarScreen> createState() => _BtmNaviBarScreenState();
}

class _BtmNaviBarScreenState extends State<BtmNaviBarScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: TABS.length,
      vsync: this,
    );
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BtmNaviBarScreen"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade200,
      ),
      body: TabBarView(
        controller: controller,
        children: TABS
            .map((e) => Center(
                  child: Icon(e.icon),
                ))
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent.shade700,
        selectedFontSize: 16.0,
        unselectedItemColor: Colors.blueAccent.shade100,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: controller.index,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          controller.animateTo(index);
        },
        items: TABS
            .map(
              (e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label),
            )
            .toList(),
      ),
    );
  }
}