import 'package:calendar_scheduler/const/colors.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:calendar_scheduler/model/category_color.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'custom_textField.dart';

class ScheduleBtmSheet extends StatefulWidget {
  final DateTime selectedDate;
  final int? scheduleId;

  const ScheduleBtmSheet(
      {required this.selectedDate, this.scheduleId, Key? key})
      : super(key: key);

  @override
  State<ScheduleBtmSheet> createState() => _ScheduleBtmSheetState();
}

class _ScheduleBtmSheetState extends State<ScheduleBtmSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;
  int? selectedColorId;

  @override
  Widget build(BuildContext context) {
    final btmInset = MediaQuery.of(context).viewInsets.bottom;
    // 아래부터 실제 키패드가 차지하는 부분

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        // 시트의 어디라도 누르면 키패드 닫힘
        // 이 부분은 외워두기!
      },
      child: FutureBuilder<Schedule>(
          future: widget.scheduleId == null
              ? null
              : GetIt.I<LocalDatabase>().getScheduleById(widget.scheduleId!),
          //widget.scheduleId == null이면 null 넣어주고
          //아니면 getScheduleById() 실행
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Could not load schedule."),
              );
            }
            if (snapshot.connectionState != ConnectionState.none &&
                !snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } // futureBuilder가 처음 실행됐고, 로딩중일 때
            if (snapshot.hasData && startTime == null) {
              startTime = snapshot.data!.startTime;
              endTime = snapshot.data!.endTime;
              content = snapshot.data!.content;
              selectedColorId = snapshot.data!.colorID;
            } // future가 실행되고 값이 있는데 한 번도 startTime이 세팅되지 않았을 때

            return SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height / 2 + btmInset,
                // 키패드가 차지하는 부분만큼 더한 부분만큼 올라가게끔
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(bottom: btmInset),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0),
                    child: Form(
                      //form 아래의 모든 textFormField들을 컨트롤
                      key: formKey, //form의 컨트롤러처럼 기능
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Time(
                            onStartSaved: (String? val) {
                              startTime = int.parse(val!);
                            },
                            startInitialValue: startTime?.toString() ?? "",
                            onEndSaved: (String? val) {
                              endTime = int.parse(val!);
                            },
                            endInitialValue: endTime?.toString() ?? "",
                          ),
                          SizedBox(height: 20.0),
                          _Content(
                            onContentSaved: (String? val) {
                              content = val;
                            },
                            initialValue: content ?? "", //null이면 empty string
                          ),
                          SizedBox(height: 20.0),
                          FutureBuilder<List<CategoryColor>>(
                              future:
                                  GetIt.I<LocalDatabase>().getCategoryColors(),
                              builder: (context, snapshot) {
                                // 데이터가 있고 한번도 값이 세팅된 적이 없고
                                // 최소한 하나의 값이 snapshot.data에 들어있다면
                                if (snapshot.hasData &&
                                    selectedColorId == null &&
                                    snapshot.data!.isNotEmpty) {
                                  selectedColorId =
                                      snapshot.data![0].id; //첫번째 색이 디폴트
                                }
                                return _ColorPicker(
                                  colors:
                                      snapshot.hasData ? snapshot.data! : [],
                                  selectedColorId: selectedColorId,
                                  colorIdSetter: (int id) {
                                    setState(() {
                                      selectedColorId = id;
                                    });
                                  },
                                );
                              }),
                          SizedBox(height: 20.0),
                          _SaveButton(
                            onPressed: onSavePressed,
                          ),
                          SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void onSavePressed() async {
    // formKey는 생성했는데 Form 위젯과 결합하지 않았을 때
    if (formKey.currentState == null) {
      return;
    }
    // 에러 없으면
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (widget.scheduleId == null) {
        await GetIt.I<LocalDatabase>().createSchedule(
          SchedulesCompanion(
            date: Value(widget.selectedDate),
            startTime: Value(startTime!),
            endTime: Value(endTime!),
            content: Value(content!),
            colorID: Value(selectedColorId!),
          ),
        );
      } else {
        //update함수 실행
        await GetIt.I<LocalDatabase>().updateScheduleById(
            widget.scheduleId!,
            SchedulesCompanion(
              date: Value(widget.selectedDate),
              startTime: Value(startTime!),
              endTime: Value(endTime!),
              content: Value(content!),
              colorID: Value(selectedColorId!),
            ));
      }
      //스케줄 생성

      Navigator.of(context).pop();
      // 일정 작성 후 btm sheet 닫기
    } else {
      print("Error");
    }
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;
  final String startInitialValue;
  final String endInitialValue;

  const _Time(
      {required this.onStartSaved,
      required this.onEndSaved,
      required this.startInitialValue,
      required this.endInitialValue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // 텍스트필드 구성
      children: [
        Expanded(
          child: CustomTextField(
            label: "Start Time",
            isTime: true,
            onSaved: onStartSaved,
            initialValue: startInitialValue,
          ),
        ),
        const SizedBox(
          width: 18.0,
        ),
        Expanded(
          child: CustomTextField(
            label: "End Time",
            isTime: true,
            onSaved: onEndSaved,
            initialValue: endInitialValue,
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onContentSaved;
  final String initialValue;

  const _Content(
      {required this.onContentSaved, required this.initialValue, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: "Content",
        isTime: false,
        onSaved: onContentSaved,
        initialValue: initialValue,
      ),
    );
  }
}

typedef ColorIdSetter = Function(int id);
// ColorIdSetter는 함수인데, 파라미터로 int id 하나 받음

class _ColorPicker extends StatelessWidget {
  final List<CategoryColor> colors;
  final int? selectedColorId;
  final ColorIdSetter colorIdSetter;

  const _ColorPicker(
      {required this.colors,
      required this.selectedColorId,
      required this.colorIdSetter,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      runAlignment: WrapAlignment.start,
      children: colors
          .map((e) => GestureDetector(
                onTap: () {
                  colorIdSetter(e.id);
                }, //각 색깔 누를 때마다 실행
                child: renderColor(
                  e,
                  selectedColorId == e.id, //선택이 된 상태로 가정
                ),
              ))
          .toList(),
    );
  }

  Widget renderColor(CategoryColor color, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(
          int.parse(
            "FF${color.hexCode}",
            radix: 16, //16진수 변환
          ),
        ),
        border: isSelected //색이 선택되었으면 테두리 표시
            ? Border.all(
                color: Colors.indigoAccent.shade100,
                width: 2.0,
              )
            : null,
      ),
      width: 32.0,
      height: 32.0,
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              alignment: Alignment.center,
            ),
            onPressed: onPressed,
            child: const Text(
              "Save",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
