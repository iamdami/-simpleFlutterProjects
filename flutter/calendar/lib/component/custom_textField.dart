import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime; // true: 시간, false: 내용

  const CustomTextField({required this.label, required this.isTime, Key? key})
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
    return TextField(
      cursorColor: Colors.grey,
      maxLines: isTime ? 1 : null, // 시간과 관련있으면(시작, 마침) 1줄, 내용과 관련있으면 쭉..
      expands: !isTime,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isTime ? [FilteringTextInputFormatter.digitsOnly] : [],
      // 숫자 외 글자는 넣지 못하게 막음
      textAlign: TextAlign.start,
      decoration: InputDecoration(
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
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        hintText: "Type in your text",
      ),
    );
  }
}

