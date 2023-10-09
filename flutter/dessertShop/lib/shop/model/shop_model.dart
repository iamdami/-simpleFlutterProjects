import 'package:actual/common/const/data.dart';
import 'package:actual/common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_model.g.dart';

enum ShopPriceRange {
  expensive,
  medium,
  cheap,
}

@JsonSerializable()
class ShopModel {
  final String id;
  final String name;
  @JsonKey(
    fromJson: DataUtils.pathToUrl,
  )
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

  factory ShopModel.fromJson(Map<String, dynamic> json)
  => _$ShopModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopModelToJson(this);


  // factory ShopModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return ShopModel(
  //     id: json["id"],
  //     name: json["name"],
  //     thumbUrl: "http://$ip${json["thumbUrl"]}",
  //     tags: List<String>.from(json["tags"]),
  //     priceRange: ShopPriceRange.values.firstWhere(
  //           (e) => e.name == json["priceRange"],
  //     ),
  //     ratings: json["ratings"],
  //     ratingsCount: json["ratingsCount"],
  //     deliveryTime: json["deliveryTime"],
  //     deliveryFee: json["deliveryFee"],
  //   );
  // }
}
