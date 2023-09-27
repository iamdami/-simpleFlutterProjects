import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';

import '../model/shop_model.dart';

class ShopCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final bool isDetailed;
  final String? detail;

  const ShopCard(
      {required this.image,
      required this.name,
      required this.tags,
      required this.ratings,
      required this.ratingsCount,
      required this.deliveryTime,
      required this.deliveryFee,
      this.isDetailed = false,
      this.detail,
      Key? key})
      : super(key: key);

  factory ShopCard.fromModel({
    required ShopModel model,
    bool isDetailed = false,
  }) {
    return ShopCard(
      image: Image.network(
        model.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: model.name,
      tags: model.tags,
      ratings: model.ratings,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      isDetailed: isDetailed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isDetailed) image,
        if (!isDetailed)
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: image,
          ),
        const SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetailed ? 16.0 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  backgroundColor: Colors.pink.shade50,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                tags.join(' ෆ '),
                style: TextStyle(
                  color: body_text_color,
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  _IconText(
                    icon: Icons.star_rounded,
                    label: ratings.toString(),
                  ),
                  _IconText(
                    icon: Icons.receipt_long_rounded,
                    label: ratingsCount.toString(),
                  ),
                  _IconText(
                    icon: Icons.timelapse_rounded,
                    label: "${deliveryTime}min",
                  ),
                  _IconText(
                    icon: Icons.monetization_on_rounded,
                    label:
                        "${deliveryFee == 0 ? "Free" : deliveryFee.toString()}",
                  ),
                ],
              ),
              if (detail != null && isDetailed)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Text(detail!),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: primary_color,
          size: 14.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }
}
