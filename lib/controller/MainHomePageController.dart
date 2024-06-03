import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mainhomepagecontroller extends GetxController {
  late TabController tabController;
  var selectedIndex = 0.obs;
  PageController pageController = PageController();
  @override
  // ignore: override_on_non_overriding_member
  void changePage(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    //tabController = new TabController();
    // TODO: implement onInit
    super.onInit();
  }
}
