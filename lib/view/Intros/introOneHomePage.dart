import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/data/widgets/IntroWidget.dart';

class introOneHomePage extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroWidget(
      mainTitleText: "5".tr,
      textIntro: "6".tr,
      onPressed: () {},
      //Get.to(PageController()),
      image: Image.asset(
        HomePagePhotoIntro,
        width: 300,
        height: 300,
        //fit: BoxFit.contain,
      ),
    ),
    );
  }
}
