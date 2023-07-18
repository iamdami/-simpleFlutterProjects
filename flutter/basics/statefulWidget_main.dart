import 'package:flutter/material.dart';
import 'package:stateful_widget/screen/home_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: Root(),
    debugShowCheckedModeBanner: false,
  ));
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  Color color = Colors.blueAccent;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Color Change!"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: show
                      ? HomeScreen(
                          color: color,
                        )
                      : Container(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        color = color == Colors.pinkAccent
                            ? Colors.blueAccent
                            : Colors.pinkAccent;
                      });
                    },
                    child: const Text(
                      'Change Color',
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: Text(
                      !show ? 'Create Widget' : 'Delete Widget',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
