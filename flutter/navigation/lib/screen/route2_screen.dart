import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route3_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    //null이 될 수(ModalRoute를 가져오지 못할 수) 없다고 정의

    return MainLayout(title: "RouteTwo Screen", children: [
      Text(
        "arguments: ${arguments}",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Pop"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent[100],
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/three', arguments: 999);
        },
        child: Text("Push Named"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[200],
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/three');
        },
        child: Text("Push Replacement"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple[100],
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/three',
            (route) => false, //false해주면 그 라우트는 라우트 스택에서 사라짐
          );
        },
        child: Text("PushAndRemoveUntil"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent[100],
        ),
      ),
    ]);
  }
}
