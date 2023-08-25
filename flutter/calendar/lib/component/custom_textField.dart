import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime; // true: 시간, false: 내용
  final FormFieldSetter<String> onSaved;
  final String initialValue;

  const CustomTextField(
      {required this.label,
      required this.isTime,
      required this.onSaved,
      required this.initialValue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: primaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        if (isTime) renderTextField(),
        if (!isTime)
          Expanded(
            child: renderTextField(),
          ),
      ],
    );
  }

  Widget renderTextField() {
    return TextFormField(
      onSaved: onSaved,
      // Form으로 텍스트필드 동시 관리(통합)
      // null 리턴되면 에러 없음
      // 에러 있으면 에러를 String 값으로 반환
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return "Enter values in all textfields.";
        }
        if (isTime) {
          int time = int.parse(val);

          if (time < 0) {
            return "Enter a number greater than 0.";
          }
          if (time > 24) {
            return "Enter a number less than 24.";
          }
        } else {}
        return null;
      },
      cursorColor: Colors.grey,
      maxLines: isTime ? 1 : null, // 시간과 관련있으면(시작, 마침) 1줄, 내용과 관련있으면 쭉..
      expands: !isTime,
      initialValue: initialValue,
      maxLength: 200,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isTime ? [FilteringTextInputFormatter.digitsOnly] : [],
      // 숫자 외 글자는 넣지 못하게 막음
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontFamily: "IndieFlower",
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        suffixText: isTime ? ": 00" : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.all(12.0),
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontFamily: "IndieFlower",
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        hintText: isTime ? "In 24 hour format." : "Type in your text.",
      ),
    );
  }
}
