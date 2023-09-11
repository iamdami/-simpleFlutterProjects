import 'package:flutter/material.dart';
import 'package:tabbar_tutorial/screen/appbar_using_controller.dart';
import 'package:tabbar_tutorial/screen/basic_appbar_tabbar_screen.dart';
import 'package:tabbar_tutorial/screen/btm_navi_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BasicAppbarTapbarScreen(),
                  ),
                );
              },
              child: Text("basic Appbar Tapbar screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AppbarUsingController(),
                  ),
                );
              },
              child: Text("AppbarUsingController"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BtmNaviBarScreen(),
                  ),
                );
              },
              child: Text("BtmNaviBarScreen"),
            ),
          ],
        ),
      ),
    );
  }
}
