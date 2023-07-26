import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route2_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;
  const RouteOneScreen({this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: "RouteOne Screen", children: [
      Text(
        "arguments: ${number.toString()}",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop(456);
        },
        child: Text("Pop"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent[100],
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => RouteTwoScreen(),
              settings: RouteSettings(
                arguments: 789,
              ),
            ),
          );
        },
        child: Text("Push"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[200],
        ),
      ),
    ]);
  }
}
