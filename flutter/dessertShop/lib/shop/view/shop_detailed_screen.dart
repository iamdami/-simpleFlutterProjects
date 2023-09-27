import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/shop/component/shop_card.dart';
import 'package:flutter/material.dart';

class ShopDetailedScreen extends StatelessWidget {
  const ShopDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "iceCream",
      child: Column(
        children: [
          ShopCard(
            image: Image.asset("asset/imgs/food/iceCream.png"),
            name: "iceCream",
            tags: ["iceCream", "sweets", "fruit"],
            ratings: 4.54,
            ratingsCount: 100,
            deliveryTime: 20,
            deliveryFee: 2500,
            isDetailed: true,
            detail: "yum!",
          )
        ],
      ),
    );
  }
}
