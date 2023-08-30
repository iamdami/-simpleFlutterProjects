import 'package:fine_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';
import '../model/stat_model.dart';
import 'card_title.dart';
import 'main_card.dart';

// 시간별 미세먼지
class HourlyCard extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final String category;
  final List<StatModel> stats;
  final String region;

  const HourlyCard({
    required this.darkColor,
    required this.lightColor,
    required this.category,
    required this.stats,
    required this.region,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainCard(
      bgColor: lightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            title: "Hourly $category",
            bgColor: darkColor,
          ),
          Column(
            children: stats
                .map(
                  (stat) => renderRow(stat: stat),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget renderRow({required StatModel stat}) {
    final status = DataUtils.getCrntStatusFromItemCodeAndValue(
        value: stat.getLevelFromRegion(region), itemCode: stat.itemCode);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text("${stat.dataTime.hour}"),
          ),
          Expanded(
            child: Image.asset(
              status.imagePath,
              height: 20.0,
            ),
          ),
          Expanded(
            child: Text(
              status.label,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
