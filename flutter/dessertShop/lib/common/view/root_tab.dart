import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/shop/view/shop_screen.dart';
import 'package:flutter/material.dart';

class RootTap extends StatefulWidget {
  const RootTap({super.key});

  @override
  State<RootTap> createState() => _RootTapState();
}

class _RootTapState extends State<RootTap> with SingleTickerProviderStateMixin {
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener(){
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "DesserToMe",
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          ShopScreen(),
          Center(
            child: Container(
              child: Text("Dessert"),
            ),
          ),
          Center(
            child: Container(
              child: Text("Order"),
            ),
          ),
          Center(
            child: Container(
              child: Text("Profile"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 110.0,
        child: BottomNavigationBar(
          selectedItemColor: primary_color,
          selectedFontSize: 14.0,
          showUnselectedLabels: true,
          unselectedFontSize: 12.0,
          unselectedItemColor: body_text_color,
          type: BottomNavigationBarType.shifting,
          onTap: (int index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cake_rounded),
              label: "Dessert",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_rounded),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
