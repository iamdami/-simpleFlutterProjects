import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("button"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("ButtonStyle"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blueGrey,
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.yellow; //눌렸을 때
                    }
                    return Colors.white; //눌리지 않았을 때
                  })),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent, //메인 색
                  foregroundColor: Colors.white, //글자 및 애니메이션 색
                  shadowColor: Colors.blueGrey, //그림자 색
                  elevation: 10.0, //3D 입체감 높이
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                  padding: EdgeInsets.all(24.0),
                  side: BorderSide(
                    color: Colors.black38,
                    width: 5.0,
                  )),
              child: Text("ElevatedButton"),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green, //글자 및 애니메이션 색
                  // backgroundColor: Colors.yellow, //메인 색
                  // elevation: 10.0,
                  textStyle: TextStyle(
                    fontSize: 16.0,
                  ),
                  padding: EdgeInsets.all(20.0),
                  side: BorderSide(
                    color: Colors.green,
                    width: 2.0,
                  )),
              child: Text("OutlinedButton"),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                foregroundColor: Colors.orange,
                textStyle: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              child: Text("TextButton"),
            ),
          ],
        ),
      ),
    );
  }
}
