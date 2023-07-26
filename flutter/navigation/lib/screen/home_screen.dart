import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route1_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        //true: pop 가능
        final canPop = Navigator.of(context).canPop();
        return canPop;
      },
      child: MainLayout(title: "Home Screen", children: [
        ElevatedButton(
          onPressed: () {
            print(Navigator.of(context).canPop());
            //print()하면 상태 출력해 줌 - false는 되돌아 갈 페이지가 없다는 뜻
          },
          child: Text("canPop"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[100],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).maybePop(); //되돌아 갈 페이지가 라우트 스택에 없을 때
          },
          child: Text("maybePop"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[100],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            final res = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => RouteOneScreen(
                  number: 123,
                ),
              ),
            );
            print(res);
          },
          child: Text("Push"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent[100],
          ),
        ),
      ]),
    );
  }
}
