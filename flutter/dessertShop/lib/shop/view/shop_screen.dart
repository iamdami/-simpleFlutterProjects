import 'package:actual/common/const/data.dart';
import 'package:actual/shop/component/shop_card.dart';
import 'package:actual/shop/model/shop_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  Future<List> paginationShop() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final resp = await dio.get(
      "http://$ip/restaurant",
      options: Options(
        headers: {
          "authorization": "Bearer $accessToken",
        },
      ),
    );

    return resp.data["data"];
  }

  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder<List>(
            future: paginationShop(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              return ListView.separated(
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];

                  final model = ShopModel.fromJson(json: item);

                  return ShopCard.fromModel(
                    model: model,
                  );
                },
                separatorBuilder: (_, index) {
                  return SizedBox(height: 20.0);
                },
                itemCount: snapshot.data!.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
