import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/localization.dart';
import 'package:projectoneuniversity/view/BottomNavBar.dart';
import 'package:projectoneuniversity/view/Intros/PageViewIntros.dart';
import 'package:projectoneuniversity/view/LoginPage.dart';
import 'package:projectoneuniversity/view/MainPageView.dart';
import 'View/chooselanguage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      translations: localization(),
      //initialBinding: ChooseLanguageWithIntroBindings(),
      initialRoute: "/",
      home: MainPageView(),
      getPages: [],
      // home: chooselanguage(),
    );
  }
}
