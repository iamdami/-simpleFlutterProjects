import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    required this.onChanged,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autoFocus = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: input_border_color,
        width: 1.0,
      ),
    );

    return TextFormField(
      cursorColor: primary_color,
      obscureText: obscureText, //비밀번호 작성시
      autofocus: autoFocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12.0),
        hintText: hintText,
        hintStyle: TextStyle(
          color: body_text_color,
          fontSize: 14.0,
        ),
        errorText: errorText,
        filled: true, //배경색 적용 유무
        fillColor: input_bg_color,
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(color: primary_color),
        ),
      ),
    );
  }
}
