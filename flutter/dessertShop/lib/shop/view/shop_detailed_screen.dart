import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/product/component/product_card.dart';
import 'package:actual/shop/component/shop_card.dart';
import 'package:flutter/material.dart';

class ShopDetailedScreen extends StatelessWidget {
  const ShopDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "iceCream",
      child: CustomScrollView(
        slivers: [
          renderTop(),
          renderLabel(),
          renderProducts(),
        ],
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

  SliverToBoxAdapter renderTop() {
    return SliverToBoxAdapter(
      child: ShopCard(
        image: Image.asset(
          "asset/imgs/food/iceCream.png",
          width: 200,
          height: 300,
        ),
        name: "iceCream",
        tags: ["iceCream", "sweets", "fruit"],
        ratings: 4.54,
        ratingsCount: 100,
        deliveryTime: 20,
        deliveryFee: 2500,
        isDetailed: true,
        detail: "yum!",
      ),
    );
  }
}
