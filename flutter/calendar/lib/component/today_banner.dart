import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;
  const TodayBanner(
      {required this.selectedDay, required this.scheduleCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      // fontWeight: FontWeight.w300,
      fontSize: 20.0,
      fontFamily: "PermanentMarker",
    );

    return Container(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "${selectedDay.month.toString().padLeft(2, "0")}. ${selectedDay.day.toString().padLeft(2, "0")}. ${selectedDay.year}",
                style: textStyle),
            Text("Schedule: $scheduleCount", style: textStyle),
          ],
        ),
      ),
    );
  }
}
