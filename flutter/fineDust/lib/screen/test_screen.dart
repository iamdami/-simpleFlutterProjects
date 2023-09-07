import 'package:fine_dust/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("testScreen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "test",
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);
              print(box.keys.toList());
              print(box.values.toList());
            },
            child: Text("print box"),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);
              box.put("nyao", "gg");
            },
            child: Text("enter data!"),
          ),
        ],
      ),
    );
  }
}
