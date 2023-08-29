/*
  * 1) 최고
  *
  * 미세먼지 : 0-15
  * 초미세먼지 : 0-8
  * 오존(O3) : 0-0.02
  * 이산화질소(NO2) : 0-0.02
  * 일산화탄소(CO) : 0-0.02
  * 아황산가스(SO2) : 0-0.01
  *
  * 2) 좋음
  *
  * 미세먼지 : 16-30
  * 초미세먼지 : 9-15
  * 오존 : 0.02 - 0.03
  * 이산화질소 : 0.02-0.03
  * 일산화탄소 : 1-2
  * 아황산가스 : 0.01-0.02
  *
  * 3) 양호
  *
  * 미세먼지 : 31-40
  * 초미세먼지 : 16-20
  * 오존 : 0.03-0.06
  * 이산화질소 : 0.03-0.05
  * 일산화탄소 : 2-5.5
  * 아황산가스 : 0.02-0.04
  *
  * 4) 보통
  *
  * 미세먼지 : 41-50
  * 초미세먼지 : 21-25
  * 오존 : 0.06-0.09
  * 이산화질소 : 0.05-0.06
  * 일산화탄소 : 5.5-9
  * 아황산가스 : 0.04-0.05
  *
  * 5) 나쁨
  *
  * 미세먼지 : 51-75
  * 초미세먼지 : 26-37
  * 오존 : 0.09-0.12
  * 이산화질소 : 0.06-0.13
  * 일산화탄소 : 9-12
  * 아황산가스 : 0.05-0.1
  *
  * 6) 상당히나쁨
  *
  * 미세먼지 : 76-100
  * 초미세먼지 : 38-50
  * 오존 : 0.12-0.15
  * 이산화질소 : 0.13-0.2
  * 일산화탄소 : 12-15
  * 아황산가스 : 0.1-0.15
  *
  * 7) 매우 나쁨
  *
  * 미세먼지 : 101-150
  * 초미세먼지 : 51-75
  * 오존 : 0.15-0.38
  * 이산화질소 : 0.2-1.1
  * 일산화탄소 : 15-32
  * 아황산가스 : 0.15-0.16
  *
  * 8) 최악
  *
  * 미세먼지 : 151~
  * 초미세먼지 : 76~
  * 오존 : 0.38~
  * 이산화질소 : 1.1~
  * 일산화탄소 : 32~
  * 아황산가스 : 0.16~
  * */

import 'package:fine_dust/model/status_model.dart';
import 'package:flutter/material.dart';

final statusLevel = [
  StatusModel(
    level: 0,
    label: "Best",
    primaryColor: Color(0xff98e2ff),
    lightColor: Color(0xffaaf8ff),
    darkColor: Color(0xff9eceff),
    detailFontColor: Colors.black87,
    imagePath: "asset/img/best.png",
    comment: "A day that comes once in 100 years!",
    minFineDust: 0,
    minUltraFineDust: 0,
    minNO2: 0,
    minO3: 0,
    minCO: 0,
    minSO2: 0,
  ),
  StatusModel(
    level: 1,
    label: "Good",
    primaryColor: Color(0xff9cecff),
    lightColor: Color(0xffb8fcff),
    darkColor: Color(0xff99d9ff),
    detailFontColor: Colors.black87,
    imagePath: "asset/img/good.png",
    comment: "Let's go picnic!",
    minFineDust: 16,
    minUltraFineDust: 9,
    minNO2: 0.02,
    minO3: 0.02,
    minCO: 1,
    minSO2: 0.01,
  ),
  StatusModel(
    level: 2,
    label: "Ok",
    primaryColor: Color(0xffb8fcff),
    lightColor: Color(0xffd6feff),
    darkColor: Color(0xffacf0f3),
    detailFontColor: Colors.black87,
    imagePath: "asset/img/ok.png",
    comment: "It's okay to play outside!",
    minFineDust: 31,
    minUltraFineDust: 16,
    minNO2: 0.03,
    minO3: 0.03,
    minCO: 2,
    minSO2: 0.02,
  ),
  StatusModel(
    level: 3,
    label: "Normal",
    primaryColor: Color(0xffa0cdcf),
    lightColor: Color(0xff98e3e6),
    darkColor: Color(0xff519ca0),
    detailFontColor: Colors.black87,
    imagePath: "asset/img/mediocre.png",
    comment: "Not bad!",
    minFineDust: 41,
    minUltraFineDust: 21,
    minNO2: 0.05,
    minO3: 0.06,
    minCO: 5.5,
    minSO2: 0.04,
  ),
  StatusModel(
    level: 4,
    label: "Bad",
    primaryColor: Color(0xffffee84),
    lightColor: Color(0xffffc647),
    darkColor: Color(0xfffff2a0),
    detailFontColor: Colors.black87,
    imagePath: "asset/img/bad.png",
    comment: "The air condition is bad",
    minFineDust: 51,
    minUltraFineDust: 26,
    minNO2: 0.06,
    minO3: 0.09,
    minCO: 9,
    minSO2: 0.05,
  ),
  StatusModel(
    level: 5,
    label: "Very Bad",
    primaryColor: Color(0xffff9f36),
    lightColor: Color(0xffffcf4e),
    darkColor: Color(0xffff8a33),
    detailFontColor: Colors.black87,
    imagePath: "asset/img/very_bad.png",
    comment: "Wear a mask!",
    minFineDust: 76,
    minUltraFineDust: 38,
    minNO2: 0.13,
    minO3: 0.12,
    minCO: 12,
    minSO2: 0.1,
  ),
  StatusModel(
    level: 6,
    label: "Worse",
    primaryColor: Color(0xffff9b73),
    lightColor: Color(0xffffc19d),
    darkColor: Color(0xffff7958),
    detailFontColor: Colors.black87,
    imagePath: "asset/img/worse.png",
    comment: "Don't go out!",
    minFineDust: 101,
    minUltraFineDust: 51,
    minNO2: 0.2,
    minO3: 0.15,
    minCO: 15,
    minSO2: 0.15,
  ),
  StatusModel(
    level: 7,
    label: "Worst",
    primaryColor: Color(0xffff8085),
    lightColor: Color(0xfff4949c),
    darkColor: Color(0xffff6560),
    detailFontColor: Colors.black87,
    imagePath: "asset/img/worst.png",
    comment: "The day of the end of the earth..?",
    minFineDust: 151,
    minUltraFineDust: 76,
    minNO2: 1.1,
    minO3: 0.38,
    minCO: 32,
    minSO2: 0.16,
  ),
];
