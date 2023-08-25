import 'package:calendar_scheduler/component/calendar.dart';
import 'package:calendar_scheduler/component/new_schedule_btm_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:calendar_scheduler/model/schedule_with_color.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
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
            ),
            const SizedBox(height: 16.0),
            _ScheduleList(
              selectedDate: selectedDay,
            ),
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
            return ScheduleBtmSheet(
              selectedDate: selectedDay,
            );
          },
        );
      },
      backgroundColor: primaryColor,
      child: const Icon(
        Icons.add,
      ),
    );
  }

  //날짜 고를 때 불림(UTC 기준)
  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

class _ScheduleList extends StatelessWidget {
  final DateTime selectedDate;
  const _ScheduleList({required this.selectedDate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: StreamBuilder<List<ScheduleWithColor>>(
            stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    "There are no events on that date.",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black38,
                    ),
                  ),
                );
              }

              return ListView.separated(
                //리소스 사용에 유리
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8.0,
                  );
                },
                itemBuilder: (context, index) {
                  final scheduleWithColor =
                      snapshot.data![index]; // 각 스케줄마다 인덱스로 관리

                  return Dismissible(
                    key: ObjectKey(scheduleWithColor.schedule.id),
                    direction: DismissDirection.endToStart,
                    //읽는 방향과 반대로 스와이프했을 때 삭제
                    onDismissed: (DismissDirection direction){
                      //실제 삭제됐을 때 onDismissed 실행
                      GetIt.I<LocalDatabase>().removeSchedule(scheduleWithColor.schedule.id);
                    },
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                          // 화면 절반만큼이 최대
                          context: context,
                          isScrollControlled: true,
                          builder: (_) {
                            return ScheduleBtmSheet(
                              selectedDate: selectedDate,
                              scheduleId: scheduleWithColor.schedule.id,
                            );
                          },
                        );
                      },
                      child: ScheduleCard(
                        startTime: scheduleWithColor.schedule.startTime,
                        endTime: scheduleWithColor.schedule.endTime,
                        content: scheduleWithColor.schedule.content,
                        color: Color(
                          int.parse(
                            "FF${scheduleWithColor.categoryColor.hexCode}",
                            radix: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
