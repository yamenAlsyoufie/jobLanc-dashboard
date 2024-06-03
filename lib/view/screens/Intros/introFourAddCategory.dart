import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/widgets/IntroWidget.dart';

class introFourAddCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        body: IntroWidget(
      mainTitleText: "11".tr,
      textIntro: "12".tr,
      onPressed: () => Get.to(PageController()),
      image: Image.asset(
        AddCategoryIntro,
        width: 300,
        height: 300,
        //fit: BoxFit.contain,
      ),
    ),
    );
  }
}
