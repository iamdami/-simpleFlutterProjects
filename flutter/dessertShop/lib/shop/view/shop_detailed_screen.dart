import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/product/component/product_card.dart';
import 'package:actual/shop/component/shop_card.dart';
import 'package:actual/shop/model/shop_detailed_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ShopDetailedScreen extends StatelessWidget {
  final String id;

  const ShopDetailedScreen({
    required this.id,
    Key? key,
  }) : super(key: key);

  Future<Map<String, dynamic>> getShopDetailed() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      "http://$ip/restaurant/$id",
      options: Options(headers: {"authorization": "Bearer $accessToken"}),
    );
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "iceCream",
      child: FutureBuilder<Map<String, dynamic>>(
        future: getShopDetailed(),
        builder: (_, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          print(snapshot.data);
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final item = ShopDetailedModel.fromJson(json: snapshot.data!);

          return CustomScrollView(
            slivers: [
              renderTop(model: item),
              renderLabel(),
              renderProducts(),
            ],
          );
        },
      ),
    );
  }

  SliverPadding renderLabel() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          "Menu",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  SliverPadding renderProducts() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProductCard(),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }

  SliverToBoxAdapter renderTop({
    required ShopDetailedModel model,
  }) {
    return SliverToBoxAdapter(
      child: ShopCard.fromModel(
        model: model,
        isDetailed: true,
      ),
    );
  }
}
