import 'package:flutter/material.dart';
import 'package:we_ve_been/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "gaegu",
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontFamily: "singleday",
            fontSize: 80.0,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 60.0,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: Colors.grey[100],
            fontSize: 35.0,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: Colors.grey[100],
            fontSize: 33.0,
          ),
        ),
      ),
      home: HomeScreen(),
    ),
  );
}
