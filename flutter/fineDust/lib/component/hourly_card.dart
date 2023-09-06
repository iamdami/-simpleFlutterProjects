import 'package:fine_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/stat_model.dart';
import 'card_title.dart';
import 'main_card.dart';

// 시간별 미세먼지
class HourlyCard extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final String region;
  final ItemCode itemCode;

  const HourlyCard({
    required this.darkColor,
    required this.lightColor,
    required this.region,
    required this.itemCode,
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
            title: "Hourly ${DataUtils.getItemCodeString(itemCode: itemCode)}",
            bgColor: darkColor,
          ),
          ValueListenableBuilder<Box>(
            valueListenable: Hive.box<StatModel>(itemCode.name).listenable(),
            builder: (context, box, widget) => Column(
              children: box.values.toList().reversed
                  .map(
                    (stat) => renderRow(stat: stat),
                  )
                  .toList(),
            ),
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
