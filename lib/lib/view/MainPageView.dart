import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projectoneuniversity/controller/NavigationController.dart';
import 'package:projectoneuniversity/view/BottomNavBar.dart';
import 'package:projectoneuniversity/view/MainPageView/HomePageView.dart';
import 'package:projectoneuniversity/view/MainPageView/SettingsPageView.dart';
import 'package:projectoneuniversity/view/MainPageView/WalletPageView.dart';
import 'package:projectoneuniversity/view/MainPageView/statisticsPageView.dart';

class MainPageView extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: PageView(
        controller: navigationController.pageController,
        onPageChanged: (index) {
          navigationController.selectedIndex.value = index;
        },
        children: [
          HomePageView(),
          WalletPageView(),
          statisticsPageView(),
          SettingsPageView()
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}