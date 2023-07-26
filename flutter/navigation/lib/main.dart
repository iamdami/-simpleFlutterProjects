import 'package:flutter/material.dart';
import 'package:navigation/screen/home_screen.dart';
import 'package:navigation/screen/route1_screen.dart';
import 'package:navigation/screen/route2_screen.dart';
import 'package:navigation/screen/route3_screen.dart';

const HOMEROUTE = '/';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: HomeScreen(),
    initialRoute: HOMEROUTE,
    routes: {
      HOMEROUTE: (context) => HomeScreen(),
      '/one': (context) => RouteOneScreen(),
      '/two': (context) => RouteTwoScreen(),
      '/three': (context) => RouteThreeScreen(),
    },
  ));
}
