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

  Future<Map<ItemCode, List<StatModel>>> fetchData() async {
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

    //Hive로부터 data 가져와서 직접 만들기
    return ItemCode.values.fold<Map<ItemCode, List<StatModel>>>(
      {},
      (previousValue, itemCode) {
        final box = Hive.box<StatModel>(itemCode.name);
        previousValue.addAll({
          itemCode: box.values.toList(),
        });
        return previousValue;
      },
    );
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
    return FutureBuilder<Map<ItemCode, List<StatModel>>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                "Error!",
              ),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        Map<ItemCode, List<StatModel>> stats = snapshot.data!;
        StatModel pm10RecentStat = stats[ItemCode.PM10]![0];

        // 미세먼지 최근 데이터의 현재 상태
        final status = DataUtils.getCrntStatusFromItemCodeAndValue(
            value: pm10RecentStat.seoul, itemCode: ItemCode.PM10);

        final ssModel = stats.keys.map((key) {
          final value = stats[key]!;
          final stat = value[0];

          return StatAndStatusModel(
            itemCode: key,
            status: DataUtils.getCrntStatusFromItemCodeAndValue(
                value: stat.getLevelFromRegion(region), itemCode: key),
            stat: stat,
          );
        }).toList();

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
                  stat: pm10RecentStat,
                  status: status, //최근 데이터에 해당하는 상태
                  dateTime: pm10RecentStat.dataTime,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CategoryCard(
                        darkColor: status.darkColor,
                        lightColor: status.lightColor,
                        region: region,
                        models: ssModel,
                      ),
                      const SizedBox(height: 16.0),
                      ...stats.keys.map(
                        (itemCode) {
                          final stat = stats[itemCode]!;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: HourlyCard(
                              darkColor: status.darkColor,
                              lightColor: status.lightColor,
                              category: DataUtils.getItemCodeString(
                                  itemCode: itemCode),
                              stats: stat,
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
