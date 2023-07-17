import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, //오른쪽 위 debug 표시 지우기
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF99231), //그냥 color 지정일 경우 color, hex 색상이면 colors
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("asset/img/logo.png"),
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
