import 'package:fine_dust/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "Permanent",
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black54),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
