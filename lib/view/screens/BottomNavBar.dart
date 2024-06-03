import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/NavigationController.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';

class BottomNavBar extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromARGB(249, 28, 29, 48),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          unselectedItemColor: Colors.white,
          currentIndex: navigationController.selectedIndex.value,
          selectedItemColor: Colors.blue,
          onTap: navigationController.changePage,
        ));
  }
}
