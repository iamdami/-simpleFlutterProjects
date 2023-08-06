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
        child: FutureBuilder(
          future: getNum(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              //데이터 있을 때 위젯 렌더링
            }
            if(snapshot.hasError){
              //에러 났을 때 위젯 렌더링
            }
            //로딩 중일 때 위젯 렌더링
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "FutureBuilder",
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
}
