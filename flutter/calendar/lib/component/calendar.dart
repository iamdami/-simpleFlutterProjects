import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  const Calendar(
      {required this.selectedDay, required this.focusedDay, required this.onDaySelected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(16.0),
    );

    final defaultTextStyle = TextStyle(
      //평일 날짜 스타일링
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
      fontFamily: "PermanentMarker"
    );

    return TableCalendar(
      locale: "en_US",
      focusedDay: focusedDay,
      firstDay: DateTime(1900),
      lastDay: DateTime(2100),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 22.0,
        ),
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          defaultDecoration: defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,
          selectedDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: primaryColor,
              width: 1.5,
            ),
          ),
          outsideDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
          ),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle.copyWith(
            color: Colors.pink.shade200,
          ),
          selectedTextStyle: defaultTextStyle.copyWith(
            color: primaryColor,
            fontSize: 20.0,
          )),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) {
          //어떤 날짜도 선택되지 않으면
          return false;
        }
        //선택한 날짜 표시
        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}
