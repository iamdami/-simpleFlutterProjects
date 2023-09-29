import 'package:actual/common/const/data.dart';
import 'package:actual/shop/model/shop_model.dart';
import 'package:flutter/material.dart';

class ShopDetailedModel extends ShopModel {
  final String detail;
  final List<ShopProductModel> products;

  ShopDetailedModel({
    required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.detail,
    required this.products,
  });

  factory ShopDetailedModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return ShopDetailedModel(
      id: json["id"],
      name: json["name"],
      thumbUrl: "http://$ip${json["thumbUrl"]}",
      tags: List<String>.from(json["tags"]),
      priceRange:
          ShopPriceRange.values.firstWhere((e) => e.name == json["priceRange"]),
      ratings: json["ratings"],
      ratingsCount: json["ratingsCount"],
      deliveryTime: json["deliveryTime"],
      deliveryFee: json["deliveryFee"],
      detail: json["detail"],
      products: json["products"]
          .map<ShopProductModel>(
            (x) => ShopProductModel(
              id: x["id"],
              name: x["name"],
              imgUrl: x["imgUrl"],
              detail: x["detail"],
              price: x["price"],
            ),
          )
          .toList(),
    );
  }
}

class ShopProductModel {
  final String id;
  final String name;
  final String imgUrl;
  final String detail;
  final int price;

  ShopProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });
}
