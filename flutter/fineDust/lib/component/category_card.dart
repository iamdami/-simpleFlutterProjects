import 'package:fine_dust/component/main_card.dart';
import 'package:flutter/material.dart';
import 'package:fine_dust/component/main_stat.dart';

import '../const/colors.dart';
import 'card_title.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: MainCard(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardTitle(
                  title: "Statistics by category",
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    //조금만 움직여도 다음 페이지스크롤로 넘어감
                    children: List.generate(
                      10,
                      (index) => MainStat(
                        width: constraint.maxWidth / 4, //스크롤 시 4개씩 보여지게
                        category: "Fine Dust $index",
                        imgPath: "asset/img/best.png",
                        level: "Best",
                        stat: "0㎍/㎥",
                      ),
                    ),
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
