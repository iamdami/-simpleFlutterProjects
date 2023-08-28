import 'package:fine_dust/component/card_title.dart';
import 'package:fine_dust/component/main_app_bar.dart';
import 'package:fine_dust/component/main_card.dart';
import 'package:fine_dust/const/colors.dart';
import 'package:flutter/material.dart';
import '../component/category_card.dart';
import '../component/hourly_card.dart';
import '../component/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CategoryCard(),
                const SizedBox(height: 16.0),
                HourlyCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
