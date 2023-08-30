import 'package:fine_dust/component/main_card.dart';
import 'package:fine_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:fine_dust/component/main_stat.dart';
import '../model/stat_and_status_model.dart';
import 'card_title.dart';

class CategoryCard extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final String region;
  final List<StatAndStatusModel> models;

  const CategoryCard({
    required this.darkColor,
    required this.lightColor,
    required this.region,
    required this.models,
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
                    children: models
                        .map(
                          (model) => MainStat(
                            category: DataUtils.getItemCodeString(
                                itemCode: model.itemCode),
                            imgPath: model.status.imagePath,
                            level: model.status.label,
                            stat: "${model.stat.getLevelFromRegion(
                              region,
                            )}${DataUtils.getUnitFromItemCode(
                              itemCode: model.itemCode,
                            )}",
                            width: constraint.maxWidth / 3,
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
