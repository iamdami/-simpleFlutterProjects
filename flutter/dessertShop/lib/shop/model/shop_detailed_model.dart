import 'package:actual/common/const/data.dart';
import 'package:actual/common/utils/data_utils.dart';
import 'package:actual/shop/model/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_detailed_model.g.dart';

@JsonSerializable()
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

  factory ShopDetailedModel.fromJson(Map<String, dynamic>json)
  => _$ShopDetailedModelFromJson(json);
}

@JsonSerializable()
class ShopProductModel {
  final String id;
  final String name;
  @JsonKey(
    fromJson: DataUtils.pathToUrl,
  )
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

  factory ShopProductModel.fromJson(Map<String, dynamic>json)
  => _$ShopProductModelFromJson(json);
}
