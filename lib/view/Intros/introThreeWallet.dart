import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/data/Statics/static.dart';
import 'package:projectoneuniversity/data/widgets/IntroWidget.dart';

class introThreeWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: IntroWidget(
      mainTitleText: "9".tr,
      textIntro: "10".tr,
      //onPressed: () => Get.to(),
      image: Image.asset(
        walletIconIntro,
        width: 300,
        height: 300,
        //fit: BoxFit.contain,
      ), onPressed: () {  },
    ),
    );
  }
}
