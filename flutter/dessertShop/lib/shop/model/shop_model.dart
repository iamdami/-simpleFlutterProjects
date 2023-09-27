import 'package:actual/common/const/data.dart';

enum ShopPriceRange {
  expensive,
  medium,
  cheap,
}

class ShopModel {
  final String id;
  final String name;
  final String thumbUrl;
  final List<String> tags;
  final ShopPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  ShopModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  factory ShopModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return ShopModel(
      id: json["id"],
      name: json["name"],
      thumbUrl: "http://$ip${json["thumbUrl"]}",
      tags: List<String>.from(json["tags"]),
      priceRange: ShopPriceRange.values.firstWhere(
            (e) => e.name == json["priceRange"],
      ),
      ratings: json["ratings"],
      ratingsCount: json["ratingsCount"],
      deliveryTime: json["deliveryTime"],
      deliveryFee: json["deliveryFee"],
    );
  }
}
