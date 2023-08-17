import 'package:calendar_scheduler/component/calendar.dart';
import 'package:calendar_scheduler/component/new_schedule_btm_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDaySelected: onDaySelected,
            ),
            const SizedBox(height: 16.0),
            TodayBanner(
              selectedDay: selectedDay,
              scheduleCount: 6,
            ),
            const SizedBox(height: 16.0),
            _ScheduleList(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          // 화면 절반만큼이 최대
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return ScheduleBtmSheet();
          },
        );
      },
      backgroundColor: primaryColor,
      child: const Icon(
        Icons.add,
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          //리소스 사용에 유리
          itemCount: 6,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 8.0,
            );
          },
          itemBuilder: (context, index) {
            return ScheduleCard(
              startTime: 12,
              endTime: 14,
              content: "Walk a cat 🐱",
              color: Colors.indigo,
            );
          },
        ),
      ),
    );
  }
}
