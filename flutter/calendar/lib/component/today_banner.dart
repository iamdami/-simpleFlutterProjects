import 'package:calendar_scheduler/const/colors.dart';
import 'package:calendar_scheduler/model/schedule_with_color.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:get_it/get_it.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  const TodayBanner({required this.selectedDay, Key? key}) : super(key: key);

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
            StreamBuilder<List<ScheduleWithColor>>(
                stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDay),
                builder: (context, snapshot) {
                  int count = 0; //일정 개수
                  if (snapshot.hasData) {
                    count = snapshot.data!.length;
                  }
                  return Text("Schedule: $count", style: textStyle);
                }),
          ],
        ),
      ),
    );
  }
}
