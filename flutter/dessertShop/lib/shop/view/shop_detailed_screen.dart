import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/product/component/product_card.dart';
import 'package:actual/shop/component/shop_card.dart';
import 'package:actual/shop/model/shop_detailed_model.dart';
import 'package:actual/shop/repo/shop_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ShopDetailedScreen extends StatelessWidget {
  final String id;

  const ShopDetailedScreen({
    required this.id,
    Key? key,
  }) : super(key: key);

  Future<ShopDetailedModel> getShopDetailed() async {
    final dio = Dio();

    final repo = ShopRepo(dio, baseUrl: "http://$ip/restaurant");
    return repo.getShopDetail(id: id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "iceCream",
      child: FutureBuilder<ShopDetailedModel>(
        future: getShopDetailed(),
        builder: (_, AsyncSnapshot<ShopDetailedModel> snapshot) {
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomScrollView(
            slivers: [
              renderTop(model: snapshot.data!),
              renderLabel(),
              renderProducts(products: snapshot.data!.products),
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

  SliverPadding renderProducts({
    required List<ShopProductModel> products,
}) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final model = products[index];

            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProductCard.fromModel(model: model),
            );
          },
          childCount: products.length,
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
