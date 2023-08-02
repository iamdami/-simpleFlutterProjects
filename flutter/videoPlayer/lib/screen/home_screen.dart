import 'dart:io'; //무조건 이 패키지의 File을 가져와야 함
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onNewVideoPressed;

  const CustomVideoPlayer({
    required this.video,
    required this.onNewVideoPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;
  Duration crntPosition = Duration();
  //현재 포지션을 매번 저장(현재 포지션에 따라서 슬라이드 자동으로 움직이게끔
  bool showControls = false; //제어화면 보이게 하는 기능. default: false

  @override
  void initState() {
    //initState()는 async 사용 못함 -> 함수로 따로 만들기!
    super.initState();
    // initState()는 initializeController()를 실행할 뿐, 동작 끝날 때까지 기다리진 않음
    initializeController();
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    //새로운 비디오가 들어왔을 때
    // -> 전에 들어온 비디오 경로와 새로 들어온 비디오 경로가 다를 때
    if (oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }

  initializeController() async {
    crntPosition = const Duration();
    //값 변경할 때마다 현재 포지션을 0으로 설정해주기 -> 새로운 동영상 실행할 때 전 동영상과의 싱크 에러 방지 위함
    videoController = VideoPlayerController.file(
      //flutter의 file 타입은 XFile 타입과는 조금 다름
      File(widget.video.path),
    );
    await videoController!.initialize(); //바로 위에 파일 넣어줬기 때문에 !

    videoController!.addListener(() {
      final crntPosition = videoController!.value.position;
      setState(() {
        this.crntPosition = crntPosition;
        //state의 crntPosition에 controller에서 가져온 crntPosition 값 가져오는 것
      });
    }); // videoController 값이 변경될 때마다 실행되는 함수

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
      child: GestureDetector(
        onTap: () {
          setState(() {
            showControls = !showControls;
            // true일 때는 false를, false일 때는 true를 넣어주기
          });
        },
        child: Stack(
          children: [
            VideoPlayer(
              videoController!,
            ),
            if (showControls)
              _Controls(
                onReversePressed: onReversePressed,
                onPlayPressed: onPlayPressed,
                onForwardPressed: onForwardPressed,
                isPlaying: videoController!.value.isPlaying,
              ),
            if (showControls)
              _NewVideo(
                onPressed: widget.onNewVideoPressed,
              ),
            _SlideBtm(
              crntPosition: crntPosition,
              maxPosition: videoController!.value.duration,
              onSliderChanged: onSliderChanged,
            ),
          ],
        ),
      ),
    );
  }

  void onSliderChanged(double val) {
    (double val) {
      videoController!.seekTo(
        Duration(
          seconds: val.toInt(),
        ),
      );
    };
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
    Duration position = const Duration(); //position은 기본 0초로 설정

    if (crntPosition.inSeconds > 3) {
      position = crntPosition - Duration(seconds: 3);
    }
    videoController!.seekTo(position);
  }

  void onForwardPressed() {
    final maxPosition = videoController!.value.duration; // 전체 길이 가져오기
    final crntPosition = videoController!.value.position;
    Duration position = maxPosition;
    //default값은 전체 길이(maxPosition)로 정의

    if ((maxPosition - Duration(seconds: 3)).inSeconds >
        crntPosition.inSeconds) {
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
      height: MediaQuery.of(context).size.height,
      child: Row(
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

class _NewVideo extends StatelessWidget {
  final VoidCallback onPressed;

  const _NewVideo({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10.0, // 아이콘 오른쪽 끝에서 몇 픽셀 떨어지게 배치할 때
      child: IconButton(
        onPressed: onPressed,
        iconSize: 40.0,
        color: Colors.white,
        icon: const Icon(
          Icons.photo_camera_rounded,
        ),
      ),
    );
  }
}

class _SlideBtm extends StatelessWidget {
  final Duration crntPosition;
  final Duration maxPosition;
  final ValueChanged<double> onSliderChanged;

  const _SlideBtm({
    required this.crntPosition,
    required this.maxPosition,
    required this.onSliderChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // 슬라이더 포지션
      bottom: 0, //아래에서 부터 0픽셀
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              "${crntPosition.inMinutes}: ${(crntPosition.inSeconds % 60).toString().padLeft(2, "0")}",
              // 60으로 나눈 나머지 코딩을 하지 않으면 61초 됐을 때 분은 1분이 올라가는데 초는 여전히 61일 것
              // -> 분 이 된 부분은 분으로 넘기고 초만 남겨줘야하기 때문
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Slider(
                  value: crntPosition.inSeconds.toDouble(),
                  max: maxPosition.inSeconds.toDouble(),
                  min: 0,
                  // 직접 슬라이드를 움직일 때만 아래 onChanged()가 불림
                  onChanged: onSliderChanged),
            ),
            Text(
              "${maxPosition.inMinutes}: ${(maxPosition.inSeconds % 60).toString().padLeft(2, "0")}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
