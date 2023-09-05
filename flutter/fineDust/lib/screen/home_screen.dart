import 'package:fine_dust/component/main_app_bar.dart';
import 'package:fine_dust/model/stat_and_status_model.dart';
import 'package:fine_dust/model/stat_model.dart';
import 'package:fine_dust/repository/stat_repo.dart';
import 'package:fine_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../component/category_card.dart';
import '../component/hourly_card.dart';
import '../component/main_drawer.dart';
import '../const/regions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String region = regions[0];
  bool isExpanded = true;
  ScrollController scrollController = ScrollController();

  @override
  initState() {
    super.initState();

    scrollController.addListener(scrollListener);
  }

  @override
  dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    List<Future> futures = [];

    for (ItemCode itemCode in ItemCode.values) {
      futures.add(
        StatRepo.fetchData(
          itemCode: itemCode,
        ),
      );
    }

    final res = await Future.wait(futures);
    // 모든 StatRepo.fetchData()가 끝나기까지 기다리지 않고 바로 다음 loop 실행
    // -> 한번에 기다렸다가 결과 받을 수 있음

    //Hive에 data 넣기
    for (int i = 0; i < res.length; i++) {
      //ItemCode
      final key = ItemCode.values[i];
      //List<StatModel>
      final value = res[i];

      final box = Hive.box<StatModel>(key.name);
      for (StatModel stat in value) {
        box.put(stat.dataTime.toString(), stat);
      }
    }
  }

  //isExpanded 값 결정
  scrollListener() {
    bool isExpanded = scrollController.offset < 500 - kToolbarHeight;

    if (isExpanded != this.isExpanded) {
      setState(() {
        this.isExpanded = isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box(ItemCode.PM10.name).listenable(),
      builder: (context, box, widget) {
        // PM10(미세먼지)
        // box.values.toList().last
        final recentStat = (box.values.toList().last as StatModel);
        // 리스트 안의 마지막 값을 StatModel로 받아옴
        final status = DataUtils.getCrntStatusFromItemCodeAndValue(
          value: recentStat.getLevelFromRegion(region),
          itemCode: ItemCode.PM10,
        );

        return Scaffold(
          drawer: MainDrawer(
            darkColor: status.darkColor,
            lightColor: status.lightColor,
            selectedRegion: region,
            onRegionTap: (String region) {
              setState(() {
                this.region = region;
              });
              Navigator.of(context).pop(); //서랍에서 지역 선택하면 서랍 닫히게
            },
          ),
          body: Container(
            color: status.primaryColor,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                MainAppBar(
                  isExpanded: isExpanded,
                  region: region,
                  stat: recentStat,
                  status: status,
                  //최근 데이터에 해당하는 상태
                  dateTime: recentStat.dataTime,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CategoryCard(
                        darkColor: status.darkColor,
                        lightColor: status.lightColor,
                        region: region,
                      ),
                      const SizedBox(height: 16.0),
                      ...ItemCode.values.map(
                        (itemCode) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: HourlyCard(
                              darkColor: status.darkColor,
                              lightColor: status.lightColor,
                              itemCode: itemCode,
                              region: region,
                            ),
                          );
                        },
                      ).toList(),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
