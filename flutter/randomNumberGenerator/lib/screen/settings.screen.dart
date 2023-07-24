import 'package:flutter/material.dart';
import 'package:rand_num_generator/component/num_row.dart';
import '../constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNum;

  const SettingsScreen({required this.maxNum, Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNum = 1000;

  @override
  void initState() {
    //_SettingsScreenState가 재생성되는 경우에만 initState 실행
    //initState는 빌드 실행되기 전 실행됨
    super.initState();

    maxNum = widget.maxNum.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNum: maxNum),
              _Footer(
                onSliderChanged: onSliderChanged,
                maxNum: maxNum,
                onBtnPressed: onBtnPressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChanged(double val) {
    setState(() {
      maxNum = val;
    });
  }

  void onBtnPressed() {
    Navigator.of(context).pop(maxNum.toInt()); //뒤로 가기
  }
}

class _Body extends StatelessWidget {
  final double maxNum;

  const _Body({
    required this.maxNum,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumRow(
        number: maxNum.toInt(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNum;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onBtnPressed;

  const _Footer(
      {required this.onSliderChanged,
      required this.maxNum,
      required this.onBtnPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNum,
          min: 100,
          max: 1000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onBtnPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorSpot,
          ),
          child: Text("저장"),
        ),
      ],
    );
  }
}
