import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projectoneuniversity/controller/NavigationController.dart';
import 'package:projectoneuniversity/view/screens/BottomNavBar.dart';
import 'package:projectoneuniversity/view/screens/MainPageView/HomePageView.dart';
import 'package:projectoneuniversity/view/screens/MainPageView/SettingsPageView.dart';
import 'package:projectoneuniversity/view/screens/MainPageView/WalletPageView.dart';
import 'package:projectoneuniversity/view/screens/MainPageView/statisticsPageView.dart';

class MainPageView extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
