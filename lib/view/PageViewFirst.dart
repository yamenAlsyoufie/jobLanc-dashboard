import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/controller/PageViewFirstOfAppController.dart';

class PageViewFirst extends StatelessWidget {
  //this page to create a page view with the 4 first pages(choose language ,intro one ,intro two , intro 3)
  PageViewFirstOfAppController controller = Get.put(PageViewFirstOfAppController
  ());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children:controller.pages,
      ),
    );
  }
}
