import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 30.0,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<int>(
          stream: streamNums(),
          builder: (context, snapshot) {

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "StreamBuilder",
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  "ConState: ${snapshot.connectionState}",
                  style: textStyle,
                ),
                Text("Data: ${snapshot.data}", style: textStyle),
                Text("Error: ${snapshot.error}", style: textStyle),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                    });
                  },
                  child: const Text("setState"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<int> getNum() async {
    await Future.delayed(const Duration(seconds: 3));

    final random = Random();

    throw Exception("에러 발생!");
    // 100보다 작은 랜덤 숫자 생성해 받기
  }

  Stream<int> streamNums() async* {
    for(int i=0; i<10; i++){
      if(i==5){
        throw Exception("i=5");
      }
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}

