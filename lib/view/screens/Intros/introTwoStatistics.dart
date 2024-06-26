import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/view/widgets/IntroWidget.dart';

class introTwoStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroWidget(
        mainTitleText: "7".tr,
        textIntro: "8".tr,
        onPressed: () => Get.to(PageController()),
        image: Image.asset(
          StatisticsIconIntro,
          width: 300,
          height: 300,
          //fit: BoxFit.contain,
        ),
      ),
    );
  }
}
