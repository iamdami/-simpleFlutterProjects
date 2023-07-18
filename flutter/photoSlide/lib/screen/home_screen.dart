import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      int crntPage = controller.page!.toInt();
      int nextPage = crntPage + 1;

      if(nextPage > 3){
        nextPage = 0;
      }

      controller.animateToPage(nextPage, duration: Duration(milliseconds: 400),
          curve: Curves.slowMiddle); //linear: 처음부터 끝까지 같은 속도
    });
  }

  @override
  void dispose() {
    controller.dispose();
    // 메모리 과소비 방지
    if(timer != null){
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light); //상태바 색 바꾸기
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Image.asset(
                'asset/img/son$e.png',
                fit: BoxFit.cover,
              ),
            ).toList(),
      ),
    );
  }
}
