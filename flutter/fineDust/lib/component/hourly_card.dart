import 'package:flutter/material.dart';
import 'card_title.dart';
import 'main_card.dart';

class HourlyCard extends StatelessWidget {
  const HourlyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            title: "Hourly fine dust",
          ),
          Column(
            children: List.generate(24, (index) {
              final now = DateTime.now();
              final hour = now.hour;
              int crntHour = hour - index;
              if (crntHour < 0) {
                crntHour += 24;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("$crntHour"),
                    ),
                    Expanded(
                      child: Image.asset(
                        "asset/img/bad.png",
                        height: 20.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Bad",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
