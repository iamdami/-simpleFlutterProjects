import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

import 'custom_textField.dart';

class ScheduleBtmSheet extends StatefulWidget {
  const ScheduleBtmSheet({super.key});

  @override
  State<ScheduleBtmSheet> createState() => _ScheduleBtmSheetState();
}

class _ScheduleBtmSheetState extends State<ScheduleBtmSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

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
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + btmInset,
          // 키패드가 차지하는 부분만큼 더한 부분만큼 올라가게끔
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(bottom: btmInset),
            child: Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0),
              child: Form( //form 아래의 모든 textFormField들을 컨트롤
                key: formKey, //form의 컨트롤러처럼 기능
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Time(
                      onStartSaved: (String? val) {
                        startTime = int.parse(val!);
                      },
                      onEndSaved: (String? val) {
                        endTime = int.parse(val!);
                      },
                    ),
                    SizedBox(height: 20.0),
                    _Content(
                      onContentSaved: (String? val) {
                        content = val;
                      },
                    ),
                    SizedBox(height: 20.0),
                    _ColorPicker(),
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
      ),
    );
  }

  void onSavePressed() {
    // formKey는 생성했는데 Form 위젯과 결합하지 않았을 때
    if (formKey.currentState == null) {
      return;
    }
    // 에러 없으면
    if (formKey.currentState!.validate()) {
      print("no error");
      formKey.currentState!.save();
      print("----------");
      print(startTime);
      print(endTime);
      print(content);
    } else {
      print("Error");
    }
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;

  const _Time({required this.onStartSaved, required this.onEndSaved, Key? key})
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
          ),
        ),
        SizedBox(
          width: 18.0,
        ),
        Expanded(
          child: CustomTextField(
            label: "End Time",
            isTime: true,
            onSaved: onEndSaved,
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onContentSaved;

  const _Content({required this.onContentSaved, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: "Content",
        isTime: false,
        onSaved: onContentSaved,
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      runAlignment: WrapAlignment.start,
      children: [
        renderColor(Colors.pinkAccent.shade100),
        renderColor(Colors.amber.shade200),
        renderColor(Colors.teal.shade200),
        renderColor(Colors.blue.shade200),
      ],
    );
  }

  Widget renderColor(Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
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
            child: Text(
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
