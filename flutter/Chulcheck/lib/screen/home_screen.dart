import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool chulCheckDone = false; // 출근 안한 형태가 기본값
  GoogleMapController? mapController;

  static final LatLng companyLatLng = LatLng(
    37.5051748,
    127.0572612,
  );

  // CameraPosition: 우주에서 지구를 바라봤을 때의 포지션
  static final CameraPosition initialPosition = CameraPosition(
    target: companyLatLng,
    zoom: 15,
  );

  static const double okDistance = 100;
  static final Circle inDistanceCircle = Circle(
    circleId: CircleId('inDistanceCircle'), //같은 원이면 circle ID에 같은 값
    center: companyLatLng,
    fillColor: Colors.pinkAccent.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.pinkAccent,
    strokeWidth: 1,
  );
  static final Circle notInDistanceCircle = Circle(
    circleId: CircleId('notInDistanceCircle'), //같은 원이면 circle ID에 같은 값
    center: companyLatLng,
    fillColor: Colors.blueAccent.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.blueAccent,
    strokeWidth: 1,
  );
  static final Circle chkDoneCircle = Circle(
    circleId: CircleId('chkDoneCircle'), //같은 원이면 circle ID에 같은 값
    center: companyLatLng,
    fillColor: Colors.greenAccent.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.greenAccent,
    strokeWidth: 1,
  );

  static final Marker marker = Marker(
    markerId: MarkerId('marker'),
    position: companyLatLng,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBer(),
      body: FutureBuilder<String>(
        future: chkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // 권한 허가된 상태
          if (snapshot.data == "위치 권한이 허가되었습니다.") {
            return StreamBuilder<Position>(
              stream: Geolocator.getPositionStream(), // 포지션이 바뀔 때마다 불림
              builder: (context, snapshot) {
                bool isInRange = false;

                if (snapshot.hasData) {
                  final start = snapshot.data!;
                  final end = companyLatLng;
                  //현재 내 위치와 companyLatLng과의 거리가 반경 100m보다 적다면 원 안에 있는 것
                  final distance = Geolocator.distanceBetween(
                    start.latitude,
                    start.longitude,
                    end.latitude,
                    end.longitude,
                  );

                  // 현재 위치가 okDistance 안에 있는지
                  if (distance < okDistance) {
                    isInRange = true;
                  }
                }

                return Column(
                  children: [
                    _CustomGoogleMap(
                      initialPosition: initialPosition,
                      circle: chulCheckDone
                          ? chkDoneCircle
                          : isInRange
                              ? inDistanceCircle
                              : notInDistanceCircle,
                      //반경 내 있으면 inDistanceCircle, 아니면 notInDistanceCircle

                      marker: marker,
                      onMapCreated: onMapCreated,
                    ),
                    _ChulCheckBtn(
                      isInRange: isInRange,
                      onPressed: onChulCheckPressed,
                      chulCheckDone: chulCheckDone,
                    ),
                  ],
                );
              },
            );
          }

          // 권한 없는 상태
          return Center(
            child: Text(snapshot.data),
          );
        },
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // 파라미터로 받은 GoogleMapController controller를 mapController에 넣어주기
  }

  onChulCheckPressed() async {
    final res = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("출근하기"),
          content: Text("출근 하시겠습니까?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); //뒤로가기
                },
                child: Text(
                  "취소",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  "승인",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ))
          ],
        );
      },
    );

    if (res) {
      setState(() {
        chulCheckDone = true;
      });
    }
  }

  //유저가 눌러주는 값으로 작업하기 때문에 async
  Future<String> chkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return "위치 서비스를 활성화 해주세요.";
    }

    LocationPermission chkedPermission = await Geolocator.checkPermission();
    // 현재 앱이 가지고 있는 위치 서비스 권한을 LocationPermission 형태로 가져옴
    if (chkedPermission == LocationPermission.denied) {
      chkedPermission = await Geolocator.requestPermission(); // 권한요청 띄우기

      // 그래도 허가 안되어있다면
      if (chkedPermission == LocationPermission.denied) {
        return "위치 권한을 허가해주세요.";
      }
    }

    // 허가 요청을 취소했거나.. 하면 개발자입장에서 다시 권한요청 띄울 수 없기에 아래 메시지 출력
    if (chkedPermission == LocationPermission.deniedForever) {
      return "앱의 위치 권한을 setting에서 허가해주세요.";
    }

    // 이 모든 것에 부합하지 않는다면(허가가 되었다면)
    return "위치 권한이 허가되었습니다.";
  }

  AppBar renderAppBer() {
    return AppBar(
      title: Text(
        "출근 가보자고~",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.green[400],
      actions: [
        IconButton(
          onPressed: () async {
            if (mapController == null) {
              return;
            }
            final location = await Geolocator.getCurrentPosition();

            mapController!.animateCamera(
              CameraUpdate.newLatLng(
                LatLng(
                  location.latitude,
                  location.longitude,
                ),
              ),
            );
          },
          icon: Icon(
            Icons.my_location_rounded,
          ),
        )
      ],
    );
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;
  final MapCreatedCallback onMapCreated;

  const _CustomGoogleMap({
    required this.initialPosition,
    required this.circle,
    required this.marker,
    required this.onMapCreated,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: initialPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          circles: Set.from([circle]),
          markers: Set.from([marker]),
          onMapCreated: onMapCreated),
    );
  }
}

class _ChulCheckBtn extends StatelessWidget {
  final bool isInRange;
  final VoidCallback onPressed;
  final bool chulCheckDone;

  const _ChulCheckBtn({
    required this.isInRange,
    required this.onPressed,
    required this.chulCheckDone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timelapse_rounded,
            size: 50.0,
            color: chulCheckDone
                ? Colors.green
                : isInRange
                    ? Colors.pinkAccent
                    : Colors.blueAccent,
            //반경 내 있는 경우 pinkAccent, 아니면 blueAccent
          ),
          const SizedBox(
            height: 20.0,
          ),
          if (!chulCheckDone && isInRange)
            //출첵하기 전이면서 반경 내에 있을 경우에만 출근하기 버튼 띄우기
            OutlinedButton(
              onPressed: onPressed,
              child: Text(
                "출근하기",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
