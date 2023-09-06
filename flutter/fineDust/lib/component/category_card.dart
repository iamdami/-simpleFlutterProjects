import 'package:fine_dust/component/main_card.dart';
import 'package:fine_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:fine_dust/component/main_stat.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/stat_model.dart';
import 'card_title.dart';

class CategoryCard extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final String region;

  const CategoryCard({
    required this.darkColor,
    required this.lightColor,
    required this.region,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: MainCard(
        bgColor: lightColor,
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardTitle(
                  bgColor: darkColor,
                  title: "Statistics by category",
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    //조금만 움직여도 다음 페이지스크롤로 넘어감
                    children: ItemCode.values
                        .map(
                          (ItemCode itemCode) => ValueListenableBuilder<Box>(
                            // 각각 itemCode에 해당되는 box가 builder안에 들어옴
                            valueListenable:
                                Hive.box<StatModel>(itemCode.name).listenable(),
                            builder: (context, box, widget) {
                              final stat = box.values.last as StatModel;
                              final status =
                                  DataUtils.getCrntStatusFromItemCodeAndValue(
                                value: stat.getLevelFromRegion(region),
                                itemCode: itemCode,
                              );

                              return MainStat(
                                category: DataUtils.getItemCodeString(
                                    itemCode: itemCode),
                                imgPath: status.imagePath,
                                level: status.label,
                                stat: "${stat.getLevelFromRegion(
                                  region,
                                )}${DataUtils.getUnitFromItemCode(
                                  itemCode: itemCode,
                                )}",
                                width: constraint.maxWidth / 3,
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
