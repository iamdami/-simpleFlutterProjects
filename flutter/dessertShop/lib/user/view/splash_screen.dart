import 'package:actual/common/const/colors.dart';
import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/common/view/root_tab.dart';
import 'package:actual/user/view/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    ChkToken();
  }

  void ChkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final dio = Dio();

    try {
      final resp = await dio.post(
        "http://$ip/auth/token",
        options: Options(
          headers: {
            "authorization": "Bearer $refreshToken",
          },
        ),
      );
      
      await storage.write(key: ACCESS_TOKEN_KEY, value: resp.data["accessToken"]);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => RootTap(),
        ),
            (route) => false,
      );
    } catch (e) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
            (route) => false,
      );
    }
  }

  void DeleteToken() async {
    storage.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      // backgroundColor: primary_color,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asset/imgs/logo/logo_ice.jpeg",
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 50.0),
            CircularProgressIndicator(
              color: Colors.pink.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
