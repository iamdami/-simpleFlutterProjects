import 'dart:io'; //무조건 이 패키지의 File을 가져와야 함
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  const CustomVideoPlayer({
    required this.video,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;
  @override
  void initState() {
    //initState()는 async 사용 못함 -> 함수로 따로 만들기!
    super.initState();
    // initState()는 initializeController()를 실행할 뿐, 동작 끝날 때까지 기다리진 않음
    initializeController();
  }

  initializeController() async {
    videoController = VideoPlayerController.file(
      //flutter의 file 타입은 XFile 타입과는 조금 다름
      File(widget.video.path),
    );
    await videoController!.initialize(); //바로 위에 파일 넣어줬기 때문에 !

    setState(() {
      // setState()는 빌드를 새로 하라는 함수
      // -> 비디오 컨트롤러를 생성했으니 비디오 컨트롤러에 맞게 새로 url을 생성하라는 의미
    });
  }

  @override
  Widget build(BuildContext context) {
    //컨트롤러가 null일 때 실행되면 에러 남 -> null 처리하기
    if (videoController == null) {
      return const CircularProgressIndicator(); //로딩 스크린 띄우기
    }
    return AspectRatio(
      // 동영상 실제 크기로 맞추기 -> 회전해도 반영
      aspectRatio: videoController!.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            videoController!,
          ),
          _Controls(
            onReversePressed: onReversePressed,
            onPlayPressed: onPlayPressed,
            onForwardPressed: onForwardPressed,
            isPlaying: videoController!.value.isPlaying,
          ),
          Positioned(
            right: 10.0, // 아이콘 오른쪽 끝에서 몇 픽셀 떨어지게 배치할 때
            child: IconButton(
              onPressed: () {},
              iconSize: 40.0,
              color: Colors.white,
              icon: const Icon(
                Icons.photo_camera_rounded,
              ),
            ),
          )
        ],
      ),
    );
  }

  void onPlayPressed() {
    setState(() {
      //이미 실행 중이면 중지, 아니면 실행
      if (videoController!.value.isPlaying) {
        videoController!.pause();
      } else {
        videoController!.play();
      }
    });
  }

  void onReversePressed() {
    final crntPosition = videoController!.value.position;
    // 뒤로 n초 돌리기 버튼
    //변경가능하도록 final이 아닌 Duration으로 정의
    Duration position = Duration(); //position은 기본 0초로 설정

    if(crntPosition.inSeconds > 3){
      position = crntPosition - Duration(seconds: 3);
    }
    videoController!.seekTo(position);
  }

  void onForwardPressed() {
    final maxPosition = videoController!.value.duration; // 전체 길이 가져오기
    final crntPosition = videoController!.value.position;
    Duration position = maxPosition; //default값은 전체 길이(maxPosition)로 정의

    if((maxPosition - Duration(seconds: 3)).inSeconds > crntPosition.inSeconds){
      // 현재 포지션 시간이 더 짧다면
      position = crntPosition + Duration(seconds: 3);
    }
    videoController!.seekTo(position);
  }
}

class _Controls extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _Controls({
    required this.onPlayPressed,
    required this.onReversePressed,
    required this.onForwardPressed,
    required this.isPlaying,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          renderIconBtn(
            onPressed: onReversePressed,
            iconData: Icons.rotate_left_rounded,
          ),
          renderIconBtn(
            onPressed: onPlayPressed,
            iconData: isPlaying
                ? Icons.pause_circle_rounded
                : Icons.play_arrow_rounded,
          ), //실행 중이면 pause로, 아니면 play 아이콘
          renderIconBtn(
            onPressed: onForwardPressed,
            iconData: Icons.rotate_right_rounded,
          ),
        ],
      ),
    );
  }

  Widget renderIconBtn({
    required VoidCallback onPressed,
    required IconData iconData,
  }) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 40.0,
      color: Colors.white,
      icon: Icon(iconData),
    );
  }
}
