import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rand_num_generator/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randNums = [
    123,
    456,
    789,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              _Body(randNums: randNums),
              _Footer(onPressed: onRandNumGenerator),
            ],
          ),
        ),
      ),
    );
  }

  void onRandNumGenerator() {
    final rand = Random();
    final Set<int> newNums = {};
    while (newNums.length != 3) {
      final nums = rand.nextInt(1000);
      newNums.add(nums);
    }
    setState(() {
      randNums = newNums.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "랜덤 숫자 생성기",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.newspaper,
            color: colorBtn,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randNums;
  const _Body({
    required this.randNums,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: randNums
              .map(
                (x) => Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: x
                        .toString()
                        .split("")
                        .map(
                          (y) => Image.asset(
                            "asset/img/$y.png",
                            height: 70.0,
                            width: 50.0,
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
              .toList()),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: colorSpot),
          onPressed: onPressed,
          child: Text(
            "생성",
            style: TextStyle(fontSize: 18.0),
          )),
    );
  }
}
