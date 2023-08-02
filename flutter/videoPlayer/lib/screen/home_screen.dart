import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidplayer/component/custom_video_player.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: video == null? renderEmpty() : renderVideo(),
    );
  }


  Widget renderVideo(){
    return Center(
      child: CustomVideoPlayer(
        video : video!,
        onNewVideoPressed: onNewVideoPressed,
        //새로운 비디오 넣어주기 위함
      ),
    );
  }

  Widget renderEmpty() {
    return Container(
      decoration: getBoxDecoration(),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(onTap: onNewVideoPressed),
          const SizedBox(
            height: 30.0,
          ),
          const _AppName(),
        ],
      ),
    );
  }

  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (video != null) {
      //비디오를 고르지않고 빠져나오면
      setState(() {
        this.video = video; //넣어놓은 비디오 사용
      });
    }
  }

  BoxDecoration getBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFF6C9),
          Color(0xD8F3B7CA),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        "asset/img/logo.png",
        width: 270.0,
      ),
    );
  }
}

class _AppName extends StatelessWidget {
  const _AppName({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Video",
          style: textStyle,
        ),
        Text(
          "Player",
          style: textStyle.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
