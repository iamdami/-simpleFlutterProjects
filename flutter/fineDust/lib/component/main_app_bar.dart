import 'package:fine_dust/model/stat_model.dart';
import 'package:fine_dust/model/status_model.dart';
import 'package:fine_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String region;
  final StatusModel status;
  final StatModel stat;
  final DateTime dateTime;
  final bool isExpanded;

  const MainAppBar(
      {required this.region,
      required this.status,
      required this.stat,
      required this.dateTime,
        required this.isExpanded,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.black87,
      fontSize: 30.0,
    );

    return SliverAppBar(
      backgroundColor: status.primaryColor,
      pinned: true,
      title: isExpanded ? null : Text(
        "$region ${DataUtils.getTimeFromDataTime(dateTime: dateTime)}",
        style: ts.copyWith(
          fontFamily: "Indie",
          fontWeight: FontWeight.w600,
          fontSize: 24.0,
          color: Colors.black54,
        ),
      ),
      centerTitle: true,
      expandedHeight: 460,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight), //appbar 공간만큼 띄워줌
            child: Column(
              children: [
                Text(
                  region,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DataUtils.getTimeFromDataTime(dateTime: stat.dataTime),
                  style: ts.copyWith(
                    fontSize: 25.0,
                    fontFamily: "Indie",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20.0),
                Image.asset(
                  status.imagePath,
                  width: MediaQuery.of(context).size.width / 2.8,
                ),
                const SizedBox(height: 15.0),
                Text(
                  status.label,
                  style: ts.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  status.comment,
                  style: ts.copyWith(
                    fontSize: 22.0,
                    fontFamily: "Indie",
                    fontWeight: FontWeight.w600,
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
