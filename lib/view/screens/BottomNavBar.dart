import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/NavigationController.dart';

class BottomNavBar extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Statistics',
              backgroundColor: Color.fromARGB(248, 18, 19, 33),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromARGB(248, 18, 19, 33),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
              backgroundColor: Color.fromARGB(248, 18, 19, 33),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Color.fromARGB(248, 18, 19, 33),
            ),
          ],
          unselectedItemColor: Colors.white,
          currentIndex: navigationController.selectedIndex.value,
          selectedItemColor: Colors.blue,
          onTap: navigationController.changePage,
        ));
  }
}
