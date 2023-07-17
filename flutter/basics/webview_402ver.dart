import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse("https://damio.tistory.com/");

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Dami Blog"),
          centerTitle: true, // 안드로이드는 기본 값이 왼쪽 정렬
          actions: [
            IconButton(
              onPressed: () {
                controller.loadRequest(homeUrl);
              },
              icon: Icon(
                Icons.home,
              ),
            ),
          ],
        ),
        body: WebViewWidget(
          controller: controller,
        ),
        // WebView(
        //   onWebViewCreated: (WebViewController controller) {
        //     this.controller = controller;
        //   },
        //   initialUrl: homeUrl,
        //   javascriptMode: JavascriptMode.unrestricted,
        // ),
        );
  }
}
