import 'dart:convert';
import 'dart:io';
import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:actual/common/const/colors.dart';
import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/common/view/root_tab.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userName = "";
  String pw = "";

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Title(),
                const SizedBox(height: 16.0),
                _SubTitle(),
                const SizedBox(height: 50.0),
                Image.asset(
                  "asset/imgs/misc/logo.png",
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                const SizedBox(height: 50.0),
                CustomTextFormField(
                  hintText: "Please enter your email.",
                  onChanged: (String value) {
                    userName = value;
                  },
                ),
                const SizedBox(height: 10.0),
                CustomTextFormField(
                  hintText: "Please enter your password.",
                  onChanged: (String value) {
                    pw = value;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () async {
                    final rawString = "$userName:$pw";
                    Codec<String, String> stringToBase64 = utf8.fuse(base64);
                    String token = stringToBase64.encode(rawString);

                    final resp = await dio.post(
                      "http://$ip/auth/login",
                      options: Options(
                        headers: {"authorization": "Basic $token"},
                      ),
                    );

                    final refreshToken = resp.data["refreshToken"];
                    final accessToken = resp.data["accessToken"];

                    await storage.write(
                        key: REFRESH_TOKEN_KEY, value: refreshToken);
                    await storage.write(
                        key: ACCESS_TOKEN_KEY, value: accessToken);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => RootTap(),
                      ),
                    );
                  },
                  child: Text("Log In"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary_color,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Sign Up"),
                  style: TextButton.styleFrom(
                    foregroundColor: body_text_color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome!",
      style: TextStyle(
        fontSize: 34.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "This is DesserToMe that brings happiness. 🎀 \nPlease enter your email and password to log in.",
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: body_text_color,
      ),
    );
  }
}
