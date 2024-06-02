import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/PageViewIntrosController.dart';

// ignore: must_be_immutable
class PageViewIntros extends StatelessWidget {
  //this page to create a page view with the 4 first pages(choose language ,intro one ,intro two , intro 3)
  PageViewIntrosController controller = Get.put(PageViewIntrosController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.pages,
      ),
    );
  }
}
